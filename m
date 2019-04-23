Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 86F7A7997F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:44:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3N9i2Ql004250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:44:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 23 Apr 2019 02:43:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2019 17:43:49 +0800
Message-ID: <1556012629-54630-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] m4: add ptest support
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
X-List-Received-Date: Tue, 23 Apr 2019 09:44:02 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add patch 0001-test-getopt-posix-fix.patch for fix test-getopt-posix

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc             | 37 +++++++++++++++++--
 .../m4/m4/0001-test-getopt-posix-fix.patch         | 41 ++++++++++++++++++++++
 meta/recipes-devtools/m4/m4/run-ptest              |  5 +++
 .../m4/m4/serial-tests-config.patch                | 30 ++++++++++++++++
 4 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
 create mode 100644 meta/recipes-devtools/m4/m4/run-ptest
 create mode 100644 meta/recipes-devtools/m4/m4/serial-tests-config.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index a6cef6f..f433b3f 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -4,15 +4,18 @@ DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro process
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 
-inherit autotools texinfo
+inherit autotools texinfo ptest
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
            file://remove-gets.patch \
            file://m4-1.4.18-glibc-change-work-around.patch \
            "
-
-SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+                                file://run-ptest \
+                                file://serial-tests-config.patch \
+                                file://0001-test-getopt-posix-fix.patch \
+                              "
 
 SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
 SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
@@ -28,3 +31,31 @@ acpaths = "-I ./m4"
 EXTRA_OECONF += "--without-libsigsegv-prefix"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
+
+do_compile_ptest() {
+	cd ${B}/tests
+	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile
+	oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+                cp -r ${B}/tests                        ${D}${PTEST_PATH}
+                cp -r ${S}/tests/*                      ${D}${PTEST_PATH}/tests/
+                sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
+                sed -i -e  "s;LOCALE_FR='fr_FR';LOCALE_FR='fr_FR.iso88591';g" \
+                       -e  "s;LOCALE_FR_UTF8='none';LOCALE_FR_UTF8='fr_FR.utf8';g" ${D}${PTEST_PATH}/tests/Makefile
+                find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
+                cp ${S}/build-aux/update-copyright  ${D}${PTEST_PATH}/tests/
+                sed -i 's;update-copyright;./update-copyright;g' ${D}${PTEST_PATH}/tests/test-update-copyright.sh
+                chmod 0755 ${D}${PTEST_PATH}/tests/test-mbrtowc-w32-1.sh  ${D}${PTEST_PATH}/tests/test-spawn-pipe-main \
+                     ${D}${PTEST_PATH}/tests/test-spawn-pipe-child ${D}${PTEST_PATH}/tests/test-version-etc \
+                     ${D}${PTEST_PATH}/tests/test-xalloc-die
+}
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+     locale-base-fr-fr.iso-8859-1 \
+"
+
+INSANE_SKIP_${PN}-ptest += "ldflags"
+INSANE_SKIP_${PN}-ptest += "rpaths"
+
diff --git a/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch b/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
new file mode 100644
index 0000000..11508ee
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
@@ -0,0 +1,41 @@
+From 75bea7c72a919859674f493548653de88f96c798 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 22 Apr 2019 10:36:13 +0800
+Subject: [PATCH] test-getopt-posix fix
+
+fix below problem:
+test-getopt.h:754: assertion 'strcmp (argv[1], "donald") == 0' failed
+
+get this patch from  
+https://github.com/habitat-sh/core-plans/blob/master/m4/fix-test-getopt-posix-with-glibc-2.26.patch
+
+Upstream-Status: Pending
+
+have report this bug to m4-discuss@gnu.org
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/test-getopt-posix.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tests/test-getopt-posix.c b/tests/test-getopt-posix.c
+index 5532271..2a3d511 100644
+--- a/tests/test-getopt-posix.c
++++ b/tests/test-getopt-posix.c
+@@ -22,6 +22,13 @@
+    ftell link warning if we are not using the gnulib ftell module.  */
+ #define _GL_NO_LARGE_FILES
+ 
++/*
++ * Glibc 2.26 does hard include bits/getopt_posix.h which causes the system
++ * to use glibc's getopt but the tests expect gnulib behavior. Until a better
++ * fix is available this avoids that mis-resolution.
++ */
++#include <getopt.h>
++
+ /* POSIX and glibc provide the getopt() function in <unistd.h>, see
+    http://pubs.opengroup.org/onlinepubs/9699919799/functions/getopt.html
+    https://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/m4/m4/run-ptest b/meta/recipes-devtools/m4/m4/run-ptest
new file mode 100644
index 0000000..5c0fe93
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+#
+#This script is used to run m4 test suites
+cd tests 
+make -k runtest-TESTS top_srcdir=.. srcdir=.
diff --git a/meta/recipes-devtools/m4/m4/serial-tests-config.patch b/meta/recipes-devtools/m4/m4/serial-tests-config.patch
new file mode 100644
index 0000000..34e6ad8
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/serial-tests-config.patch
@@ -0,0 +1,30 @@
+From ab8491111b4578db5b735c6466187775e1855f18 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 23 Apr 2019 15:35:00 +0800
+Subject: [PATCH] add a patch to use serial-tests config needed by ptest
+
+Add serial-tests support, ptest need it.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 78b8788..931fa6f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,7 +22,7 @@ AC_INIT([GNU M4], m4_esyscmd([build-aux/git-version-gen .tarball-version]),
+   [bug-m4@gnu.org])
+ AC_CONFIG_AUX_DIR([build-aux])
+ 
+-AM_INIT_AUTOMAKE([1.11.6 dist-bzip2 dist-xz color-tests parallel-tests
++AM_INIT_AUTOMAKE([1.11.6 dist-bzip2 dist-xz color-tests serial-tests
+ silent-rules subdir-objects gnu])
+ AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
+ 
+-- 
+2.7.4
+
-- 
2.7.4


