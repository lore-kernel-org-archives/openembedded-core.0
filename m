Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3DA6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064202"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:23 +0200
Message-Id: <75361fe58bb48cbda4dd21063e55af80dfeee838.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/20] flex: update to 2.6.0
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:12 -0000

Drop backported 0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch

Test cases have been completely rearranged upstream, so ptest support
is fully rewritten.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...fixes-Do-not-use-obsolete-bison-construct.patch | 80 ----------------------
 meta/recipes-devtools/flex/files/run-ptest         | 30 +-------
 meta/recipes-devtools/flex/flex.inc                | 19 +++--
 ...-target-for-building-tests-without-runnin.patch | 28 ++++++++
 meta/recipes-devtools/flex/flex_2.5.39.bb          |  9 ---
 meta/recipes-devtools/flex/flex_2.6.0.bb           | 13 ++++
 6 files changed, 52 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 create mode 100644 meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.39.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.6.0.bb

diff --git a/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch b/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
deleted file mode 100644
index 3504f54..0000000
--- a/meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 7fbc074901129ffaff9e18fadacae62d8053ad95 Mon Sep 17 00:00:00 2001
-From: Manoj Srivastava <srivasta@golden-gryphon.com>
-Date: Wed, 9 Apr 2014 00:23:07 -0700
-Subject: [PATCH] Do not use obsolete bison constructs in tests.
-
-In Bison 3.0, support for YYLEX_PARAM and YYPARSE_PARAM has been
-removed (deprecated in Bison 1.875): use %lex-param, %parse-param, or
-%param. This commit fixes the tests so they still work.
-
-Signed-off-by: Manoj Srivastava <srivasta@golden-gryphon.com>
-
-Upstream-Status: Backport [from http://sourceforge.net/p/flex/bugs/169/]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/test-bison-yylloc/parser.y | 4 ++--
- tests/test-bison-yylval/parser.y | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tests/test-bison-yylloc/parser.y b/tests/test-bison-yylloc/parser.y
-index e8f4e56..224d252 100644
---- a/tests/test-bison-yylloc/parser.y
-+++ b/tests/test-bison-yylloc/parser.y
-@@ -22,6 +22,7 @@
-  */
- 
- %parse-param { void* scanner }
-+%lex-param { void* scanner }
- 
- /* 
-    How to compile:
-@@ -34,7 +35,6 @@
- #include "config.h"
- 
- #define YYERROR_VERBOSE 1
--#define YYLEX_PARAM   scanner
- 
- extern int testget_lineno(void*);
- 
-@@ -52,7 +52,7 @@ int process_text(char* s) {
- 
- %}
- 
--%pure_parser
-+%pure-parser
- 
- %union  {
-     int  lineno;
-diff --git a/tests/test-bison-yylval/parser.y b/tests/test-bison-yylval/parser.y
-index 0ffdb89..626c5e7 100644
---- a/tests/test-bison-yylval/parser.y
-+++ b/tests/test-bison-yylval/parser.y
-@@ -26,6 +26,7 @@
-    bison --defines --output-file="parser.c" --name-prefix="test" parser.y
-  */
- %parse-param { void* scanner }
-+%lex-param { void* scanner }
- %{
- #include <stdio.h>
- #include <stdlib.h>
-@@ -33,7 +34,6 @@
- #include "config.h"
- 
- #define YYERROR_VERBOSE 1
--#define YYLEX_PARAM   scanner
- 
- 
- /* A dummy function. A check against seg-faults in yylval->str. */
-@@ -49,7 +49,7 @@ int process_text(char* s) {
- 
- %}
- 
--%pure_parser
-+%pure-parser
- 
- %union  {
-     long unused;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/flex/files/run-ptest b/meta/recipes-devtools/flex/files/run-ptest
index bffba16..19db337 100755
--- a/meta/recipes-devtools/flex/files/run-ptest
+++ b/meta/recipes-devtools/flex/files/run-ptest
@@ -1,29 +1,5 @@
 #!/bin/sh
 
-test1="test-alloc-extra test-array-nr test-array-r test-basic-nr test-basic-r test-extended test-quotes \
-test-bison-nr test-bison-yylloc test-bison-yylval test-c++-basic test-c-cpp-nr test-prefix-nr test-ccl \
-test-c-cpp-r test-c++-multiple-scanners test-mem-r test-mem-nr test-debug-nr test-linedir-r test-noansi-r \
-test-yyextra test-header-r test-noansi-nr test-debug-r TEMPLATE test-top test-header-nr test-prefix-r"
-test2="test-multiple-scanners-nr test-posixly-correct test-posix test-string-r test-string-nr"
-test3="test-pthread test-include-by-push test-include-by-buffer test-include-by-reentrant"
-test4="test-lineno-nr test-lineno-r test-lineno-trailing"
-test5="test-c++-yywrap test-rescan-r test-rescan-nr"
-test6="test-reject-nr test-reject-r"
-test7="test-reject-ser test-reject-ver"
-test8="test-multiple-scanners-r"
-
-output() {
-  if [ $? -eq 0 ]; \
-    then echo "PASS: $i"; \
-    else echo "FAIL: $i"; \
-  fi;
-}
-
-for i in $test1; do $i/$i < $i/test.input >/dev/null; output; done
-for i in $test2; do $i/$i >/dev/null; output; done
-for i in $test3; do cd $i; ./$i test-1.input >/dev/null; output; cd ..; done
-for i in $test4; do test `$i/$i < $i/test.input` -eq `$i/$i 1 < $i/test.input` >/dev/null; output; done
-for i in $test5; do $i/$i $i/test.input >/dev/null; output; done
-for i in $test6; do test-reject/$i < test-reject/test.input >/dev/null; output; done
-for i in $test7; do test-reject/$i test-reject/$i.tables < test-reject/test.input >/dev/null; output; done
-cd $test8; ./$test8 >/dev/null; i=$test8 output
+# make would want to rebuild some files with a compiler otherwise :-/
+make FLEX=/usr/bin/flex -t check-TESTS || true
+make FLEX=/usr/bin/flex check-TESTS
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index fbe921b..ab4c4bc 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -7,10 +7,7 @@ SECTION = "devel"
 LICENSE = "BSD"
 DEPENDS += "${@'bison-native flex-native' if '${PTEST_ENABLED}' == '1' else ''}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
-           file://0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch \
-           file://run-ptest \
-"
+UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext texinfo ptest
 
@@ -30,16 +27,16 @@ do_install_append_class-nativesdk() {
 }
 
 RDEPENDS_${PN} += "m4"
+RDEPENDS_${PN}-ptest += "bash gawk"
 
 do_compile_ptest() {
-	for i in `find ${S}/tests/ -type d |grep -Ev "concatenated-options|reject|table-opts" | awk -F/ '{print $NF}'`; \
-	  do oe_runmake -C ${S}/tests/$i -f ${B}/tests/$i/Makefile top_builddir=${B} FLEX=flex $i; \
-	done
-	oe_runmake -C ${S}/tests/test-reject -f ${B}/tests/test-reject/Makefile top_builddir=${B} FLEX=flex test-reject-nr test-reject-r test-reject-ser test-reject-ver
+	oe_runmake -C ${B}/tests -f ${B}/tests/Makefile top_builddir=${B} INCLUDES=-I${S}/src FLEX=`which flex` buildtests
 }
 
 do_install_ptest() {
-	for i in `find ${S}/tests/ -type d | awk -F/ '{print $NF}'`; \
-	  do cp -r ${S}/tests/$i ${D}${PTEST_PATH}; \
-	done
+        mkdir -p ${D}${PTEST_PATH}/build-aux/
+        cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+        cp -r ${S}/tests/* ${D}${PTEST_PATH}
+        cp -r ${B}/tests/* ${D}${PTEST_PATH}
+        sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./'  -i ${D}${PTEST_PATH}/Makefile
 }
diff --git a/meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch
new file mode 100644
index 0000000..556c240
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -0,0 +1,28 @@
+From b4aa18d939fc0c8825fa584dfcee1a7da61099cf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 10 Dec 2015 16:09:26 +0200
+Subject: [PATCH] tests: add a target for building tests without running them
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 4ac3c17..0025cfe 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -21,6 +21,9 @@
+ 
+ TESTS = $(check_PROGRAMS) options.cn
+ 
++# This allows building tests without running them
++buildtests: $(TESTS)
++
+ # The script testwrapper.sh will run most tests as is. A couple tests
+ # in the suite end in .reject, .table and the like so that we can pass
+ # different arguments to the test runner. We list those extensions so
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/flex/flex_2.5.39.bb b/meta/recipes-devtools/flex/flex_2.5.39.bb
deleted file mode 100644
index 7485743..0000000
--- a/meta/recipes-devtools/flex/flex_2.5.39.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require flex.inc
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://do_not_create_pdf_doc.patch"
-
-SRC_URI[md5sum] = "77d44c6bb8c0705e0017ab9a84a1502b"
-SRC_URI[sha256sum] = "add2b55f3bc38cb512b48fad7d72f43b11ef244487ff25fc00aabec1e32b617f"
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
new file mode 100644
index 0000000..ecacd60
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -0,0 +1,13 @@
+require flex.inc
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://run-ptest \
+           file://do_not_create_pdf_doc.patch \
+           file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           "
+
+SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
+SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
-- 
2.6.2


