Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98A2CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 17:08:17 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.851.1756314491018078906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 10:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lKdU/0bg;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61c68525abbso23624a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314489; x=1756919289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucdCooWsqcH05WF3LXoHsApdpJuJrNIxrsKP0fTyqoQ=;
        b=lKdU/0bg/ieTjkFVSHmjhHlAU4091hDh497gfK0JL2Dkqzh+QFJpP8aFXNX03DViS1
         lA1DuCyKHru8xPj0waRQ30LHZBX6u2VHJ/teDZ2bM8DPQlwSt6Jx1L8EXJypDOvXGxtp
         C8MA3rNEV100I6D0AH/yHGwfAzWypHol2Bmeuc8VFp/17TXt4af+evtlZPdTBCXlvC1g
         tUnoeL4X+fo6N9eJyZSKvpBdx9cBMB37PXXD6jeDlaZFh16fIFg5ZK8msohT8wwhVsCb
         WRn4naCQgyVPaxxEBrdwqqhXRgKk8VmjQ+gCjejeRIF6D1uVgTcuntXZVSaKNJE0Q+24
         W12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314489; x=1756919289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucdCooWsqcH05WF3LXoHsApdpJuJrNIxrsKP0fTyqoQ=;
        b=DvS8FsJWcCs9Ol32StSgzDYGoG2Zrgl1zeJOQ18k0VJTa6pnRG/RIzEIz32l/2aU9M
         qWoBm9c27lfQBRZqkP5Vvr9fEj5o3YMOvJBGXMHb1y4I9VMSvVML0njJB446Mms08Qyb
         llK/CROWRWtPiTR9vIahZlsCDrhZoCo7fhjZo8DDsN1ck615zADA1VEM7gphM0SqFkRi
         AC/hWk8shBt10rCw3NAOQYl5lnMVcC2iQsMXJxPjujo7g/LIICw7Av85WXoExUxnrkDO
         M+OxTFXCAJMoMBTRximXJIBKHgI8kNCfJZpwmE7EHxYKg624MydG6n+7I+Kc6qU+9rmc
         QArQ==
X-Gm-Message-State: AOJu0YzWBBGx2hFXRi7N+AukFy1vJrGrILLT1TSg7VJmf0A0EZe0trC1
	95ai7LNSj+vcq1BCFSRgKp619HBpkcu22onCcOLpi+VJAsPPappsakIOnZPJjw==
X-Gm-Gg: ASbGncutamINz98aBT2an0nO+oqnXJWvXkIwmyCc/UHjXQpm7rP9bL/FMgeq+zZvmjC
	bGLZJ4sRywP2f8eJa4+8cMXv3tc94osKRtMYbZqucACp8fHkNkIZQSh/301ZgyrM3DB7Vb0KFVy
	31SVxNqBpaQUT+z1/43tMnZe4/8h+SyuWDnBDgD6n07OL+vIAHxd09Bt6WNucOobbTZtAQaoBpT
	qMFi+zR+2PotA0WYLvGM+sRSUD8Br/K/Xm1GP8BYsXoPqmexwMFrg5qXIXoxLznfQD205chJ+YM
	SzX2jg+6NV2BLlsYNstYGK4PdNXCp7AN1fmIJNNf8vxLBoMLGNxNdJNIz22KZwca3F3zxZRKTxh
	Vq168L6LCh9jSDCF7kLUx
X-Google-Smtp-Source: AGHT+IE1dDhGlywpxfv2626lcfRCT4K2lR8WfVDaYTa3a0ujmw05fJs22FfVmtt1OBioCZFqtfF37Q==
X-Received: by 2002:a05:6402:3490:b0:61c:4d92:9b34 with SMTP id 4fb4d7f45d1cf-61c4d929ed6mr11137536a12.31.1756314488907;
        Wed, 27 Aug 2025 10:08:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c533e96dfsm7753408a12.18.2025.08.27.10.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:08:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pinentry: upgrade 1.3.1 -> 1.3.2
Date: Wed, 27 Aug 2025 19:08:07 +0200
Message-ID: <20250827170807.1853599-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 17:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222507

Shortlog:

-qt: Replace icons for dark mode with 16x16 icons
-qt,qt5: Ensure that input field is large enough for generated password
-qt5: Add dark mode icon variants and detection
-Make Show/Hide Password functionality accessible
-qt5: Make Show/Hide Password functionality accessible
-m4: Update libassuan.m4.
-build: Remove defining GPG_ERR_ENABLE_ERRNO_MACROS.
-build: Fix warning about obsolete pinentry-emacs.
-curses: Factor out dialog release to separate function.
-qt: Add dark mode icon variants and detection
-m4: Update gpg-error.m4 and libassuan.m4.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gpg-error_pkconf.patch                    | 47 +++++++++++--------
 .../libassuan_pkgconf.patch                   | 30 +++++-------
 .../{pinentry_1.3.1.bb => pinentry_1.3.2.bb}  |  2 +-
 3 files changed, 40 insertions(+), 39 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.3.1 => pinentry}/gpg-error_pkconf.patch (88%)
 rename meta/recipes-support/pinentry/{pinentry-1.3.1 => pinentry}/libassuan_pkgconf.patch (87%)
 rename meta/recipes-support/pinentry/{pinentry_1.3.1.bb => pinentry_1.3.2.bb} (93%)

diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry/gpg-error_pkconf.patch
similarity index 88%
rename from meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry/gpg-error_pkconf.patch
index 863ba9e34b..d27588e4ec 100644
--- a/meta/recipes-support/pinentry/pinentry-1.3.1/gpg-error_pkconf.patch
+++ b/meta/recipes-support/pinentry/pinentry/gpg-error_pkconf.patch
@@ -17,7 +17,7 @@ diff --git a/m4/gpg-error.m4 b/m4/gpg-error.m4
 index 7fa52b1..c0784ed 100644
 --- a/m4/gpg-error.m4
 +++ b/m4/gpg-error.m4
-@@ -15,188 +15,18 @@
+@@ -15,197 +15,20 @@
  dnl
  dnl Find gpg-error-config, for backward compatibility
  dnl
@@ -131,17 +131,16 @@ index 7fa52b1..c0784ed 100644
 -  fi
 -
 -  if test -n "$gpgrt_libdir"; then
+-    # Add the --libdir option to GPGRT_CONFIG
 -    GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
--    if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
--      GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
--      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
--    else
--      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-    # Make sure if gpgrt-config really works, by testing config gpg-error
+-    if ! $GPGRT_CONFIG gpg-error --exists; then
+-      # If it doesn't work, clear the GPGRT_CONFIG variable.
 -      unset GPGRT_CONFIG
 -    fi
--  elif test "$GPG_ERROR_CONFIG" != "no"; then
--    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  else
+-    # GPGRT_CONFIG found but no suitable dir for --libdir found.
+-    # This is a failure.  Clear the GPGRT_CONFIG variable.
 -    unset GPGRT_CONFIG
 -  fi
 -])
@@ -151,17 +150,31 @@ index 7fa52b1..c0784ed 100644
 -dnl
 -dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
 -dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
--dnl used for programs requireing real multi thread support.
+-dnl used for programs requiring real multi thread support.
 -dnl
  dnl If a prefix option is not used, the config script is first
  dnl searched in $SYSROOT/bin and then along $PATH.  If the used
  dnl config script does not match the host specification the script
  dnl is added to the gpg_config_script_warn variable.
  dnl
--AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
--AC_REQUIRE([AC_CANONICAL_HOST])dnl
--AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
--AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
++
+ AC_DEFUN([AM_PATH_GPG_ERROR],
+-[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
+-  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-    AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
+-  elif test x"$GPG_ERROR_CONFIG" != x -a "$GPG_ERROR_CONFIG" != "no"; then
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  else
+-    gpg_error_config_version="0.0"
+-  fi
++[
++  min_gpg_error_version=ifelse([$1], ,0.0,$1)
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
+ 
 -  min_gpg_error_version=ifelse([$1], ,1.33,$1)
 -  ok=no
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
@@ -184,10 +197,6 @@ index 7fa52b1..c0784ed 100644
 -    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
-+AC_DEFUN([AM_PATH_GPG_ERROR],
-+[
-+  min_gpg_error_version=ifelse([$1], ,0.0,$1)
-+  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version gpg-error], [ok=yes], [ok=no])
    if test $ok = yes; then
 -    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG --cflags`
 -    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG --libs`
@@ -211,7 +220,7 @@ index 7fa52b1..c0784ed 100644
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -211,10 +41,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+@@ -220,10 +43,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
similarity index 87%
rename from meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
index f2d50010c5..fbd370d9fd 100644
--- a/meta/recipes-support/pinentry/pinentry-1.3.1/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
@@ -18,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index 4944f7c..f03cbb7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -264,8 +264,8 @@ if test "$have_libassuan" = "yes"; then
+@@ -261,8 +261,8 @@ if test "$have_libassuan" = "yes"; then
                       [version of the libassuan library])
  fi
  
@@ -33,12 +33,13 @@ diff --git a/m4/libassuan.m4 b/m4/libassuan.m4
 index a2eb5d9..897f407 100644
 --- a/m4/libassuan.m4
 +++ b/m4/libassuan.m4
-@@ -15,30 +15,8 @@ dnl
+@@ -100,31 +100,8 @@ dnl
  dnl Common code used for libassuan detection [internal]
  dnl Returns ok set to yes or no.
  dnl
 -AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
--[ AC_REQUIRE([AC_CANONICAL_HOST])
+-[ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
 -  AC_ARG_WITH(libassuan-prefix,
 -              AS_HELP_STRING([--with-libassuan-prefix=PFX],
 -                             [prefix where LIBASSUAN is installed (optional)]),
@@ -66,7 +67,7 @@ index a2eb5d9..897f407 100644
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
      req_libassuan_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -48,59 +26,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -134,59 +111,11 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
@@ -111,7 +112,7 @@ index a2eb5d9..897f407 100644
 -
 -  if test $ok = yes; then
 -    AC_MSG_RESULT([yes ($libassuan_config_version)])
--    AC_DEFINE(LIBASSUAN_API_REQUESTED, $req_libassuan_api, Requested API version for libassuan)
+-    AC_DEFINE_UNQUOTED(LIBASSUAN_API_REQUESTED, $req_libassuan_api, [Requested API version for libassuan])
 -  else
 -    AC_MSG_RESULT(no)
 -  fi
@@ -128,7 +129,7 @@ index a2eb5d9..897f407 100644
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -117,11 +47,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
+@@ -203,11 +132,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
@@ -141,7 +142,7 @@ index a2eb5d9..897f407 100644
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -144,7 +70,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
+@@ -230,7 +155,7 @@ dnl Test whether libassuan has at least MINIMUM-VERSION. This is
  dnl used to test for features only available in newer versions.
  dnl
  AC_DEFUN([AM_CHECK_LIBASSUAN],
@@ -150,21 +151,12 @@ index a2eb5d9..897f407 100644
    if test $ok = yes; then
      ifelse([$2], , :, [$2])
    else
-@@ -160,16 +86,10 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+@@ -246,7 +171,7 @@ dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
  dnl Test for libassuan and define LIBASSUAN_CFLAGS and LIBASSUAN_LIBS
  dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
 -[ _AM_PATH_LIBASSUAN_COMMON($1)
 +[ AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
--    LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
--    LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
-     ifelse([$2], , :, [$2])
-   else
--    LIBASSUAN_CFLAGS=""
--    LIBASSUAN_LIBS=""
-     ifelse([$3], , :, [$3])
-   fi
--  AC_SUBST(LIBASSUAN_CFLAGS)
--  AC_SUBST(LIBASSUAN_LIBS)
- ])
+     LIBASSUAN_CFLAGS=`$LIBASSUAN_CONFIG --cflags`
+     LIBASSUAN_LIBS=`$LIBASSUAN_CONFIG --libs`
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.1.bb b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
similarity index 93%
rename from meta/recipes-support/pinentry/pinentry_1.3.1.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.2.bb
index 0fc652cdba..0a4a847776 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.1.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[sha256sum] = "bc72ee27c7239007ab1896c3c2fae53b076e2c9bd2483dc2769a16902bce8c04"
+SRC_URI[sha256sum] = "8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e"
 
 inherit autotools pkgconfig
 

