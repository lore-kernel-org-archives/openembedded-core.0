Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A9CC25B78
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3633.1716833541973300718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCCtpubI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a63359aaaa6so1379566b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833540; x=1717438340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HqCKEww5ADf3aM/b14SJyAyyPKKdOWdcIGWodMuAlk=;
        b=nCCtpubINz35iYD/Y1juj6rbJiIiWhKf7rZR5RGbtSHtRIS+li27xI3CGirtoix1ls
         8gDvAGBOGW4IqzFxSUfzbQBpFPLN7KNZ1v4odnh6EOTqf5L+G2LqCbN6EUnSW9QuJHpm
         W6saiqvSJOpx+U88/Y6m/Um9zydBrq+Xk+JTHAbi/9/dv+tMsRVIBS6eF7GiZeDcAXor
         aOIgi5qFjMfcVN1JplCPyNveKLcRLCY2iT2T5ggEiS0opxaGHsX1s7M5QW3V42XvBO5n
         giejox+SMhXPnRTE1DXb0dJCG2dP5LaducDA/8hydxnfFLDddXPVZvpMuB/pIV26STv0
         uT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833540; x=1717438340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HqCKEww5ADf3aM/b14SJyAyyPKKdOWdcIGWodMuAlk=;
        b=exudIMw82VIgiO6mlKkqPnI5a5bFLk/B21RppiuvsGKgo3q1oGonIRB/GqiKQti6K5
         +ebdV7wAz6FSVMKyYhAtMfo+iIe+5DJDL9wKNB6qGnS8gf75EQ7FMn58kIdzxBhbDxwy
         VfPm1RJLr159pI8OLlYHyHp8ddiTlHs25U5YUUHqO7217VBm7n86YhrkF68HXH8Q/Oe5
         9I0soBRqID/j9ze8/r+0F9tXiDxgI7jZjLOxfyoLM6ruWWOikTEG/Pw0dNXGKcBb8Zv2
         x70J9gTqlZa651LM/BwS5AtWXoQNuz3MSaWpERtNxFBDjvVd0P7tEbCcKRWQWnm8343a
         257g==
X-Gm-Message-State: AOJu0YwFPAkLxidiWGF7EViSGG+Au7Z7p9RD54S0FiIt5zNBwjHoqS0v
	tTrmyVH5Y/uiVlFmDNv2TsTwS7nf1FALR523WzImq7NeKALsD/1AwjgM+A==
X-Google-Smtp-Source: AGHT+IH6I+ogwNP4mOPtNedDb9CvqlOj1B9XRvcR9GGLqHuZhMZ6yPrTpOD7P1NE96qaX2TQMM4+xA==
X-Received: by 2002:a17:906:2583:b0:a59:9b75:b90 with SMTP id a640c23a62f3a-a62642da85emr679773966b.2.1716833539929;
        Mon, 27 May 2024 11:12:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/13] pinentry: update 1.2.1 -> 1.3.0
Date: Mon, 27 May 2024 20:12:04 +0200
Message-Id: <20240527181214.1778037-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199920

From: Alexander Kanavin <alex@linutronix.de>

License-update: formatting, FSF address

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gpg-error_pkconf.patch                    | 56 ++++++++++++++-----
 .../libassuan_pkgconf.patch                   | 24 ++++----
 .../{pinentry_1.2.1.bb => pinentry_1.3.0.bb}  |  4 +-
 3 files changed, 56 insertions(+), 28 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.2.1 => pinentry-1.3.0}/gpg-error_pkconf.patch (82%)
 rename meta/recipes-support/pinentry/{pinentry-1.2.1 => pinentry-1.3.0}/libassuan_pkgconf.patch (88%)
 rename meta/recipes-support/pinentry/{pinentry_1.2.1.bb => pinentry_1.3.0.bb} (88%)

diff --git a/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
similarity index 82%
rename from meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
index bb7e43b1e75..863ba9e34b4 100644
--- a/meta/recipes-support/pinentry/pinentry-1.2.1/gpg-error_pkconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.3.0/gpg-error_pkconf.patch
@@ -1,4 +1,4 @@
-From 785777dc0bc6b69ff68c91547ec6b6634049662f Mon Sep 17 00:00:00 2001
+From ccc3c6a8d469bbfa6717b970cfe70816c1fd545e Mon Sep 17 00:00:00 2001
 From: Armin Kuster <akuster@mvista.com>
 Date: Fri, 2 Sep 2005 11:50:01 +0000
 Subject: [PATCH] Add gtk+, avahi, dbus-0.34 (.36 coming soon) and
@@ -9,20 +9,20 @@ the gpg-error recipe for gpg-error.pc  generation.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
-
 ---
- m4/gpg-error.m4 | 160 ++----------------------------------------------
- 1 file changed, 4 insertions(+), 156 deletions(-)
+ m4/gpg-error.m4 | 184 ++----------------------------------------------
+ 1 file changed, 5 insertions(+), 179 deletions(-)
 
 diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
-index 4b5cd40..7dfbb83 100644
+index 7fa52b1..c0784ed 100644
 --- a/m4/gpg-error.m4
 +++ b/m4/gpg-error.m4
-@@ -26,160 +26,12 @@ dnl config script does not match the host specification the script
- dnl is added to the gpg_config_script_warn variable.
+@@ -15,188 +15,18 @@
+ dnl
+ dnl Find gpg-error-config, for backward compatibility
  dnl
- AC_DEFUN([AM_PATH_GPG_ERROR],
--[ AC_REQUIRE([AC_CANONICAL_HOST])
+-dnl _AM_PATH_POSSIBLE_GPG_ERROR_CONFIG
+-AC_DEFUN([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG],[dnl
 -  gpg_error_config_prefix=""
 -  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
 -  dnl since that is consistent with how our three siblings use the directory/
@@ -58,9 +58,14 @@ index 4b5cd40..7dfbb83 100644
 -  fi
 -
 -  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
--  min_gpg_error_version=ifelse([$1], ,1.33,$1)
--  ok=no
+-])
 -
+-dnl
+-dnl Find gpgrt-config, which uses .pc file
+-dnl (minimum pkg-config functionality, supporting cross build)
+-dnl
+-dnl _AM_PATH_GPGRT_CONFIG
+-AC_DEFUN([_AM_PATH_GPGRT_CONFIG],[dnl
 -  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
 -  if test "$GPGRT_CONFIG" != "no"; then
 -    # Determine gpgrt_libdir
@@ -116,8 +121,9 @@ index 4b5cd40..7dfbb83 100644
 -        fi
 -        if test -n "$gpgrt_libdir"; then break; fi
 -      done
--    else
--      # When we cannot determine system libdir-format, use this:
+-    fi
+-    if test -z "$gpgrt_libdir"; then
+-      # No valid pkgconfig dir in any of the system directories, fallback
 -      gpgrt_libdir=${possible_libdir1}
 -    fi
 -  else
@@ -131,12 +137,33 @@ index 4b5cd40..7dfbb83 100644
 -      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
 -      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
 -    else
+-      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -      unset GPGRT_CONFIG
 -    fi
 -  elif test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -    unset GPGRT_CONFIG
 -  fi
+-])
+-
+-dnl AM_PATH_GPG_ERROR([MINIMUM-VERSION,
+-dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+-dnl
+-dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
+-dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
+-dnl used for programs requireing real multi thread support.
+-dnl
+ dnl If a prefix option is not used, the config script is first
+ dnl searched in $SYSROOT/bin and then along $PATH.  If the used
+ dnl config script does not match the host specification the script
+ dnl is added to the gpg_config_script_warn variable.
+ dnl
+-AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
+-AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+-  min_gpg_error_version=ifelse([$1], ,1.33,$1)
+-  ok=no
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
 -    req_major=`echo $min_gpg_error_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
@@ -157,6 +184,7 @@ index 4b5cd40..7dfbb83 100644
 -    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
++AC_DEFUN([AM_PATH_GPG_ERROR],
 +[
 +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
 +  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
@@ -183,7 +211,7 @@ index 4b5cd40..7dfbb83 100644
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -194,10 +46,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -211,10 +41,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
        fi
      fi
    else
diff --git a/meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
similarity index 88%
rename from meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
index f4aec2d1c39..bee9acd081c 100644
--- a/meta/recipes-support/pinentry/pinentry-1.2.1/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry-1.3.0/libassuan_pkgconf.patch
@@ -1,4 +1,4 @@
-From 26fb6c3faa27180c8ed9ada1728c3d8683a65f3a Mon Sep 17 00:00:00 2001
+From fb6179fabb5e793a83cbb0d0d45814d99b97807a Mon Sep 17 00:00:00 2001
 From: Armin Kuster <akuster@mvista.com>
 Date: Thu, 22 May 2014 10:50:00 +0100
 Subject: [PATCH] libassuan: Improve pkgconfig support
@@ -9,17 +9,16 @@ the libassuan recipe for libassuan.pc generation.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
-
 ---
  configure.ac    |  4 +--
- m4/libassuan.m4 | 93 ++++---------------------------------------------
- 2 files changed, 9 insertions(+), 88 deletions(-)
+ m4/libassuan.m4 | 94 ++++---------------------------------------------
+ 2 files changed, 9 insertions(+), 89 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d8dcc0c..ca51766 100644
+index f04c00d..8e6da5c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -267,8 +267,8 @@ if test "$have_libassuan" = "yes"; then
+@@ -263,8 +263,8 @@ if test "$have_libassuan" = "yes"; then
                       [version of the libassuan library])
  fi
  
@@ -31,7 +30,7 @@ index d8dcc0c..ca51766 100644
  
  dnl Checks for libsecmem.
 diff --git a/m4/libassuan.m4 b/m4/libassuan.m4
-index df50484..2057412 100644
+index a2eb5d9..897f407 100644
 --- a/m4/libassuan.m4
 +++ b/m4/libassuan.m4
 @@ -15,30 +15,8 @@ dnl
@@ -51,7 +50,7 @@ index df50484..2057412 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"${LIBASSUAN_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libassuan --exists; then
 -      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
 -      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
@@ -67,7 +66,7 @@ index df50484..2057412 100644
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
      req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -48,58 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -48,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
@@ -112,6 +111,7 @@ index df50484..2057412 100644
 -
 -  if test $ok = yes; then
 -    AC_MSG_RESULT([yes ($libassuan_config_version)])
+-    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
 -  else
 -    AC_MSG_RESULT(no)
 -  fi
@@ -128,7 +128,7 @@ index df50484..2057412 100644
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -114,11 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -117,11 +47,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
@@ -141,7 +141,7 @@ index df50484..2057412 100644
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -141,7 +68,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
+@@ -144,7 +70,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
  dnl used to test for features only available in newer versions.
  dnl
  AC_DEFUN([AM_CHECK_LIBASSUAN],
@@ -150,7 +150,7 @@ index df50484..2057412 100644
    if test $ok = yes; then
      ifelse([$2], , :, [$2])
    else
-@@ -157,16 +84,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+@@ -160,16 +86,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
  dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
  dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
diff --git a/meta/recipes-support/pinentry/pinentry_1.2.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.0.bb
similarity index 88%
rename from meta/recipes-support/pinentry/pinentry_1.2.1.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.0.bb
index 7daf80f36eb..6ce873871b1 100644
--- a/meta/recipes-support/pinentry/pinentry_1.2.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.0.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "\
 
 HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gettext-native libassuan libgpg-error"
 
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[sha256sum] = "457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067"
+SRC_URI[sha256sum] = "9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


