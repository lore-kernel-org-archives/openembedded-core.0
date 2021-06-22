Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.6606.1624355462485042172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Xg6XhppaKpKhPRIF29Ds+2B7xY3Jy/QccYSZhaVKSxN1v7f9sLDtYIGxJouRkRnzu8UC32RbRV
 +54KMA8thaiA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014062"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014062"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:55 -0700
IronPort-SDR: HRCKlKBjA5QUFPQbFyIfPUIYNg6w2LcF9rOctyUxQD/QNjWe5A/PihksGtBG9Y/Ajp3NcU5XFa
 gUOYU6+z4sgQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260010"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/13] libx11: fix CVE-2021-31535
Date: Tue, 22 Jun 2021 17:50:21 +0800
Message-Id: <097df6a4ebee4bb1b7c60b61baf5c0c1d8137b5d.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-31535 of libx11. Adjust indentation as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xorg-lib/libx11/fix-CVE-2021-31535.patch  | 320 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.7.0.bb |   5 +-
 2 files changed, 323 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch
new file mode 100644
index 0000000000..2ec5cc1688
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch
@@ -0,0 +1,320 @@
+From 8d2e02ae650f00c4a53deb625211a0527126c605 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2021-31535
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8d2e02a]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/Font.c      | 4 +++-
+ src/FontInfo.c  | 3 +++
+ src/FontNames.c | 3 +++
+ src/GetColor.c  | 4 ++++
+ src/LoadFont.c  | 4 ++++
+ src/LookupCol.c | 6 ++++--
+ src/ParseCol.c  | 3 +++
+ src/QuExt.c     | 5 +++++
+ src/SetFPath.c  | 6 ++++++
+ src/SetHints.c  | 7 +++++++
+ src/StNColor.c  | 3 +++
+ src/StName.c    | 7 ++++++-
+ 12 files changed, 51 insertions(+), 4 deletions(-)
+
+diff --git a/src/Font.c b/src/Font.c
+index d4ebdaca..1cd89cca 100644
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
+@@ -663,7 +665,7 @@ int _XF86LoadQueryLocaleFont(
+     if (!name)
+ 	return 0;
+     l = (int) strlen(name);
+-    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-')
++    if (l < 2 || name[l - 1] != '*' || name[l - 2] != '-' || l >= USHRT_MAX)
+ 	return 0;
+     charset = NULL;
+     /* next three lines stolen from _XkbGetCharset() */
+diff --git a/src/FontInfo.c b/src/FontInfo.c
+index 694efa10..6644b3fa 100644
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
+index 30912925..458d80c9 100644
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
+index d088497f..c8178067 100644
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
+index 0a3809a8..3996436f 100644
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
+index 9608d512..cd9b1368 100644
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
+-	n = (int) strlen (spec);
+ 	LockDisplay(dpy);
+ 	GetReq (LookupColor, req);
+ 	req->cmap = cmap;
+diff --git a/src/ParseCol.c b/src/ParseCol.c
+index 2691df36..7a84a17b 100644
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
+@@ -47,6 +48,8 @@ XParseColor (
+ 
+         if (!spec) return(0);
+ 	n = (int) strlen (spec);
++	if (n >= USHRT_MAX)
++            return(0);
+ 	if (*spec == '#') {
+ 	    /*
+ 	     * RGB
+diff --git a/src/QuExt.c b/src/QuExt.c
+index 2021dca4..4cb99fcf 100644
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
+     req->nbytes = name ? (CARD16) strlen(name) : 0;
+diff --git a/src/SetFPath.c b/src/SetFPath.c
+index 7d12f18c..13fce49e 100644
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
+@@ -49,6 +50,11 @@ XSetFontPath (
+ 	req->nFonts = ndirs;
+ 	for (i = 0; i < ndirs; i++) {
+ 		n = (int) ((size_t) n + (safestrlen (directories[i]) + 1));
++		if (n >= USHRT_MAX) {
++			UnlockDisplay(dpy);
++			SyncHandle();
++			return 0;
++		}
+ 	}
+ 	nbytes = (n + 3) & ~3;
+ 	req->length += nbytes >> 2;
+diff --git a/src/SetHints.c b/src/SetHints.c
+index e81aa9d3..61cb0684 100644
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
+index 3b50401b..16dc9cbc 100644
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
+index 58b5a5a6..04bb3aa6 100644
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
+ 			   name ? (int) strlen(name) : 0);
+ }
+@@ -47,6 +50,8 @@ XSetIconName (
+     Window w,
+     _Xconst char *icon_name)
+ {
++    if (strlen(icon_name) >= USHRT_MAX)
++        return 0;
+     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
+                            PropModeReplace, (_Xconst unsigned char *)icon_name,
+ 			   icon_name ? (int) strlen(icon_name) : 0);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
index 3faee6e497..c6429cbbac 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb
@@ -11,8 +11,9 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/libx11:"
 PE = "1"
 
 SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
-           file://disable_tests.patch \
-           "
+            file://disable_tests.patch \
+            file://fix-CVE-2021-31535.patch \
+            "
 
 SRC_URI[sha256sum] = "36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54"
 
-- 
2.31.1

