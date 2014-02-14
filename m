Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 246E16F006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 09:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E9lW7p008100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 01:47:32 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 01:47:31 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 17:47:27 +0800
Message-ID: <fe5f37533a89ff792a05d5ccd5f2bb3b580d2f99.1392371084.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392371084.git.Chong.Lu@windriver.com>
References: <cover.1392371084.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] flex: enable ptest support
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
X-List-Received-Date: Fri, 14 Feb 2014 09:47:31 -0000
Content-Type: text/plain

Install flex test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/flex/files/run-ptest | 29 +++++++++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc        | 21 +++++++++++++++++++--
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/flex/files/run-ptest

diff --git a/meta/recipes-devtools/flex/files/run-ptest b/meta/recipes-devtools/flex/files/run-ptest
new file mode 100755
index 0000000..bffba16
--- /dev/null
+++ b/meta/recipes-devtools/flex/files/run-ptest
@@ -0,0 +1,29 @@
+#!/bin/sh
+
+test1="test-alloc-extra test-array-nr test-array-r test-basic-nr test-basic-r test-extended test-quotes \
+test-bison-nr test-bison-yylloc test-bison-yylval test-c++-basic test-c-cpp-nr test-prefix-nr test-ccl \
+test-c-cpp-r test-c++-multiple-scanners test-mem-r test-mem-nr test-debug-nr test-linedir-r test-noansi-r \
+test-yyextra test-header-r test-noansi-nr test-debug-r TEMPLATE test-top test-header-nr test-prefix-r"
+test2="test-multiple-scanners-nr test-posixly-correct test-posix test-string-r test-string-nr"
+test3="test-pthread test-include-by-push test-include-by-buffer test-include-by-reentrant"
+test4="test-lineno-nr test-lineno-r test-lineno-trailing"
+test5="test-c++-yywrap test-rescan-r test-rescan-nr"
+test6="test-reject-nr test-reject-r"
+test7="test-reject-ser test-reject-ver"
+test8="test-multiple-scanners-r"
+
+output() {
+  if [ $? -eq 0 ]; \
+    then echo "PASS: $i"; \
+    else echo "FAIL: $i"; \
+  fi;
+}
+
+for i in $test1; do $i/$i < $i/test.input >/dev/null; output; done
+for i in $test2; do $i/$i >/dev/null; output; done
+for i in $test3; do cd $i; ./$i test-1.input >/dev/null; output; cd ..; done
+for i in $test4; do test `$i/$i < $i/test.input` -eq `$i/$i 1 < $i/test.input` >/dev/null; output; done
+for i in $test5; do $i/$i $i/test.input >/dev/null; output; done
+for i in $test6; do test-reject/$i < test-reject/test.input >/dev/null; output; done
+for i in $test7; do test-reject/$i test-reject/$i.tables < test-reject/test.input >/dev/null; output; done
+cd $test8; ./$test8 >/dev/null; i=$test8 output
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 96d5de5..75c10ef 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -6,9 +6,12 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
+SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://run-ptest \
+"
+
+inherit autotools gettext ptest
 
-inherit autotools gettext
 
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
@@ -25,3 +28,17 @@ do_install_append_class-nativesdk() {
 }
 
 RDEPENDS_${PN} += "m4"
+DEPENDS_${PN}-ptest += "bison-native flex-native"
+
+do_compile_ptest() {
+	for i in `find ${S}/tests/ -type d |grep -Ev "concatenated-options|reject|table-opts" | awk -F/ '{print $NF}'`; \
+	  do oe_runmake -C ${S}/tests/$i -f ${B}/tests/$i/Makefile top_builddir=${B} FLEX=flex $i; \
+	done
+	oe_runmake -C ${S}/tests/test-reject -f ${B}/tests/test-reject/Makefile top_builddir=${B} FLEX=flex test-reject-nr test-reject-r test-reject-ser test-reject-ver
+}
+
+do_install_ptest() {
+	for i in `find ${S}/tests/ -type d | awk -F/ '{print $NF}'`; \
+	  do cp -r ${S}/tests/$i ${D}${PTEST_PATH}; \
+	done
+}
-- 
1.8.1.2


