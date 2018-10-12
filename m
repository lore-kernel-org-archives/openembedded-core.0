Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 020CF79BA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:44:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n1-v6so13493432wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DBnxDZN+VbcvwMZzyxhtu8IZOStDZpXkZcc2v1h2DLw=;
	b=uTrVhEvl7Tux38juu53YnUB+idGoY7TVkASc8nUqzx2gP+kJzfSlJuQbQPDnNYdPSe
	MrsfTl8eYXZ7eaGtJqdTMUqGb3YH+l/2oSjajh6pYxx2NJNYAGg8yM0Yuyj9NM1hGQs3
	loC+e6OvSri4N98JUp2oWeRmC3nsKAQ4PmgNYnjDw6OdJ+gFde5V9jKyBifIEy0xEodI
	/cFZw2A+o47xvoopzGoH6uaAn9tGrzmLV3lZKPYZjtDxLGGBwWdRBKJvxdFlYwPKAcqu
	g9BgHVVnJLlQRXBAJ4rHP7w94N7pA5MVDV48amiuu+fufQ30Ehqr0zdsKxyeTBgkvbDv
	Akeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DBnxDZN+VbcvwMZzyxhtu8IZOStDZpXkZcc2v1h2DLw=;
	b=J+QQQd+RkddBwBM1NNQ83j58Kyc0pATQ9Uju6Oazb5K37wBE6gdUDu3j3LzSo3riBG
	cNloSbVZtSvm3ZqLaYgpn4bp5foe0ZUMiJtDXbKDGfCCPHeVij+04nKtvyVS4JFdS/Qi
	1yjbN4SvKICSiqKS1ZHgxEJygQCJC8Y9tVGfrtAWEqYkYfMjt1gxQVgvLvXYmIzEC3X3
	XjbTYoS9lCTCSW9dg3YtA6j3XsTDHYNk90FZV/NK0fp16ppjuCOYvxSK8K3sPTHlM3c6
	ZUBhzlR7Xah6WQTqq+9n80AoiGWCjJDEvHUtbyFILjpyaCulLVr+op3cgGVRGuM4AgHN
	o2uA==
X-Gm-Message-State: ABuFfogLz7WjQZZdhpemkHCkCwfS3agxqIzxLGcikONn/P/f2f7QX4cH
	PCY8don5hlNH0nFOFM1s7qAaevSqkwc=
X-Google-Smtp-Source: ACcGV62HMAu9wcQkE1m6LCkJHKwyohJi7JuK+/sL18WcIk/oF6HHBNHS8PlpiUWB8ryPdZ6XrW16UA==
X-Received: by 2002:adf:c3cd:: with SMTP id
	d13-v6mr5708272wrg.68.1539351846130; 
	Fri, 12 Oct 2018 06:44:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	203-v6sm1593769wmn.34.2018.10.12.06.44.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 06:44:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 14:44:03 +0100
Message-Id: <20181012134403.4705-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: don't use runtime checks to identify float endianism
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
X-List-Received-Date: Fri, 12 Oct 2018 13:44:06 -0000

Python uses AC_RUN_IFELSE to determine the byte order for floats and doubles,
and falls back onto "I don't know" if it can't run code.  This results in
crippled floating point numbers in Python, and the regression tests fail.

Instead of running code, take a macro from autoconf-archive which compiles C
with a special double in which has an ASCII representation, and then greps the
binary to identify the format.

This is essentially a backport of the Python 3 patch in oe-core 1781b87.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python/float-endian.patch               | 216 +++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.15.bb      |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/float-endian.patch

diff --git a/meta/recipes-devtools/python/python/float-endian.patch b/meta/recipes-devtools/python/python/float-endian.patch
new file mode 100644
index 00000000000..8a5c90aec40
--- /dev/null
+++ b/meta/recipes-devtools/python/python/float-endian.patch
@@ -0,0 +1,216 @@
+Python uses AC_RUN_IFELSE to determine the byte order for floats and doubles,
+and falls back onto "I don't know" if it can't run code.  This results in
+crippled floating point numbers in Python, and the regression tests fail.
+
+Instead of running code, take a macro from autoconf-archive which compiles C
+with a special double in which has an ASCII representation, and then greps the
+binary to identify the format.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 253f47b28120c42cfe53a4e2f5ed0ab0ed469deb Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross@burtonini.com>
+Date: Wed, 19 Sep 2018 07:25:48 +0100
+Subject: [PATCH] closes bpo-34585: Don't do runtime test to get float byte
+ order. (GH-9085)
+
+Currently configure.ac uses AC_RUN_IFELSE to determine the byte order of doubles, but this silently fails under cross compilation and Python doesn't do floats properly.
+
+Instead, steal a macro from autoconf-archive which compiles code using magic doubles (which encode to ASCII) and grep for the representation in the binary.
+
+RFC because this doesn't yet handle the weird ancient ARMv4 OABI 'mixed-endian' encoding properly. This encoding is ancient and I don't believe the union of "Python 3.8 users" and "OABI users" has anything in. Should the support for this just be dropped too? Alternatively, someone will need to find an OABI toolchain to verify the encoding of the magic double.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ .../Build/2018-09-18-16-28-31.bpo-34585.CGMu0h.rst |  3 +
+ configure.ac                                       | 76 ++++----------------
+ m4/ax_c_float_words_bigendian.m4                   | 83 ++++++++++++++++++++++
+ 3 files changed, 99 insertions(+), 63 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2018-09-18-16-28-31.bpo-34585.CGMu0h.rst
+ create mode 100644 m4/ax_c_float_words_bigendian.m4
+
+diff --git a/configure.ac b/configure.ac
+index 913d5469d0..7672735396 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3835,74 +3835,24 @@ fi],
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
++  AC_DEFINE(DOUBLE_IS_LITTLE_ENDIAN_IEEE754, 1,
++  [Define if C doubles are 64-bit IEEE 754 binary format, stored
++   with the least significant byte first])
++else
++  # Some ARM platforms use a mixed-endian representation for doubles.
++  # While Python doesn't currently have full support for these platforms
++  # (see e.g., issue 1762561), we can at least make sure that float <-> string
++  # conversions work.
++  # FLOAT_WORDS_BIGENDIAN doesnt actually detect this case, but if it's not big
++  # or little, then it must be this?
+   AC_DEFINE(DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754, 1,
+   [Define if C doubles are 64-bit IEEE 754 binary format, stored
+    in ARM mixed-endian order (byte order 45670123)])
+diff --git a/m4/ax_c_float_words_bigendian.m4 b/m4/ax_c_float_words_bigendian.m4
+new file mode 100644
+index 0000000000..216b90d803
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
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 7662b165372..0225c197205 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+  file://float-endian.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.11.0


