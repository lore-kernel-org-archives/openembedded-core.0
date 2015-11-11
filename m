Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7D1736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 06:58:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB6wPhP007835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Nov 2015 22:58:25 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 22:58:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 11 Nov 2015 14:58:14 +0800
Message-ID: <d1133bcb570672fb61918ac86b05c1ae58544bb7.1447222992.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447222992.git.hongxu.jia@windriver.com>
References: <cover.1447222992.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] flex: fix test-bison-yylval and test-bison-yylloc failed
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
X-List-Received-Date: Wed, 11 Nov 2015 06:58:28 -0000
Content-Type: text/plain

The tests in flex test-bison-yylval and test-bison-yylloc
failed, so we backport a patch from upstream to fix it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...fixes-Do-not-use-obsolete-bison-construct.patch | 81 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch

diff --git a/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch b/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
new file mode 100644
index 0000000..20c0a7b
--- /dev/null
+++ b/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
@@ -0,0 +1,81 @@
+From 7fbc074901129ffaff9e18fadacae62d8053ad95 Mon Sep 17 00:00:00 2001
+From: Manoj Srivastava <srivasta@golden-gryphon.com>
+Date: Wed, 9 Apr 2014 00:23:07 -0700
+Subject: [PATCH] Do not use obsolete bison constructs in tests.
+
+In Bison 3.0, support for YYLEX_PARAM and YYPARSE_PARAM has been
+removed (deprecated in Bison 1.875): use %lex-param, %parse-param, or
+%param. This commit fixes the tests so they still work.
+
+Signed-off-by: Manoj Srivastava <srivasta@golden-gryphon.com>
+
+Upstream-Status:  Backport from upstream
+http://sourceforge.net/p/flex/bugs/169/
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/test-bison-yylloc/parser.y | 4 ++--
+ tests/test-bison-yylval/parser.y | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/test-bison-yylloc/parser.y b/tests/test-bison-yylloc/parser.y
+index e8f4e56..224d252 100644
+--- a/tests/test-bison-yylloc/parser.y
++++ b/tests/test-bison-yylloc/parser.y
+@@ -22,6 +22,7 @@
+  */
+ 
+ %parse-param { void* scanner }
++%lex-param { void* scanner }
+ 
+ /* 
+    How to compile:
+@@ -34,7 +35,6 @@
+ #include "config.h"
+ 
+ #define YYERROR_VERBOSE 1
+-#define YYLEX_PARAM   scanner
+ 
+ extern int testget_lineno(void*);
+ 
+@@ -52,7 +52,7 @@ int process_text(char* s) {
+ 
+ %}
+ 
+-%pure_parser
++%pure-parser
+ 
+ %union  {
+     int  lineno;
+diff --git a/tests/test-bison-yylval/parser.y b/tests/test-bison-yylval/parser.y
+index 0ffdb89..626c5e7 100644
+--- a/tests/test-bison-yylval/parser.y
++++ b/tests/test-bison-yylval/parser.y
+@@ -26,6 +26,7 @@
+    bison --defines --output-file="parser.c" --name-prefix="test" parser.y
+  */
+ %parse-param { void* scanner }
++%lex-param { void* scanner }
+ %{
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -33,7 +34,6 @@
+ #include "config.h"
+ 
+ #define YYERROR_VERBOSE 1
+-#define YYLEX_PARAM   scanner
+ 
+ 
+ /* A dummy function. A check against seg-faults in yylval->str. */
+@@ -49,7 +49,7 @@ int process_text(char* s) {
+ 
+ %}
+ 
+-%pure_parser
++%pure-parser
+ 
+ %union  {
+     long unused;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index a4a26e2..fbe921b 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -8,6 +8,7 @@ LICENSE = "BSD"
 DEPENDS += "${@'bison-native flex-native' if '${PTEST_ENABLED}' == '1' else ''}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch \
            file://run-ptest \
 "
 
-- 
1.9.1


