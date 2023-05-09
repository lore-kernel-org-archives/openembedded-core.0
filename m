Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D72C7EE3A
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.39168.1683653043453750320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=O+aCahgV;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-94a34a14a54so1221047666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653042; x=1686245042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0fLJVWq54C5B5jf1TVk6M45QrhDFy9YNFc+AisTp3E=;
        b=O+aCahgV9uayziI5SG8217lUwOOa2LoeW7zc9EB2Tp5/ZJtX19ecRpK5EknXirQn0K
         mEKmIgjMu3yzt4x466t5vKde2dOCysoM3U7ezzNpFMjpikzbvG/UQOhSXAdAtfIm/l8U
         eo/klNp1rSiBGE5JYFlyBskOZPBYZplyBN/5UWsrJ0191ReUeW1MZ9KD5u0FMBz3ryY/
         O/FsY9Om3bKyM6RKLeRxeIpMqn3FfQoHf0exXRILMRI95Y2+VJQr0qJbLCBrrXwrnkPK
         s1tc2rLH+r+WvvvK+HafR7bdeL2XraDFQ92w1HJdNlzzMS/tL9KMQq+8mPMDLmqOyX51
         W3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653042; x=1686245042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0fLJVWq54C5B5jf1TVk6M45QrhDFy9YNFc+AisTp3E=;
        b=AT8pthDvdv3O8AFsKRWedyqDTYKv6jfO6xo2epOsPlfHlTiwsrpXClwPNyMCmEiTPA
         XJyz7oQ9Zv66rQjY22PEnNUF86kN3gs0WC/UMID2YJ/PaulSOixPrfQ55DvsAp2p33Pq
         tdWHLNSzoknEH8U2R/U3oP4MHYVppuPnghCf9nxMo9kY4J11Y1nIZiECIpyKwpbKBZoD
         OMONhQES3CJDYoy/iPTsFrUnlIfavltSLXtXb0k+DEMeRxpQOoVar4z5NNBp4dc8Kclt
         eIABc4SFWUrKG2/ezyNBhVYiKaTXpC717YttiF4jm0KgKCkfSrJwx21i0M5n509cmi5N
         sG1Q==
X-Gm-Message-State: AC+VfDz2ganjcYIkQ8CxoEEOzae6MV24TdUsqdSrAAd6Mpx6jPis59ga
	+zCaM3E0lcD25qYiVrU+P8Q6PtXKIBo=
X-Google-Smtp-Source: ACHHUZ4SM/uypWpfHIyEKYgi1rKTDXO0G6w/rDb2YjQcj3f2oY0vqkUbJlXk+q4FUTjfjE/ECnTsxw==
X-Received: by 2002:a17:907:a06:b0:94e:c97b:e3ba with SMTP id bb6-20020a1709070a0600b0094ec97be3bamr12281059ejc.37.1683653041891;
        Tue, 09 May 2023 10:24:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/27] gpgme: update 1.18.0 -> 1.20.0
Date: Tue,  9 May 2023 19:23:37 +0200
Message-Id: <20230509172344.1516743-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181075

Rebase patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-gpgme.m4-use-gpgrt-config-with-.pc.patch | 40 +++------
 .../gpgme/gpgme/0001-pkgconfig.patch          | 81 ++++++++++---------
 ...n-gpg-error-config-should-not-be-use.patch | 34 +++-----
 .../0008-do-not-auto-check-var-PYTHON.patch   | 13 +--
 .../{gpgme_1.18.0.bb => gpgme_1.20.0.bb}      |  2 +-
 5 files changed, 71 insertions(+), 99 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.18.0.bb => gpgme_1.20.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 0c15cc7c38f..8ed39280cac 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From a001b3c23bf80fd752044615b9bba6b926ff9666 Mon Sep 17 00:00:00 2001
+From ee1421f7a7a9f31400ba992a5be52b88d20170c9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:18:04 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
@@ -10,36 +10,21 @@ The oe-core does not support gpgrt-config, so revert it
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- src/gpgme.m4 | 58 +++++++++-------------------------------------------
- 1 file changed, 10 insertions(+), 48 deletions(-)
+ src/gpgme.m4 | 54 ++++++++--------------------------------------------
+ 1 file changed, 8 insertions(+), 46 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index c749a5d..8579146 100644
+index f2906c1..8cc2898 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
-@@ -1,5 +1,5 @@
- # gpgme.m4 - autoconf macro to detect GPGME.
--# Copyright (C) 2002, 2003, 2004, 2014, 2018 g10 Code GmbH
-+# Copyright (C) 2002, 2003, 2004, 2014 g10 Code GmbH
- #
- # This file is free software; as a special exception the author gives
- # unlimited permission to copy and/or distribute it, with or without
-@@ -9,7 +9,7 @@
- # WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
- # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- #
--# Last-changed: 2020-11-20
-+# Last-changed: 2014-10-02
- 
- 
- AC_DEFUN([_AM_PATH_GPGME_CONFIG],
-@@ -36,24 +36,10 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+@@ -125,24 +125,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
       fi
    fi
  
 -  use_gpgrt_config=""
--  if test x"${GPGME_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG gpgme --exists; then
 -      GPGME_CONFIG="$GPGRT_CONFIG gpgme"
 -      AC_MSG_NOTICE([Use gpgrt-config as gpgme-config])
@@ -61,7 +46,7 @@ index c749a5d..8579146 100644
    fi
    gpgme_version_major=`echo $gpgme_version | \
                 sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-@@ -66,16 +52,12 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+@@ -155,16 +141,12 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
  
  AC_DEFUN([_AM_PATH_GPGME_CONFIG_HOST_CHECK],
  [
@@ -80,7 +65,7 @@ index c749a5d..8579146 100644
  *** built for $gpgme_config_host and thus may not match the
  *** used host $host.
  *** You may want to use the configure option --with-gpgme-prefix
-@@ -136,11 +118,7 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -225,11 +207,7 @@ AC_DEFUN([AM_PATH_GPGME],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -93,7 +78,7 @@ index c749a5d..8579146 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -280,11 +258,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -372,11 +350,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -106,7 +91,7 @@ index c749a5d..8579146 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -293,20 +267,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -385,20 +359,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -129,6 +114,3 @@ index c749a5d..8579146 100644
      AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 3b2f59c2fcf..738b23cd584 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 0d7ec5b98dc6cbd35f56deaecec5ecfdaa944aee Mon Sep 17 00:00:00 2001
+From f8221238d51066b7a1a5f2917cce2791876ea8b0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 10 May 2019 14:23:55 +0800
 Subject: [PATCH] pkgconfig
@@ -19,17 +19,17 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  configure.ac            |   1 +
  src/Makefile.am         |   4 +-
- src/gpgme-pthread.pc.in |  15 ++++++
- src/gpgme.m4            | 114 +++-------------------------------------
+ src/gpgme-pthread.pc.in |  15 +++++
+ src/gpgme.m4            | 119 +++-------------------------------------
  src/gpgme.pc.in         |   4 +-
- 5 files changed, 28 insertions(+), 110 deletions(-)
+ 5 files changed, 29 insertions(+), 114 deletions(-)
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 9d696b9..5b4e730 100644
+index d1b9aca..9c4f97c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -926,6 +926,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1043,6 +1043,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -77,10 +77,10 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 71b0010..5821895 100644
+index 8cc2898..0ff550e 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
-@@ -79,7 +79,7 @@ dnl config script does not match the host specification the script
+@@ -168,7 +168,7 @@ dnl config script does not match the host specification the script
  dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPGME],
@@ -89,7 +89,7 @@ index 71b0010..5821895 100644
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -89,36 +89,12 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -178,36 +178,12 @@ AC_DEFUN([AM_PATH_GPGME],
       min_gpgme_version="$tmp"
    fi
  
@@ -128,7 +128,7 @@ index 71b0010..5821895 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -127,19 +103,11 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -216,19 +192,11 @@ AC_DEFUN([AM_PATH_GPGME],
       fi
    fi
    if test $ok = yes; then
@@ -148,44 +148,45 @@ index 71b0010..5821895 100644
  ])
  
  dnl AM_PATH_GPGME_PTHREAD([MINIMUM-VERSION,
-@@ -148,7 +116,7 @@ dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
+@@ -236,9 +204,8 @@ dnl                       [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+ dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
  dnl  and GPGME_PTHREAD_LIBS.
  dnl
- AC_DEFUN([AM_PATH_GPGME_PTHREAD],
--[ AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
+-AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
+-  AC_OBSOLETE([$0], [; use AM_PATH_GPGME instead to use GPGME_CFLAGS and GPGME_LIBS])dnl
+-  AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
++AC_DEFUN([AM_PATH_GPGME_PTHREAD],
 +[
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -158,38 +126,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -248,40 +215,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
       min_gpgme_version="$tmp"
    fi
  
 -  AC_MSG_CHECKING(for GPGME pthread - version >= $min_gpgme_version)
 -  ok=no
 -  if test "$GPGME_CONFIG" != "no" ; then
--    if `$GPGME_CONFIG --thread=pthread 2> /dev/null` ; then
--      req_major=`echo $min_gpgme_version | \
+-    req_major=`echo $min_gpgme_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
--      req_minor=`echo $min_gpgme_version | \
+-    req_minor=`echo $min_gpgme_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
--      req_micro=`echo $min_gpgme_version | \
+-    req_micro=`echo $min_gpgme_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--      if test "$gpgme_version_major" -gt "$req_major"; then
+-    if test "$gpgme_version_major" -gt "$req_major"; then
 -        ok=yes
--      else
+-    else
 -        if test "$gpgme_version_major" -eq "$req_major"; then
--          if test "$gpgme_version_minor" -gt "$req_minor"; then
--            ok=yes
--          else
--            if test "$gpgme_version_minor" -eq "$req_minor"; then
--              if test "$gpgme_version_micro" -ge "$req_micro"; then
--                ok=yes
--              fi
+-            if test "$gpgme_version_minor" -gt "$req_minor"; then
+-               ok=yes
+-            else
+-               if test "$gpgme_version_minor" -eq "$req_minor"; then
+-                   if test "$gpgme_version_micro" -ge "$req_micro"; then
+-                     ok=yes
+-                   fi
+-               fi
 -            fi
--          fi
 -        fi
--      fi
 -    fi
 -  fi
 +  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])
@@ -193,17 +194,21 @@ index 71b0010..5821895 100644
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
--        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+-        if test -z "$use_gpgrt_config"; then
+-          tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
+-        else
+-          tmp=`$GPGME_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-        fi
 +        tmp=`$PKG_CONFIG --variable=api_version gpgme-pthread 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -198,19 +140,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -290,19 +229,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
       fi
    fi
    if test $ok = yes; then
--    GPGME_PTHREAD_CFLAGS=`$GPGME_CONFIG --thread=pthread --cflags`
--    GPGME_PTHREAD_LIBS=`$GPGME_CONFIG --thread=pthread --libs`
+-    GPGME_PTHREAD_CFLAGS=`$GPGME_CONFIG --cflags`
+-    GPGME_PTHREAD_LIBS=`$GPGME_CONFIG --libs`
 -    AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
@@ -218,7 +223,7 @@ index 71b0010..5821895 100644
  ])
  
  
-@@ -229,36 +163,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -321,36 +252,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       min_gpgme_version="$tmp"
    fi
  
@@ -257,7 +262,7 @@ index 71b0010..5821895 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -267,17 +177,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -359,17 +266,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -276,15 +281,15 @@ index 71b0010..5821895 100644
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
 diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
-index 80d59de..932645b 100644
+index 9ddef5c..932645b 100644
 --- a/src/gpgme.pc.in
 +++ b/src/gpgme.pc.in
 @@ -9,6 +9,6 @@ Name: gpgme
  Description: GnuPG Made Easy to access GnuPG
  Requires.private: gpg-error, libassuan
  Version: @PACKAGE_VERSION@
--Cflags: -I${includedir} @GPGME_CONFIG_CFLAGS@
--Libs: -L${libdir} @GPGME_CONFIG_LIBS@
+-Cflags: @GPGME_CONFIG_CFLAGS@
+-Libs: @GPGME_CONFIG_LIBS@
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index ecd1793ab9c..0d2692912fd 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,7 +1,7 @@
-From 52f8fd2010b900c7d382a7c4e6c1a317d8160585 Mon Sep 17 00:00:00 2001
+From 9fce0689bc04506e5758444efa24ea99fe1ff5ef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:30:36 +0800
-Subject: [PATCH 2/7] gpgme/lang/python: gpg-error-config should not be used
+Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
 
 gpg-error-config was modified by OE to always return an error.
 So we want to find an alternative way to retrieve whatever it
@@ -14,39 +14,23 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Rebase to 1.13.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- lang/python/setup.py.in | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
+ lang/python/setup.py.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 9785a28..006216d 100755
+index 6f36861..1d9058b 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
-@@ -30,7 +30,6 @@ import subprocess
- import sys
- 
- # Out-of-tree build of the gpg bindings.
--gpg_error_config = ['gpg-error-config']
- gpgme_config_flags = ['--thread=pthread']
- gpgme_config = ['gpgme-config'] + gpgme_config_flags
- gpgme_h = ''
-@@ -182,15 +181,9 @@ class BuildExtFirstHack(build):
+@@ -169,9 +169,8 @@ class BuildExtFirstHack(build):
  
      def _generate_errors_i(self):
  
--        try:
--            subprocess.check_call(
--                gpg_error_config + ['--version'], stdout=devnull)
--        except:
--            sys.exit('Could not find gpg-error-config.  ' +
--                     'Please install the libgpg-error development package.')
- 
+-        ge_cflags='@GPG_ERROR_CFLAGS@'
          gpg_error_content = self._read_header(
--            'gpg-error.h', getconfig('cflags', config=gpg_error_config))
+-            'gpg-error.h', ge_cflags.split(' ') if ge_cflags else [])
 +            "gpg-error.h", os.environ.get('CFLAGS').split())
  
          filter_re = re.compile(r'GPG_ERR_[^ ]* =')
          rewrite_re = re.compile(r' *(.*) = .*')
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
index dfea1bf78ab..214cf348e43 100644
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
@@ -1,4 +1,4 @@
-From 5bbf7a048b6d81d23186340e839f9f65b5b514b6 Mon Sep 17 00:00:00 2001
+From 94cf9f8fc79c0d1d4529cebdd74328927fda36a2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 16:19:54 +0800
 Subject: [PATCH] do not auto check var-PYTHON
@@ -14,18 +14,19 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5ef00c0..bbcff93 100644
+index df218ec..6a619ef 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -425,8 +425,8 @@ if test "$found_py" = "1"; then
+@@ -521,9 +521,8 @@ if test "$found_py" = "1"; then
  	if test "$found_py" = "1" -o "$found_py3" = "1"; then
  	  # Reset everything, so that we can look for another Python.
            m4_foreach([mym4pythonver],
--                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[all]],
+-                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[3.10],
+-                      [3.11],[3.12],[all]],
 -           [unset PYTHON
 +                     [[2.7],[3.7]],
 +           [
diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.20.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.18.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.20.0.bb
index deea6f3f7b0..dc5b58d7c33 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.20.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
+SRC_URI[sha256sum] = "25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.30.2


