Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 831507D290
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 15:44:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k16so25040646wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yREK/d1zkb6u2YRAU+mDkEhhdp7xgfkZgLKvtEjwXzE=;
	b=T11dy9dP+uKdkYDXTbw0MxNuQNxFy2fBM5VyVNOTOPwxiFoqUpAuMpf1th/XGQ21bG
	YmGDJgDVorG3QkWu/oTxg50VCmCcy3aVsc8faT2I49ufN3PpDwa6+K7I0m9vFNTeqx+8
	0R2PSruNWc01kIBVisz2nV5QOjXzguFm7Ptog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yREK/d1zkb6u2YRAU+mDkEhhdp7xgfkZgLKvtEjwXzE=;
	b=ECPeAmPa9IeH74Yrn/czmQ4QQPPpDhabBXcTT8+Wn57OOdm5taXslrpKCwIr5yeatd
	r0x6w+WV1x2iRh4xVAF2zUR1pLxkahm4u0jCmnAIDiDCNyYxIbn6nAwa50l/yJWLlpk2
	cCrbBIBllcQCcBT8EX/E2MA8+mWuDZtXftzV/NyUtJNKjLom927VjHcTkUOC3Na0xqo+
	0EmPoDMGUN3R/of6nuiRtjbLx8sDNiZsPXO/LoEYLNUjqEy+Vw55MAnr8MRW0ImMP2zI
	KHlSlyPjybQPiEykCfj9UCfannmahJB9Ui0qBAbtZ6ngRE6Q2g75m6HRFlPZAgPQBlxC
	EdEA==
X-Gm-Message-State: APjAAAUe6AMgrHnvKmlGW+ed2/IiqR0M6ZwZyqnFt+kLhZuTUAo31D3M
	1lMRLMzr5h3V+Gw2g2lQwVewQJMc1D8=
X-Google-Smtp-Source: APXvYqwFMrEBngn+ZuwYZSAOnYiV7ieFri0Q3Pp0nCWJXLP1GVrpfj4Vp9vZz+zreoqetycDlAP6Uw==
X-Received: by 2002:adf:cc8a:: with SMTP id p10mr7789567wrj.34.1556725484847; 
	Wed, 01 May 2019 08:44:44 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y197sm5882815wmd.34.2019.05.01.08.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:44:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 16:44:42 +0100
Message-Id: <20190501154442.10964-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] elfutils: ptest fixes
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
X-List-Received-Date: Wed, 01 May 2019 15:44:44 -0000
Content-Transfer-Encoding: 8bit

Changes to improve the way ptest runs:

a) Use the standalone test mode which allows the tests to be run in their
  'installled' locations on target (but not any of the standalone build pieces)
b) We want to use the binaries from their installed locations so the run-subr
   script needs tweaking to run them like that. The rpath conditional isn't
   enough since we want the second entry in the case statement.
c) Add an oecheck make target which we can use to build the test binaries we need
d) Add missing -ptest package dependencies (needs coreutils, ${PN}, ${PN}-binutils, make)
e) Don't add RPATH to the test binaries, we don't need that
f) Add some extra parameters to the make command to ensure tests run correctly

Before:
-----------------------------------------------------
Recipe   | Passed    | Failed   | Skipped  | Time(s)
-----------------------------------------------------
elfutils | 31        | 4        | 168      | 6
-----------------------------------------------------

After:
-----------------------------------------------------
Recipe   | Passed    | Failed   | Skipped  | Time(s)
-----------------------------------------------------
elfutils | 173       | 25       | 5        | 15
-----------------------------------------------------

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils_0.176.bb                | 10 +--
 .../elfutils/files/ptest.patch                | 76 +++++++++++++++++++
 .../recipes-devtools/elfutils/files/run-ptest |  2 +-
 .../elfutils/files/serial-tests.patch         | 28 -------
 4 files changed, 81 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/ptest.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/serial-tests.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index fb2868723ae..19d27cd992a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/testsuite-ignore-elflint.diff \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://run-ptest \
-           file://serial-tests.patch \
+           file://ptest.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch \
                              file://0001-fix-err-variable-and-function-conflicts.patch \
@@ -43,10 +43,9 @@ inherit autotools gettext ptest
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
-# gcc has been added to blacklist, we will find workaround solution
-RDEPENDS_${PN}-ptest = "libasm libelf bash"
+RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
 
-EXTRA_OECONF_append_class-target += "--enable-tests-rpath"
+EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
 
 do_install_append() {
 	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
@@ -56,14 +55,13 @@ do_install_append() {
 
 do_compile_ptest() {
 	cd ${B}/tests
-	oe_runmake buildtest-TESTS
+	oe_runmake buildtest-TESTS oecheck
 }
 
 do_install_ptest() {
 	if [ ${PTEST_ENABLED} = "1" ]; then
 		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
 		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
-		cp -r ${B}/src                          ${D}${PTEST_PATH}
 		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
 		cp -r ${B}/backends                     ${D}${PTEST_PATH}
 		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
new file mode 100644
index 00000000000..35b23f43b34
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -0,0 +1,76 @@
+Changes to allow ptest to run standalone on target:
+
+a) Run the tests serially
+b) Use the standalone test mode which allows the tests to be run in their
+  'installled' locations on target (but not any of the standalone build pieces)
+c) We want to use the binaries from their installed locations so the run-subr
+   script needs tweaking to run them like that. The rpath conditional isn't
+   enough since we want the second entry in the case statement.
+d) Add an oecheck make target which we can use to build the test binaries we need
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Upstream-Status: Inappropriate [oe specific]
+
+Index: elfutils-0.176/configure.ac
+===================================================================
+--- elfutils-0.176.orig/configure.ac
++++ elfutils-0.176/configure.ac
+@@ -45,7 +45,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2018 Th
+ AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
+ 
+ dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
+-AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip parallel-tests])
++AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip serial-tests])
+ AM_MAINTAINER_MODE
+ 
+ AM_SILENT_RULES([yes])
+Index: elfutils-0.176/tests/Makefile.am
+===================================================================
+--- elfutils-0.176.orig/tests/Makefile.am
++++ elfutils-0.176/tests/Makefile.am
+@@ -445,10 +445,10 @@ installed_TESTS_ENVIRONMENT = libdir=$(D
+ installed_LOG_COMPILER = $(abs_srcdir)/test-wrapper.sh \
+ 			 installed $(tests_rpath) \
+ 			 '$(program_transform_name)'
+-if STANDALONE
++if !STANDALONE
+ TESTS_ENVIRONMENT = $(installed_TESTS_ENVIRONMENT)
+ LOG_COMPILER = $(installed_LOG_COMPILER)
+-else !STANDALONE
++else STANDALONE
+ TESTS_ENVIRONMENT = LC_ALL=C; LANG=C; VALGRIND_CMD=$(valgrind_cmd); \
+ 		    abs_srcdir=$(abs_srcdir);  abs_builddir=$(abs_builddir); \
+ 		    abs_top_builddir=$(abs_top_builddir); \
+@@ -463,7 +463,7 @@ installcheck-local:
+ 	$(MAKE) $(AM_MAKEFLAGS) \
+ 		TESTS_ENVIRONMENT="$(installed_TESTS_ENVIRONMENT)" \
+ 		LOG_COMPILER="$(installed_LOG_COMPILER)" check-TESTS
+-endif !STANDALONE
++endif STANDALONE
+ 
+ if STANDALONE
+ libdw = -ldw
+@@ -612,3 +612,5 @@ check: check-am coverage
+ coverage:
+ 	-$(srcdir)/coverage.sh
+ endif
++oecheck:
++	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
+Index: elfutils-0.176/tests/test-subr.sh
+===================================================================
+--- elfutils-0.176.orig/tests/test-subr.sh
++++ elfutils-0.176/tests/test-subr.sh
+@@ -91,12 +91,6 @@ installed_testrun()
+   program="$1"
+   shift
+   case "$program" in
+-  ${abs_builddir}/*)
+-    if [ "x$elfutils_tests_rpath" != xno ]; then
+-      echo >&2 installcheck not possible with --enable-tests-rpath
+-      exit 77
+-    fi
+-    ;;
+   ${abs_top_builddir}/src/*)
+     program=${bindir}/`program_transform ${program##*/}`
+     ;;
diff --git a/meta/recipes-devtools/elfutils/files/run-ptest b/meta/recipes-devtools/elfutils/files/run-ptest
index 770a62e7310..81b81f2f5d1 100644
--- a/meta/recipes-devtools/elfutils/files/run-ptest
+++ b/meta/recipes-devtools/elfutils/files/run-ptest
@@ -3,4 +3,4 @@
 #This script is used to run elfutils test suites
 cd tests
 
-make -k runtest-TESTS abs_srcdir=$PWD abs_builddir=$PWD bindir=$PWD/../src/  srcdir=$PWD  top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed
+make -k runtest-TESTS abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-,
diff --git a/meta/recipes-devtools/elfutils/files/serial-tests.patch b/meta/recipes-devtools/elfutils/files/serial-tests.patch
deleted file mode 100644
index 4b448cd50a8..00000000000
--- a/meta/recipes-devtools/elfutils/files/serial-tests.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 48e111a17e8d5f10690716a63c17670f1406b56c Mon Sep 17 00:00:00 2001
-From: "Hongjun.Yang" <hongjun.yang@windriver.com>
-Date: Wed, 28 Oct 2015 13:24:54 +0800
-Subject: [PATCH] Add serial-tests support, ptest need it.
-
-Add serial-tests support, ptest need it.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b4e012d..2eb0417 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,7 +45,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2018 The elfutils developers.])
- AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
- 
- dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
--AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip parallel-tests])
-+AM_INIT_AUTOMAKE([gnits 1.11 -Wno-portability dist-bzip2 no-dist-gzip serial-tests])
- AM_MAINTAINER_MODE
- 
- AM_SILENT_RULES([yes])
-- 
2.20.1


