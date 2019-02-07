Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id C5D736BD57
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 13:18:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t200so6722186wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5ZgmQk6w7QZSprW/IJPgSAEaLhTx0M+6JXBVVL/DCyE=;
	b=dmrRCKKruhaKDFJx8wjEZt43hKaGVosLeQ/zlfwXFI7QlsGCPlYrPGW4ZGTPsY+Mwd
	00RJGQAleMlNIzRAMfdUUtXThcZcwED1oo96tY4RKEdGIVXHZ5TXj2LC1FQI1EY6WxIn
	uTHGnQ9uoVetcoqpIS4kCD1hiBa1n/7j1HF1vUjHg1l2VkNEvxVYCqzwm2VMTyGx7cc6
	9+cygOzUP0g/a8+MUh+PYZOF+SrsBS7d+TAp+69lnuzZRclhlJ03mjqq6TvRxYNKSaMB
	NwOeH940L3sapoeFDXagOfFC30GCicddQJZUharHA7drn+7ZgT5bvH/0Ls1vjzRelj17
	rcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5ZgmQk6w7QZSprW/IJPgSAEaLhTx0M+6JXBVVL/DCyE=;
	b=W2EPERI9Xb77CisPiX2RIeWLarOymxPgskrY93iHVU1mOSZNBl+PFVH+3DEsh7NIzu
	23ODf825V3nLw6GpFPlLen8qrR8ivRtZggv4P7fiNWASpyYyQi50dhA3tOm2Q1cLq7qW
	FsLIpErMaA6TmKX9j9aPD/bI4cJbh+oa/HlDJbW7TuKi09CFCLq+mAJO31dsbFPW5pC7
	9pmDkrt0Lmd9BOh4+xOpjOEBKEu+H5H9J0qeW5+gryOQ9W7hKer2w5m8pU/ScvocvCOn
	zODPV1+NtPfAmj0zgsbSQ6Mk7JgnE5CK+MNAfd9/zX4P6sEt3umh00Sg07xxfLYc3cbR
	cUJA==
X-Gm-Message-State: AHQUAublGSikUSykOjgBzepDGpiJ9JBLaKtKSZK4hF8LgF2mwi2KyAqt
	tXbUHY0eT2kayq3SFu3xteh4WNGo
X-Google-Smtp-Source: AHgI3IbGVXL50h23hcbCtWXnoScEYGNpXox3TVVTTK6Ytg+XqdFlqt+sCQ4i6SUWEywyJnl2HEA/rA==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr7504816wmc.68.1549545504804; 
	Thu, 07 Feb 2019 05:18:24 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h5sm8440261wrt.38.2019.02.07.05.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 05:18:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 14:18:15 +0100
Message-Id: <20190207131815.8663-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: forward-port a few patches from 3.5.6
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
X-List-Received-Date: Thu, 07 Feb 2019 13:18:25 -0000

There were a few other patches where it was difficult to decide if the patch
is still relevant, and how to test that it works correctly; please add those
as-needed by testing the new python.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...asename-to-replace-CC-for-checking-c.patch | 120 +++++++++++
 ...runtime-test-to-get-float-byte-order.patch | 199 ++++++++++++++++++
 ...ssing-libraries-to-Extension-for-mul.patch |  80 +++++++
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python-sanity/python3_3.7.2.bb            |   3 +
 6 files changed, 404 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python-sanity/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
 create mode 100644 meta/recipes-devtools/python-sanity/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
 create mode 100644 meta/recipes-devtools/python-sanity/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch

diff --git a/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 56f7f713112..8083345a4e0 100644
--- a/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python-sanity/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 5b2885fd3eaf05b4397385195872d4ec8240a47c Mon Sep 17 00:00:00 2001
+From 4865615a2bc2b78c739e4c33f536712c7f9af061 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python-sanity/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python-sanity/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
new file mode 100644
index 00000000000..5735954628e
--- /dev/null
+++ b/meta/recipes-devtools/python-sanity/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -0,0 +1,120 @@
+From 2645317fef09afe31b01bb2c1d4fe5b9afdbb11a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 22 Oct 2018 15:19:51 +0800
+Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
+
+When working path contains "clang"/"gcc"/"icc", it might be part of $CC
+because of the "--sysroot" parameter. That could cause judgement error
+about clang/gcc/icc compilers. e.g.
+When "icc" is containded in working path, below errors are reported when
+compiling python3:
+x86_64-wrs-linux-gcc: error: strict: No such file or directory
+x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'
+
+Here use cc_basename to replace CC for checking compiler to avoid such
+kind of issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+
+patch originally from Li Zhou, I just rework it to new version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a7de901..4a3681f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
+ AC_CANONICAL_HOST
+ AC_SUBST(build)
+ AC_SUBST(host)
++LT_INIT
+ 
+ # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
+ rm -f pybuilddir.txt
+@@ -695,7 +696,7 @@ AC_MSG_RESULT($with_cxx_main)
+ preset_cxx="$CXX"
+ if test -z "$CXX"
+ then
+-        case "$CC" in
++        case "$cc_basename" in
+         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
+         clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
+@@ -979,7 +980,7 @@ rmdir CaseSensitiveTestDir
+ 
+ case $ac_sys_system in
+ hp*|HP*)
+-    case $CC in
++    case $cc_basename in
+     cc|*/cc) CC="$CC -Ae";;
+     esac;;
+ esac
+@@ -1336,7 +1337,7 @@ else
+ fi],
+ [AC_MSG_RESULT(no)])
+ if test "$Py_LTO" = 'true' ; then
+-  case $CC in
++  case $cc_basename in
+     *clang*)
+       AC_SUBST(LLVM_AR)
+       AC_PATH_TARGET_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
+@@ -1426,7 +1427,7 @@ then
+   fi
+ fi
+ LLVM_PROF_ERR=no
+-case $CC in
++case $cc_basename in
+   *clang*)
+     # Any changes made here should be reflected in the GCC+Darwin case below
+     PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
+@@ -1500,7 +1501,7 @@ then
+            WRAP="-fwrapv"
+         fi
+ 
+-        case $CC in
++        case $cc_basename in
+             *clang*)
+                 cc_is_clang=1
+                 ;;
+@@ -1623,7 +1624,7 @@ yes)
+ 
+     # ICC doesn't recognize the option, but only emits a warning
+     ## XXX does it emit an unused result warning and can it be disabled?
+-    case "$CC" in
++    case "$cc_basename" in
+     *icc*)
+     ac_cv_disable_unused_result_warning=no
+     ;;
+@@ -1965,7 +1966,7 @@ yes)
+ esac
+ 
+ # ICC needs -fp-model strict or floats behave badly
+-case "$CC" in
++case "$cc_basename" in
+ *icc*)
+     CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
+     ;;
+@@ -2727,7 +2728,7 @@ then
+ 		then
+ 			LINKFORSHARED="-Wl,--export-dynamic"
+ 		fi;;
+-	SunOS/5*) case $CC in
++	SunOS/5*) case $cc_basename in
+ 		  *gcc*)
+ 		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
+ 		    then
+@@ -5429,7 +5430,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+     # Some versions of gcc miscompile inline asm:
+     # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
+     # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
+-    case $CC in
++    case $cc_basename in
+         *gcc*)
+             AC_MSG_CHECKING(for gcc ipa-pure-const bug)
+             saved_cflags="$CFLAGS"
diff --git a/meta/recipes-devtools/python-sanity/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch b/meta/recipes-devtools/python-sanity/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
new file mode 100644
index 00000000000..3721e7c2aa3
--- /dev/null
+++ b/meta/recipes-devtools/python-sanity/python3/0002-Don-t-do-runtime-test-to-get-float-byte-order.patch
@@ -0,0 +1,199 @@
+From fa96a7fd19e17b9c6b4dd01c3c3774fb382dddc6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 5 Sep 2018 11:45:52 +0100
+Subject: [PATCH] Don't do runtime test to get float byte order
+
+Python uses AC_RUN_IFELSE to determine the byte order for floats and doubles,
+and falls back onto "I don't know" if it can't run code.  This results in
+crippled floating point numbers in Python, and the regression tests fail.
+
+Instead of running code, take a macro from autoconf-archive which compiles C
+with a special double in which has an ASCII representation, and then greps the
+binary to identify the format.
+
+Upstream-Status: Submitted [https://bugs.python.org/issue34585]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac                     | 72 +++------------------------
+ m4/ax_c_float_words_bigendian.m4 | 83 ++++++++++++++++++++++++++++++++
+ 2 files changed, 90 insertions(+), 65 deletions(-)
+ create mode 100644 m4/ax_c_float_words_bigendian.m4
+
+diff --git a/configure.ac b/configure.ac
+index 4a3681f..4ab19a6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4328,77 +4328,19 @@ fi
+ # * Check for various properties of floating point *
+ # **************************************************
+ 
+-AC_MSG_CHECKING(whether C doubles are little-endian IEEE 754 binary64)
+-AC_CACHE_VAL(ac_cv_little_endian_double, [
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <string.h>
+-int main() {
+-    double x = 9006104071832581.0;
+-    if (memcmp(&x, "\x05\x04\x03\x02\x01\xff\x3f\x43", 8) == 0)
+-        return 0;
+-    else
+-        return 1;
+-}
+-]])],
+-[ac_cv_little_endian_double=yes],
+-[ac_cv_little_endian_double=no],
+-[ac_cv_little_endian_double=no])])
+-AC_MSG_RESULT($ac_cv_little_endian_double)
+-if test "$ac_cv_little_endian_double" = yes
+-then
+-  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
+-  [Define if C doubles are 64-bit IEEE 754 binary format, stored
+-   with the least significant byte first])
+-fi
+-
+-AC_MSG_CHECKING(whether C doubles are big-endian IEEE 754 binary64)
+-AC_CACHE_VAL(ac_cv_big_endian_double, [
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <string.h>
+-int main() {
+-    double x = 9006104071832581.0;
+-    if (memcmp(&x, "\x43\x3f\xff\x01\x02\x03\x04\x05", 8) == 0)
+-        return 0;
+-    else
+-        return 1;
+-}
+-]])],
+-[ac_cv_big_endian_double=yes],
+-[ac_cv_big_endian_double=no],
+-[ac_cv_big_endian_double=no])])
+-AC_MSG_RESULT($ac_cv_big_endian_double)
+-if test "$ac_cv_big_endian_double" = yes
++AX_C_FLOAT_WORDS_BIGENDIAN
++if test "$ax_cv_c_float_words_bigendian" = "yes"
+ then
+   AC_DEFINE(DOUBLE_IS_BIG_ENDIAN_IEEE754, 1,
+   [Define if C doubles are 64-bit IEEE 754 binary format, stored
+    with the most significant byte first])
+-fi
+-
+-# Some ARM platforms use a mixed-endian representation for doubles.
+-# While Python doesn't currently have full support for these platforms
+-# (see e.g., issue 1762561), we can at least make sure that float <-> string
+-# conversions work.
+-AC_MSG_CHECKING(whether C doubles are ARM mixed-endian IEEE 754 binary64)
+-AC_CACHE_VAL(ac_cv_mixed_endian_double, [
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <string.h>
+-int main() {
+-    double x = 9006104071832581.0;
+-    if (memcmp(&x, "\x01\xff\x3f\x43\x05\x04\x03\x02", 8) == 0)
+-        return 0;
+-    else
+-        return 1;
+-}
+-]])],
+-[ac_cv_mixed_endian_double=yes],
+-[ac_cv_mixed_endian_double=no],
+-[ac_cv_mixed_endian_double=no])])
+-AC_MSG_RESULT($ac_cv_mixed_endian_double)
+-if test "$ac_cv_mixed_endian_double" = yes
++elif test "$ax_cv_c_float_words_bigendian" = "no"
+ then
+-  AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,
++  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
+   [Define if C doubles are 64-bit IEEE 754 binary format, stored
+-   in ARM mixed-endian order (byte order 45670123)])
++   with the least significant byte first])
++else
++  AC_MSG_ERROR([Cannot identify floating point byte order])
+ fi
+ 
+ # The short float repr introduced in Python 3.1 requires the
+diff --git a/m4/ax_c_float_words_bigendian.m4 b/m4/ax_c_float_words_bigendian.m4
+new file mode 100644
+index 0000000..216b90d
+--- /dev/null
++++ b/m4/ax_c_float_words_bigendian.m4
+@@ -0,0 +1,83 @@
++# ===============================================================================
++#  https://www.gnu.org/software/autoconf-archive/ax_c_float_words_bigendian.html
++# ===============================================================================
++#
++# SYNOPSIS
++#
++#   AX_C_FLOAT_WORDS_BIGENDIAN([ACTION-IF-TRUE], [ACTION-IF-FALSE], [ACTION-IF-UNKNOWN])
++#
++# DESCRIPTION
++#
++#   Checks the ordering of words within a multi-word float. This check is
++#   necessary because on some systems (e.g. certain ARM systems), the float
++#   word ordering can be different from the byte ordering. In a multi-word
++#   float context, "big-endian" implies that the word containing the sign
++#   bit is found in the memory location with the lowest address. This
++#   implementation was inspired by the AC_C_BIGENDIAN macro in autoconf.
++#
++#   The endianness is detected by first compiling C code that contains a
++#   special double float value, then grepping the resulting object file for
++#   certain strings of ASCII values. The double is specially crafted to have
++#   a binary representation that corresponds with a simple string. In this
++#   implementation, the string "noonsees" was selected because the
++#   individual word values ("noon" and "sees") are palindromes, thus making
++#   this test byte-order agnostic. If grep finds the string "noonsees" in
++#   the object file, the target platform stores float words in big-endian
++#   order. If grep finds "seesnoon", float words are in little-endian order.
++#   If neither value is found, the user is instructed to specify the
++#   ordering.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Daniel Amelang <dan@amelang.net>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 11
++
++AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
++  [AC_CACHE_CHECK(whether float word ordering is bigendian,
++                  ax_cv_c_float_words_bigendian, [
++
++ax_cv_c_float_words_bigendian=unknown
++AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
++
++double d = 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
++
++]])], [
++
++if grep noonsees conftest.$ac_objext >/dev/null ; then
++  ax_cv_c_float_words_bigendian=yes
++fi
++if grep seesnoon conftest.$ac_objext >/dev/null ; then
++  if test "$ax_cv_c_float_words_bigendian" = unknown; then
++    ax_cv_c_float_words_bigendian=no
++  else
++    ax_cv_c_float_words_bigendian=unknown
++  fi
++fi
++
++])])
++
++case $ax_cv_c_float_words_bigendian in
++  yes)
++    m4_default([$1],
++      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
++                 [Define to 1 if your system stores words within floats
++                  with the most significant word first])]) ;;
++  no)
++    $2 ;;
++  *)
++    m4_default([$3],
++      [AC_MSG_ERROR([
++
++Unknown float word ordering. You need to manually preset
++ax_cv_c_float_words_bigendian=no (or yes) according to your system.
++
++    ])]) ;;
++esac
++
++])# AX_C_FLOAT_WORDS_BIGENDIAN
diff --git a/meta/recipes-devtools/python-sanity/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python-sanity/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
new file mode 100644
index 00000000000..b9d5bc9c516
--- /dev/null
+++ b/meta/recipes-devtools/python-sanity/python3/0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
@@ -0,0 +1,80 @@
+From b881a79adcd4ae5ac8fe4f49d0fc77c47f777919 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 4 Aug 2017 11:16:14 +0800
+Subject: [PATCH] setup.py: pass missing libraries to Extension for
+ multiprocessing module
+
+In the following commit:
+...
+commit e711cafab13efc9c1fe6c5cd75826401445eb585
+Author: Benjamin Peterson <benjamin@python.org>
+Date:   Wed Jun 11 16:44:04 2008 +0000
+
+    Merged revisions 64104,64117 via svnmerge from
+    svn+ssh://pythondev@svn.python.org/python/trunk
+...
+(see diff in setup.py)
+It assigned libraries for multiprocessing module according
+the host_platform, but not pass it to Extension.
+
+In glibc, the following commit caused two definition of
+sem_getvalue are different.
+https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
+(see diff in nptl/sem_getvalue.c for detail)
+`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
+and `__old_sem_getvalue' is to compat the old version
+sem_getvalue@GLIBC_2.0.
+
+To build python for embedded Linux systems:
+http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
+If not explicitly link to library pthread (-lpthread), it will
+load glibc's sem_getvalue randomly at runtime.
+
+Such as build python on linux x86_64 host and run the python
+on linux x86_32 target. If not link library pthread, it caused
+multiprocessing bounded semaphore could not work correctly.
+...
+>>> import multiprocessing
+>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
+>>> pool_sema.acquire()
+True
+>>> pool_sema.release()
+Traceback (most recent call last):
+  File "<stdin>", line 1, in <module>
+ValueError: semaphore or lock released too many times
+...
+
+And the semaphore issue also caused multiprocessing.Queue().put() hung.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index b7a36a6..658ead3 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1584,8 +1584,10 @@ class PyBuildExt(build_ext):
+         elif host_platform.startswith('netbsd'):
+             macros = dict()
+             libraries = []
+-
+-        else:                                   # Linux and other unices
++        elif host_platform.startswith(('linux')):
++            macros = dict()
++            libraries = ['pthread']
++        else:                                   # Other unices
+             macros = dict()
+             libraries = ['rt']
+ 
+@@ -1603,6 +1605,7 @@ class PyBuildExt(build_ext):
+ 
+         exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
+                                 define_macros=list(macros.items()),
++                                libraries=libraries,
+                                 include_dirs=["Modules/_multiprocessing"]))
+         # End multiprocessing
+ 
diff --git a/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
index 28c9cc93c03..dcc0932c7f2 100644
--- a/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python-sanity/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 58ad4e8033f5b1c1b6e4a5ab0d262b29451d49e8 Mon Sep 17 00:00:00 2001
+From 1397979ee445ff6826aa5469511e003539f77bb2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python-sanity/python3_3.7.2.bb b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
index 31da9944e77..e05ab42b0ca 100644
--- a/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python-sanity/python3_3.7.2.bb
@@ -18,6 +18,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-Do-not-hardcode-lib-as-location-for-site-packages-an.patch \
+           file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
+           file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1


