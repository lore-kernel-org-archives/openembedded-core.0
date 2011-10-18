Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RG27f-0002H0-JC
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 07:22:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9I5G5JI028873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 22:16:05 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 22:16:05 -0700
Message-ID: <e45d724cf956aed072563af5f441e7ebd56a9a3a.1318904555.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318904555.git.xiaofeng.yan@windriver.com>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 18 Oct 2011 10:09:25 +0800
Date: Tue, 18 Oct 2011 13:22:01 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9I5G5JI028873
Subject: [PATCH 2/2] libx11-diet: update to 1.4.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 05:22:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

core-image-sato based on libx11-diet can run on qemu by test.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff   |  540 ++++++++++++++=
++++++
 .../libx11-diet-1.4.4/fix-disable-xlocale.diff     |   16 +
 .../libx11-diet-1.4.4/fix-utf8-wrong-define.patch  |   17 +
 .../xorg-lib/libx11-diet-1.4.4/include_fix.patch   |   25 +
 .../xorg-lib/libx11-diet-1.4.4/nodolt.patch        |   14 +
 .../libx11-diet-1.4.4/x11_disable_makekeys.patch   |   31 ++
 .../recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb |   27 +
 7 files changed, 670 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18N=
CMSstubs.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-=
disable-xlocale.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-=
utf8-wrong-define.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/incl=
ude_fix.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/nodo=
lt.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_=
disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstub=
s.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.di=
ff
new file mode 100644
index 0000000..91ab180
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
@@ -0,0 +1,540 @@
+Upstream-Status: Pending
+
+Index: libX11-1.3/src/imConv.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- libX11-1.3.orig/src/imConv.c
++++ libX11-1.3/src/imConv.c
+@@ -83,6 +83,7 @@ static const struct SubstRec SubstTable[
+  * from UCS char to specified charset char.
+  * This converter is needed for _XimGetCharCode subroutine.
+  */
++#ifdef XLOCALE
+ XPointer
+ _XimGetLocaleCode (
+     _Xconst char*	encoding_name)
+@@ -96,6 +97,7 @@ _XimGetLocaleCode (
+     }
+     return cvt;
+ }
++#endif
+=20
+ /*
+  * Returns the locale dependent representation of a keysym.
+@@ -106,6 +108,7 @@ _XimGetLocaleCode (
+  * terminating NUL byte. Return 0 if the keysym is not representable in=
 the
+  * locale
+  */
++#ifdef XLOCALE
+ /*ARGSUSED*/
+ int
+ _XimGetCharCode (
+@@ -135,6 +138,7 @@ _XimGetCharCode (
+         buf[count]=3D '\0';
+     return count;
+ }
++#endif
+=20
+ #ifdef XKB
+ static int lookup_string(
+Index: libX11-1.3/src/X18NCMSstubs.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null
++++ libX11-1.3/src/X18NCMSstubs.c
+@@ -0,0 +1,428 @@
++/*
++ * X18NCMSstubs.c
++ * - Provides stubs and dummy funcs needed when Xcms and XLocale stuff =
removed
++ *
++ * Copyright =A9 2003 Matthew Allum
++ *
++ * Permission to use, copy, modify, distribute, and sell this software =
and its
++ * documentation for any purpose is hereby granted without fee, provide=
d that
++ * the above copyright notice appear in all copies and that both that
++ * copyright notice and this permission notice appear in supporting
++ * documentation, and that the name of Matthew Allum not be used in
++ * advertising or publicity pertaining to distribution of the software =
without
++ * specific, written prior permission.  Keith Packard and Compaq makes =
no
++ * representations about the suitability of this software for any purpo=
se.  It
++ * is provided "as is" without express or implied warranty.
++ *
++ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS=20
++ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FI=
TNESS,=20
++ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT =
OR
++ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS =
OF USE,
++ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTH=
ER
++ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
++ * PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <stdlib.h>
++#include "Xlibint.h"
++#include "Xlcint.h"
++#include <X11/Xlocale.h>
++#include <X11/Xos.h>
++#ifdef WIN32
++#undef close
++#endif
++#include <X11/Xutil.h>
++#include "XlcPubI.h"
++
++#include "Xcmsint.h" 		/* for XcmsCCC type  */
++#include "XlcPubI.h"            /* for XLCd type */
++#include "config.h"
++
++#if ! XLOCALE
++
++Bool
++XSupportsLocale()
++{
++  return False; 	=09
++}
++
++char *
++XSetLocaleModifiers(
++    const char *modifiers)
++{
++  return NULL;
++}
++
++XLCd
++_XOpenLC(
++    char *name)
++{
++  return NULL;
++}
++
++XLCd
++_XlcCurrentLC()
++{
++  return NULL;
++}
++
++void
++_XlcVaToArgList(
++    va_list var,
++    int count,
++    XlcArgList *args_ret)
++{
++  return;
++}
++
++void
++_XlcCountVaList(
++    va_list var,
++    int *count_ret)
++{
++  return;
++}
++
++void
++_XCloseLC(
++    XLCd lcd)
++{
++  return;
++}
++
++int
++_XlcConvert(
++    XlcConv conv,
++    XPointer *from,
++    int *from_left,
++    XPointer *to,
++    int *to_left,
++    XPointer *args,
++    int num_args)
++{
++  return 0;
++}
++
++/* XIM Stubs */
++
++XPointer
++_XimGetLocaleCode ( _Xconst char* encoding_name )
++{
++  return NULL;
++}
++
++int
++_XimGetCharCode (
++    XPointer            ucs_conv,
++    KeySym              keysym,
++    unsigned char*      buf,
++    int                 nbytes)
++{
++  return 0;
++}
++
++/* Xrm Stubs */
++
++XrmMethods
++_XrmInitParseInfo(
++    XPointer *state)
++{
++    return (XrmMethods) NULL;
++}
++
++/* Xwc Stubs */
++
++int
++XwcTextExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *overall_ink_extents,
++    XRectangle         *overall_logical_extents)
++{
++  return 0;
++}
++
++void=20
++XwcDrawString(Display *display,
++	      Drawable d,
++	      XFontSet font_set,
++	      GC gc,
++	      int x, int y,
++	      _Xconst wchar_t *string,
++	      int num_wchars)
++{
++  ;
++}
++
++void
++XwcDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XwcTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XwcDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XwcTextEscapement(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len)
++{
++  return 0;
++}
++
++Status
++XwcTextPerCharExtents(
++    XFontSet            font_set,
++    _Xconst wchar_t    *text,
++    int                 text_len,
++    XRectangle         *ink_extents_buffer,
++    XRectangle         *logical_extents_buffer,
++    int                 buffer_size,
++    int                *num_chars,
++    XRectangle         *max_ink_extents,
++    XRectangle         *max_logical_extents)
++{
++  ;
++}
++
++int
++XwcTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    wchar_t ***list_ret,
++    int *count_ret)
++{
++  return 0;
++}
++
++int
++XwcTextListToTextProperty(
++    Display *dpy,
++    wchar_t **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return 0;
++}
++
++void
++XwcFreeStringList(wchar_t **list)
++{
++  return;
++}
++
++
++void XmbSetWMProperties (        /* Actually from mbWMProps.c */
++    Display *dpy,
++    Window w,
++    _Xconst char *windowName,
++    _Xconst char *iconName,
++    char **argv,
++    int argc,
++    XSizeHints *sizeHints,
++    XWMHints *wmHints,
++    XClassHint *classHints)
++{
++  return;
++}
++
++int
++XmbTextPropertyToTextList(
++    Display *dpy,
++    const XTextProperty *text_prop,
++    char ***list_ret,
++    int *count_ret)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextListToTextProperty(
++    Display *dpy,
++    char **list,
++    int count,
++    XICCEncodingStyle style,
++    XTextProperty *text_prop)
++{
++  return XLocaleNotSupported;
++}
++
++int
++XmbTextExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *overall_ink_extents,
++    XRectangle     *overall_logical_extents)
++{
++  return 0;
++}
++
++void
++XmbDrawText(
++    Display            *dpy,
++    Drawable            d,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    XmbTextItem        *text_items,
++    int                 nitems)
++{
++  ;
++}
++
++void
++XmbDrawString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++void
++XmbDrawImageString(
++    Display            *dpy,
++    Drawable            d,
++    XFontSet            font_set,
++    GC                  gc,
++    int                 x,
++    int                 y,
++    _Xconst char       *text,
++    int                 text_len)
++{
++  ;
++}
++
++int
++XmbTextEscapement(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len)
++{
++  return 0;
++}
++
++Status
++XmbTextPerCharExtents(
++    XFontSet        font_set,
++    _Xconst char   *text,
++    int             text_len,
++    XRectangle     *ink_extents_buffer,
++    XRectangle     *logical_extents_buffer,
++    int             buffer_size,
++    int            *num_chars,
++    XRectangle     *max_ink_extents,
++    XRectangle     *max_logical_extents)
++{
++  return 0;
++}
++
++unsigned int
++KeySymToUcs4(KeySym keysym)
++{
++  return 0;
++}
++
++#endif=20
++
++#if ! XCMS
++
++XcmsCCC=20
++XcmsCCCOfColormap(dpy, cmap)
++    Display *dpy;
++    Colormap cmap;
++{
++  return NULL;
++}
++
++Status
++_XcmsResolveColorString (
++    XcmsCCC ccc,
++    const char **color_string,
++    XcmsColor *pColor_exact_return,
++    XcmsColorFormat result_format)
++{
++  return(XcmsFailure);
++}
++
++void
++_XcmsUnresolveColor(
++    XcmsCCC ccc,
++    XcmsColor *pColor)
++{
++  return;
++}
++
++void
++_XUnresolveColor(
++    XcmsCCC ccc,
++    XColor *pXColor)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsAddCmapRec(dpy, cmap, windowID, visual)
++    Display *dpy;
++    Colormap cmap;
++    Window windowID;
++    Visual *visual;
++{
++  return NULL;
++}
++
++void
++_XcmsRGB_to_XColor(
++    XcmsColor *pColors,
++    XColor *pXColors,
++    unsigned int nColors)
++{
++  return;
++}
++
++XcmsCmapRec *
++_XcmsCopyCmapRecAndFree(
++    Display *dpy,
++    Colormap src_cmap,
++    Colormap copy_cmap)
++{
++  return NULL;
++}
++
++void
++_XcmsDeleteCmapRec(
++    Display *dpy,
++    Colormap cmap)
++{
++  return;
++}
++
++#endif
+Index: libX11-1.3/src/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- libX11-1.3.orig/src/Makefile.am
++++ libX11-1.3/src/Makefile.am
+@@ -335,6 +335,8 @@ if THRSTUBS
+ libX11_la_SOURCES+=3DUIThrStubs.c
+ endif
+=20
++libX11_la_SOURCES+=3DX18NCMSstubs.c
++
+ x11datadir =3D @X11_DATADIR@
+ x11data_DATA =3D XKeysymDB XErrorDB
+=20
+@@ -342,7 +344,8 @@ EXTRA_DIST =3D \
+ 	$(x11data_DATA) \
+ 	os2Stubs.c \
+ 	udcInf.c \
+-	UIThrStubs.c=20
++	UIThrStubs.c \
++	X18NCMSstubs.c
+=20
+ if XCB
+ libX11_la_SOURCES +=3D \
+Index: libX11-1.3/src/locking.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- libX11-1.3.orig/src/locking.c
++++ libX11-1.3/src/locking.c
+@@ -66,7 +66,9 @@ in this Software without prior written a
+ #define NUM_FREE_CVLS 4
+=20
+ /* in lcWrap.c */
++#ifdef XLOCALE
+ extern LockInfoPtr _Xi18n_lock;
++#endif
+=20
+ #ifdef WIN32
+ static DWORD _X_TlsIndex =3D (DWORD)-1;
+@@ -594,9 +596,11 @@ Status XInitThreads(void)
+     _Xglobal_lock =3D &global_lock;
+     xmutex_init(_Xglobal_lock->lock);
+     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
++#ifdef XLOCALE
+     _Xi18n_lock =3D &i18n_lock;
+     xmutex_init(_Xi18n_lock->lock);
+     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
++#endif
+     _XLockMutex_fn =3D _XLockMutex;
+     _XUnlockMutex_fn =3D _XUnlockMutex;
+     _XCreateMutex_fn =3D _XCreateMutex;
+Index: libX11-1.3/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- libX11-1.3.orig/configure.ac
++++ libX11-1.3/configure.ac
+@@ -289,7 +289,14 @@ else
+ fi
+ AC_SUBST(KEYSYMDEF)
+=20
+-AM_CONDITIONAL(UDC, test xfalse =3D xtrue)
++AC_ARG_ENABLE(udc,
++              AC_HELP_STRING([--disable-udc],
++                [Disable Xlib support for UDC *EXPERIMENTAL*]),
++              [UDC=3D$enableval],[UDC=3Dyes])
++AM_CONDITIONAL(UDC, [test x$UDC =3D xyes ])
++if test x"$UDC" =3D "xyes"; then
++	AC_DEFINE(UDC,1,[Include support for UDC])
++fi
+=20
+ AC_ARG_ENABLE(xcms,
+               AC_HELP_STRING([--disable-xcms],
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable=
-xlocale.diff b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disa=
ble-xlocale.diff
new file mode 100644
index 0000000..7dcdd6a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocal=
e.diff
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+--- libX11-X11R7.0-1.0.0/src/Font.c.orig	2006-03-12 18:35:42.000000000 +=
0100
++++ libX11-X11R7.0-1.0.0/src/Font.c	2006-03-12 18:40:27.000000000 +0100
+@@ -701,7 +701,11 @@
+     }
+     if (l - 2 - (p - charset) < 0)
+ 	return 0;
++#ifdef XLOCALE
+     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p =
- charset))
++#else
++    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset)=
)
++#endif
+ 	return 0;
+     if (strlen(p + 1) + l - 1 >=3D sizeof(buf) - 1)
+ 	return 0;
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wr=
ong-define.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-u=
tf8-wrong-define.patch
new file mode 100644
index 0000000..26d3349
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-def=
ine.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- libX11-X11R7.0-1.0.0/include/X11/Xlib.h~fix-utf8-wrong-define
++++ libX11-X11R7.0-1.0.0/include/X11/Xlib.h
+@@ -103,7 +103,7 @@
+=20
+ /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced =
in
+    November 2000. Its presence is indicated through the following macro=
. */
+-#define X_HAVE_UTF8_STRING 1
++#undef X_HAVE_UTF8_STRING
+=20
+ typedef char *XPointer;
+=20
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/include_fix=
.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/include_fix.pat=
ch
new file mode 100644
index 0000000..b3bcbab
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/include_fix.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Inappropriate [configuration]
+
+---
+ configure.ac |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- libX11-1.1.5.orig/configure.ac
++++ libX11-1.1.5/configure.ac
+@@ -218,13 +218,13 @@ AC_SUBST(XDMCP_LIBS)
+ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is availab=
le])], )
+=20
+ #
+ # Find keysymdef.h
+ #
+-AC_MSG_CHECKING([keysymdef.h])
+-dir=3D`pkg-config --variable=3Dincludedir xproto`
+-KEYSYMDEF=3D"$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++	AC_HELP_STRING([--with-keysymdef=3DDIR/keysymdef.h], [The location of =
keysymdef.h]),
++ 	KEYSYMDEF=3D$withval, KEYSYMDEF=3D"")
+ if test -f "$KEYSYMDEF"; then
+         AC_MSG_RESULT([$KEYSYMDEF])
+ else
+ 	AC_MSG_ERROR([Cannot find keysymdef.h])
+ fi
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/nodolt.patc=
h b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/nodolt.patch
new file mode 100644
index 0000000..cc05fdc
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/nodolt.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: libX11-1.2.1/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- libX11-1.2.1.orig/configure.ac	2009-07-02 14:07:54.000000000 +0100
++++ libX11-1.2.1/configure.ac	2009-07-02 14:08:01.000000000 +0100
+@@ -20,7 +20,6 @@
+=20
+ # Checks for programs.
+ AC_PROG_LIBTOOL
+-DOLT
+ AC_PROG_CC
+ XORG_CWARNFLAGS
+=20
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable=
_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_di=
sable_makekeys.patch
new file mode 100644
index 0000000..70ee695
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makeke=
ys.patch
@@ -0,0 +1,31 @@
+---
+ src/util/Makefile.am |   21 -----------------
+ 1 file changed, 21 deletions(-)
+
+--- a/src/util/Makefile.am
++++ b/src/util/Makefile.am
+@@ -1,24 +1,3 @@
+=20
+-noinst_PROGRAMS=3Dmakekeys
+-
+-makekeys_CFLAGS =3D \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC =3D @CC_FOR_BUILD@
+-CPPFLAGS =3D @CPPFLAGS_FOR_BUILD@
+-CFLAGS =3D @CFLAGS_FOR_BUILD@
+-LDFLAGS =3D @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST =3D mkks.sh
+=20
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=3D$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) =
\
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/r=
ecipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
new file mode 100644
index 0000000..df2a47f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
@@ -0,0 +1,27 @@
+require libx11.inc
+
+DESCRIPTION +=3D " Support for XCB, UDC, XCMS and XLOCALE is disabled in=
 \
+this version."
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
+
+PR =3D "r5"
+
+SRC_URI +=3D "file://x11_disable_makekeys.patch \
+            file://X18NCMSstubs.diff \
+            file://fix-disable-xlocale.diff \
+            file://fix-utf8-wrong-define.patch \
+           "
+
+
+SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
+SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834=
599f5c654e6c840d"
+
+DEPENDS +=3D "bigreqsproto xproto xextproto xtrans libxau libx11 xcmiscp=
roto \
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
+
+FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
+
+EXTRA_OECONF +=3D "--without-xcb --disable-udc --disable-xcms --disable-=
xlocale"
+CFLAGS +=3D "-D_GNU_SOURCE"
+
--=20
1.7.0.4



