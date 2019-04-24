Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88279600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:37:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3O3b75E023694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 20:37:07 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 23 Apr 2019 20:37:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2019 11:37:04 +0800
Message-ID: <1556077024-241129-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gettext: add ptest support
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
X-List-Received-Date: Wed, 24 Apr 2019 03:37:06 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

skip test lang-c since it need gcc/libtool on target

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gettext/gettext-0.19.8.1/run-ptest             |  6 +++
 .../gettext-0.19.8.1/serial-tests-config.patch     | 58 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      | 57 ++++++++++++++++++++-
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest b/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
new file mode 100644
index 0000000..f17f3c8
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+#
+#This script is used to run gettext test suites
+cd tests
+
+make -k runtest-TESTS top_srcdir=.. srcdir=. abs_srcdir=$PWD top_builddir=$PWD/../ abs_top_srcdir=$PWD/../ | cat
diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
new file mode 100644
index 0000000..31ff913
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/serial-tests-config.patch
@@ -0,0 +1,58 @@
+From c4b1f3a0c7b7c40b343be9b95deb84e0485643be Mon Sep 17 00:00:00 2001
+From: "Hongjun.Yang" <hongjun.yang@windriver.com>
+Date: Thu, 28 Jul 2016 12:36:15 +0800
+Subject: [PATCH] fix for ptest
+
+Add serial-tests support, ptest need it
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac                 | 2 +-
+ gettext-runtime/configure.ac | 2 +-
+ gettext-tools/configure.ac   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5e996fa..880581f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -23,7 +23,7 @@ AC_INIT([gettext],
+ 	[bug-gnu-gettext@gnu.org])
+ AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+-AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests dist-xz dist-lzip])
++AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests dist-xz dist-lzip])
+ 
+ dnl Override automake's tar command used for creating distributions.
+ am__tar='${AMTAR} chof - --owner=root --group=root "$$tardir"'
+diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
+index e9299b6..d4f5528 100644
+--- a/gettext-runtime/configure.ac
++++ b/gettext-runtime/configure.ac
+@@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
+ 	[bug-gnu-gettext@gnu.org])
+ AC_CONFIG_SRCDIR([intl/dcigettext.c])
+ AC_CONFIG_AUX_DIR([../build-aux])
+-AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
++AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
+ AC_CONFIG_HEADERS([config.h])
+ 
+ dnl Installation directories.
+diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
+index 920eeb6..c507434 100644
+--- a/gettext-tools/configure.ac
++++ b/gettext-tools/configure.ac
+@@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
+ 	[bug-gnu-gettext@gnu.org])
+ AC_CONFIG_SRCDIR([src/msgfmt.c])
+ AC_CONFIG_AUX_DIR([../build-aux])
+-AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
++AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
+ AC_CONFIG_HEADERS([config.h])
+ 
+ dnl Installation directories.
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 4049724..627568b 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -22,12 +22,14 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
 	   file://use-pkgconfig.patch \
 	   file://fix-CVE-2018-18751.patch \
+	   file://run-ptest \
+	   file://serial-tests-config.patch \
 "
 
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
 SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
 
-inherit autotools texinfo pkgconfig
+inherit autotools texinfo pkgconfig ptest
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
@@ -129,4 +131,57 @@ do_install_append_class-native () {
 
 }
 
+do_compile_ptest() {
+        cd ${B}/gettext-tools/tests/
+        sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_PROGRAMS)' Makefile
+        oe_runmake buildtest-TESTS
+        cd -
+}
+
+do_install_ptest() {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        mkdir -p                                        ${D}${PTEST_PATH}/tests
+        mkdir -p                                        ${D}${PTEST_PATH}/src
+        mkdir -p                                        ${D}${PTEST_PATH}/po
+        mkdir -p                                        ${D}${PTEST_PATH}/misc
+        cp -rf ${S}/gettext-tools/tests/*               ${D}${PTEST_PATH}/tests
+        cp -rf ${B}/gettext-tools/tests/.libs/*         ${D}${PTEST_PATH}/tests
+        cp -rf ${B}/gettext-runtime/intl/.libs/libgnuintl.so.8*         ${D}${libdir}/
+        cp -rf ${B}/gettext-tools/tests/Makefile        ${D}${PTEST_PATH}/tests
+        sed -i '/^Makefile:/c Makefile:'                ${D}${PTEST_PATH}/tests/Makefile
+        sed -i -e 's:CONFIG_SHELL=.*:& LOCALE_FR='fr_FR.iso88591' LOCALE_FR_UTF8='fr_FR.utf8' LOCALE_JA='ja_JP.eucjp':g' \
+            -e 's:lang-c lang-c++:lang-c++:g' ${D}${PTEST_PATH}/tests/Makefile
+        install ${S}/gettext-tools/src/msgunfmt.tcl     ${D}${PTEST_PATH}/src
+        install ${S}/gettext-tools/src/project-id       ${D}${PTEST_PATH}/src
+        install ${B}/gettext-runtime/src/gettext.sh     ${D}${PTEST_PATH}/src
+        install ${B}/gettext-runtime/src/ngettext       ${D}${PTEST_PATH}/src
+        install ${B}/gettext-runtime/src/envsubst       ${D}${PTEST_PATH}/src
+        install ${B}/gettext-runtime/src/gettext        ${D}${PTEST_PATH}/src
+        install ${B}/gettext-tools/src/.libs/cldr-plurals   ${D}${PTEST_PATH}/src
+        install ${S}/gettext-tools/po/gettext-tools.pot ${D}${PTEST_PATH}/po
+        install ${B}/gettext-tools/misc/*       ${D}${PTEST_PATH}/misc
+        find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
+        chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
+                   ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2
+    fi
+}
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+    glibc-gconv-big5 \
+    glibc-charmap-big5 \
+    glibc-gconv-cp1251 \
+    glibc-charmap-cp1251 \
+    glibc-charmap-iso-8859-9 \
+    glibc-gconv-iso8859-9 \
+    glibc-charmap-koi8-r \
+    glibc-gconv-koi8-r \
+    glibc-gconv-iso8859-2 \
+    glibc-charmap-iso-8859-2 \
+    glibc-gconv-euc-kr \
+    glibc-charmap-euc-kr \
+"
+
+INSANE_SKIP_${PN}-ptest += "ldflags"
+INSANE_SKIP_${PN}-ptest += "rpaths"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


