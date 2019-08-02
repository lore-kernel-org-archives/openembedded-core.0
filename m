Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 323A87F39A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 21:55:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x72LtLQD022486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Aug 2019 14:55:21 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 2 Aug 2019 14:55:20 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190802204406.21313-1-ross.burton@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <77a12d52-8ddd-750e-8f78-2a77da972040@windriver.com>
Date: Fri, 2 Aug 2019 17:55:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802204406.21313-1-ross.burton@intel.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH][RFC] libx11-diet: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 21:55:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 8/2/19 4:44 PM, Ross Burton wrote:
> This doesn't appear to be used anymore, as saving a few hundred k at the expense
> of only using ASCII is quite the compromise in the modern world.

Seconded!
../Randy

> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/conf/distro/include/maintainers.inc      |   1 -
>   .../xorg-lib/libx11-diet_1.6.8.bb             |  16 -
>   .../xorg-lib/libx11/X18NCMSstubs.patch        | 536 ------------------
>   .../xorg-lib/libx11/fix-disable-xlocale.patch |  33 --
>   .../libx11/fix-utf8-wrong-define.patch        |  31 -
>   5 files changed, 617 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index d9ef9bf1fdb..2ede6df96ff 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -405,7 +405,6 @@ RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
>   RECIPE_MAINTAINER_pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-libx11 = "Armin Kuster <akuster808@gmail.com>"
> -RECIPE_MAINTAINER_pn-libx11-diet = "Armin Kuster <akuster808@gmail.com>"
>   RECIPE_MAINTAINER_pn-libxau = "Armin Kuster <akuster808@gmail.com>"
>   RECIPE_MAINTAINER_pn-libxcb = "Armin Kuster <akuster808@gmail.com>"
>   RECIPE_MAINTAINER_pn-libxcomposite = "Armin Kuster <akuster808@gmail.com>"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
> deleted file mode 100644
> index 9c773a09dd8..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.8.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require libx11.inc
> -
> -DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
> -this version."
> -
> -SRC_URI += "file://X18NCMSstubs.patch \
> -            file://fix-disable-xlocale.patch \
> -            file://fix-utf8-wrong-define.patch \
> -           "
> -
> -RPROVIDES_${PN}-dev = "libx11-dev"
> -RPROVIDES_${PN}-locale = "libx11-locale"
> -
> -EXTRA_OECONF += "--disable-xlocale"
> -
> -PACKAGECONFIG ??= ""
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
> deleted file mode 100644
> index c1172147a6e..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
> +++ /dev/null
> @@ -1,536 +0,0 @@
> -From 62005ad019d6afb81da100b3113292a16472d241 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 10 Sep 2018 09:08:27 +0800
> -Subject: [PATCH] Stub out x18n
> -
> -Update patch to version 1.6.6
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -Upstream-Status: Inappropriate [configuration]
> ----
> - src/Makefile.am    |   5 +-
> - src/X18NCMSstubs.c | 426 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> - src/imConv.c       |   5 +-
> - src/locking.c      |   4 +
> - 4 files changed, 438 insertions(+), 2 deletions(-)
> - create mode 100644 src/X18NCMSstubs.c
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index f8c476d..cdbcbbd 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -336,13 +336,16 @@ if THRSTUBS
> - libX11_la_SOURCES+=UIThrStubs.c
> - endif
> -
> -+libX11_la_SOURCES+=X18NCMSstubs.c
> -+
> - x11datadir = @X11_DATADIR@
> - x11data_DATA = XErrorDB
> -
> - EXTRA_DIST = \
> - 	$(x11data_DATA) \
> - 	os2Stubs.c \
> --	UIThrStubs.c
> -+	UIThrStubs.c \
> -+	X18NCMSstubs.c
> -
> - libX11_xcb_la_SOURCES = x11_xcb.c Xxcbint.h
> - libX11_xcb_la_LDFLAGS = -version-number 1:0:0 -no-undefined
> -diff --git a/src/X18NCMSstubs.c b/src/X18NCMSstubs.c
> -new file mode 100644
> -index 0000000..429cb31
> ---- /dev/null
> -+++ b/src/X18NCMSstubs.c
> -@@ -0,0 +1,426 @@
> -+ /* - Provides stubs and dummy funcs needed when Xcms and XLocale stuff removed
> -+ *
> -+ * Copyright © 2003 Matthew Allum
> -+ *
> -+ * Permission to use, copy, modify, distribute, and sell this software and its
> -+ * documentation for any purpose is hereby granted without fee, provided that
> -+ * the above copyright notice appear in all copies and that both that
> -+ * copyright notice and this permission notice appear in supporting
> -+ * documentation, and that the name of Matthew Allum not be used in
> -+ * advertising or publicity pertaining to distribution of the software without
> -+ * specific, written prior permission.  Keith Packard and Compaq makes no
> -+ * representations about the suitability of this software for any purpose.  It
> -+ * is provided "as is" without express or implied warranty.
> -+ *
> -+ * MATTHEW ALLUM DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
> -+ * SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS,
> -+ * IN NO EVENT SHALL KEITH PACKARD BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> -+ * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> -+ * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> -+ * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> -+ * PERFORMANCE OF THIS SOFTWARE.
> -+ */
> -+
> -+#include <stdlib.h>
> -+#include "Xlibint.h"
> -+#include "Xlcint.h"
> -+#include <X11/Xlocale.h>
> -+#include <X11/Xos.h>
> -+#ifdef WIN32
> -+#undef close
> -+#endif
> -+#include <X11/Xutil.h>
> -+#include "XlcPubI.h"
> -+
> -+#include "Xcmsint.h" 		/* for XcmsCCC type  */
> -+#include "XlcPubI.h"            /* for XLCd type */
> -+#include "config.h"
> -+
> -+#if ! XLOCALE
> -+
> -+Bool
> -+XSupportsLocale()
> -+{
> -+  return False; 		
> -+}
> -+
> -+char *
> -+XSetLocaleModifiers(
> -+    const char *modifiers)
> -+{
> -+  return NULL;
> -+}
> -+
> -+XLCd
> -+_XOpenLC(
> -+    char *name)
> -+{
> -+  return NULL;
> -+}
> -+
> -+XLCd
> -+_XlcCurrentLC()
> -+{
> -+  return NULL;
> -+}
> -+
> -+void
> -+_XlcVaToArgList(
> -+    va_list var,
> -+    int count,
> -+    XlcArgList *args_ret)
> -+{
> -+  return;
> -+}
> -+
> -+void
> -+_XlcCountVaList(
> -+    va_list var,
> -+    int *count_ret)
> -+{
> -+  return;
> -+}
> -+
> -+void
> -+_XCloseLC(
> -+    XLCd lcd)
> -+{
> -+  return;
> -+}
> -+
> -+int
> -+_XlcConvert(
> -+    XlcConv conv,
> -+    XPointer *from,
> -+    int *from_left,
> -+    XPointer *to,
> -+    int *to_left,
> -+    XPointer *args,
> -+    int num_args)
> -+{
> -+  return 0;
> -+}
> -+
> -+/* XIM Stubs */
> -+
> -+XPointer
> -+_XimGetLocaleCode ( _Xconst char* encoding_name )
> -+{
> -+  return NULL;
> -+}
> -+
> -+int
> -+_XimGetCharCode (
> -+    XPointer            ucs_conv,
> -+    KeySym              keysym,
> -+    unsigned char*      buf,
> -+    int                 nbytes)
> -+{
> -+  return 0;
> -+}
> -+
> -+/* Xrm Stubs */
> -+
> -+XrmMethods
> -+_XrmInitParseInfo(
> -+    XPointer *state)
> -+{
> -+    return (XrmMethods) NULL;
> -+}
> -+
> -+/* Xwc Stubs */
> -+
> -+int
> -+XwcTextExtents(
> -+    XFontSet            font_set,
> -+    _Xconst wchar_t    *text,
> -+    int                 text_len,
> -+    XRectangle         *overall_ink_extents,
> -+    XRectangle         *overall_logical_extents)
> -+{
> -+  return 0;
> -+}
> -+
> -+void
> -+XwcDrawString(Display *display,
> -+	      Drawable d,
> -+	      XFontSet font_set,
> -+	      GC gc,
> -+	      int x, int y,
> -+	      _Xconst wchar_t *string,
> -+	      int num_wchars)
> -+{
> -+  ;
> -+}
> -+
> -+void
> -+XwcDrawText(
> -+    Display            *dpy,
> -+    Drawable            d,
> -+    GC                  gc,
> -+    int                 x,
> -+    int                 y,
> -+    XwcTextItem        *text_items,
> -+    int                 nitems)
> -+{
> -+  ;
> -+}
> -+
> -+void
> -+XwcDrawImageString(
> -+    Display            *dpy,
> -+    Drawable            d,
> -+    XFontSet            font_set,
> -+    GC                  gc,
> -+    int                 x,
> -+    int                 y,
> -+    _Xconst wchar_t    *text,
> -+    int                 text_len)
> -+{
> -+  ;
> -+}
> -+
> -+int
> -+XwcTextEscapement(
> -+    XFontSet            font_set,
> -+    _Xconst wchar_t    *text,
> -+    int                 text_len)
> -+{
> -+  return 0;
> -+}
> -+
> -+Status
> -+XwcTextPerCharExtents(
> -+    XFontSet            font_set,
> -+    _Xconst wchar_t    *text,
> -+    int                 text_len,
> -+    XRectangle         *ink_extents_buffer,
> -+    XRectangle         *logical_extents_buffer,
> -+    int                 buffer_size,
> -+    int                *num_chars,
> -+    XRectangle         *max_ink_extents,
> -+    XRectangle         *max_logical_extents)
> -+{
> -+  return(XcmsFailure);
> -+}
> -+
> -+int
> -+XwcTextPropertyToTextList(
> -+    Display *dpy,
> -+    const XTextProperty *text_prop,
> -+    wchar_t ***list_ret,
> -+    int *count_ret)
> -+{
> -+  return 0;
> -+}
> -+
> -+int
> -+XwcTextListToTextProperty(
> -+    Display *dpy,
> -+    wchar_t **list,
> -+    int count,
> -+    XICCEncodingStyle style,
> -+    XTextProperty *text_prop)
> -+{
> -+  return 0;
> -+}
> -+
> -+void
> -+XwcFreeStringList(wchar_t **list)
> -+{
> -+  return;
> -+}
> -+
> -+
> -+void XmbSetWMProperties (        /* Actually from mbWMProps.c */
> -+    Display *dpy,
> -+    Window w,
> -+    _Xconst char *windowName,
> -+    _Xconst char *iconName,
> -+    char **argv,
> -+    int argc,
> -+    XSizeHints *sizeHints,
> -+    XWMHints *wmHints,
> -+    XClassHint *classHints)
> -+{
> -+  return;
> -+}
> -+
> -+int
> -+XmbTextPropertyToTextList(
> -+    Display *dpy,
> -+    const XTextProperty *text_prop,
> -+    char ***list_ret,
> -+    int *count_ret)
> -+{
> -+  return XLocaleNotSupported;
> -+}
> -+
> -+int
> -+XmbTextListToTextProperty(
> -+    Display *dpy,
> -+    char **list,
> -+    int count,
> -+    XICCEncodingStyle style,
> -+    XTextProperty *text_prop)
> -+{
> -+  return XLocaleNotSupported;
> -+}
> -+
> -+int
> -+XmbTextExtents(
> -+    XFontSet        font_set,
> -+    _Xconst char   *text,
> -+    int             text_len,
> -+    XRectangle     *overall_ink_extents,
> -+    XRectangle     *overall_logical_extents)
> -+{
> -+  return 0;
> -+}
> -+
> -+void
> -+XmbDrawText(
> -+    Display            *dpy,
> -+    Drawable            d,
> -+    GC                  gc,
> -+    int                 x,
> -+    int                 y,
> -+    XmbTextItem        *text_items,
> -+    int                 nitems)
> -+{
> -+  ;
> -+}
> -+
> -+void
> -+XmbDrawString(
> -+    Display            *dpy,
> -+    Drawable            d,
> -+    XFontSet            font_set,
> -+    GC                  gc,
> -+    int                 x,
> -+    int                 y,
> -+    _Xconst char       *text,
> -+    int                 text_len)
> -+{
> -+  ;
> -+}
> -+
> -+void
> -+XmbDrawImageString(
> -+    Display            *dpy,
> -+    Drawable            d,
> -+    XFontSet            font_set,
> -+    GC                  gc,
> -+    int                 x,
> -+    int                 y,
> -+    _Xconst char       *text,
> -+    int                 text_len)
> -+{
> -+  ;
> -+}
> -+
> -+int
> -+XmbTextEscapement(
> -+    XFontSet        font_set,
> -+    _Xconst char   *text,
> -+    int             text_len)
> -+{
> -+  return 0;
> -+}
> -+
> -+Status
> -+XmbTextPerCharExtents(
> -+    XFontSet        font_set,
> -+    _Xconst char   *text,
> -+    int             text_len,
> -+    XRectangle     *ink_extents_buffer,
> -+    XRectangle     *logical_extents_buffer,
> -+    int             buffer_size,
> -+    int            *num_chars,
> -+    XRectangle     *max_ink_extents,
> -+    XRectangle     *max_logical_extents)
> -+{
> -+  return 0;
> -+}
> -+
> -+unsigned int
> -+KeySymToUcs4(KeySym keysym)
> -+{
> -+  return 0;
> -+}
> -+
> -+#endif
> -+
> -+#if ! XCMS
> -+
> -+XcmsCCC
> -+XcmsCCCOfColormap(dpy, cmap)
> -+    Display *dpy;
> -+    Colormap cmap;
> -+{
> -+  return NULL;
> -+}
> -+
> -+Status
> -+_XcmsResolveColorString (
> -+    XcmsCCC ccc,
> -+    const char **color_string,
> -+    XcmsColor *pColor_exact_return,
> -+    XcmsColorFormat result_format)
> -+{
> -+  return(XcmsFailure);
> -+}
> -+
> -+void
> -+_XcmsUnresolveColor(
> -+    XcmsCCC ccc,
> -+    XcmsColor *pColor)
> -+{
> -+  return;
> -+}
> -+
> -+void
> -+_XUnresolveColor(
> -+    XcmsCCC ccc,
> -+    XColor *pXColor)
> -+{
> -+  return;
> -+}
> -+
> -+XcmsCmapRec *
> -+_XcmsAddCmapRec(dpy, cmap, windowID, visual)
> -+    Display *dpy;
> -+    Colormap cmap;
> -+    Window windowID;
> -+    Visual *visual;
> -+{
> -+  return NULL;
> -+}
> -+
> -+void
> -+_XcmsRGB_to_XColor(
> -+    XcmsColor *pColors,
> -+    XColor *pXColors,
> -+    unsigned int nColors)
> -+{
> -+  return;
> -+}
> -+
> -+XcmsCmapRec *
> -+_XcmsCopyCmapRecAndFree(
> -+    Display *dpy,
> -+    Colormap src_cmap,
> -+    Colormap copy_cmap)
> -+{
> -+  return NULL;
> -+}
> -+
> -+void
> -+_XcmsDeleteCmapRec(
> -+    Display *dpy,
> -+    Colormap cmap)
> -+{
> -+  return;
> -+}
> -+
> -+#endif
> -diff --git a/src/imConv.c b/src/imConv.c
> -index c3c1974..04ecc81 100644
> ---- a/src/imConv.c
> -+++ b/src/imConv.c
> -@@ -80,6 +80,7 @@ static const struct SubstRec SubstTable[] = {
> -  * from UCS char to specified charset char.
> -  * This converter is needed for _XimGetCharCode subroutine.
> -  */
> -+#ifdef XLOCALE
> - XPointer
> - _XimGetLocaleCode (
> -     _Xconst char*	encoding_name)
> -@@ -93,7 +94,7 @@ _XimGetLocaleCode (
> -     }
> -     return cvt;
> - }
> --
> -+#endif
> - /*
> -  * Returns the locale dependent representation of a keysym.
> -  * The locale's encoding is passed in form of pointer to UCS convertor.
> -@@ -105,6 +105,7 @@ _XimGetLocaleCode (
> -  * locale
> -  */
> - /*ARGSUSED*/
> -+#ifdef XLOCALE
> - int
> - _XimGetCharCode (
> -     XPointer            ucs_conv,
> -@@ -133,6 +134,7 @@ _XimGetCharCode (
> -         buf[count]= '\0';
> -     return count;
> - }
> -+#endif
> -
> - #ifdef XKB
> - static int lookup_string(
> -diff --git a/src/locking.c b/src/locking.c
> -index 9f4fe06..e6967ee 100644
> ---- a/src/locking.c
> -+++ b/src/locking.c
> -@@ -65,7 +65,9 @@ in this Software without prior written authorization from The Open Group.
> - #define NUM_FREE_CVLS 4
> -
> - /* in lcWrap.c */
> -+#ifdef XLOCALE
> - extern LockInfoPtr _Xi18n_lock;
> -+#endif
> -
> - #ifdef WIN32
> - static DWORD _X_TlsIndex = (DWORD)-1;
> -@@ -597,9 +599,11 @@ Status XInitThreads(void)
> -     _Xglobal_lock = &global_lock;
> -     xmutex_init(_Xglobal_lock->lock);
> -     xmutex_set_name(_Xglobal_lock->lock, "Xlib global");
> -+#ifdef XLOCALE
> -     _Xi18n_lock = &i18n_lock;
> -     xmutex_init(_Xi18n_lock->lock);
> -     xmutex_set_name(_Xi18n_lock->lock, "Xlib i18n");
> -+#endif
> -     _XLockMutex_fn = _XLockMutex;
> -     _XUnlockMutex_fn = _XUnlockMutex;
> -     _XCreateMutex_fn = _XCreateMutex;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
> deleted file mode 100644
> index 09cf74fff4c..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5c1693028ef12ab767d7cdbc349c27efa1ada87a Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 10 Sep 2018 09:13:38 +0800
> -Subject: [PATCH] Fix build when xlocale disabled
> -
> -Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> -
> -Update patch to version 1.6.6
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -Upstream-Status: Pending
> ----
> - src/Font.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/Font.c b/src/Font.c
> -index a73f9b1..8f4d210 100644
> ---- a/src/Font.c
> -+++ b/src/Font.c
> -@@ -675,7 +675,11 @@ int _XF86LoadQueryLocaleFont(
> -     }
> -     if (l - 2 - (p - charset) < 0)
> - 	return 0;
> -+#ifdef XLOCALE
> -     if (_XlcNCompareISOLatin1(name + l - 2 - (p - charset), charset, p - charset))
> -+#else
> -+    if (strncasecmp(name + l - 2 - (p - charset), charset, p - charset))
> -+#endif
> - 	return 0;
> -     if (strlen(p + 1) + l - 1 >= sizeof(buf) - 1)
> - 	return 0;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch b/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
> deleted file mode 100644
> index 0b57e0b068c..00000000000
> --- a/meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 046703373055c7029c19d171e415ff3caaa87372 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Mon, 10 Sep 2018 09:16:33 +0800
> -Subject: [PATCH] Disable unicode
> -
> -Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> -
> -Update patch to version 1.6.6
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -Upstream-Status: Pending
> ----
> - include/X11/Xlib.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/X11/Xlib.h b/include/X11/Xlib.h
> -index 84403f7..56be654 100644
> ---- a/include/X11/Xlib.h
> -+++ b/include/X11/Xlib.h
> -@@ -67,7 +67,7 @@ _Xmblen(
> -
> - /* API mentioning "UTF8" or "utf8" is an XFree86 extension, introduced in
> -    November 2000. Its presence is indicated through the following macro. */
> --#define X_HAVE_UTF8_STRING 1
> -+#undef X_HAVE_UTF8_STRING
> -
> - /* The Xlib structs are full of implicit padding to properly align members.
> -    We can't clean that up without breaking ABI, so tell clang not to bother
> ---
> -2.7.4
> -
> 


-- 
# Randy MacLeod
# Wind River Linux

