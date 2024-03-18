# Represet the full list
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head
      curr_node = @head
      curr_node = curr_node.next_node while curr_node.next_node
      curr_node.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    if @head
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
    else
      @head = Node.new(value)
    end
  end

  def size
    return 0 unless @head

    curr_node = @head
    list_size = 1
    while curr_node.next_node
      curr_node = curr_node.next_node
      list_size += 1
    end
    list_size
  end

  def tail
    return nil unless @head

    curr_node = @head
    curr_node = curr_node.next_node while curr_node.next_node
    curr_node
  end

  def at(index)
    return nil unless @head && index < size

    curr_node = @head
    curr_index = 0
    while curr_index < index
      curr_node = curr_node.next_node
      curr_index += 1
    end
    curr_node
  end

  def pop
    at(size - 2).next_node = nil
  end

  def contains?(value)
    curr_node = @head
    while curr_node
      return true if curr_node.value == value

      curr_node = curr_node.next_node
    end
    false
  end

  def find(value)
    curr_node = @head
    curr_index = 0
    while curr_node
      return curr_index if curr_node.value == value

      curr_node = curr_node.next_node
      curr_index += 1
    end
    nil
  end

  def to_s
    curr_node = @head
    string = ''
    while curr_node
      string += "#{curr_node.value} -> "
      curr_node = curr_node.next_node
    end
    string + 'nil'
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return append(value) if index >= size

    new_node = Node.new(value)
    new_node.next_node = at(index)
    at(index - 1).next_node = new_node
  end

  def remove_at(index)
    return @head = @head.next_node if index == 0

    at(index - 1).next_node = at(index).next_node
  end
end

# Containing a #value method and a link to the #next_node, set both as nil by default.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
