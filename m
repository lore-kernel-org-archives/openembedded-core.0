Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web09.12347.1624892776365234291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a8qvBVHq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 110-20020a9d0a770000b0290466fa79d098so2426397otg.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ma42B3oBVC/i+JUUcZbk/qgQBWAOsl1kFWKn0ifY8kM=;
        b=a8qvBVHqlBY2StnQm7svF68gP0lezmMNlKuXUGXiNDyt3bTtAXOfZfh3X+w8vhfSmr
         +lx0baLPmvMNLKWSXP+6/1BfwTJsNn5FBn8yJ1NY1CKVYVyfg2/OOzGEXfHL63vemhAa
         3dUjtzitikLlfsn9C864mmiVqIQkwF5T1bjqTumKm9sAZApkBeaLp3rqBWWGLCEsJ9wv
         5OeI64yQBdEyaKE9IVAJFMx/7LcwGRAQWv5PN8s05wqZHguR3NffX6X+wKSrThSGczGH
         piUBB9Bt9v8DH89vdrRtcAO9wDElOeD+LUZBXbLTXPCzepn1GrETO4tZnuyZlZ/S8Del
         PcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ma42B3oBVC/i+JUUcZbk/qgQBWAOsl1kFWKn0ifY8kM=;
        b=OZPMQ3iSk77oq992F/5V7Fzmans6yMx+yUk4euJYqVTAu0OBHjcUfB0INgrlU3i5c8
         kTdw3uNlXnLhopnnQtCtmw04beFOgRI7q0c8VPaXyPicdFZHg3naCgmuYWKYMtgONizD
         3b2XAcOodJH3JLEhLtfdaCQ1d6XGv5+GidtqGy/o6dMBypxiynyD6K9iVdzkjjMpoVvk
         bR6Tf8EPmFfv7YQxNPtyIhMnPy67+4goTTo+18JKvStH9Vnr3L1gBN7wnxk25vnsU+wj
         cA5PHfTM6XsqQlVFo3I+Z4+XMJUav3KkUByi0wxeAupb9JQjkDVYn0l26Jnsv5CPl5OK
         uGGA==
X-Gm-Message-State: AOAM533oM4fknDo6nGylXoUgq60V6AiOuyHOCdUF/2BumoItefdTMDzU
	KZ/j/2BvJDRaDK9B9ylzdVVpBD7OG/NPa4F0NdY=
X-Google-Smtp-Source: ABdhPJznqN1TtY3OF0w2hKF78New838vDkCL+z1O8lWm1PatpDWBX0b25SrjIUcRowerKW4oheUSfw==
X-Received: by 2002:a9d:4c81:: with SMTP id m1mr11290otf.175.1624892774934;
        Mon, 28 Jun 2021 08:06:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] libx11: Fix CVE-2021-31535
Date: Mon, 28 Jun 2021 05:05:21 -1000
Message-Id: <81d338c6079729b35f55f8889526f0c9a62802fe.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jasper Orschulko <jasper@fancydomain.eu>

https://lists.x.org/archives/xorg-announce/2021-May/003088.html

XLookupColor() and other X libraries function lack proper validation
of the length of their string parameters. If those parameters can be
controlled by an external application (for instance a color name that
can be emitted via a terminal control sequence) it can lead to the
emission of extra X protocol requests to the X server.

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libx11/CVE-2021-31535.patch      | 333 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 2 files changed, 334 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
new file mode 100644
index 0000000000..97c4c17a8a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
@@ -0,0 +1,333 @@
+From 5c539ee6aba5872fcc73aa3d46a4e9a33dc030db Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Fri, 19 Feb 2021 15:30:39 +0100
+Subject: [PATCH] Reject string longer than USHRT_MAX before sending them on
+ the wire
+
+The X protocol uses CARD16 values to represent the length so
+this would overflow.
+
+CVE-2021-31535
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+https://lists.x.org/archives/xorg-announce/2021-May/003088.html
+
+XLookupColor() and other X libraries function lack proper validation
+of the length of their string parameters. If those parameters can be
+controlled by an external application (for instance a color name that
+can be emitted via a terminal control sequence) it can lead to the
+emission of extra X protocol requests to the X server.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8d2e02ae650f00c4a53deb625211a0527126c605]
+CVE: CVE-2021-31535
+Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
+---
+ src/Font.c      | 6 ++++--
+ src/FontInfo.c  | 3 +++
+ src/FontNames.c | 3 +++
+ src/GetColor.c  | 4 ++++
+ src/LoadFont.c  | 4 ++++
+ src/LookupCol.c | 6 ++++--
+ src/ParseCol.c  | 5 ++++-
+ src/QuExt.c     | 5 +++++
+ src/SetFPath.c  | 8 +++++++-
+ src/SetHints.c  | 7 +++++++
+ src/StNColor.c  | 3 +++
+ src/StName.c    | 7 ++++++-
+ 12 files changed, 54 insertions(+), 7 deletions(-)
+
+diff --git a/src/Font.c b/src/Font.c
+index 09d2ae91..3f468e4b 100644
+--- a/src/Font.c
++++ b/src/Font.c
+@@ -102,6 +102,8 @@ XFontStruct *XLoadQueryFont(
+     XF86BigfontCodes *extcodes = _XF86BigfontCodes(dpy);
+ #endif
+ 
++    if (strlen(name) >= USHRT_MAX)
++        return NULL;
+     if (_XF86LoadQueryLocaleFont(dpy, name, &font_result, (Font *)0))
+       return font_result;
+     LockDisplay(dpy);
+@@ -662,8 +664,8 @@ int _XF86LoadQueryLocaleFont(
+ 
+     if (!name)
+ 	return 0;
+-    l = strlen(name);
+-    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-')
++    l = (int) strlen(name);
++    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-' || l >= USHRT_MAX)
+ 	return 0;
+     charset = NULL;
+     /* next three lines stolen from _XkbGetCharset() */
+diff --git a/src/FontInfo.c b/src/FontInfo.c
+index f870e431..51b48e29 100644
+--- a/src/FontInfo.c
++++ b/src/FontInfo.c
+@@ -58,6 +58,9 @@ XFontStruct **info)	/* RETURN */
+     register xListFontsReq *req;
+     int j;
+ 
++    if (strlen(pattern) >= USHRT_MAX)
++        return NULL;
++
+     LockDisplay(dpy);
+     GetReq(ListFontsWithInfo, req);
+     req->maxNames = maxNames;
+diff --git a/src/FontNames.c b/src/FontNames.c
+index b78792d6..4dac4916 100644
+--- a/src/FontNames.c
++++ b/src/FontNames.c
+@@ -51,6 +51,9 @@ int *actualCount)	/* RETURN */
+     register xListFontsReq *req;
+     unsigned long rlen = 0;
+ 
++    if (strlen(pattern) >= USHRT_MAX)
++        return NULL;
++
+     LockDisplay(dpy);
+     GetReq(ListFonts, req);
+     req->maxNames = maxNames;
+diff --git a/src/GetColor.c b/src/GetColor.c
+index cd0eb9f6..512ac308 100644
+--- a/src/GetColor.c
++++ b/src/GetColor.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <stdio.h>
+ #include "Xlibint.h"
+ #include "Xcmsint.h"
+@@ -48,6 +49,9 @@ XColor *exact_def) /* RETURN */
+     XcmsColor cmsColor_exact;
+     Status ret;
+ 
++    if (strlen(colorname) >= USHRT_MAX)
++        return (0);
++
+ #ifdef XCMS
+     /*
+      * Let's Attempt to use Xcms and i18n approach to Parse Color
+diff --git a/src/LoadFont.c b/src/LoadFont.c
+index f547976b..85735249 100644
+--- a/src/LoadFont.c
++++ b/src/LoadFont.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include "Xlibint.h"
+ 
+ Font
+@@ -38,6 +39,9 @@ XLoadFont (
+     Font fid;
+     register xOpenFontReq *req;
+ 
++    if (strlen(name) >= USHRT_MAX)
++        return (0);
++
+     if (_XF86LoadQueryLocaleFont(dpy, name, (XFontStruct **)0, &fid))
+       return fid;
+ 
+diff --git a/src/LookupCol.c b/src/LookupCol.c
+index f7f969f5..cd9b1368 100644
+--- a/src/LookupCol.c
++++ b/src/LookupCol.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <stdio.h>
+ #include "Xlibint.h"
+ #include "Xcmsint.h"
+@@ -46,6 +47,9 @@ XLookupColor (
+ 	XcmsCCC ccc;
+ 	XcmsColor cmsColor_exact;
+ 
++	n = (int) strlen (spec);
++	if (n >= USHRT_MAX)
++            return 0;
+ #ifdef XCMS
+ 	/*
+ 	 * Let's Attempt to use Xcms and i18n approach to Parse Color
+@@ -77,8 +81,6 @@ XLookupColor (
+ 	 * Xcms and i18n methods failed, so lets pass it to the server
+ 	 * for parsing.
+ 	 */
+-
+-	n = strlen (spec);
+ 	LockDisplay(dpy);
+ 	GetReq (LookupColor, req);
+ 	req->cmap = cmap;
+diff --git a/src/ParseCol.c b/src/ParseCol.c
+index e997b1b8..180132dd 100644
+--- a/src/ParseCol.c
++++ b/src/ParseCol.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <stdio.h>
+ #include "Xlibint.h"
+ #include "Xcmsint.h"
+@@ -46,7 +47,9 @@ XParseColor (
+ 	XcmsColor cmsColor;
+ 
+         if (!spec) return(0);
+-	n = strlen (spec);
++	n = (int) strlen (spec);
++	if (n >= USHRT_MAX)
++            return(0);
+ 	if (*spec == '#') {
+ 	    /*
+ 	     * RGB
+diff --git a/src/QuExt.c b/src/QuExt.c
+index 4e230e77..d38a1572 100644
+--- a/src/QuExt.c
++++ b/src/QuExt.c
+@@ -27,6 +27,8 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
++#include <stdbool.h>
+ #include "Xlibint.h"
+ 
+ Bool
+@@ -40,6 +42,9 @@ XQueryExtension(
+     xQueryExtensionReply rep;
+     register xQueryExtensionReq *req;
+ 
++    if (strlen(name) >= USHRT_MAX)
++        return false;
++
+     LockDisplay(dpy);
+     GetReq(QueryExtension, req);
+     req->nbytes = name ? strlen(name) : 0;
+diff --git a/src/SetFPath.c b/src/SetFPath.c
+index 60aaef01..3d8c50cb 100644
+--- a/src/SetFPath.c
++++ b/src/SetFPath.c
+@@ -26,6 +26,7 @@ in this Software without prior written authorization from The Open Group.
+ 
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
++#include <limits.h>
+ #endif
+ #include "Xlibint.h"
+ 
+@@ -48,7 +49,12 @@ XSetFontPath (
+ 	GetReq (SetFontPath, req);
+ 	req->nFonts = ndirs;
+ 	for (i = 0; i < ndirs; i++) {
+-		n += safestrlen (directories[i]) + 1;
++		n = (int) ((size_t) n + (safestrlen (directories[i]) + 1));
++		if (n >= USHRT_MAX) {
++			UnlockDisplay(dpy);
++			SyncHandle();
++			return 0;
++		}
+ 	}
+ 	nbytes = (n + 3) & ~3;
+ 	req->length += nbytes >> 2;
+diff --git a/src/SetHints.c b/src/SetHints.c
+index bc46498a..f3d727ec 100644
+--- a/src/SetHints.c
++++ b/src/SetHints.c
+@@ -49,6 +49,7 @@ SOFTWARE.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <X11/Xlibint.h>
+ #include <X11/Xutil.h>
+ #include "Xatomtype.h"
+@@ -214,6 +215,8 @@ XSetCommand (
+ 	register char *buf, *bp;
+ 	for (i = 0, nbytes = 0; i < argc; i++) {
+ 		nbytes += safestrlen(argv[i]) + 1;
++		if (nbytes >= USHRT_MAX)
++                    return 1;
+ 	}
+ 	if ((bp = buf = Xmalloc(nbytes))) {
+ 	    /* copy arguments into single buffer */
+@@ -256,6 +259,8 @@ XSetStandardProperties (
+ 
+ 	if (name != NULL) XStoreName (dpy, w, name);
+ 
++        if (safestrlen(icon_string) >= USHRT_MAX)
++            return 1;
+ 	if (icon_string != NULL) {
+ 	    XChangeProperty (dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
+                              PropModeReplace,
+@@ -298,6 +303,8 @@ XSetClassHint(
+ 
+ 	len_nm = safestrlen(classhint->res_name);
+ 	len_cl = safestrlen(classhint->res_class);
++        if (len_nm + len_cl >= USHRT_MAX)
++            return 1;
+ 	if ((class_string = s = Xmalloc(len_nm + len_cl + 2))) {
+ 	    if (len_nm) {
+ 		strcpy(s, classhint->res_name);
+diff --git a/src/StNColor.c b/src/StNColor.c
+index 8b821c3e..ba021958 100644
+--- a/src/StNColor.c
++++ b/src/StNColor.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <stdio.h>
+ #include "Xlibint.h"
+ #include "Xcmsint.h"
+@@ -46,6 +47,8 @@ int flags)  /* DoRed, DoGreen, DoBlue */
+     XcmsColor cmsColor_exact;
+     XColor scr_def;
+ 
++    if (strlen(name) >= USHRT_MAX)
++        return 0;
+ #ifdef XCMS
+     /*
+      * Let's Attempt to use Xcms approach to Parse Color
+diff --git a/src/StName.c b/src/StName.c
+index b4048bff..5a632d0c 100644
+--- a/src/StName.c
++++ b/src/StName.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization from The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <X11/Xlibint.h>
+ #include <X11/Xatom.h>
+ 
+@@ -36,7 +37,9 @@ XStoreName (
+     Window w,
+     _Xconst char *name)
+ {
+-    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING,
++    if (strlen(name) >= USHRT_MAX)
++        return 0;
++    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING, /*  */
+ 			   8, PropModeReplace, (_Xconst unsigned char *)name,
+ 			   name ? strlen(name) : 0);
+ }
+@@ -47,6 +50,8 @@ XSetIconName (
+     Window w,
+     _Xconst char *icon_name)
+ {
++    if (strlen(icon_name) >= USHRT_MAX)
++        return 0;
+     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
+                            PropModeReplace, (_Xconst unsigned char *)icon_name,
+ 			   icon_name ? strlen(icon_name) : 0);
+-- 
+2.32.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index ebd2640743..ff2a6f7265 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://libx11-whitespace.patch \
             file://CVE-2020-14344.patch \
             file://CVE-2020-14363.patch \
+            file://CVE-2021-31535.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1

