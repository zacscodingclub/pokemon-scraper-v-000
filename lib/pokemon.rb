class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    q = db.prepare("INSERT INTO Pokemon (name, type) VALUES (?, ?)")
    q.execute(name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
  end

end
