" Vim syntax file
" Language:	Matlab
" Maintainer:	Fabrice Guy <fabrice.guy at gmail dot com>
"		Original authors: Mario Eusebio and Preben Guldberg
" Last Change:	2008 Oct 16 : added try/catch/rethrow and class statements

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword matlabStatement		return 
syn keyword matlabConditional		switch case else elseif end if otherwise break continue
syn keyword matlabRepeat		do for while
syn keyword matlabStorageClass		classdef methods properties events persistent global
syn keyword matlabExceptions		try catch rethrow

syn keyword matlabTodo			contained  TODO NOTE FIXME XXX
syn keyword matlabImport		import
" If you do not want these operators lit, uncommment them and the "hi link" below
syn match  matlabRelationalOperator	"\(==\|\~=\|>=\|<=\|=\~\|>\|<\|=\)"
syn match matlabArithmeticOperator	"[-+]"
syn match matlabArithmeticOperator	"\.\=[*/\\^]"
syn match matlabLogicalOperator		"[&|~]"
syn keyword matlabBoolean		true false

syn match matlabLineContinuation	"\.\{3}"

" String
syn region matlabString			start=+'+ end=+'+	oneline

" If you don't like tabs
syn match matlabTab			"\t"

" Standard numbers
syn match matlabNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match matlabFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match matlabFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match matlabDelimiter		"[][]"
"syn match matlabDelimiter		"[][()]"
syn match matlabTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match matlabSemicolon		";"

syn match matlabComment			"%.*$"	contains=matlabTodo,matlabTab
syn region matlabBlockComment        start=+%{+    end=+%}+

syn keyword matlabOperator		zeros default margin round ones rand
syn keyword matlabOperator		ceil floor size clear zeros eye mean std cov

syn keyword matlabFunction		error eval function properties methods

syn keyword matlabImplicit		abs acos atan asin cos cosh exp log prod sum
syn keyword matlabImplicit		log10 max min sign sin sqrt tan reshape

syn match matlabError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match matlabError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_matlab_syntax_inits")
  if version < 508
    let did_matlab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink matlabTransposeOperator	matlabOperator
  HiLink matlabLineContinuation		Special
  HiLink matlabLabel			Label
  HiLink matlabConditional		Conditional
  HiLink matlabRepeat			Repeat
  HiLink matlabTodo			Todo
  HiLink matlabString			String
  HiLink matlabDelimiter		Identifier
  HiLink matlabTransposeOther		Identifier
  HiLink matlabNumber			Number
  HiLink matlabFloat			Float
  HiLink matlabFunction			Function
  HiLink matlabError			Error
  HiLink matlabImplicit			matlabStatement
  HiLink matlabStatement		Statement
  HiLink matlabSemicolon		SpecialChar
  HiLink matlabComment			Comment
  HiLink matlabBlockComment		Comment
  HiLink matlabImport			Include
  HiLink matlabBoolean			Boolean
  HiLink matlabStorageClass		StorageClass

  HiLink matlabArithmeticOperator	matlabOperator
  HiLink matlabRelationalOperator	matlabOperator
  HiLink matlabLogicalOperator		matlabOperator
  HiLink matlabOperator			Operator
  HiLink matlabExceptions		Exception

"optional highlighting
  "HiLink matlabIdentifier		Identifier
  "HiLink matlabTab			Error
  delcommand HiLink
endif

let b:current_syntax = "matlab"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
