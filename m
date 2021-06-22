Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [116.202.209.171])
 by mx.groups.io with SMTP id smtpd.web09.8062.1624363788898188844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 05:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@fancydomain.eu header.s=mail header.b=KlX22rSN;
 spf=pass (domain: fancydomain.eu, ip: 116.202.209.171, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1624363787;
	bh=31rVQEkCUr3iihjT1gl7wLgztO6XhbQAJc7mpYHdYHk=;
	h=From:To:Cc:Subject;
	b=KlX22rSNtx6l4KzUXDVUuOxcBvAOi6NkwlG/Lonbb/gr6NUZ0k4Vc2SJvownfXd06
	 yvoACx7aV7+raESkLeueFoxzWXCRwo8cSVPYZXGE7Y4oLh3LxQTL3L2x9U9HMf7QJV
	 PWOiZM7mcQzbDy5lZnZad/ov7mtnbLXuRn9t+zyN4qLyvvJ5K53TTBA8Y0IO5g2Jg8
	 4dAiACc1yNFDgmJYnWSAe6HZlQNpd79F0E0xrvmAD7apNg37sjWiZHtkx635c+kJKX
	 SkGFFCGzofQanRBD5fqKMbYwKPsNmgGeZGEH1fKYQctQubZ+wW3dm+V5cjRtPhrNLx
	 KO9w81CIy9YfA==
To: openembedded-core@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [oe-core][dunfell][PATCH v2] libx11: Fix CVE-2021-31535
Date: Tue, 22 Jun 2021 14:08:47 +0200
Message-Id: <20210622120847.111023-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://lists.x.org/archives/xorg-announce/2021-May/003088.html

XLookupColor() and other X libraries function lack proper validation
of the length of their string parameters. If those parameters can be
controlled by an external application (for instance a color name that
can be emitted via a terminal control sequence) it can lead to the
emission of extra X protocol requests to the X server.

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11=
/-/commit/8d2e02ae650f00c4a53deb625211a0527126c605]
CVE: CVE-2021-31535
Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../xorg-lib/libx11/CVE-2021-31535.patch      | 322 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 2 files changed, 323 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.=
patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch b=
/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
new file mode 100644
index 0000000000..1112320acf
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2021-31535.patch
@@ -0,0 +1,322 @@
+From 5c539ee6aba5872fcc73aa3d46a4e9a33dc030db Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Fri, 19 Feb 2021 15:30:39 +0100
+Subject: [PATCH] Reject string longer than USHRT_MAX before sending them=
 on
+ the wire
+
+The X protocol uses CARD16 values to represent the length so
+this would overflow.
+
+CVE-2021-31535
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
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
+     XF86BigfontCodes *extcodes =3D _XF86BigfontCodes(dpy);
+ #endif
+=20
++    if (strlen(name) >=3D USHRT_MAX)
++        return NULL;
+     if (_XF86LoadQueryLocaleFont(dpy, name, &font_result, (Font *)0))
+       return font_result;
+     LockDisplay(dpy);
+@@ -662,8 +664,8 @@ int _XF86LoadQueryLocaleFont(
+=20
+     if (!name)
+ 	return 0;
+-    l =3D strlen(name);
+-    if (l < 2 || name[l - 1] !=3D '*' || name[l - 2] !=3D '-')
++    l =3D (int) strlen(name);
++    if (l < 2 || name[l - 1] !=3D '*' || name[l - 2] !=3D '-' || l >=3D=
 USHRT_MAX)
+ 	return 0;
+     charset =3D NULL;
+     /* next three lines stolen from _XkbGetCharset() */
+diff --git a/src/FontInfo.c b/src/FontInfo.c
+index f870e431..51b48e29 100644
+--- a/src/FontInfo.c
++++ b/src/FontInfo.c
+@@ -58,6 +58,9 @@ XFontStruct **info)	/* RETURN */
+     register xListFontsReq *req;
+     int j;
+=20
++    if (strlen(pattern) >=3D USHRT_MAX)
++        return NULL;
++
+     LockDisplay(dpy);
+     GetReq(ListFontsWithInfo, req);
+     req->maxNames =3D maxNames;
+diff --git a/src/FontNames.c b/src/FontNames.c
+index b78792d6..4dac4916 100644
+--- a/src/FontNames.c
++++ b/src/FontNames.c
+@@ -51,6 +51,9 @@ int *actualCount)	/* RETURN */
+     register xListFontsReq *req;
+     unsigned long rlen =3D 0;
+=20
++    if (strlen(pattern) >=3D USHRT_MAX)
++        return NULL;
++
+     LockDisplay(dpy);
+     GetReq(ListFonts, req);
+     req->maxNames =3D maxNames;
+diff --git a/src/GetColor.c b/src/GetColor.c
+index cd0eb9f6..512ac308 100644
+--- a/src/GetColor.c
++++ b/src/GetColor.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
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
+=20
++    if (strlen(colorname) >=3D USHRT_MAX)
++        return (0);
++
+ #ifdef XCMS
+     /*
+      * Let's Attempt to use Xcms and i18n approach to Parse Color
+diff --git a/src/LoadFont.c b/src/LoadFont.c
+index f547976b..85735249 100644
+--- a/src/LoadFont.c
++++ b/src/LoadFont.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include "Xlibint.h"
+=20
+ Font
+@@ -38,6 +39,9 @@ XLoadFont (
+     Font fid;
+     register xOpenFontReq *req;
+=20
++    if (strlen(name) >=3D USHRT_MAX)
++        return (0);
++
+     if (_XF86LoadQueryLocaleFont(dpy, name, (XFontStruct **)0, &fid))
+       return fid;
+=20
+diff --git a/src/LookupCol.c b/src/LookupCol.c
+index f7f969f5..cd9b1368 100644
+--- a/src/LookupCol.c
++++ b/src/LookupCol.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
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
+=20
++	n =3D (int) strlen (spec);
++	if (n >=3D USHRT_MAX)
++            return 0;
+ #ifdef XCMS
+ 	/*
+ 	 * Let's Attempt to use Xcms and i18n approach to Parse Color
+@@ -77,8 +81,6 @@ XLookupColor (
+ 	 * Xcms and i18n methods failed, so lets pass it to the server
+ 	 * for parsing.
+ 	 */
+-
+-	n =3D strlen (spec);
+ 	LockDisplay(dpy);
+ 	GetReq (LookupColor, req);
+ 	req->cmap =3D cmap;
+diff --git a/src/ParseCol.c b/src/ParseCol.c
+index e997b1b8..180132dd 100644
+--- a/src/ParseCol.c
++++ b/src/ParseCol.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <stdio.h>
+ #include "Xlibint.h"
+ #include "Xcmsint.h"
+@@ -46,7 +47,9 @@ XParseColor (
+ 	XcmsColor cmsColor;
+=20
+         if (!spec) return(0);
+-	n =3D strlen (spec);
++	n =3D (int) strlen (spec);
++	if (n >=3D USHRT_MAX)
++            return(0);
+ 	if (*spec =3D=3D '#') {
+ 	    /*
+ 	     * RGB
+diff --git a/src/QuExt.c b/src/QuExt.c
+index 4e230e77..d38a1572 100644
+--- a/src/QuExt.c
++++ b/src/QuExt.c
+@@ -27,6 +27,8 @@ in this Software without prior written authorization f=
rom The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
++#include <stdbool.h>
+ #include "Xlibint.h"
+=20
+ Bool
+@@ -40,6 +42,9 @@ XQueryExtension(
+     xQueryExtensionReply rep;
+     register xQueryExtensionReq *req;
+=20
++    if (strlen(name) >=3D USHRT_MAX)
++        return false;
++
+     LockDisplay(dpy);
+     GetReq(QueryExtension, req);
+     req->nbytes =3D name ? strlen(name) : 0;
+diff --git a/src/SetFPath.c b/src/SetFPath.c
+index 60aaef01..3d8c50cb 100644
+--- a/src/SetFPath.c
++++ b/src/SetFPath.c
+@@ -26,6 +26,7 @@ in this Software without prior written authorization f=
rom The Open Group.
+=20
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
++#include <limits.h>
+ #endif
+ #include "Xlibint.h"
+=20
+@@ -48,7 +49,12 @@ XSetFontPath (
+ 	GetReq (SetFontPath, req);
+ 	req->nFonts =3D ndirs;
+ 	for (i =3D 0; i < ndirs; i++) {
+-		n +=3D safestrlen (directories[i]) + 1;
++		n =3D (int) ((size_t) n + (safestrlen (directories[i]) + 1));
++		if (n >=3D USHRT_MAX) {
++			UnlockDisplay(dpy);
++			SyncHandle();
++			return 0;
++		}
+ 	}
+ 	nbytes =3D (n + 3) & ~3;
+ 	req->length +=3D nbytes >> 2;
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
+ 	for (i =3D 0, nbytes =3D 0; i < argc; i++) {
+ 		nbytes +=3D safestrlen(argv[i]) + 1;
++		if (nbytes >=3D USHRT_MAX)
++                    return 1;
+ 	}
+ 	if ((bp =3D buf =3D Xmalloc(nbytes))) {
+ 	    /* copy arguments into single buffer */
+@@ -256,6 +259,8 @@ XSetStandardProperties (
+=20
+ 	if (name !=3D NULL) XStoreName (dpy, w, name);
+=20
++        if (safestrlen(icon_string) >=3D USHRT_MAX)
++            return 1;
+ 	if (icon_string !=3D NULL) {
+ 	    XChangeProperty (dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
+                              PropModeReplace,
+@@ -298,6 +303,8 @@ XSetClassHint(
+=20
+ 	len_nm =3D safestrlen(classhint->res_name);
+ 	len_cl =3D safestrlen(classhint->res_class);
++        if (len_nm + len_cl >=3D USHRT_MAX)
++            return 1;
+ 	if ((class_string =3D s =3D Xmalloc(len_nm + len_cl + 2))) {
+ 	    if (len_nm) {
+ 		strcpy(s, classhint->res_name);
+diff --git a/src/StNColor.c b/src/StNColor.c
+index 8b821c3e..ba021958 100644
+--- a/src/StNColor.c
++++ b/src/StNColor.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
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
+=20
++    if (strlen(name) >=3D USHRT_MAX)
++        return 0;
+ #ifdef XCMS
+     /*
+      * Let's Attempt to use Xcms approach to Parse Color
+diff --git a/src/StName.c b/src/StName.c
+index b4048bff..5a632d0c 100644
+--- a/src/StName.c
++++ b/src/StName.c
+@@ -27,6 +27,7 @@ in this Software without prior written authorization f=
rom The Open Group.
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <limits.h>
+ #include <X11/Xlibint.h>
+ #include <X11/Xatom.h>
+=20
+@@ -36,7 +37,9 @@ XStoreName (
+     Window w,
+     _Xconst char *name)
+ {
+-    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING,
++    if (strlen(name) >=3D USHRT_MAX)
++        return 0;
++    return XChangeProperty(dpy, w, XA_WM_NAME, XA_STRING, /*  */
+ 			   8, PropModeReplace, (_Xconst unsigned char *)name,
+ 			   name ? strlen(name) : 0);
+ }
+@@ -47,6 +50,8 @@ XSetIconName (
+     Window w,
+     _Xconst char *icon_name)
+ {
++    if (strlen(icon_name) >=3D USHRT_MAX)
++        return 0;
+     return XChangeProperty(dpy, w, XA_WM_ICON_NAME, XA_STRING, 8,
+                            PropModeReplace, (_Xconst unsigned char *)ic=
on_name,
+ 			   icon_name ? strlen(icon_name) : 0);
+--=20
+2.32.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.6.9.bb
index ebd2640743..ff2a6f7265 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -15,6 +15,7 @@ SRC_URI +=3D "file://Fix-hanging-issue-in-_XReply.patch=
 \
             file://libx11-whitespace.patch \
             file://CVE-2020-14344.patch \
             file://CVE-2020-14363.patch \
+            file://CVE-2021-31535.patch \
 "
=20
 SRC_URI[md5sum] =3D "55adbfb6d4370ecac5e70598c4e7eed2"
--=20
2.32.0

