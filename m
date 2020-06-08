Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.25170.1591602524411378887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kBJoB5qw;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id y13so17159270eju.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2PdIiwdOH7Dp5cjtZwd5dzjEVnMHganAdWlErd3gRBM=;
        b=kBJoB5qwiSuufWsCh1gBv/oI31f/ji6afY9KgTEQTvI0dCf0lguYWpxIFBybNaahkY
         506t31+4VWchJl7A8R4JX9nX5iBdRHJyQinefP2ubDMuaGyphZZxZ0Tig32pnS2PUWnE
         qV8ngQDyJm0m9AM8xw1gMq+BWd/EmWw0uUIX/3XpzGMg9uy/w31wkHlPYJ/dsFlFyqBV
         Z63XB2g235XgBm4nUBOdOgLS6rTN2UKMhkJyQ49ZCUP3XiiGACIUyrbkzFZRLOA/PUVG
         q+EZAkt91nF5EgG9tjvslrXtb+wddtOTX2cvN58fUUjMyRJNyxYel8nJegqame1nA5UH
         SUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2PdIiwdOH7Dp5cjtZwd5dzjEVnMHganAdWlErd3gRBM=;
        b=chwKCbh8ll/RtcAt83d7471aLK/1Cd0NxvLsTBZ5EMnh9A6j0r4W4CwGIFOlt+Ps8a
         zFAVVUye0dRD5Gs0Yv716YGRUyDLowyXwqPzQHUD+V3q0sNRAZ0sqmYDbwiTSiMv1KAn
         HYWpLQ9AXK1wOjG7eSOsAG9K49MQFnwt7WAI95ikfAX6NZBbuEFVAC1cTML1tReOvkvv
         A03FY9UdUXRHOfyuIqZInArSyeVWGZjq3Stb+DP97Xm5EXf1ksitINJfzwq2Os6cAaiE
         yg4ulhIqxgGPVbQiAtos5sWcOOVJtI9OQctp0tvCf8Xc/cSYaS8roTe0mbE2QJUkSXsA
         jKRw==
X-Gm-Message-State: AOAM532SWoACXyId0RxaWoY9aUS4L1EnELcg3/GmYWCmAI418NIaW1D1
	PhVJKn9dW5RZmZuSUBbgx6udViS63hY=
X-Google-Smtp-Source: ABdhPJyJrAbjrMq+186UDVVDbdShtWuBkpikUiT/e9u++B3FyqthkNQdTvZSURD13FcuC027OrRXrg==
X-Received: by 2002:a17:906:5e0a:: with SMTP id n10mr18846548eju.274.1591602522457;
        Mon, 08 Jun 2020 00:48:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/42] libksba: 1.3.5 -> 1.4.0
Date: Mon,  8 Jun 2020 09:46:50 +0200
Message-Id: <20200608074659.7051-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the pkg-config patch:

- upstream added their own .pc file, so adding it again is not needed.
- ksba.m4 adjustment to use pkg-config remains in place, but has to be rebased.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libksba/ksba-add-pkgconfig-support.patch  | 130 ++++++++----------
 .../{libksba_1.3.5.bb => libksba_1.4.0.bb}    |   3 +-
 2 files changed, 60 insertions(+), 73 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.5.bb => libksba_1.4.0.bb} (87%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 5afe6de923..ebb7fa588a 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,3 +1,8 @@
+From 7bd2b060e9ea3e2ff11e67d1e98ab882819b28b7 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 3 Dec 2012 18:17:31 +0800
+Subject: [PATCH] libksba: add pkgconfig support
+
 Upstream-Status: Denied
 
 Add pkgconfig support to libksba.
@@ -6,78 +11,49 @@ They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
-Index: libksba-1.3.5/Makefile.am
-===================================================================
---- libksba-1.3.5.orig/Makefile.am
-+++ libksba-1.3.5/Makefile.am
-@@ -20,6 +20,9 @@
- 
- ACLOCAL_AMFLAGS = -I m4 -I gl/m4
- 
-+pkgconfigdir = ${libdir}/pkgconfig
-+pkgconfig_DATA = ksba.pc
-+
- # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
- GITLOG_TO_CHANGELOG=gitlog-to-changelog
- 
-Index: libksba-1.3.5/configure.ac
-===================================================================
---- libksba-1.3.5.orig/configure.ac
-+++ libksba-1.3.5/configure.ac
-@@ -414,6 +414,7 @@ gl/Makefile
- src/Makefile
- src/ksba-config
- src/versioninfo.rc
-+ksba.pc
- tests/Makefile
- doc/Makefile
- ])
-Index: libksba-1.3.5/ksba.pc.in
-===================================================================
---- /dev/null
-+++ libksba-1.3.5/ksba.pc.in
-@@ -0,0 +1,17 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@KSBA_CONFIG_API_VERSION@
-+host=@KSBA_CONFIG_HOST@
-+
-+Name: ksba
-+Description: Libksba provides an easy API to create and parse X.509 and CMS related objects
-+Requires:
-+Version: @VERSION@
-+Libs: -L${libdir} -lksba
-+Libs.private: -L${libdir} -lgpg-error
-+Cflags: -I${includedir}
-+
-Index: libksba-1.3.5/src/ksba.m4
-===================================================================
---- libksba-1.3.5.orig/src/ksba.m4
-+++ libksba-1.3.5/src/ksba.m4
-@@ -22,18 +22,7 @@ dnl with a changed API.
+diff --git a/src/ksba.m4 b/src/ksba.m4
+index ad8de4f..af903ad 100644
+--- a/src/ksba.m4
++++ b/src/ksba.m4
+@@ -22,37 +22,6 @@ dnl with a changed API.
  dnl
  AC_DEFUN([AM_PATH_KSBA],
- [AC_REQUIRE([AC_CANONICAL_HOST])
-- AC_ARG_WITH(ksba-prefix,
--            AC_HELP_STRING([--with-ksba-prefix=PFX],
--                           [prefix where KSBA is installed (optional)]),
+ [ AC_REQUIRE([AC_CANONICAL_HOST])
+-  dnl --with-libksba-prefix=PFX is the preferred name for this option,
+-  dnl since that is consistent with how our three siblings use the directory/
+-  dnl package name in --with-$dir_name-prefix=PFX.
+-  AC_ARG_WITH(libksba-prefix,
+-              AC_HELP_STRING([--with-libksba-prefix=PFX],
+-                             [prefix where KSBA is installed (optional)]),
+-     ksba_config_prefix="$withval", ksba_config_prefix="")
+-
+-  dnl Accept --with-ksba-prefix and make it work the same as
+-  dnl --with-libksba-prefix above, for backwards compatibility,
+-  dnl but do not document this old, inconsistently-named option.
+-  AC_ARG_WITH(ksba-prefix,,
 -     ksba_config_prefix="$withval", ksba_config_prefix="")
+-
 -  if test x$ksba_config_prefix != x ; then
--     ksba_config_args="$ksba_config_args --prefix=$ksba_config_prefix"
--     if test x${KSBA_CONFIG+set} != xset ; then
--        KSBA_CONFIG=$ksba_config_prefix/bin/ksba-config
--     fi
+-    if test x${KSBA_CONFIG+set} != xset ; then
+-      KSBA_CONFIG=$ksba_config_prefix/bin/ksba-config
+-    fi
+-  fi
+-
+-  use_gpgrt_config=""
+-  if test x"$KSBA_CONFIG" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG ksba --exists; then
+-      KSBA_CONFIG="$GPGRT_CONFIG ksba"
+-      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
 -  fi
  
--  AC_PATH_PROG(KSBA_CONFIG, ksba-config, no)
    tmp=ifelse([$1], ,1:1.0.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-      req_ksba_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -43,48 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -63,56 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
       min_ksba_version="$tmp"
    fi
  
@@ -90,7 +66,11 @@ Index: libksba-1.3.5/src/ksba.m4
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
 -    req_micro=`echo $min_ksba_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--    ksba_config_version=`$KSBA_CONFIG $ksba_config_args --version`
+-    if test -z "$use_gpgrt_config"; then
+-      ksba_config_version=`$KSBA_CONFIG --version`
+-    else
+-      ksba_config_version=`$KSBA_CONFIG --modversion`
+-    fi
 -    major=`echo $ksba_config_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
 -    minor=`echo $ksba_config_version | \
@@ -124,24 +104,32 @@ Index: libksba-1.3.5/src/ksba.m4
       # Even if we have a recent libksba, we should check that the
       # API is compatible.
       if test "$req_ksba_api" -gt 0 ; then
--        tmp=`$KSBA_CONFIG --api-version 2>/dev/null || echo 0`
+-        if test -z "$use_gpgrt_config"; then
+-          tmp=`$KSBA_CONFIG --api-version 2>/dev/null || echo 0`
+-	else
+-          tmp=`$KSBA_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-	fi
 +        tmp=`$PKG_CONFIG --variable=api_version ksba`
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([KSBA API version])
             if test "$req_ksba_api" -eq "$tmp" ; then
-@@ -97,10 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -125,14 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
       fi
    fi
    if test $ok = yes; then
--    KSBA_CFLAGS=`$KSBA_CONFIG $ksba_config_args --cflags`
--    KSBA_LIBS=`$KSBA_CONFIG $ksba_config_args --libs`
+-    KSBA_CFLAGS=`$KSBA_CONFIG --cflags`
+-    KSBA_LIBS=`$KSBA_CONFIG --libs`
      ifelse([$2], , :, [$2])
--    libksba_config_host=`$LIBKSBA_CONFIG $ksba_config_args --host 2>/dev/null || echo none`
+-    if test -z "$use_gpgrt_config"; then
+-      libksba_config_host=`$KSBA_CONFIG --host 2>/dev/null || echo none`
+-    else
+-      libksba_config_host=`$KSBA_CONFIG --variable=host 2>/dev/null || echo none`
+-    fi
 +    libksba_config_host=`$PKG_CONFIG --variable=host ksba`
      if test x"$libksba_config_host" != xnone ; then
        if test x"$libksba_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -114,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -146,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
        fi
      fi
    else
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.4.0.bb
similarity index 87%
rename from meta/recipes-support/libksba/libksba_1.3.5.bb
rename to meta/recipes-support/libksba/libksba_1.4.0.bb
index 336d7f8177..a9daf22d77 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.4.0.bb
@@ -19,8 +19,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
-SRC_URI[sha256sum] = "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
+SRC_URI[sha256sum] = "bfe6a8e91ff0f54d8a329514db406667000cb207238eded49b599761bfca41b6"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.26.2

