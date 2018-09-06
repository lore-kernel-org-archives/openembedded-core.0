Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAD879660
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:15:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c14-v6so11005056wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nfSHl7EkOiGBL7G/xExpApOJ+BXqpLg3dZL8oV825gI=;
	b=OymI5m7ijIrE6a2rDW+mD6puaYrQNVAEqqLhQpyzvzPS81TRgy86Tgch3AUk3K/7SV
	g7Awa8Gg5HmtR0qTbR63WzjYhpWDds7q9J1MfmrGC0o3xJQhD+3CmjE+bHX3bYMsH2WZ
	FALbm2X0spdLTw1tdzDKu+K40gb6kMiUAXPNrZ6kBpna0b9SJ7rhqHw1l+DHeoWxC3kH
	Xu8Nkt8XoZRwP4a1GoukNNIdP0IOvOexayQGENUdwhbefx3W+l3gxjOQZSq5YRZs0SuE
	zDp4S2s9wzRpWTdm9hnEIl8YNRXwnBKXGjLYR0g5KZ1M9QqELy54vQx5n/dL7LtEXWw3
	99Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nfSHl7EkOiGBL7G/xExpApOJ+BXqpLg3dZL8oV825gI=;
	b=CWdyjuL31OOp6SJnH4/oxoC6XkUSPUupg66NGtxR4tFwb4e6coY1mvF2ad3YdBjlE3
	rQYqnvdAV++LwsgG6bffMNDg8F1BjljhkoG4Dkfrpw2HXYHWjnXpgHOKzMf/f/doldL7
	HQ8sNQSLQTN4QnS1zaoGbk9enJMramwDX+cwkZMP6Se9DdlkC38NEN8ElKOIBMM1eISH
	FBAzd81PmRcsO1cz286Fx+OqtRov1Pv+FnfFPpa8bVIaAFPVvuH30X+NlnFEaBrlp4QQ
	Hot63kzibS/vV8T9ETsA+50K6tGWKD0Jmnkf5BMpP6qnr2q2AR9SlGRByx9rTBSTvlAf
	hZvA==
X-Gm-Message-State: APzg51AFhLHU7CgGgWvqek80G9eWOcfJ4xlXq1AYi+HLUWADfHp0HqiQ
	jVUbD8uiScMEEErQlOokY9tXSMWEP9g=
X-Google-Smtp-Source: ANB0VdZHnGIExBh8SwiAFq7GzCZFJ3oO5GyH6EwjxBC+5XkP0NDlQITr86kZFEL3IURIoM37IsQ7rQ==
X-Received: by 2002:a1c:8952:: with SMTP id l79-v6mr1783352wmd.7.1536232529384;
	Thu, 06 Sep 2018 04:15:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm5519173wrr.68.2018.09.06.04.15.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:15:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:15:20 +0100
Message-Id: <20180906111521.20997-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180906111521.20997-1-ross.burton@intel.com>
References: <20180906111521.20997-1-ross.burton@intel.com>
Subject: [PATCH 4/5] python3: don't use runtime checks to identify float endianism
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
X-List-Received-Date: Thu, 06 Sep 2018 11:15:29 -0000

Python uses AC_RUN_IFELSE to determine the byte order for floats and doubles,
and falls back onto "I don't know" if it can't run code.  This results in
crippled floating point numbers in Python, and the regression tests fail.

Instead of running code, take a macro from autoconf-archive which compiles C
with a special double in which has an ASCII representation, and then greps the
binary to identify the format.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/float-endian.patch              | 212 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.5.bb      |   1 +
 2 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/float-endian.patch

diff --git a/meta/recipes-devtools/python/python3/float-endian.patch b/meta/recipes-devtools/python/python3/float-endian.patch
new file mode 100644
index 00000000000..6ba3f5c252d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/float-endian.patch
@@ -0,0 +1,212 @@
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
+
+From 50df2a4c3a65ed06322be7c26d42b06ce81730c1 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 5 Sep 2018 11:45:52 +0100
+Subject: [PATCH] Don't do runtime test to get float byte order
+
+---
+ configure.ac                     | 74 +++++------------------------------
+ m4/ax_c_float_words_bigendian.m4 | 83 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 92 insertions(+), 65 deletions(-)
+ create mode 100644 m4/ax_c_float_words_bigendian.m4
+
+diff --git a/configure.ac b/configure.ac
+index c9b755f0f4..1215969871 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -9,6 +9,8 @@ AC_PREREQ(2.65)
+ 
+ AC_INIT(python, PYTHON_VERSION, https://bugs.python.org/)
+ 
++AC_CONFIG_MACRO_DIR(m4)
++
+ AC_SUBST(BASECPPFLAGS)
+ if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
+     # If we're building out-of-tree, we need to make sure the following
+@@ -4128,77 +4130,19 @@ fi
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
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index aad2e3abe60..b89e3b04c86 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -41,6 +41,7 @@ SRC_URI += "\
             file://pass-missing-libraries-to-Extension-for-mul.patch \
             file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
             file://0002-Makefile-add-target-to-split-profile-generation.patch \
+			file://float-endian.patch \
            "
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
 SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
-- 
2.11.0


