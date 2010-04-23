class Hash

  # Constructs a Proc object from a hash such that
  # the parameter of the Proc is assigned the hash
  # keys as attributes.
  #
  #   h = { :a => 1 }
  #   p = h.to_proc
  #   o = OpenStruct.new
  #   p.call(o)
  #   o.a  #=> 1
  #
  # If +response+ is set to +true+, then assignment
  # will only occur if receiver responds_to? the
  # writer method.
  #
  # CREDIT: Trans

  def to_proc(response=false)
    if response
      lambda do |o|
        self.each do |k,v|
          ke = "#{k}="
          o.__send__(ke, v) if respond_to?(ke)
        end
      end
    else
      lambda do |o|
        self.each do |k,v|
          ke = "#{k}="
          o.__send__(ke, v)
        end
      end
    end
  end

end

