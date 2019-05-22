Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AEF37D69E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 09:11:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4M9BbJ8005311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 May 2019 02:11:37 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 22 May 2019 02:11:36 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2019 17:11:35 +0800
Message-ID: <1558516295-289667-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] elfutils: fix ptest failures
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
X-List-Received-Date: Wed, 22 May 2019 09:11:37 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add missing -ptest package dependencies (needs
  ${PN}-dbg)

* Add missing files which needed by ptest test
  to fix below failures:
  | ./run-ar.sh: line 23: cd: /usr/lib64/elfutils/ptest/tests/..//src: No such file or directory
  | FAIL: run-ar.sh

  | sh: ../src/elflint: No such file or directory
  | FAIL: asm-tst4

* Rework 0001-skip-the-test-when-gcc-not-deployed.patch
  to skip the tests which depend on gcc

Before:
--------------------------------------------
Recipe   | Passed    | Failed   | Skipped
--------------------------------------------
elfutils | 176       | 23       | 4
--------------------------------------------

After:
--------------------------------------------
Recipe   | Passed    | Failed   | Skipped
--------------------------------------------
elfutils | 184       | 15       | 4
--------------------------------------------

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.176.bb   |  5 ++-
 .../0001-skip-the-test-when-gcc-not-deployed.patch | 38 +++++++++++++++++++---
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 157551e..85ff5f3 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -44,7 +44,7 @@ inherit autotools gettext ptest
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
-RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
+RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN} ${PN}-dbg"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
 
@@ -61,6 +61,8 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	if [ ${PTEST_ENABLED} = "1" ]; then
+		install -d -m 755                       ${D}${PTEST_PATH}/src
+		cp -r ${B}/src/*                        ${D}${PTEST_PATH}/src
 		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
 		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
 		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
@@ -109,3 +111,4 @@ FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils
 
 # The package contains symlinks that trip up insane
 INSANE_SKIP_${MLPREFIX}libdw = "dev-so"
+INSANE_SKIP_${PN}-ptest += "debug-deps"
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 67ca0e4..de8c05f 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,19 +1,47 @@
-From 61939d2e552e7645ecd671fa01cf1c7a72caa82a Mon Sep 17 00:00:00 2001
+From e82a055f85e398cb03a4eaf5faf351a3a1f19344 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 12 Apr 2019 16:29:58 +0800
-Subject: [PATCH] skip the test when gcc not deployed
+Date: Tue, 21 May 2019 15:20:34 +0800
+Subject: [PATCH v2] skip the test when gcc not deployed
 
 Skip the tests which depend on gcc when
 gcc not deployed.
 
-Upstream-Status: Inappropriate [oe specific]
+Upstream-Status: Submitted[https://sourceware.org/ml/elfutils-devel/2019-q2/msg00091.html]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
+ tests/run-disasm-x86-64.sh | 2 ++
+ tests/run-disasm-x86.sh    | 2 ++
  tests/run-strip-g.sh       | 2 ++
  tests/run-strip-nothing.sh | 2 ++
- 2 files changed, 4 insertions(+)
+ 4 files changed, 8 insertions(+)
 
+diff --git a/tests/run-disasm-x86-64.sh b/tests/run-disasm-x86-64.sh
+index a6be62b..c3ef238 100755
+--- a/tests/run-disasm-x86-64.sh
++++ b/tests/run-disasm-x86-64.sh
+@@ -22,6 +22,8 @@ case "`uname -m`" in
+   x86_64)
+     tempfiles testfile45.o
+     testfiles testfile45.S testfile45.expect
++    # skip the case if no gcc deployed
++    which gcc || exit 77
+     gcc -m64 -c -o testfile45.o testfile45.S
+     testrun_compare ${abs_top_builddir}/src/objdump -d testfile45.o < testfile45.expect
+     ;;
+diff --git a/tests/run-disasm-x86.sh b/tests/run-disasm-x86.sh
+index 28a3df7..544fc28 100755
+--- a/tests/run-disasm-x86.sh
++++ b/tests/run-disasm-x86.sh
+@@ -22,6 +22,8 @@ case "`uname -m`" in
+   x86_64 | i?86 )
+     tempfiles testfile44.o
+     testfiles testfile44.S testfile44.expect
++    # skip the case if no gcc deployed
++    which gcc || exit 77
+     gcc -m32 -c -o testfile44.o testfile44.S
+     testrun_compare ${abs_top_builddir}/src/objdump -d testfile44.o < testfile44.expect
+     ;;
 diff --git a/tests/run-strip-g.sh b/tests/run-strip-g.sh
 index 1303819..a943dec 100755
 --- a/tests/run-strip-g.sh
-- 
2.7.4


