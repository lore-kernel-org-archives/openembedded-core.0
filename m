Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ToGLm-0004th-5O
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 17:30:48 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so4910607eek.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=kv3LYA0/yczFv+JaP5VgTuVLkvH8d/m9hab4IabCbFo=;
	b=m0llY7vJUcY5cmrm42w7MhjRP/HRwLtKsllMz/BUo4wEWNoTHE5o5Tq8BMLqlux2vL
	5u6HZreNzyjRJl4Q7EzcQzxqWF3AnBYoYuJq5mfh8CvM/rB3O9zqCOotBwqZI7vKrI3q
	tOVmLhNuFD0MTbbI5S2kvVQe2HqTO46Srf/QgfbaKqUAeqCNXKMbVIYiX0SrQs2d8HnR
	ul/7bXs/HVh9W3LVfuicpNl9RJWgPJ5v4n7EAiHmpHH4iYiHr9UHj/LCd2GeZPSJegvd
	Es1EKDqGTBm1m8EVsuyOZGnxUJuEDdCmSGFCa9PeWuHb/dWen0B/JZhEywLqQs4YNpLH
	+CQg==
X-Received: by 10.14.2.66 with SMTP id 42mr79385214eee.7.1356624936001;
	Thu, 27 Dec 2012 08:15:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm60345954eem.14.2012.12.27.08.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 08:15:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:15:32 +0100
Message-Id: <1356621332-5076-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] webkit-gtk: fix build with bison-2.6+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 16:30:54 -0000

* bison was upgraded to 2.7 in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/files/bison-2.6.patch | 558 +++++++++++++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb   |   3 +-
 2 files changed, 560 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/webkit/files/bison-2.6.patch

diff --git a/meta/recipes-sato/webkit/files/bison-2.6.patch b/meta/recipes-sato/webkit/files/bison-2.6.patch
new file mode 100644
index 0000000..d4aa674
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/bison-2.6.patch
@@ -0,0 +1,558 @@
+Upstream-Status: Backport
+http://trac.webkit.org/changeset/124099
+
+Subversion Revision: 123651
+diff --git a/Source/WebCore/css/CSSGrammar.y b/Source/WebCore/css/CSSGrammar.y
+index c7c10b541cd46ad4febc6efe289e81b2cfb0861e..1c604e76b4da4cc65f395bc4a73b112561bd5c84 100644
+--- a/Source/WebCore/css/CSSGrammar.y
++++ b/Source/WebCore/css/CSSGrammar.y
+@@ -53,14 +53,13 @@ using namespace HTMLNames;
+ #define YYMAXDEPTH 10000
+ #define YYDEBUG 0
+ 
+-// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
+-#define YYPARSE_PARAM parser
+-#define YYLEX_PARAM parser
+-
+ %}
+ 
+ %pure_parser
+ 
++%parse-param { CSSParser* parser }
++%lex-param { CSSParser* parser }
++
+ %union {
+     bool boolean;
+     char character;
+@@ -89,7 +88,7 @@ using namespace HTMLNames;
+ 
+ %{
+ 
+-static inline int cssyyerror(const char*)
++static inline int cssyyerror(void*, const char*)
+ {
+     return 1;
+ }
+diff --git a/Source/WebCore/css/CSSParser.cpp b/Source/WebCore/css/CSSParser.cpp
+index 650844060477cfc6ea6fdeaf11ec63b34ac646e7..8369549dbff25537cf93a11237a9bbbac4fe50f2 100644
+--- a/Source/WebCore/css/CSSParser.cpp
++++ b/Source/WebCore/css/CSSParser.cpp
+@@ -114,7 +114,7 @@
+ extern int cssyydebug;
+ #endif
+ 
+-extern int cssyyparse(void* parser);
++extern int cssyyparse(WebCore::CSSParser*);
+ 
+ using namespace std;
+ using namespace WTF;
+diff --git a/Source/WebCore/xml/XPathGrammar.y b/Source/WebCore/xml/XPathGrammar.y
+index 2eba5b35bd2338272a0f4ec756d137e47d2d59c8..d558211db2d89ea13716762a51397755560f66f3 100644
+--- a/Source/WebCore/xml/XPathGrammar.y
++++ b/Source/WebCore/xml/XPathGrammar.y
+@@ -34,6 +34,7 @@
+ #include "XPathParser.h"
+ #include "XPathPath.h"
+ #include "XPathPredicate.h"
++#include "XPathStep.h"
+ #include "XPathVariableReference.h"
+ #include <wtf/FastMalloc.h>
+ 
+@@ -44,8 +45,6 @@
+ #define YYLTYPE_IS_TRIVIAL 1
+ #define YYDEBUG 0
+ #define YYMAXDEPTH 10000
+-#define YYPARSE_PARAM parserParameter
+-#define PARSER static_cast<Parser*>(parserParameter)
+ 
+ using namespace WebCore;
+ using namespace XPath;
+@@ -53,6 +52,7 @@ using namespace XPath;
+ %}
+ 
+ %pure_parser
++%parse-param { WebCore::XPath::Parser* parser }
+ 
+ %union
+ {
+@@ -71,7 +71,7 @@ using namespace XPath;
+ %{
+ 
+ static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
+-static void xpathyyerror(const char*) { }
++static void xpathyyerror(void*, const char*) { }
+     
+ %}
+ 
+@@ -118,7 +118,7 @@ static void xpathyyerror(const char*) { }
+ Expr:
+     OrExpr
+     {
+-        PARSER->m_topExpr = $1;
++        parser->m_topExpr = $1;
+     }
+     ;
+ 
+@@ -138,7 +138,7 @@ AbsoluteLocationPath:
+     '/'
+     {
+         $$ = new LocationPath;
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     |
+     '/' RelativeLocationPath
+@@ -150,7 +150,7 @@ AbsoluteLocationPath:
+     {
+         $$ = $2;
+         $$->insertFirstStep($1);
+-        PARSER->unregisterParseNode($1);
++        parser->unregisterParseNode($1);
+     }
+     ;
+ 
+@@ -159,22 +159,22 @@ RelativeLocationPath:
+     {
+         $$ = new LocationPath;
+         $$->appendStep($1);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->registerParseNode($$);
+     }
+     |
+     RelativeLocationPath '/' Step
+     {
+         $$->appendStep($3);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($3);
+     }
+     |
+     RelativeLocationPath DescendantOrSelf Step
+     {
+         $$->appendStep($2);
+         $$->appendStep($3);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($2);
++        parser->unregisterParseNode($3);
+     }
+     ;
+ 
+@@ -183,58 +183,58 @@ Step:
+     {
+         if ($2) {
+             $$ = new Step(Step::ChildAxis, *$1, *$2);
+-            PARSER->deletePredicateVector($2);
++            parser->deletePredicateVector($2);
+         } else
+             $$ = new Step(Step::ChildAxis, *$1);
+-        PARSER->deleteNodeTest($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteNodeTest($1);
++        parser->registerParseNode($$);
+     }
+     |
+     NAMETEST OptionalPredicateList
+     {
+         String localName;
+         String namespaceURI;
+-        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
+-            PARSER->m_gotNamespaceError = true;
++        if (!parser->expandQName(*$1, localName, namespaceURI)) {
++            parser->m_gotNamespaceError = true;
+             YYABORT;
+         }
+         
+         if ($2) {
+             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
+-            PARSER->deletePredicateVector($2);
++            parser->deletePredicateVector($2);
+         } else
+             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     AxisSpecifier NodeTest OptionalPredicateList
+     {
+         if ($3) {
+             $$ = new Step($1, *$2, *$3);
+-            PARSER->deletePredicateVector($3);
++            parser->deletePredicateVector($3);
+         } else
+             $$ = new Step($1, *$2);
+-        PARSER->deleteNodeTest($2);
+-        PARSER->registerParseNode($$);
++        parser->deleteNodeTest($2);
++        parser->registerParseNode($$);
+     }
+     |
+     AxisSpecifier NAMETEST OptionalPredicateList
+     {
+         String localName;
+         String namespaceURI;
+-        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
+-            PARSER->m_gotNamespaceError = true;
++        if (!parser->expandQName(*$2, localName, namespaceURI)) {
++            parser->m_gotNamespaceError = true;
+             YYABORT;
+         }
+ 
+         if ($3) {
+             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
+-            PARSER->deletePredicateVector($3);
++            parser->deletePredicateVector($3);
+         } else
+             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
+-        PARSER->deleteString($2);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($2);
++        parser->registerParseNode($$);
+     }
+     |
+     AbbreviatedStep
+@@ -259,23 +259,23 @@ NodeTest:
+         else if (*$1 == "comment")
+             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
+ 
+-        PARSER->deleteString($1);
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->registerNodeTest($$);
+     }
+     |
+     PI '(' ')'
+     {
+         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
+-        PARSER->deleteString($1);        
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->registerNodeTest($$);
+     }
+     |
+     PI '(' LITERAL ')'
+     {
+         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
+-        PARSER->deleteString($1);        
+-        PARSER->deleteString($3);
+-        PARSER->registerNodeTest($$);
++        parser->deleteString($1);
++        parser->deleteString($3);
++        parser->registerNodeTest($$);
+     }
+     ;
+ 
+@@ -293,14 +293,14 @@ PredicateList:
+     {
+         $$ = new Vector<Predicate*>;
+         $$->append(new Predicate($1));
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerPredicateVector($$);
++        parser->unregisterParseNode($1);
++        parser->registerPredicateVector($$);
+     }
+     |
+     PredicateList Predicate
+     {
+         $$->append(new Predicate($2));
+-        PARSER->unregisterParseNode($2);
++        parser->unregisterParseNode($2);
+     }
+     ;
+ 
+@@ -315,7 +315,7 @@ DescendantOrSelf:
+     SLASHSLASH
+     {
+         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -323,13 +323,13 @@ AbbreviatedStep:
+     '.'
+     {
+         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     |
+     DOTDOT
+     {
+         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
+-        PARSER->registerParseNode($$);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -337,8 +337,8 @@ PrimaryExpr:
+     VARIABLEREFERENCE
+     {
+         $$ = new VariableReference(*$1);
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     '(' Expr ')'
+@@ -349,15 +349,15 @@ PrimaryExpr:
+     LITERAL
+     {
+         $$ = new StringExpression(*$1);
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     NUMBER
+     {
+         $$ = new Number($1->toDouble());
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     FunctionCall
+@@ -369,8 +369,8 @@ FunctionCall:
+         $$ = createFunction(*$1);
+         if (!$$)
+             YYABORT;
+-        PARSER->deleteString($1);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->registerParseNode($$);
+     }
+     |
+     FUNCTIONNAME '(' ArgumentList ')'
+@@ -378,9 +378,9 @@ FunctionCall:
+         $$ = createFunction(*$1, *$3);
+         if (!$$)
+             YYABORT;
+-        PARSER->deleteString($1);
+-        PARSER->deleteExpressionVector($3);
+-        PARSER->registerParseNode($$);
++        parser->deleteString($1);
++        parser->deleteExpressionVector($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -389,14 +389,14 @@ ArgumentList:
+     {
+         $$ = new Vector<Expression*>;
+         $$->append($1);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->registerExpressionVector($$);
++        parser->unregisterParseNode($1);
++        parser->registerExpressionVector($$);
+     }
+     |
+     ArgumentList ',' Argument
+     {
+         $$->append($3);
+-        PARSER->unregisterParseNode($3);
++        parser->unregisterParseNode($3);
+     }
+     ;
+ 
+@@ -412,9 +412,9 @@ UnionExpr:
+         $$ = new Union;
+         $$->addSubExpression($1);
+         $$->addSubExpression($3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -430,9 +430,9 @@ PathExpr:
+     {
+         $3->setAbsolute(true);
+         $$ = new Path(static_cast<Filter*>($1), $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     |
+     FilterExpr DescendantOrSelf RelativeLocationPath
+@@ -440,10 +440,10 @@ PathExpr:
+         $3->insertFirstStep($2);
+         $3->setAbsolute(true);
+         $$ = new Path(static_cast<Filter*>($1), $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($2);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -453,9 +453,9 @@ FilterExpr:
+     PrimaryExpr PredicateList
+     {
+         $$ = new Filter($1, *$2);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->deletePredicateVector($2);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->deletePredicateVector($2);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -465,9 +465,9 @@ OrExpr:
+     OrExpr OR AndExpr
+     {
+         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -477,9 +477,9 @@ AndExpr:
+     AndExpr AND EqualityExpr
+     {
+         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -489,9 +489,9 @@ EqualityExpr:
+     EqualityExpr EQOP RelationalExpr
+     {
+         $$ = new EqTestOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -501,9 +501,9 @@ RelationalExpr:
+     RelationalExpr RELOP AdditiveExpr
+     {
+         $$ = new EqTestOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -513,17 +513,17 @@ AdditiveExpr:
+     AdditiveExpr PLUS MultiplicativeExpr
+     {
+         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     |
+     AdditiveExpr MINUS MultiplicativeExpr
+     {
+         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -533,9 +533,9 @@ MultiplicativeExpr:
+     MultiplicativeExpr MULOP UnaryExpr
+     {
+         $$ = new NumericOp($2, $1, $3);
+-        PARSER->unregisterParseNode($1);
+-        PARSER->unregisterParseNode($3);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($1);
++        parser->unregisterParseNode($3);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+@@ -546,8 +546,8 @@ UnaryExpr:
+     {
+         $$ = new Negative;
+         $$->addSubExpression($2);
+-        PARSER->unregisterParseNode($2);
+-        PARSER->registerParseNode($$);
++        parser->unregisterParseNode($2);
++        parser->registerParseNode($$);
+     }
+     ;
+ 
+diff --git a/Source/WebCore/xml/XPathParser.cpp b/Source/WebCore/xml/XPathParser.cpp
+index 62d8ee37fd6ebb74a580a00c59beb6cd40c5a8b7..b5e6a9237593b4aaa2a243f2ff9d86e57f930a97 100644
+--- a/Source/WebCore/xml/XPathParser.cpp
++++ b/Source/WebCore/xml/XPathParser.cpp
+@@ -32,24 +32,21 @@
+ #include "XPathEvaluator.h"
+ #include "XPathException.h"
+ #include "XPathNSResolver.h"
++#include "XPathPath.h"
+ #include "XPathStep.h"
+ #include <wtf/StdLibExtras.h>
+ #include <wtf/text/StringHash.h>
+ 
+-int xpathyyparse(void*);
+-
++using namespace WebCore;
+ using namespace WTF;
+ using namespace Unicode;
++using namespace XPath;
+ 
+-namespace WebCore {
+-namespace XPath {
+-
+-class LocationPath;
+-
+-#include "XPathGrammar.h"    
++extern int xpathyyparse(WebCore::XPath::Parser*);
++#include "XPathGrammar.h"
+ 
+ Parser* Parser::currentParser = 0;
+-    
++
+ enum XMLCat { NameStart, NameCont, NotPartOfName };
+ 
+ typedef HashMap<String, Step::Axis> AxisNamesMap;
+@@ -630,5 +627,3 @@ void Parser::deleteNodeTest(Step::NodeTest* t)
+     delete t;
+ }
+ 
+-}
+-}
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
index bba9a80..1789d4d 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
-PR = "r2"
+PR = "r3"
 
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
@@ -22,6 +22,7 @@ SRC_URI = "\
   file://nodolt.patch \
   file://no-gtkdoc.patch \
   file://webgit-gtk_fix_build_with_automake_1.12.patch \
+  file://bison-2.6.patch \
  "
 
 SRC_URI[md5sum] = "f7bd0bd4f323039f15e19c82a9a8313c"
-- 
1.8.0.2



