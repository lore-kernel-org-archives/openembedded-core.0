Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4267C337
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:05:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3G85Ete004815
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2019 01:05:29 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 16 Apr 2019 01:05:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 16 Apr 2019 16:05:00 +0800
Message-ID: <1555401901-255399-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <a6d8db1cab09ee762353d355107975a59c74b67e.camel@linuxfoundation.org>
References: <a6d8db1cab09ee762353d355107975a59c74b67e.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH v2 1/2] elfutils: add ptest support
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
X-List-Received-Date: Tue, 16 Apr 2019 08:05:55 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add testsuite-ignore-elflint.diff from debian
(http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz)
to fix below ptest failure:
 | ./run-strip-strmerge.sh: line 33: testrun_on_self_skip: command not found
 | FAIL: run-strip-strmerge.sh

Add check for gcc for two test cases such as
run-strip-nothing.sh and run-strip-g.sh which
depends on gcc at run time.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.176.bb   | 27 ++++++++++-
 .../0001-skip-the-test-when-gcc-not-deployed.patch | 45 +++++++++++++++++++
 .../files/debian/testsuite-ignore-elflint.diff     | 52 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/files/run-ptest     |  6 +++
 .../elfutils/files/serial-tests.patch              | 28 ++++++++++++
 5 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
 create mode 100644 meta/recipes-devtools/elfutils/files/run-ptest
 create mode 100644 meta/recipes-devtools/elfutils/files/serial-tests.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index fd901c9..917c296 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -27,16 +27,24 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/hurd_path.patch \
            file://debian/ignore_strmerge.diff \
            file://debian/disable_werror.patch \
+           file://debian/testsuite-ignore-elflint.diff \
+           file://0001-skip-the-test-when-gcc-not-deployed.patch \
+           file://run-ptest \
+           file://serial-tests.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
 SRC_URI[md5sum] = "077e4f49320cad82bf17a997068b1db9"
 SRC_URI[sha256sum] = "eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023"
 
-inherit autotools gettext
+inherit autotools gettext ptest
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
+# gcc has been added to blacklist, we will find workaround solution
+RDEPENDS_${PN}-ptest = "libasm libelf bash"
+
+EXTRA_OECONF_append_class-target += "--enable-tests-rpath"
 
 do_install_append() {
 	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
@@ -44,6 +52,23 @@ do_install_append() {
 	fi
 }
 
+do_compile_ptest() {
+	cd ${B}/tests
+	oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+	if [ ${PTEST_ENABLED} = "1" ]; then
+		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
+		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
+		cp -r ${B}/src                          ${D}${PTEST_PATH}
+		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
+		cp -r ${B}/backends                     ${D}${PTEST_PATH}
+		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
+		find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
+	fi
+}
+
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OEMAKE_class-nativesdk = ""
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
new file mode 100644
index 0000000..67ca0e4
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -0,0 +1,45 @@
+From 61939d2e552e7645ecd671fa01cf1c7a72caa82a Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 12 Apr 2019 16:29:58 +0800
+Subject: [PATCH] skip the test when gcc not deployed
+
+Skip the tests which depend on gcc when
+gcc not deployed.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tests/run-strip-g.sh       | 2 ++
+ tests/run-strip-nothing.sh | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/tests/run-strip-g.sh b/tests/run-strip-g.sh
+index 1303819..a943dec 100755
+--- a/tests/run-strip-g.sh
++++ b/tests/run-strip-g.sh
+@@ -24,6 +24,8 @@
+ 
+ tempfiles a.out strip.out debug.out readelf.out
+ 
++# skip the test if gcc deployed
++which gcc || exit 77
+ echo Create debug a.out.
+ echo "int main() { return 1; }" | gcc -g -xc -
+ 
+diff --git a/tests/run-strip-nothing.sh b/tests/run-strip-nothing.sh
+index 914fdfb..d03f734 100755
+--- a/tests/run-strip-nothing.sh
++++ b/tests/run-strip-nothing.sh
+@@ -22,6 +22,8 @@
+ 
+ tempfiles a.out strip.out debug.out
+ 
++# skip the case if no gcc deployed
++which gcc || exit 77
+ # Create no-debug a.out.
+ echo "int main() { return 1; }" | gcc -s -xc -
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
new file mode 100644
index 0000000..c4ce20c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/testsuite-ignore-elflint.diff
@@ -0,0 +1,52 @@
+From 03a343c6b1b72598fce654b8a638f106da44abfb Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Fri, 12 Apr 2019 08:05:50 +0000
+Subject: [PATCH] On many architectures this test fails because binaries/libs
+ produced by binutils don't pass elflint. However elfutils shouldn't FTBFS
+ because of this.
+
+So we run the tests on all archs to see what breaks, but if it breaks we ignore
+the result (exitcode 77 means: this test was skipped).
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ tests/run-elflint-self.sh |  2 +-
+ tests/test-subr.sh        | 15 +++++++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/tests/run-elflint-self.sh b/tests/run-elflint-self.sh
+index 58fa7d0..85d21a5 100755
+--- a/tests/run-elflint-self.sh
++++ b/tests/run-elflint-self.sh
+@@ -18,5 +18,5 @@
+ 
+ . $srcdir/test-subr.sh
+ 
+-testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
++testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+ testrun_on_self_compressed ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+diff --git a/tests/test-subr.sh b/tests/test-subr.sh
+index 09f428d..26f61f1 100644
+--- a/tests/test-subr.sh
++++ b/tests/test-subr.sh
+@@ -201,3 +201,18 @@ testrun_on_self_quiet()
+   # Only exit if something failed
+   if test $exit_status != 0; then exit $exit_status; fi
+ }
++
++# Same as testrun_on_self(), but skip on failure.
++testrun_on_self_skip()
++{
++  exit_status=0
++
++  for file in $self_test_files; do
++      testrun $* $file \
++	  || { echo "*** failure in $* $file"; exit_status=77; }
++  done
++
++  # Only exit if something failed
++  if test $exit_status != 0; then exit $exit_status; fi
++}
++
diff --git a/meta/recipes-devtools/elfutils/files/run-ptest b/meta/recipes-devtools/elfutils/files/run-ptest
new file mode 100644
index 0000000..770a62e
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+#
+#This script is used to run elfutils test suites
+cd tests
+
+make -k runtest-TESTS abs_srcdir=$PWD abs_builddir=$PWD bindir=$PWD/../src/  srcdir=$PWD  top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed
diff --git a/meta/recipes-devtools/elfutils/files/serial-tests.patch b/meta/recipes-devtools/elfutils/files/serial-tests.patch
new file mode 100644
index 0000000..4b448cd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/serial-tests.patch
@@ -0,0 +1,28 @@
+From 48e111a17e8d5f10690716a63c17670f1406b56c Mon Sep 17 00:00:00 2001
+From: "Hongjun.Yang" <hongjun.yang@windriver.com>
+Date: Wed, 28 Oct 2015 13:24:54 +0800
+Subject: [PATCH] Add serial-tests support, ptest need it.
+
+Add serial-tests support, ptest need it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b4e012d..2eb0417 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -45,7 +45,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2018 The elfutils developers.])
+ AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
+ 
+ dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
+-AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip parallel-tests])
++AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip serial-tests])
+ AM_MAINTAINER_MODE
+ 
+ AM_SILENT_RULES([yes])
-- 
2.7.4


