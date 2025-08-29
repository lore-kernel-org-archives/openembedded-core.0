Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60ABCA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 08:01:29 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.8309.1756454481965276991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lRSu227i;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61d06c4e0d0so681237a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454480; x=1757059280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8gCMflhjq6tl96oC18geazof2FUfXzOfxyQFvVpY9A=;
        b=lRSu227iRxgkb+Frnl/5q9smWAQGj86Q2pyRafCsTju/zp6GN0KRIGYKWZUbLhCq9O
         5DIpdZY4mEuZjEWTesoLfdUYzTxtIpIQ9GzjxzHK/q07/ofkeLZGExX8c54K29q+Zlu+
         95/pkOQKXSkQ369H2F2xsFxrI61AAKIkZ8HWkQ7E48JqwU4tT6k7aEsV+GSMLSKZHjbQ
         H+2HN9x5Ei5UDVQh/wA3CUe8he7JA9jskt9svNm8GD+T+QAAaCpy6dJO4eWjFl4fX44b
         p9B2pOAhcZH7je/pVatW0ccjij1AKqJVYaalWY9CnC44jeN6lS7ZmYD+K7f9C4fAG25s
         IiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454480; x=1757059280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8gCMflhjq6tl96oC18geazof2FUfXzOfxyQFvVpY9A=;
        b=u9HlTPGvmf6MmCoh0ET8fcf3KTA4y9unHgcbikF5WbV7O73LwJgaBo+zJPtMLWqfgo
         9xXE892jBVs2XKdSFxEeIi7pzPwGUMBim8+H5ah+HdAb3yOziKuOn0wi8cir+GxkfTHT
         XxNJxBvQwK6DO6pWa17eq2kEtUP+BSbqgb5cknAszGAwjVF2IrtABfVGHqh9LA0Ax6zd
         3I++14TDskCK7/t8+Rqev2Wrhvb82867DTgMuH9Jip+QspBxAXillNqR9dCIahDsQvai
         ljSWv3oW8cU/tdXI6YgTr7qr+JrJ6m1tXR8503xVp0xONHFkZJ6IsnclEKB8+tZ5i0gx
         q4iQ==
X-Gm-Message-State: AOJu0YxBpTEjKgKgHOyuni2vjdcwoQiDf1NzgPD6Mf0+QUZD3NDaONeH
	KqmeMCe3+ad7cauVU/QsxYEUgCWrIyIDUlev+5gvUMRUGG/bmf354BbVR48MzQ==
X-Gm-Gg: ASbGncspN+XBC53mlisw73pG93fQ3okh9l+Y8uSF0tsTmgWc4DJJHOCI1DO8lEWfbKQ
	q8tesluZos7mxaUzDr613Wv7Or1WX5tcoohydfHRKOjuol9/RWS1sAahwv1l6iAJfiZMFElyKWD
	TtBYqfH8gewOR9kYMCmTSWUbFIcPGzFWTGbcYumcvJPSU26+LrH+aMb4osCASX9xkyIyF87y/3W
	bLx5TLbZjIcKg24F9ef9G+CUpmnhBHJC1udCMfyPQWuBYj8U7hTkdi9PsZridq9/JGdm4kYBcYk
	CBEhCKJh02/XoH2HAPVEpOMEPe+RrDyBAc5rVQdieDynPhFB0mgLtITfzOILukjt4T47GGmAsJ2
	OMfr2DcbV+MmN2dwdvFN0
X-Google-Smtp-Source: AGHT+IHnpqVNejehw5vix8sznELy/IqvojmAGOXMbjNL924ZpkSPBBd44FL9iUB5r0E16ZNGjCf6hA==
X-Received: by 2002:a05:6402:51ca:b0:61d:107e:9c28 with SMTP id 4fb4d7f45d1cf-61d107ea0eamr80702a12.1.1756454479798;
        Fri, 29 Aug 2025 01:01:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc214ec8sm1256939a12.17.2025.08.29.01.01.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:01:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] pinentry: upgrade 1.3.1 -> 1.3.2
Date: Fri, 29 Aug 2025 10:01:18 +0200
Message-ID: <20250829080118.3776531-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 08:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222603

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

v2: adapt selftest to the new version number

 meta/lib/oeqa/selftest/cases/oescripts.py     |  2 +-
 .../gpg-error_pkconf.patch                    | 47 +++++++++++--------
 .../libassuan_pkgconf.patch                   | 30 +++++-------
 .../{pinentry_1.3.1.bb => pinentry_1.3.2.bb}  |  2 +-
 4 files changed, 41 insertions(+), 40 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.3.1 => pinentry}/gpg-error_pkconf.patch (88%)
 rename meta/recipes-support/pinentry/{pinentry-1.3.1 => pinentry}/libassuan_pkgconf.patch (87%)
 rename meta/recipes-support/pinentry/{pinentry_1.3.1.bb => pinentry_1.3.2.bb} (93%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 3f9899b289..64fb3f1a1d 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -151,7 +151,7 @@ class OEListPackageconfigTests(OESelftestTestCase):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.3.1")
+        expected_endlines.append("pinentry-1.3.2")
         expected_endlines.append("PACKAGECONFIG ncurses")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
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
 

