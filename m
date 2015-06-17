Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B405975956
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205536"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:30 +0300
Message-Id: <1434547172-24620-21-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/22] Remove the recipe for the obsolete webkit-gtk 1.8.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 13:19:59 -0000

webkitgtk 2.8.3 is provided instead and midori browser is replaced by epiphany in
separate commits.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc        |   2 -
 meta/recipes-sato/webkit/files/bison-2.6.patch     | 558 ---------------------
 meta/recipes-sato/webkit/files/no-gtkdoc.patch     |  20 -
 meta/recipes-sato/webkit/files/nodolt.patch        |  19 -
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |  62 ---
 ...bkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch |  26 -
 .../0001-Enable-mips64-build.patch                 |  69 ---
 .../webkit/webkit-gtk-1.8.3/aarch64.patch          |  41 --
 .../obsolete_automake_macros.patch                 |  14 -
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       | 116 -----
 10 files changed, 927 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/bison-2.6.patch
 delete mode 100644 meta/recipes-sato/webkit/files/no-gtkdoc.patch
 delete mode 100644 meta/recipes-sato/webkit/files/nodolt.patch
 delete mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
 delete mode 100644 meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 9608c7f..367995c 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -16,7 +16,6 @@ SECURITY_CFLAGS_powerpc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
 SECURITY_CFLAGS_pn-dbus_powerpc = ""
 SECURITY_CFLAGS_pn-dbus-ptest_powerpc = ""
 SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
-SECURITY_CFLAGS_pn-webkit-gtk_powerpc = ""
 
 # arm specific security flag issues
 SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
@@ -80,7 +79,6 @@ SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-webkit-gtk = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
 # These 2 have text relco errors with the pie options enabled
diff --git a/meta/recipes-sato/webkit/files/bison-2.6.patch b/meta/recipes-sato/webkit/files/bison-2.6.patch
deleted file mode 100644
index d4aa674..0000000
--- a/meta/recipes-sato/webkit/files/bison-2.6.patch
+++ /dev/null
@@ -1,558 +0,0 @@
-Upstream-Status: Backport
-http://trac.webkit.org/changeset/124099
-
-Subversion Revision: 123651
-diff --git a/Source/WebCore/css/CSSGrammar.y b/Source/WebCore/css/CSSGrammar.y
-index c7c10b541cd46ad4febc6efe289e81b2cfb0861e..1c604e76b4da4cc65f395bc4a73b112561bd5c84 100644
---- a/Source/WebCore/css/CSSGrammar.y
-+++ b/Source/WebCore/css/CSSGrammar.y
-@@ -53,14 +53,13 @@ using namespace HTMLNames;
- #define YYMAXDEPTH 10000
- #define YYDEBUG 0
- 
--// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
--#define YYPARSE_PARAM parser
--#define YYLEX_PARAM parser
--
- %}
- 
- %pure_parser
- 
-+%parse-param { CSSParser* parser }
-+%lex-param { CSSParser* parser }
-+
- %union {
-     bool boolean;
-     char character;
-@@ -89,7 +88,7 @@ using namespace HTMLNames;
- 
- %{
- 
--static inline int cssyyerror(const char*)
-+static inline int cssyyerror(void*, const char*)
- {
-     return 1;
- }
-diff --git a/Source/WebCore/css/CSSParser.cpp b/Source/WebCore/css/CSSParser.cpp
-index 650844060477cfc6ea6fdeaf11ec63b34ac646e7..8369549dbff25537cf93a11237a9bbbac4fe50f2 100644
---- a/Source/WebCore/css/CSSParser.cpp
-+++ b/Source/WebCore/css/CSSParser.cpp
-@@ -114,7 +114,7 @@
- extern int cssyydebug;
- #endif
- 
--extern int cssyyparse(void* parser);
-+extern int cssyyparse(WebCore::CSSParser*);
- 
- using namespace std;
- using namespace WTF;
-diff --git a/Source/WebCore/xml/XPathGrammar.y b/Source/WebCore/xml/XPathGrammar.y
-index 2eba5b35bd2338272a0f4ec756d137e47d2d59c8..d558211db2d89ea13716762a51397755560f66f3 100644
---- a/Source/WebCore/xml/XPathGrammar.y
-+++ b/Source/WebCore/xml/XPathGrammar.y
-@@ -34,6 +34,7 @@
- #include "XPathParser.h"
- #include "XPathPath.h"
- #include "XPathPredicate.h"
-+#include "XPathStep.h"
- #include "XPathVariableReference.h"
- #include <wtf/FastMalloc.h>
- 
-@@ -44,8 +45,6 @@
- #define YYLTYPE_IS_TRIVIAL 1
- #define YYDEBUG 0
- #define YYMAXDEPTH 10000
--#define YYPARSE_PARAM parserParameter
--#define PARSER static_cast<Parser*>(parserParameter)
- 
- using namespace WebCore;
- using namespace XPath;
-@@ -53,6 +52,7 @@ using namespace XPath;
- %}
- 
- %pure_parser
-+%parse-param { WebCore::XPath::Parser* parser }
- 
- %union
- {
-@@ -71,7 +71,7 @@ using namespace XPath;
- %{
- 
- static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
--static void xpathyyerror(const char*) { }
-+static void xpathyyerror(void*, const char*) { }
-     
- %}
- 
-@@ -118,7 +118,7 @@ static void xpathyyerror(const char*) { }
- Expr:
-     OrExpr
-     {
--        PARSER->m_topExpr = $1;
-+        parser->m_topExpr = $1;
-     }
-     ;
- 
-@@ -138,7 +138,7 @@ AbsoluteLocationPath:
-     '/'
-     {
-         $$ = new LocationPath;
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     '/' RelativeLocationPath
-@@ -150,7 +150,7 @@ AbsoluteLocationPath:
-     {
-         $$ = $2;
-         $$->insertFirstStep($1);
--        PARSER->unregisterParseNode($1);
-+        parser->unregisterParseNode($1);
-     }
-     ;
- 
-@@ -159,22 +159,22 @@ RelativeLocationPath:
-     {
-         $$ = new LocationPath;
-         $$->appendStep($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     RelativeLocationPath '/' Step
-     {
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     |
-     RelativeLocationPath DescendantOrSelf Step
-     {
-         $$->appendStep($2);
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -183,58 +183,58 @@ Step:
-     {
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, *$1, *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, *$1);
--        PARSER->deleteNodeTest($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$1, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
-         
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NodeTest OptionalPredicateList
-     {
-         if ($3) {
-             $$ = new Step($1, *$2, *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, *$2);
--        PARSER->deleteNodeTest($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$2, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
- 
-         if ($3) {
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AbbreviatedStep
-@@ -259,23 +259,23 @@ NodeTest:
-         else if (*$1 == "comment")
-             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
- 
--        PARSER->deleteString($1);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
--        PARSER->deleteString($1);        
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' LITERAL ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
--        PARSER->deleteString($1);        
--        PARSER->deleteString($3);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->deleteString($3);
-+        parser->registerNodeTest($$);
-     }
-     ;
- 
-@@ -293,14 +293,14 @@ PredicateList:
-     {
-         $$ = new Vector<Predicate*>;
-         $$->append(new Predicate($1));
--        PARSER->unregisterParseNode($1);
--        PARSER->registerPredicateVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerPredicateVector($$);
-     }
-     |
-     PredicateList Predicate
-     {
-         $$->append(new Predicate($2));
--        PARSER->unregisterParseNode($2);
-+        parser->unregisterParseNode($2);
-     }
-     ;
- 
-@@ -315,7 +315,7 @@ DescendantOrSelf:
-     SLASHSLASH
-     {
-         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -323,13 +323,13 @@ AbbreviatedStep:
-     '.'
-     {
-         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     DOTDOT
-     {
-         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -337,8 +337,8 @@ PrimaryExpr:
-     VARIABLEREFERENCE
-     {
-         $$ = new VariableReference(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     '(' Expr ')'
-@@ -349,15 +349,15 @@ PrimaryExpr:
-     LITERAL
-     {
-         $$ = new StringExpression(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NUMBER
-     {
-         $$ = new Number($1->toDouble());
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FunctionCall
-@@ -369,8 +369,8 @@ FunctionCall:
-         $$ = createFunction(*$1);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FUNCTIONNAME '(' ArgumentList ')'
-@@ -378,9 +378,9 @@ FunctionCall:
-         $$ = createFunction(*$1, *$3);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->deleteExpressionVector($3);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->deleteExpressionVector($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -389,14 +389,14 @@ ArgumentList:
-     {
-         $$ = new Vector<Expression*>;
-         $$->append($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerExpressionVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerExpressionVector($$);
-     }
-     |
-     ArgumentList ',' Argument
-     {
-         $$->append($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -412,9 +412,9 @@ UnionExpr:
-         $$ = new Union;
-         $$->addSubExpression($1);
-         $$->addSubExpression($3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -430,9 +430,9 @@ PathExpr:
-     {
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     FilterExpr DescendantOrSelf RelativeLocationPath
-@@ -440,10 +440,10 @@ PathExpr:
-         $3->insertFirstStep($2);
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -453,9 +453,9 @@ FilterExpr:
-     PrimaryExpr PredicateList
-     {
-         $$ = new Filter($1, *$2);
--        PARSER->unregisterParseNode($1);
--        PARSER->deletePredicateVector($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->deletePredicateVector($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -465,9 +465,9 @@ OrExpr:
-     OrExpr OR AndExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -477,9 +477,9 @@ AndExpr:
-     AndExpr AND EqualityExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -489,9 +489,9 @@ EqualityExpr:
-     EqualityExpr EQOP RelationalExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -501,9 +501,9 @@ RelationalExpr:
-     RelationalExpr RELOP AdditiveExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -513,17 +513,17 @@ AdditiveExpr:
-     AdditiveExpr PLUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     AdditiveExpr MINUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -533,9 +533,9 @@ MultiplicativeExpr:
-     MultiplicativeExpr MULOP UnaryExpr
-     {
-         $$ = new NumericOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -546,8 +546,8 @@ UnaryExpr:
-     {
-         $$ = new Negative;
-         $$->addSubExpression($2);
--        PARSER->unregisterParseNode($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-diff --git a/Source/WebCore/xml/XPathParser.cpp b/Source/WebCore/xml/XPathParser.cpp
-index 62d8ee37fd6ebb74a580a00c59beb6cd40c5a8b7..b5e6a9237593b4aaa2a243f2ff9d86e57f930a97 100644
---- a/Source/WebCore/xml/XPathParser.cpp
-+++ b/Source/WebCore/xml/XPathParser.cpp
-@@ -32,24 +32,21 @@
- #include "XPathEvaluator.h"
- #include "XPathException.h"
- #include "XPathNSResolver.h"
-+#include "XPathPath.h"
- #include "XPathStep.h"
- #include <wtf/StdLibExtras.h>
- #include <wtf/text/StringHash.h>
- 
--int xpathyyparse(void*);
--
-+using namespace WebCore;
- using namespace WTF;
- using namespace Unicode;
-+using namespace XPath;
- 
--namespace WebCore {
--namespace XPath {
--
--class LocationPath;
--
--#include "XPathGrammar.h"    
-+extern int xpathyyparse(WebCore::XPath::Parser*);
-+#include "XPathGrammar.h"
- 
- Parser* Parser::currentParser = 0;
--    
-+
- enum XMLCat { NameStart, NameCont, NotPartOfName };
- 
- typedef HashMap<String, Step::Axis> AxisNamesMap;
-@@ -630,5 +627,3 @@ void Parser::deleteNodeTest(Step::NodeTest* t)
-     delete t;
- }
- 
--}
--}
diff --git a/meta/recipes-sato/webkit/files/no-gtkdoc.patch b/meta/recipes-sato/webkit/files/no-gtkdoc.patch
deleted file mode 100644
index 4eb09dc..0000000
--- a/meta/recipes-sato/webkit/files/no-gtkdoc.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-make install invokes a gtk-doc tool without checking that we have gtk-doc.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Upstream-Status: Pending (https://bugs.webkit.org/show_bug.cgi?id=91239)
-
-Index: webkit-1.8.1/Tools/GNUmakefile.am
-===================================================================
---- webkit-1.8.1.orig/Tools/GNUmakefile.am
-+++ webkit-1.8.1/Tools/GNUmakefile.am
-@@ -330,7 +330,9 @@ if ENABLE_WEBKIT2
- 	  fi; \
- 	fi
- endif
-+if ENABLE_GTK_DOC
- 	@$(AM_V_GEN)$(PYTHON) $(srcdir)/Tools/gtk/generate-gtkdoc --rebase --virtual-root=$${DESTDIR}
-+endif
- 
- uninstall-local:
- 	@DOC_MODULE_VERSION=`cat ./Documentation/webkitgtk/version.xml`; \
diff --git a/meta/recipes-sato/webkit/files/nodolt.patch b/meta/recipes-sato/webkit/files/nodolt.patch
deleted file mode 100644
index e713e8b..0000000
--- a/meta/recipes-sato/webkit/files/nodolt.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Dolt cause build error on some platform, so disable it.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: webkit-gtk-1.3.7+svnr72836-r72836-r0/configure.ac
-===================================================================
---- webkit-gtk-1.3.7+svnr72836-r72836-r0.orig/configure.ac	2011-01-21 11:11:07.000000000 +0800
-+++ webkit-gtk-1.3.7+svnr72836-r72836-r0/configure.ac	2011-01-21 11:11:15.000000000 +0800
-@@ -82,8 +82,6 @@
- AC_DISABLE_STATIC
- AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
--# use dolt to speedup the build
--DOLT
- 
- AC_PATH_PROG(FLEX, flex)
- if test -z "$FLEX"; then
diff --git a/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch b/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
deleted file mode 100644
index ad7c55f..0000000
--- a/meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has deprecated use of mkdir_p, and it recommends
-use of MKDIR_P instead. Changed the code to avoid these kind 
-of warning-errors.
-
-./.deps/DerivedSources
-make[1]: ./.deps/DerivedSources: Command not found
-make[1]: *** [all-local] Error 127
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/10
-
-Index: webkit-gtk-1.7.2+svnr101488-r6/GNUmakefile.am
-===================================================================
---- webkit-gtk-1.7.2+svnr101488-r6.orig/GNUmakefile.am
-+++ webkit-gtk-1.7.2+svnr101488-r6/GNUmakefile.am
-@@ -255,7 +255,7 @@ MAINTAINERCLEANFILES += \
- # Older automake versions (1.7) place Plo files in a different place so we need
- # to create the output directory manually.
- all-local: stamp-po
--	$(mkdir_p) $(top_builddir)/$(DEPDIR)/DerivedSources
-+	$(MKDIR_P) $(top_builddir)/$(DEPDIR)/DerivedSources
- 
- # remove built sources and program directories
- clean-local:
-Index: webkit-gtk-1.7.2+svnr101488-r6/Source/WebKit/gtk/po/GNUmakefile.am
-===================================================================
---- webkit-gtk-1.7.2+svnr101488-r6.orig/Source/WebKit/gtk/po/GNUmakefile.am
-+++ webkit-gtk-1.7.2+svnr101488-r6/Source/WebKit/gtk/po/GNUmakefile.am
-@@ -132,13 +132,13 @@ DISTCLEANFILES += \
- 	$(top_builddir)/Source/WebKit/gtk/po/$(DOMAIN).pot
- 
- po-install-data-local: all
--	$(mkdir_p) $(DESTDIR)$(datadir)
-+	$(MKDIR_P) $(DESTDIR)$(datadir)
- 	@catalogs='$(MOFILES)'; \
- 	for cat in $$catalogs; do \
- 	  cat=`basename $$cat`; \
- 	  lang=`echo $$cat | sed -e 's/\.mo$$//'`; \
- 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
--	  $(mkdir_p) $(DESTDIR)$$dir; \
-+	  $(MKDIR_P) $(DESTDIR)$$dir; \
- 	  if test -r Source/WebKit/gtk/po/$$cat; then realcat=Source/WebKit/gtk/po/$$cat; else realcat=$(srcdir)/$$cat; fi; \
- 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
- 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
-@@ -173,13 +173,13 @@ po-install-data-local: all
- 	done
- 
- po-installdirs-data-local:
--	$(mkdir_p) $(DESTDIR)$(datadir)
-+	$(MKDIR_P) $(DESTDIR)$(datadir)
- 	@catalogs='$(MOFILES)'; \
- 	for cat in $$catalogs; do \
- 	  cat=`basename $$cat`; \
- 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
- 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
--	  $(mkdir_p) $(DESTDIR)$$dir; \
-+	  $(MKDIR_P) $(DESTDIR)$$dir; \
- 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
- 	    if test -n "$$lc"; then \
- 	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
diff --git a/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch b/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
deleted file mode 100644
index e7e9083..0000000
--- a/meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-webkit-gtk: ANGLE doesn't build with bison 3
-
-Use %lex-param to set YYLEX_PARAM.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- Source/ThirdParty/ANGLE/src/compiler/glslang.y | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/ThirdParty/ANGLE/src/compiler/glslang.y b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-index ec1a85c..15723cc 100644
---- a/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-+++ b/Source/ThirdParty/ANGLE/src/compiler/glslang.y
-@@ -32,6 +32,7 @@ WHICH GENERATES THE GLSL ES PARSER (glslang_tab.cpp AND glslang_tab.h).
- %expect 1 /* One shift reduce conflict because of if | else */
- %pure-parser
- %parse-param {TParseContext* context}
-+%lex-param {YYLEX_PARAM}
- 
- %union {
-     struct {
--- 
-1.9.1
-
diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
deleted file mode 100644
index 5a42cd7..0000000
--- a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 4084d31d5b1fe3bf041881ad124873dbf3cd1868 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 17 May 2013 19:51:11 -0700
-Subject: [PATCH] Enable mips64 build
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- Source/JavaScriptCore/wtf/Platform.h   |    2 +-
- Source/JavaScriptCore/wtf/dtoa/utils.h |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h
-===================================================================
---- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/Platform.h	2012-08-20 09:30:25.000000000 -0700
-+++ webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h	2013-06-12 00:58:14.624055787 -0700
-@@ -76,14 +76,19 @@
- 
- /* CPU(MIPS) - MIPS 32-bit */
- /* Note: Only O32 ABI is tested, so we enable it for O32 ABI for now.  */
--#if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_)) \
--    && defined(_ABIO32)
-+#if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_) \
-+    || defined(__mips64))
-+#if defined(__mips64)
-+#define WTF_CPU_MIPS64 1
-+#define WTF_MIPS_ARCH __mips64
-+#else
- #define WTF_CPU_MIPS 1
-+#define WTF_MIPS_ARCH __mips
-+#endif
- #if defined(__MIPSEB__)
- #define WTF_CPU_BIG_ENDIAN 1
- #endif
- #define WTF_MIPS_PIC (defined __PIC__)
--#define WTF_MIPS_ARCH __mips
- #define WTF_MIPS_ISA(v) (defined WTF_MIPS_ARCH && WTF_MIPS_ARCH == v)
- #define WTF_MIPS_ISA_AT_LEAST(v) (defined WTF_MIPS_ARCH && WTF_MIPS_ARCH >= v)
- #define WTF_MIPS_ARCH_REV __mips_isa_rev
-@@ -295,7 +300,7 @@
- 
- #endif /* ARM */
- 
--#if CPU(ARM) || CPU(MIPS) || CPU(SH4) || CPU(SPARC)
-+#if CPU(ARM) || CPU(MIPS) || CPU(MIPS64) || CPU(SH4) || CPU(SPARC)
- #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
- #endif
- 
-@@ -899,6 +904,7 @@
-     || CPU(ALPHA) \
-     || CPU(SPARC64) \
-     || CPU(S390X) \
-+    || CPU(MIPS64) \
-     || CPU(PPC64)
- #define WTF_USE_JSVALUE64 1
- #else
-Index: webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h
-===================================================================
---- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/dtoa/utils.h	2012-08-20 09:26:05.000000000 -0700
-+++ webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h	2013-06-12 00:57:22.424054793 -0700
-@@ -49,7 +49,7 @@
- defined(__ARMEL__) || \
- defined(_MIPS_ARCH_MIPS32R2)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
--#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA)
-+#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__)
- #if defined(_WIN32)
diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
deleted file mode 100644
index a76b0ba..0000000
--- a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-Index: webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h
-===================================================================
---- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/Platform.h 2013-06-12 00:58:14.000000000 -0700
-+++ webkit-1.8.3/Source/JavaScriptCore/wtf/Platform.h  2013-06-12 00:59:18.764056782 -0700
-@@ -304,6 +304,11 @@
- #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
- #endif
- 
-+/* CPU(AARCH64) - Aarch64 */
-+#if defined(__aarch64__)
-+#define WTF_CPU_AARCH64 1
-+#endif
-+
- /* ==== OS() - underlying operating system; only to be used for mandated low-level services like 
-    virtual memory, not to choose a GUI toolkit ==== */
- 
-@@ -905,7 +910,8 @@
-     || CPU(SPARC64) \
-     || CPU(S390X) \
-     || CPU(MIPS64) \
--    || CPU(PPC64)
-+    || CPU(PPC64) \
-+    || CPU(AARCH64)
- #define WTF_USE_JSVALUE64 1
- #else
- #define WTF_USE_JSVALUE32_64 1
-Index: webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h
-===================================================================
---- webkit-1.8.3.orig/Source/JavaScriptCore/wtf/dtoa/utils.h   2013-06-12 00:57:22.000000000 -0700
-+++ webkit-1.8.3/Source/JavaScriptCore/wtf/dtoa/utils.h    2013-06-12 00:58:28.340056029 -0700
-@@ -49,7 +49,7 @@
- defined(__ARMEL__) || \
- defined(_MIPS_ARCH_MIPS32R2)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
--#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64)
-+#elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64) || CPU(AARCH64)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__)
- #if defined(_WIN32)
diff --git a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch b/meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
deleted file mode 100644
index d9e8444..0000000
--- a/meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd webkit-1.8.3/configure.ac webkit-1.8.3/configure.ac
---- webkit-1.8.3/configure.ac	2012-08-20 19:35:38.000000000 +0300
-+++ webkit-1.8.3/configure.ac	2013-02-08 11:55:28.403397789 +0200
-@@ -111,7 +111,6 @@
-
- AC_PROG_CC
- AC_PROG_CXX
--AM_PROG_CC_STDC
- AM_PROG_CC_C_O
- AC_PROG_INSTALL
- AC_SYS_LARGEFILE
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
deleted file mode 100644
index b9a9d7a..0000000
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-SUMMARY = "WebKit web rendering engine for the GTK+ platform"
-HOMEPAGE = "http://www.webkitgtk.org/"
-BUGTRACKER = "http://bugs.webkit.org/"
-
-LICENSE = "BSD & LGPLv2+"
-LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
-                    file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
-                    file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
-
-PR = "r1"
-
-# Choice of language backends - icu has issues on Big Endian machines so use pango
-ICU_LIB = "icu"
-ICU_LIB_powerpc = "pango"
-
-DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
-           gtk+ flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
-
-# The libxt requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "\
-  http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
-  file://nodolt.patch \
-  file://no-gtkdoc.patch \
-  file://webgit-gtk_fix_build_with_automake_1.12.patch \
-  file://bison-2.6.patch \
-  file://obsolete_automake_macros.patch \
-  file://0001-Enable-mips64-build.patch \
-  file://aarch64.patch \
-  file://webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch \
- "
-
-SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
-SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
-
-# webkit-gtk can NOT be built on MIPS64 with n32 ABI
-COMPATIBLE_HOST_mips64n32 = "null"
-
-inherit autotools lib_package gtk-doc pkgconfig distro_features_check
-
-S = "${WORKDIR}/webkit-${PV}/"
-
-# Disabled by default because it pulls in obsolete gstreamer 0.10
-WEBKIT_AUDIOVIDEO ?= "--disable-video --disable-web-audio"
-
-EXTRA_OECONF = "\
-                --enable-debug=no \
-                --enable-svg \
-                --enable-icon-database=yes \
-                --enable-fullscreen-api \
-                --enable-image-resizer \
-                --enable-link-prefetch \
-                --with-gtk=2.0 \
-                --disable-geolocation \
-		${WEBKIT_AUDIOVIDEO} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
-                UNICODE_CFLAGS=-D_REENTRANT \
-               "
-EXTRA_OECONF_append_armv5 = " --disable-jit"
-EXTRA_OECONF_append_armv6 = " --disable-jit"
-
-#default unicode backend icu breaks in cross-compile when target and host are different endian type
-EXTRA_OECONF_append_powerpc = " --with-unicode-backend=glib"
-
-CPPFLAGS_append_powerpc = " -I${STAGING_INCDIR}/pango-1.0 \
-                            -I${STAGING_LIBDIR}/glib-2.0/include \
-                            -I${STAGING_INCDIR}/glib-2.0"
-
-# ld can run out of memory linking libwebkitgtk!
-#
-LDFLAGS += "-Wl,--no-keep-memory"
-
-EXTRA_AUTORECONF = " -I Source/autotools "
-
-
-#| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member function 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T = JSC::Structure, JSC::HandleTypes<T>::ExternalType = JSC::Structure*, JSC::HandleSlot = JSC::JSValue*]':
-#| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from 'JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T = JSC::Structure, JSC::Handle<T>::ExternalType = JSC::Structure*]'
-#| ./Source/JavaScriptCore/runtime/ScopeChain.h:39:75:   instantiated from here
-#| ./Source/JavaScriptCore/heap/HandleTypes.h:38:130: warning: cast from 'JSC::JSCell*' to 'JSC::HandleTypes<JSC::Structure>::ExternalType {aka JSC::Structure*}' increases required alignment of target type [-Wcast-align]
-#| {standard input}: Assembler messages:
-#| {standard input}:28873: Error: invalid immediate: 983040 is out of range
-#| {standard input}:28873: Error: value of 983040 too large for field of 2 bytes at 15110
-#| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.2/as: BFD (GNU Binutils) 2.21.1 assertion fail /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/binutils-cross-2.21.1a-r0/binutils-2.21.1/bfd/elf.c:2819
-#| arm-oe-linux-gnueabi-g++: internal compiler error: Segmentation fault (program as)
-#| Please submit a full bug report,
-#| with preprocessed source if appropriate.
-#| See <http://gcc.gnu.org/bugs.html> for instructions.
-#| make[1]: *** [Source/JavaScriptCore/jit/libjavascriptcoregtk_1_0_la-JIT.lo] Error 1
-#| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/webkit-gtk-1.5.1+svnr90727-r0'
-ARM_INSTRUCTION_SET = "arm"
-
-CONFIGUREOPT_DEPTRACK = ""
-
-do_configure_append() {
-	# somethings wrong with icu, fix it up manually
-	for makefile in $(find ${B} -name "GNUmakefile") ; do
-		sed -i s:-I/usr/include::g $makefile
-	done
-}
-
-do_install_append() {
-	rmdir ${D}${libexecdir}
-}
-
-PACKAGES =+ "${PN}-webinspector ${PN}launcher-dbg ${PN}launcher libjavascriptcore"
-FILES_${PN}launcher = "${bindir}/GtkLauncher"
-FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
-FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
-FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
-FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
-                ${datadir}/webkitgtk-*/images \
-                ${datadir}/glib-2.0/schemas"
-
-
-- 
2.1.4


