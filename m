Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B68C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87936.1783067415834049050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=etVN9dgn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso2684195e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067414; x=1783672214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nQCObMkAZ2V1zAPouGsFSYcBj18NUVrdBSNl4W/F6Q=;
        b=etVN9dgnl30cxz1VEgWWjUvR/N8wjeqsi1l+KvfU2Y9pU+CZsr7PDqzrVIzBANuUlr
         cwMqFPNGibe0ViJw+fdHwfo7UXOx+kHC2nqalEcwnCJEZeRZYBNKb8tdPXMpJ7gGpkEw
         TMmaTXkwD05yoXJz0HmHh0aTxRzOV0TUpGZoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067414; x=1783672214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nQCObMkAZ2V1zAPouGsFSYcBj18NUVrdBSNl4W/F6Q=;
        b=OG1Sek4Z/+Ka/l54PSIFLCnIBuRG6aQ4Cs9adHfNXV/ZcrHhVDj/hNMtH4qwHxHlnh
         rgn0286cfmD3IcW/Z91gV2SCFIk12U6Q7J4+t06ynBZMebWdHC2zl0kBte7/sHuGD8qw
         gXWCRKyMMRW/YcwPBdGdu4o5+NKgcFp3kRVLU+/zR7cCBciMVyDFJp2c424u9m5FT7Ud
         w329IQ9mShG0uzfWpvIIKcOJFg+nl3YSw1ZfN3STmd+XqaNHpCVWtxntb0hvYUBr3R31
         8AUZyVKcMYqMMQ+eK6lg3yWA1u00U1cxcDebqExs0yIhPU7zndA618v0QuOL4ISWehPK
         RBVA==
X-Gm-Message-State: AOJu0YybjyCoIElhzJ/taX6YdvX7cUj6MtbGoz8ARlpM3YpTOccNETqE
	v8I8lWtLIjEcgiC+P7WoPZYPere1+vZTe+LbxYTavKEsEr/ADAwN7ljWTCdmD1fHSf+lUWKnLwG
	iq0qCZJU=
X-Gm-Gg: AfdE7claqULq88t42ddhbJ1k/RJHb0Ea5kqX9PtGsYoUkUU4ejsON/aK4mA61BVpSr+
	B90qgCwmI+WqYW2saBEB5IGW+zLBX0uVO4hgybrw/XgZK/jSoVs1R5bpkeQ7G+I9sjm1Tf0LX0Q
	Iz4Q8mWlkLENCrcrqgvnM5syWp0FMra2HtR8L3Z4+lRzmeAWU0JTwuZ+w7UqDf4LM0vFF9dxnz7
	NtBCuvI80eHfOorcGdufRGLtpLe9WVa10E4zQFIrVcoRa6ytpnRafDnhd8nAv56/33yKgJDQdqF
	gy8xukkk/8BGI7dUk9859uK1v00Fe6gbGo2IAlPGcRdofqjGrFeEhkEUrQL8UWWQYsCrlFUDGrk
	2rXnQ+gYfyLP9FkCsyR+PpABJTsoxzdBr9A0QthduRFE1X09iktBfAeTEy89IWy29zclX8E3t02
	7W5PkL/aIta4NuovwgNTNj6ryXXtyfmSh3nnt116JPqpxd2P3Sby+N
X-Received: by 2002:a05:600c:848d:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493c2b49d54mr135784765e9.9.1783067413835;
        Fri, 03 Jul 2026 01:30:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/15] gpgme: upgrade 2.1.0 -> 2.1.2
Date: Fri,  3 Jul 2026 09:29:55 +0100
Message-ID: <20260703082955.1585712-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240097

License-Update: Copyright years changed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ake-gpgme.m4-use-gpgrt-config-with-.pc.patch | 11 ++++-------
 ...1-autogen.sh-remove-unknown-in-version.patch |  6 +++---
 .../gpgme/gpgme/0001-pkgconfig.patch            | 17 +++++++----------
 ...osix-io.c-Use-off_t-instead-of-off64_t.patch |  4 ++--
 ...-use-closefrom-on-linux-and-glibc-2.34.patch |  6 +++---
 ...kip-all-lib-or-usr-lib-directories-in-.patch |  2 +-
 .../gpgme/{gpgme_2.1.0.bb => gpgme_2.1.2.bb}    |  4 ++--
 7 files changed, 22 insertions(+), 28 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.1.0.bb => gpgme_2.1.2.bb} (93%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 4b8d1ceecdf..ec0c4239613 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
+From 11991439661faba92e2a3966084d40fc8757557f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 46 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index acbfc1c..5f689e1 100644
+index 5fbb5db..13b43a4 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -122,24 +122,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
@@ -77,7 +77,7 @@ index acbfc1c..5f689e1 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -370,11 +348,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -371,11 +349,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -90,7 +90,7 @@ index acbfc1c..5f689e1 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -383,20 +357,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -384,20 +358,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       fi
    fi
    if test $ok = yes; then
@@ -113,6 +113,3 @@ index acbfc1c..5f689e1 100644
      AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 890909dd5e0..579f47c173b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
+From 7f374b5827f3d5d7f57e9045259f5aca703fb1d3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9f91297..9f7559b 100755
+index 71f89e2..6b407e2 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -271,7 +271,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -286,7 +286,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 67b65157d1b..ed3b3db2613 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
+From 04838f9ce25f6964254310b66069ed1b37b019ce Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,10 +29,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d4dcb1c..293fcc2 100644
+index cd0af89..5ee3891 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -844,6 +844,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme.pc
                  src/gpgme-glib.pc
                  src/gpgme.h)
@@ -41,7 +41,7 @@ index d4dcb1c..293fcc2 100644
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
  AC_CONFIG_FILES([lang/js/Makefile lang/js/src/Makefile
 diff --git a/src/Makefile.am b/src/Makefile.am
-index edc239b..d427044 100644
+index 4f45dfe..3c49190 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -80,7 +80,7 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 5f689e1..249e8c9 100644
+index 13b43a4..851e866 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -166,7 +166,6 @@ dnl is added to the gpg_config_script_warn variable.
@@ -225,7 +225,7 @@ index 5f689e1..249e8c9 100644
  ])
  
  
-@@ -319,36 +249,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -320,36 +250,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       min_gpgme_version="$tmp"
    fi
  
@@ -264,7 +264,7 @@ index 5f689e1..249e8c9 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -357,17 +263,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -358,17 +264,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       fi
    fi
    if test $ok = yes; then
@@ -295,6 +295,3 @@ index 9ddef5c..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 932fb9c9620..16df7fff1b9 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
+From c069f75821abe4fa7765556f2bcf3af8b04a6eaf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index 0d0a98b..286a626 100644
+index 4dee776..3b99500 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
 @@ -74,8 +74,8 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index ed2edabd63b..0c00cb00f85 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
+From 116b3ecc954387f141f7cf9f5e01185919130f18 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index a422d8f..0d0a98b 100644
+index f8196f9..4dee776 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
-@@ -577,7 +577,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+@@ -599,7 +599,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index c021e48be94..a71ec8e7625 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
+From 101b5ffa3742d7e71e75f5e22aa3efe0f4c283b5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.0.bb b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
similarity index 93%
rename from meta/recipes-support/gpgme/gpgme_2.1.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.1.2.bb
index 269070b10b3..328b5442127 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
@@ -9,7 +9,7 @@ LICENSE:${PN}-tool = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=c0d051fa63f5a5514f4ab190d7ca495e \
+                    file://src/gpgme.h.in;endline=23;md5=3b8e9a6fe45f4aef6306036aa21d3b89 \
                     file://src/engine.h;endline=21;md5=f58f7a0b6488edae41b925ac9c890068 \
                     file://src/gpgme-tool.c;endline=21;md5=66c5381e0e05475792e24982d15e7ce8 \
                     "
@@ -24,7 +24,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "841c5ea53fc26259f4fbf0e8bde982dea1b8a1ca0cb77e681c82b050566bf92b"
+SRC_URI[sha256sum] = "0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 

