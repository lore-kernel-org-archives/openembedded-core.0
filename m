Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.5119.1593377524875886234
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 13:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ejy22+32;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id p20so14552302ejd.13
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRSJ/k9IaZWDUq1A6qfKFG10ZdrmM4CqQz/Mbf0kYyo=;
        b=ejy22+32dyp68WPAIYKUVboZSXsXlESp7HP8kTGYRJRXSiix1KlV9uaK3OayMBMLL+
         D1IbDsiPrtOyi6rSteDARKOyRozdBZ2OLr7iBqMFx2FNcyvbhD4ZBLDP+qqBoXhritv3
         iAi5J3xf98YEq/H7ThwgGo/L4LAolPbm0W2e93UsVj75uq9PF082OAL65IxCJUVmpSJ2
         sNaS0KEhviVox11oigyeBapgAW0g1DBBycwOvV13ieD8OnBvyFauG6AGo5k+l6Won02f
         uYj26kPfUVnY0PokJYw/VHz+3nXIzt77rtX8S6JzNshAg0JiisXtmliWisd4p0v4H6v4
         FNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRSJ/k9IaZWDUq1A6qfKFG10ZdrmM4CqQz/Mbf0kYyo=;
        b=CSk248M8k1gbRGhBR/ALrB20E8dHv5FRD38pi8NPSRAkGwjFEU3bih8zJpcp7dadOH
         CrjKNYyKmcvjbsCt9nG2ZiDMEqtgtYDC8xhPFLq2UgO4c6Hw1+OnlzwAuciYLDhSEkDN
         peE8TczIKrd0+V+DW7OmOkFnq5LLvFG37cEhWE0xd4esvy0ja1T4kYlZZJvIorVMwuOy
         yt01WjOdKcQztB+ByCb/1nKOZ5p0gI3B4EcVQMwQEW7cLqJ6Esb0hXZ2gsc+FNnLcH/0
         aONAsU0h0Pv+ULalYI/5fJ4P6/IxPiJem09dRB45c+byBuvzXe7auLwgdJXK5mxP7Bxg
         ux+w==
X-Gm-Message-State: AOAM532z/zxQVPWwY0bKYAtZG4FIB2qyvuNbSESY1PDg+NjHxQiCUopJ
	cDJuYRUorLOyP/q1RxpiXudo9VFX
X-Google-Smtp-Source: ABdhPJzWCHP+MIeNmNML/DcUTGL97rDCPQsbb7gaVK5y8TcXgC8PJ4YFB/qigD2VHKzsIGLN8iuugA==
X-Received: by 2002:a17:906:40d7:: with SMTP id a23mr10395513ejk.421.1593377523145;
        Sun, 28 Jun 2020 13:52:03 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id q3sm9024062ejb.118.2020.06.28.13.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 13:52:02 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [[OE-core][Patch] cogl-1.0: cope with missing x11 headers
Date: Sun, 28 Jun 2020 22:51:22 +0200
Message-Id: <20200628205122.9970-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix commit 3e96efc4dd87 ("cogl-1.0: : don't require eglmesaext.h") if
x11 headers are missing.

In that case AC_CHECK_HEADERS will report the egl headers missing, as
by default on unix it builds for X11 as the platform but the compiler
will fail to find the X11 headers.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Tested-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...figure.ac-don-t-require-eglmesaext.h.patch | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
index 16ab2d7797..328984a63f 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
+++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
@@ -1,4 +1,4 @@
-From ca94946110f4aaeeb0cbc75e11a619b21f295056 Mon Sep 17 00:00:00 2001
+From bb9765a926588ebfe1eb324fbbe8fc22d419eebe Mon Sep 17 00:00:00 2001
 From: Max Krummenacher <max.krummenacher@toradex.com>
 Date: Thu, 25 Jun 2020 11:27:40 +0000
 Subject: [PATCH] configure.ac: don't require eglmesaext.h
@@ -15,11 +15,11 @@ Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cogl/-/merge_requests/28]
 Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
 ---
- configure.ac | 36 +++++++++++++++++-------------------
- 1 file changed, 17 insertions(+), 19 deletions(-)
+ configure.ac | 51 ++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 32 insertions(+), 19 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 12798e9f..f7fa40e2 100644
+index b7ba95d..0d1d8de 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1212,22 +1212,6 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
@@ -45,29 +45,44 @@ index 12798e9f..f7fa40e2 100644
              AC_CHECK_LIB(EGL, [eglInitialize],
                [COGL_EXTRA_LDFLAGS="$COGL_EXTRA_LDFLAGS -lEGL"],
                [AC_MSG_ERROR([Unable to locate required EGL library])])
-@@ -1236,9 +1220,23 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
+@@ -1236,9 +1220,38 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
            ]
            )
  
 -        COGL_EGL_INCLUDES="#include <EGL/egl.h>
 -#include <EGL/eglext.h>
 -#include <EGL/eglmesaext.h>"
++dnl Test for the existence of egl headers.
++dnl egl*.h includes eglplatform.h which on __unix__ defaults to a X11 platform.
++dnl In that case AC_CHECK_HEADERS failes if X11 headers are not available.
++dnl Set the usual include guard define and, if the EGL implementation doesn't
++dnl use that guard fall back to USE_OZONE and EGL_NO_X11 platforms which don't
++dnl require additional headers.
 +        AC_CHECK_HEADERS(
 +          [EGL/egl.h],
 +          [COGL_EGL_INCLUDES="#include <EGL/egl.h>"],
-+          [AC_MSG_ERROR([Unable to locate required EGL headers])])
++          [AC_MSG_ERROR([Unable to locate required EGL headers])],
++          [#define __egl_h_
++ #define USE_OZONE
++ #define EGL_NO_X11])
 +        AC_CHECK_HEADERS(
 +          [EGL/eglext.h],
 +          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
 +#include <EGL/eglext.h>"],
 +          [AC_MSG_ERROR([Unable to locate required EGL headers])],
-+          [$COGL_EGL_INCLUDES])
++          [#define __eglext_h_
++ #define USE_OZONE
++ #define EGL_NO_X11
++$COGL_EGL_INCLUDES])
 +        AC_CHECK_HEADERS(
 +          [EGL/eglmesaext.h],
 +          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
 +#include <EGL/eglmesaext.h>"],
 +          [],
-+          [$COGL_EGL_INCLUDES])
++          [#define __eglmesaext_h_
++#define USE_OZONE
++#define EGL_NO_X11
++$COGL_EGL_INCLUDES])
 +
          AC_SUBST([COGL_EGL_INCLUDES])
        ])
-- 
2.20.1

