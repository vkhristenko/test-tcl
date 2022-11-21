puts "Hello World With quotes"
puts {Hello World with braces}

set test_var_int 10
set test_var_str "Some string"

puts "test_var_int = $test_var_int"
puts "test_var_str = $test_var_str"

set a 100.00
puts "Washington is not on the $a bill"    ;# This is not what you want
puts "Lincoln is not on the $$a bill"      ;# This is OK
puts "Hamilton is not on the \$a bill"     ;# This is not what you want
puts "Ben Franklin is on the \$$a bill"    ;# But, this is OK

puts "\n................. examples of escape strings"
puts "Tab\tTab\tTab"
puts "This string prints out \non two lines"
puts "This string comes out\
on a single line"

set Z Albany
set Z_LABEL "The Capitol of New York is: "

puts "\n................. examples of differences between  \" and \{"
puts "$Z_LABEL $Z"
puts {$Z_LABEL $Z}

puts "\n....... examples of differences in nesting \{ and \" "
puts "$Z_LABEL {$Z}"
puts {Who said, "What this country needs is a good $0.05 cigar!"?}

puts "\n................. examples of escape strings"
puts {There are no substitutions done within braces \n \r \x0a \f \v}
puts {But, the escaped newline at the end of a\
string is still evaluated as a space}

puts "\n<<< 00000000000000 >>>\n"

set x abc
puts "A simple substitution: $x\n"

set y [set x "def"]
puts "Remember that set returns the new value of the variable: X: $x Y: $y\n"

set z {[set x "This is a string within quotes within braces"]}
puts "Note the curly braces: $z"
puts "\$x is : $x\n"

set a "[set x {This is a string within braces within quotes}]"
puts "See how the set is executed: $a"
puts "\$x is: $x\n"

set b "\[set y {This is a string within braces within quotes}]"
# Note the \ escapes the bracket, and must be doubled to be a
# literal character in double quotes
puts "Note the \\ escapes the bracket:\n \$b is: $b"
puts "\$y is: $y"

puts "\n<<< 111111111111111 >>>\n"

set X 100
set Y 256
set Z [expr {$Y + $X}]
set Z_LABEL "$Y plus $X is "

puts "$Z_LABEL $Z"
puts "The square root of $Y is [expr { sqrt($Y) }]\n"

puts "Because of the precedence rules \"5 + -3 * 4\"   is: [expr {-3 * 4 + 5}]"
puts "Because of the parentheses      \"(5 + -3) * 4\" is: [expr {(5 + -3) * 4}]"

set A 3
set B 4
puts "The hypotenuse of a triangle: [expr {hypot($A,$B)}]"

#
# The trigonometric functions work with radians ...
#
set pi6 [expr {3.1415926/6.0}]
puts "The sine and cosine of pi/6: [expr {sin($pi6)}] [expr {cos($pi6)}]"

proc TestArray {} {
    #
    # Working with arrays
    #
    set aa(0) 0
    set a(1) 10
    set a(2) 7
    set a(3) 17
    set b    2
    puts "Sum: [expr {$a(1)+$a($b)}]"
}
TestArray

puts "\n<<< 2222222222 >>>\n"

proc TestIf1 {} {
    puts "<<< This is [dict get [info frame [info frame]] proc] >>>"

    set x 2
    if {$x == 1} {
        puts "true branch"
    } else {
        puts "false branch"
    }
}
TestIf1

proc TestIf2 {} {
    puts "<<< This is [dict get [info frame [info frame]] proc] >>>"

    set x 1
    if "$x == 1" {
        puts "true branch"
    } else {
        puts "false branch"
    }
}
TestIf2

proc TestIf3 {} {
    puts "<<< This is [dict get [info frame [info frame]] proc] >>>"

    set y 1
    set x y
    if {$x == 1} {
        puts "true branch"
    } else {
        puts "false branch"
    }
}
TestIf3

proc TestSubstitutions {} {
    puts "<<< This is [dict get [info frame [info frame]] proc] >>>"
    set x "hello"
    set y x
    puts "$x"
    puts "$y"
    puts "$$y"
}
TestSubstitutions
