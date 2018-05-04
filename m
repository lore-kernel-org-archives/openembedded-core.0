Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C9ECA74D40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 13:07:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 06:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="55946587"
Received: from bpark-mobl.gar.corp.intel.com (HELO [10.249.73.208])
	([10.249.73.208])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2018 06:07:54 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<20180503081758.4661-2-anuj.mittal@intel.com>
	<CAJTo0LZqqcDiMQE6-GjaLmYJWQoj_g_ttkz1JR8X25K6uUcHxw@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <0635df77-73be-ef9e-2952-b1c87743b4f7@intel.com>
Date: Fri, 4 May 2018 21:07:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZqqcDiMQE6-GjaLmYJWQoj_g_ttkz1JR8X25K6uUcHxw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/12] gst-plugins-base: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Fri, 04 May 2018 13:07:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

For some reason, I can't reproduce this, I have g-i enabled. But, it
looks like we need this:

https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?h=1.14&id=9261296858cb149767ceac44fd6bd13cc0de0d21

On 05/04/2018 07:52 PM, Burton, Ross wrote:
>  Couldn't find include 'GstVideo-1.0.gir' (search path:
> '['/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
> '/usr/share/gir-1.0', '/usr/share/gir-1.0', '/usr/share/gir-1.0',
> '/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot/usr/share/gir-1.0',
> '/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0',
> '/usr/share/gir-1.0',
> '/data/poky-tmp/master/work/corei7-64-poky-linux/gstreamer1.0-plugins-base/1.14.0-r0/recipe-sysroot-native/usr/share/gir-1.0']')
> | Makefile:1506: recipe for target 'GstGL-1.0.gir' failed
> 
> Turn on gobject-introspection DISTRO_FEATURE if you haven't already.
> 
> That file is at ./gst-libs/gst/video/GstVideo-1.0.gir in the build tree,
> so that search path is wrong...
> 
> Ross
> 
> On 3 May 2018 at 09:17, Anuj Mittal <anuj.mittal@intel.com
> <mailto:anuj.mittal@intel.com>> wrote:
> 
>     * For changes, please see:
>     https://gstreamer.freedesktop.org/releases/1.14/
>     <https://gstreamer.freedesktop.org/releases/1.14/>
>     * OpenGL integration library has moved to -plugins-base, add
>     PACKAGECONFIG.
>     * Remove one patch as that has been fixed in a different way upstream.
>     * Merge inc/bb and refresh patches to get rid of fuzz warnings.
>     * Remove x86 specific cached variables as they're not needed anymore.
>     * Add jpeg to PACKAGECONFIG and enable it by default.
>     * Port gstreamer-gl specific patches from -plugins-bad.
> 
>     Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>
>     ---
>      ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  12 +-
>      .../gstreamer/gstreamer1.0-plugins-base.inc        |  50 -------
>      ...-don-t-hardcode-libtool-name-when-running.patch |  71 +++++-----
>      ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  29 ++++
>      ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 151
>     +++++++++------------
>      ...ssing-include-directories-when-calling-in.patch |  12 +-
>      ...3-ssaparse-enhance-SSA-text-lines-parsing.patch |  24 ++--
>      ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  12 +-
>      ...t-need_segment-after-sink-pad-received-GS.patch |  69 ----------
>      .../0009-glimagesink-Downrank-to-marginal.patch    |  32 +++++
>      .../get-caps-from-src-pad-when-query-caps.patch    |  12 +-
>      .../link-with-libvchostif.patch                    |  45 ++++++
>      ...make-gio_unix_2_0-dependency-configurable.patch |  12 +-
>      .../gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
>     <http://gstreamer1.0-plugins-base_1.12.4.bb>  |  18 ---
>      .../gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
>     <http://gstreamer1.0-plugins-base_1.14.0.bb>  |  70 ++++++++++
>      15 files changed, 314 insertions(+), 305 deletions(-)
>      delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
>      create mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
>      delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
>      create mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
>      create mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
>      delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb <http://gstreamer1.0-plugins-base_1.12.4.bb>
>      create mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb <http://gstreamer1.0-plugins-base_1.14.0.bb>
> 
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>     b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>     index 2cab87f9ec..1b7f115083 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>     @@ -1,4 +1,4 @@
>     -From 90916f96262fa7b27a0a99788c69f9fd6df11000 Mon Sep 17 00:00:00 2001
>     +From 2b0436f9a07773fae8c74df902d7024e8bfc3512 Mon Sep 17 00:00:00 2001
>      From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      Date: Tue, 24 Nov 2015 16:46:27 +0200
>      Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
>     @@ -10,12 +10,13 @@ is later supplied to g-ir-scanner.
> 
>      Upstream-Status: Pending [review on oe-core list]
>      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +
>      ---
>     - common/m4/introspection.m4 | 12 ++++++------
>     - 1 file changed, 6 insertions(+), 6 deletions(-)
>     + common/m4/introspection.m4 | 8 ++++----
>     + 1 file changed, 4 insertions(+), 4 deletions(-)
> 
>      diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
>     -index 162be57..217a6ae 100644
>     +index 162be57..933f979 100644
>      --- a/common/m4/introspection.m4
>      +++ b/common/m4/introspection.m4
>      @@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
>     @@ -37,6 +38,3 @@ index 162be57..217a6ae 100644
>              INTROSPECTION_INIT="extern void gst_init(gint*,gchar**);
>     gst_init(NULL,NULL);"
>           fi
>           AC_SUBST(INTROSPECTION_SCANNER)
>     ---
>     -2.6.2
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
>     deleted file mode 100644
>     index 08130c1da4..0000000000
>     --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
>     +++ /dev/null
>     @@ -1,50 +0,0 @@
>     -require gstreamer1.0-plugins.inc
>     -
>     -SRC_URI_append = "\
>     -   
>     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
>     -   
>     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
>     -   
>     file://0003-riff-add-missing-include-directories-when-calling-in.patch \
>     -   
>     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
>     -"
>     -
>     -LICENSE = "GPLv2+ & LGPLv2+"
>     -
>     -DEPENDS += "iso-codes util-linux zlib"
>     -
>     -inherit gettext
>     -
>     -PACKAGES_DYNAMIC =+ "^libgst.*"
>     -
>     -PACKAGECONFIG ??= " \
>     -    ${GSTREAMER_ORC} \
>     -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
>     -    gio-unix-2.0 ogg pango theora vorbis \
>     -"
>     -
>     -X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
>     -X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
>     -X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
>     -
>     -PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
>     -PACKAGECONFIG[cdparanoia]   =
>     "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
>     -PACKAGECONFIG[gio-unix-2.0] =
>     "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
>     -PACKAGECONFIG[ivorbis]      =
>     "--enable-ivorbis,--disable-ivorbis,tremor"
>     -PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
>     -PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
>     -PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
>     -PACKAGECONFIG[theora]       =
>     "--enable-theora,--disable-theora,libtheora"
>     -PACKAGECONFIG[visual]       =
>     "--enable-libvisual,--disable-libvisual,libvisual"
>     -PACKAGECONFIG[vorbis]       =
>     "--enable-vorbis,--disable-vorbis,libvorbis"
>     -PACKAGECONFIG[x11]          =
>     "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>     -
>     -EXTRA_OECONF += " \
>     -    --enable-zlib \
>     -"
>     -
>     -CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no
>     ac_cv_header_xmmintrin_h=no"
>     -
>     -FILES_${MLPREFIX}libgsttag-1.0 +=
>     "${datadir}/gst-plugins-base/1.0/license-translations.dict"
>     -
>     -do_compile_prepend() {
>     -        export
>     GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs"
>     -}
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>     index 094bdac846..128c7f8cb6 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
>     @@ -1,16 +1,18 @@
>     -From f1d9652351e7754c63003104eceb526af424c7e0 Mon Sep 17 00:00:00 2001
>     +From 4d6ea58f96b9744af8d899ddca22c2695ac74b5b Mon Sep 17 00:00:00 2001
>      From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     -Date: Fri, 20 Nov 2015 16:53:04 +0200
>     -Subject: [PATCH 1/4] Makefile.am: don't hardcode libtool name when
>     running
>     +Date: Thu, 5 Apr 2018 10:15:08 +0800
>     +Subject: [PATCH] Makefile.am: don't hardcode libtool name when running
>       introspection tools
> 
>      Upstream-Status: Pending [review on oe-core maillist]
>      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>
>     +
>      ---
>       gst-libs/gst/allocators/Makefile.am | 2 +-
>       gst-libs/gst/app/Makefile.am        | 2 +-
>       gst-libs/gst/audio/Makefile.am      | 2 +-
>     - gst-libs/gst/fft/Makefile.am        | 2 +-
>     + gst-libs/gst/gl/Makefile.am         | 2 +-
>       gst-libs/gst/pbutils/Makefile.am    | 2 +-
>       gst-libs/gst/riff/Makefile.am       | 2 +-
>       gst-libs/gst/rtp/Makefile.am        | 2 +-
>     @@ -21,10 +23,10 @@ Signed-off-by: Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
>       11 files changed, 11 insertions(+), 11 deletions(-)
> 
>      diff --git a/gst-libs/gst/allocators/Makefile.am
>     b/gst-libs/gst/allocators/Makefile.am
>     -index 9361bf9..bc7f53a 100644
>     +index 1957d28..1ecc950 100644
>      --- a/gst-libs/gst/allocators/Makefile.am
>      +++ b/gst-libs/gst/allocators/Makefile.am
>     -@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstallocators-@
>     +@@ -42,7 +42,7 @@ GstAllocators-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstallocators-@
>                    
>     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>                     --library=libgstallocators-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>     @@ -34,10 +36,10 @@ index 9361bf9..bc7f53a 100644
>                     --pkg-export gstreamer-allocators-@GST_API_VERSION@ \
>                     --output $@ \
>      diff --git a/gst-libs/gst/app/Makefile.am
>     b/gst-libs/gst/app/Makefile.am
>     -index 6d6de8d..dcc2fe0 100644
>     +index 52f6ad3..5bfd606 100644
>      --- a/gst-libs/gst/app/Makefile.am
>      +++ b/gst-libs/gst/app/Makefile.am
>     -@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
>     +@@ -56,7 +56,7 @@ GstApp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
>                     --library=libgstapp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     @@ -47,10 +49,10 @@ index 6d6de8d..dcc2fe0 100644
>                     --pkg gstreamer-base-@GST_API_VERSION@ \
>                     --pkg-export gstreamer-app-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/audio/Makefile.am
>     b/gst-libs/gst/audio/Makefile.am
>     -index 275d222..2374196 100644
>     +index 2922245..7fb65f2 100644
>      --- a/gst-libs/gst/audio/Makefile.am
>      +++ b/gst-libs/gst/audio/Makefile.am
>     -@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
>     +@@ -184,7 +184,7 @@ GstAudio-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>                     --include=GstTag-@GST_API_VERSION@ \
>     @@ -59,24 +61,24 @@ index 275d222..2374196 100644
>                     --pkg gstreamer-@GST_API_VERSION@ \
>                     --pkg gstreamer-base-@GST_API_VERSION@ \
>                     --pkg-export gstreamer-audio-@GST_API_VERSION@ \
>     -diff --git a/gst-libs/gst/fft/Makefile.am
>     b/gst-libs/gst/fft/Makefile.am
>     -index 09b3d68..f545354 100644
>     ---- a/gst-libs/gst/fft/Makefile.am
>     -+++ b/gst-libs/gst/fft/Makefile.am
>     -@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
>     -             
>      --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>     -               --library=libgstfft-@GST_API_VERSION@.la \
>     +diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
>     +index a3bbc94..16f829f 100644
>     +--- a/gst-libs/gst/gl/Makefile.am
>     ++++ b/gst-libs/gst/gl/Makefile.am
>     +@@ -192,7 +192,7 @@ GstGL-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
>                     --include=Gst-@GST_API_VERSION@ \
>     +               --include=GstBase-@GST_API_VERSION@ \
>     +               --include=GstVideo-@GST_API_VERSION@ \
>      -              --libtool="$(top_builddir)/libtool" \
>      +              --libtool="$(LIBTOOL)" \
>                     --pkg gstreamer-@GST_API_VERSION@ \
>     -               --pkg-export gstreamer-fft-@GST_API_VERSION@ \
>     -               --output $@ \
>     +               --pkg gstreamer-base-@GST_API_VERSION@ \
>     +               --pkg gstreamer-video-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/pbutils/Makefile.am
>     b/gst-libs/gst/pbutils/Makefile.am
>     -index 64d5eb0..91dc214 100644
>     +index ae51993..35a6e44 100644
>      --- a/gst-libs/gst/pbutils/Makefile.am
>      +++ b/gst-libs/gst/pbutils/Makefile.am
>     -@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
>     +@@ -103,7 +103,7 @@ GstPbutils-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
>                     --include=GstTag-@GST_API_VERSION@ \
>                     --include=GstVideo-@GST_API_VERSION@ \
>                     --include=GstAudio-@GST_API_VERSION@ \
>     @@ -86,10 +88,10 @@ index 64d5eb0..91dc214 100644
>                     --pkg gstreamer-tag-@GST_API_VERSION@ \
>                     --pkg gstreamer-video-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/riff/Makefile.am
>     b/gst-libs/gst/riff/Makefile.am
>     -index 83d83cb..3bd8fc0 100644
>     +index fb53f06..e66ef4f 100644
>      --- a/gst-libs/gst/riff/Makefile.am
>      +++ b/gst-libs/gst/riff/Makefile.am
>     -@@ -47,7 +47,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>     +@@ -49,7 +49,7 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>       #             --include=GstAudio-@GST_API_VERSION@ \
>       #             --include=GstTag-@GST_API_VERSION@ \
>       #             --include=Gst-@GST_API_VERSION@ \
>     @@ -99,10 +101,10 @@ index 83d83cb..3bd8fc0 100644
>       #             --pkg gstreamer-tag-@GST_API_VERSION@ \
>       #             --pkg gstreamer-audio-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/rtp/Makefile.am
>     b/gst-libs/gst/rtp/Makefile.am
>     -index fdd01c1..f5445c1 100644
>     +index a6f971d..77ebeeb 100644
>      --- a/gst-libs/gst/rtp/Makefile.am
>      +++ b/gst-libs/gst/rtp/Makefile.am
>     -@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
>     +@@ -69,7 +69,7 @@ GstRtp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
>                     --library=libgstrtp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     @@ -112,10 +114,10 @@ index fdd01c1..f5445c1 100644
>                     --pkg gstreamer-base-@GST_API_VERSION@ \
>                     --pkg-export gstreamer-rtp-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/rtsp/Makefile.am
>     b/gst-libs/gst/rtsp/Makefile.am
>     -index ede5706..9b0b258 100644
>     +index ceb07f4..db9d0fd 100644
>      --- a/gst-libs/gst/rtsp/Makefile.am
>      +++ b/gst-libs/gst/rtsp/Makefile.am
>     -@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>     +@@ -76,7 +76,7 @@ GstRtsp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                     --include=Gio-2.0 \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstSdp-@GST_API_VERSION@ \
>     @@ -125,10 +127,10 @@ index ede5706..9b0b258 100644
>                     --pkg gstreamer-@GST_API_VERSION@ \
>                     --pkg gstreamer-sdp-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/sdp/Makefile.am
>     b/gst-libs/gst/sdp/Makefile.am
>     -index a90f30b..0e149b8 100644
>     +index e197e9b..6e05cc7 100644
>      --- a/gst-libs/gst/sdp/Makefile.am
>      +++ b/gst-libs/gst/sdp/Makefile.am
>     -@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
>     +@@ -34,7 +34,7 @@ GstSdp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
>                    
>     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>                     --library=libgstsdp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>     @@ -138,10 +140,10 @@ index a90f30b..0e149b8 100644
>                     --pkg-export gstreamer-sdp-@GST_API_VERSION@ \
>                     --output $@ \
>      diff --git a/gst-libs/gst/tag/Makefile.am
>     b/gst-libs/gst/tag/Makefile.am
>     -index c534a4d..cafafd3 100644
>     +index 0247c33..c86515b 100644
>      --- a/gst-libs/gst/tag/Makefile.am
>      +++ b/gst-libs/gst/tag/Makefile.am
>     -@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
>     +@@ -66,7 +66,7 @@ GstTag-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
>                     --library=libgsttag-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     @@ -151,10 +153,10 @@ index c534a4d..cafafd3 100644
>                     --pkg gstreamer-base-@GST_API_VERSION@ \
>                     --pkg-export gstreamer-tag-@GST_API_VERSION@ \
>      diff --git a/gst-libs/gst/video/Makefile.am
>     b/gst-libs/gst/video/Makefile.am
>     -index 5d31fa1..ac64eb3 100644
>     +index 9fc1ccf..0f8455f 100644
>      --- a/gst-libs/gst/video/Makefile.am
>      +++ b/gst-libs/gst/video/Makefile.am
>     -@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
>     +@@ -124,7 +124,7 @@ GstVideo-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
>                     --library=libgstvideo-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     @@ -163,6 +165,3 @@ index 5d31fa1..ac64eb3 100644
>                     --pkg gstreamer-@GST_API_VERSION@ \
>                     --pkg gstreamer-base-@GST_API_VERSION@ \
>                     --pkg-export gstreamer-video-@GST_API_VERSION@ \
>     ---
>     -2.6.2
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
>     new file mode 100644
>     index 0000000000..251dc172cb
>     --- /dev/null
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
>     @@ -0,0 +1,29 @@
>     +From 61a672e79c8cb1aeeeda4c968997c577ac73a8f3 Mon Sep 17 00:00:00 2001
>     +From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +Date: Fri, 12 May 2017 16:47:12 +0300
>     +Subject: [PATCH] gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>:
>     don't append GL_CFLAGS to CFLAGS
>     +
>     +Dependencies' include directories should not be added in this way;
>     +it causes problems when cross-compiling in sysroot environments.
>     +
>     +Upstream-Status: Pending
>     +
>     +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +Signed-off-by: Maxin B. John <maxin.john@intel.com
>     <mailto:maxin.john@intel.com>>
>     +---
>     + pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in> | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/pkgconfig/gstreamer-gl.pc.in
>     <http://gstreamer-gl.pc.in> b/pkgconfig/gstreamer-gl.pc.in
>     <http://gstreamer-gl.pc.in>
>     +index dc672a9..8c290ba 100644
>     +--- a/pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>
>     ++++ b/pkgconfig/gstreamer-gl.pc.in <http://gstreamer-gl.pc.in>
>     +@@ -13,4 +13,4 @@ Version: @VERSION@
>     + Requires: gstreamer-video-@GST_API_VERSION@
>     gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
>     +
>     + Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
>     +-Cflags: -I${includedir}
>     -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
>     ++Cflags: -I${includedir}
>     -I${libdir}/gstreamer-@GST_API_VERSION@/include
>     +--
>     +2.7.4
>     +
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>     index 6616e2cf0d..dc15d93eb0 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>     @@ -1,16 +1,17 @@
>     -From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00 2001
>     +From f523721e453febfb3f62f3ba1e9fefb31dcec471 Mon Sep 17 00:00:00 2001
>      From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     -Date: Mon, 26 Oct 2015 16:38:18 +0200
>     -Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
>     +Date: Thu, 5 Apr 2018 10:26:25 +0800
>     +Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
>       PKG_CONFIG_SYSROOT_DIR
> 
>      Upstream-Status: Pending [review on oe-core maillist]
>      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>
>     +
>      ---
>       gst-libs/gst/allocators/Makefile.am |  4 ++--
>       gst-libs/gst/app/Makefile.am        |  4 ++--
>       gst-libs/gst/audio/Makefile.am      | 12 ++++++------
>     - gst-libs/gst/fft/Makefile.am        |  4 ++--
>       gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
>       gst-libs/gst/riff/Makefile.am       |  8 ++++----
>       gst-libs/gst/rtp/Makefile.am        |  8 ++++----
>     @@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
>       gst-libs/gst/sdp/Makefile.am        |  4 ++--
>       gst-libs/gst/tag/Makefile.am        |  8 ++++----
>       gst-libs/gst/video/Makefile.am      |  8 ++++----
>     - 11 files changed, 38 insertions(+), 38 deletions(-)
>     + 10 files changed, 36 insertions(+), 36 deletions(-)
> 
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/allocators/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
>     -@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(I
>     +diff --git a/gst-libs/gst/allocators/Makefile.am
>     b/gst-libs/gst/allocators/Makefile.am
>     +index 1ecc950..d6417ac 100644
>     +--- a/gst-libs/gst/allocators/Makefile.am
>     ++++ b/gst-libs/gst/allocators/Makefile.am
>     +@@ -39,7 +39,7 @@ GstAllocators-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstallocators-@
>                     --c-include "gst/allocators/allocators.h" \
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>     @@ -33,7 +34,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
>                     --library=libgstallocators-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --libtool="$(LIBTOOL)" \
>     -@@ -60,7 +60,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -63,7 +63,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     @@ -42,11 +43,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/app/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
>     -@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPE
>     +diff --git a/gst-libs/gst/app/Makefile.am
>     b/gst-libs/gst/app/Makefile.am
>     +index 5bfd606..6441674 100644
>     +--- a/gst-libs/gst/app/Makefile.am
>     ++++ b/gst-libs/gst/app/Makefile.am
>     +@@ -51,8 +51,8 @@ GstApp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
>                     --c-include "gst/app/app.h" \
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>     @@ -57,11 +58,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
>                     --library=libgstapp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/audio/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
>     -@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROS
>     +diff --git a/gst-libs/gst/audio/Makefile.am
>     b/gst-libs/gst/audio/Makefile.am
>     +index 7fb65f2..5379f79 100644
>     +--- a/gst-libs/gst/audio/Makefile.am
>     ++++ b/gst-libs/gst/audio/Makefile.am
>     +@@ -174,12 +174,12 @@ GstAudio-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>                     --c-include "gst/audio/audio.h" \
>     @@ -78,7 +79,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
>                     --library-path="$(top_builddir)/gst-libs/gst/tag/" \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     -@@ -201,8 +201,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -208,8 +208,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>                     --includedir="$(top_builddir)/gst-libs/gst/tag/" \
>     @@ -89,33 +90,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/fft/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
>     -@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE
>     -               --c-include "gst/fft/fft.h" \
>     -               -I$(top_srcdir)/gst-libs \
>     -               -I$(top_builddir)/gst-libs \
>     --             
>     --add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>     -+             
>     --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>     -               --library=libgstfft-@GST_API_VERSION@.la \
>     -               --include=Gst-@GST_API_VERSION@ \
>     -               --libtool="$(LIBTOOL)" \
>     -@@ -87,7 +87,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     -               $(INTROSPECTION_COMPILER) \
>     -               --includedir=$(srcdir) \
>     -               --includedir=$(builddir) \
>     --             
>     --includedir=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG)
>     --variable=girdir gstreamer-@GST_API_VERSION@` \
>     -+             
>     --includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>     -               $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>     -
>     - CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/pbutils/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
>     -@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTR
>     +diff --git a/gst-libs/gst/pbutils/Makefile.am
>     b/gst-libs/gst/pbutils/Makefile.am
>     +index 35a6e44..49d6894 100644
>     +--- a/gst-libs/gst/pbutils/Makefile.am
>     ++++ b/gst-libs/gst/pbutils/Makefile.am
>     +@@ -88,14 +88,14 @@ GstPbutils-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
>                     --c-include "gst/pbutils/pbutils.h" \
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>     @@ -134,7 +113,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
>                     --library-path="$(top_builddir)/gst-libs/gst/tag/" \
>                     --library-path="$(top_builddir)/gst-libs/gst/video/" \
>                     --library-path="$(top_builddir)/gst-libs/gst/audio/" \
>     -@@ -125,8 +125,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -128,8 +128,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     @@ -145,11 +124,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
>                     --includedir="$(top_builddir)/gst-libs/gst/tag/" \
>                     --includedir="$(top_builddir)/gst-libs/gst/video/" \
>                     --includedir="$(top_builddir)/gst-libs/gst/audio/" \
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/riff/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
>     -@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
>     +diff --git a/gst-libs/gst/riff/Makefile.am
>     b/gst-libs/gst/riff/Makefile.am
>     +index e66ef4f..c8c588a 100644
>     +--- a/gst-libs/gst/riff/Makefile.am
>     ++++ b/gst-libs/gst/riff/Makefile.am
>     +@@ -43,8 +43,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>       #             --c-include "gst/riff/riff.h" \
>       #             --add-include-path=$(builddir)/../tag \
>       #             --add-include-path=$(builddir)/../audio \
>     @@ -160,7 +139,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
>       #             --library=libgstriff-@GST_API_VERSION@.la \
>       #             --include=GstAudio-@GST_API_VERSION@ \
>       #             --include=GstTag-@GST_API_VERSION@ \
>     -@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
>     +@@ -75,8 +75,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>       #             --includedir=$(builddir) \
>       #             --includedir=$(builddir)/../tag \
>       #             --includedir=$(builddir)/../audio \
>     @@ -171,11 +150,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
>       #             $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
>       #
>       #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtp/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
>     -@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPE
>     +diff --git a/gst-libs/gst/rtp/Makefile.am
>     b/gst-libs/gst/rtp/Makefile.am
>     +index 77ebeeb..9aee788 100644
>     +--- a/gst-libs/gst/rtp/Makefile.am
>     ++++ b/gst-libs/gst/rtp/Makefile.am
>     +@@ -64,8 +64,8 @@ GstRtp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
>                     --c-include "gst/rtp/rtp.h" \
>                     -I$(top_builddir)/gst-libs \
>                     -I$(top_srcdir)/gst-libs \
>     @@ -186,7 +165,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
>                     --library=libgstrtp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     -@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -92,8 +92,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     @@ -197,11 +176,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtsp/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
>     -@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSP
>     +diff --git a/gst-libs/gst/rtsp/Makefile.am
>     b/gst-libs/gst/rtsp/Makefile.am
>     +index db9d0fd..79027cb 100644
>     +--- a/gst-libs/gst/rtsp/Makefile.am
>     ++++ b/gst-libs/gst/rtsp/Makefile.am
>     +@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                     -I$(top_builddir)/gst-libs \
>                     -I$(top_srcdir)/gst-libs \
>                     --add-include-path=$(builddir)/../sdp \
>     @@ -210,7 +189,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
>                     --library=libgstrtsp-@GST_API_VERSION@.la \
>                     --include=Gio-2.0 \
>                     --include=Gst-@GST_API_VERSION@ \
>     -@@ -98,7 +98,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -101,7 +101,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>                     --includedir=$(builddir)/../sdp \
>     @@ -219,11 +198,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/sdp/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
>     -@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPE
>     +diff --git a/gst-libs/gst/sdp/Makefile.am
>     b/gst-libs/gst/sdp/Makefile.am
>     +index 6e05cc7..c7cf514 100644
>     +--- a/gst-libs/gst/sdp/Makefile.am
>     ++++ b/gst-libs/gst/sdp/Makefile.am
>     +@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
>                     --warn-all \
>                     --c-include "gst/sdp/sdp.h" \
>                     -I$(top_srcdir)/gst-libs \
>     @@ -232,7 +211,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
>                     --library=libgstsdp-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --libtool="$(LIBTOOL)" \
>     -@@ -54,7 +54,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -55,7 +55,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     @@ -241,11 +220,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/tag/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
>     -@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPE
>     +diff --git a/gst-libs/gst/tag/Makefile.am
>     b/gst-libs/gst/tag/Makefile.am
>     +index c86515b..363e6d2 100644
>     +--- a/gst-libs/gst/tag/Makefile.am
>     ++++ b/gst-libs/gst/tag/Makefile.am
>     +@@ -61,8 +61,8 @@ GstTag-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
>                     --c-include "gst/tag/tag.h" \
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>     @@ -256,7 +235,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
>                     --library=libgsttag-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     -@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     @@ -267,11 +246,11 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
>                     $(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
> 
>       CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
>     -Index: gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
>     -===================================================================
>     ---- gst-plugins-base-1.12.3.orig/gst-libs/gst/video/Makefile.am
>     -+++ gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
>     -@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROS
>     +diff --git a/gst-libs/gst/video/Makefile.am
>     b/gst-libs/gst/video/Makefile.am
>     +index 0f8455f..8c9955c 100644
>     +--- a/gst-libs/gst/video/Makefile.am
>     ++++ b/gst-libs/gst/video/Makefile.am
>     +@@ -119,8 +119,8 @@ GstVideo-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
>                     --c-include "gst/video/video.h" \
>                     -I$(top_srcdir)/gst-libs \
>                     -I$(top_builddir)/gst-libs \
>     @@ -282,7 +261,7 @@ Index:
>     gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
>                     --library=libgstvideo-@GST_API_VERSION@.la \
>                     --include=Gst-@GST_API_VERSION@ \
>                     --include=GstBase-@GST_API_VERSION@ \
>     -@@ -144,8 +144,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
>     +@@ -147,8 +147,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
>                     $(INTROSPECTION_COMPILER) \
>                     --includedir=$(srcdir) \
>                     --includedir=$(builddir) \
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
>     index 9b66f7f49d..98ffdb1c10 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
>     @@ -1,20 +1,21 @@
>     -From 3c2c2d5dd08aa30ed0e8acd8566ec99412bb8209 Mon Sep 17 00:00:00 2001
>     +From b9765efb1696e3e2e79f2955f759be199fe34882 Mon Sep 17 00:00:00 2001
>      From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      Date: Mon, 26 Oct 2015 17:29:37 +0200
>     -Subject: [PATCH 3/4] riff: add missing include directories when calling
>     +Subject: [PATCH] riff: add missing include directories when calling
>       introspection scanner
> 
>      Upstream-Status: Pending [review on oe-core maillist]
>      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +
>      ---
>       gst-libs/gst/riff/Makefile.am | 2 ++
>       1 file changed, 2 insertions(+)
> 
>      diff --git a/gst-libs/gst/riff/Makefile.am
>     b/gst-libs/gst/riff/Makefile.am
>     -index 0a115cc..5057a58 100644
>     +index c8c588a..c096453 100644
>      --- a/gst-libs/gst/riff/Makefile.am
>      +++ b/gst-libs/gst/riff/Makefile.am
>     -@@ -39,6 +39,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>     +@@ -41,6 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS =
>     $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
>       #             --strip-prefix=Gst \
>       #             --warn-all \
>       #             --c-include "gst/riff/riff.h" \
>     @@ -23,6 +24,3 @@ index 0a115cc..5057a58 100644
>       #             --add-include-path=$(builddir)/../tag \
>       #             --add-include-path=$(builddir)/../audio \
>       #           
>      --add-include-path=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)"
>     $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
>     ---
>     -2.6.2
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
>     index 9fbebd5700..9e95524057 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
>     @@ -1,7 +1,7 @@
>     -From be6163cfa3a255493f9d75bad9541cbfe1723fee Mon Sep 17 00:00:00 2001
>     +From 918c96b24d10f61b7455b4cef3bab490849d0d77 Mon Sep 17 00:00:00 2001
>      From: Mingke Wang <mingke.wang@freescale.com
>     <mailto:mingke.wang@freescale.com>>
>      Date: Thu, 19 Mar 2015 14:17:10 +0800
>     -Subject: [PATCH 3/4] ssaparse: enhance SSA text lines parsing.
>     +Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
> 
>      some parser will pass in the original ssa text line which starts
>     with "Dialog:"
>      and there's are maybe multiple Dialog lines in one input buffer.
>     @@ -10,13 +10,18 @@ Upstream-Status: Submitted
>     [https://bugzilla.gnome.org/show_bug.cgi?id=747496
>     <https://bugzilla.gnome.org/show_bug.cgi?id=747496>]
> 
>      Signed-off-by: Mingke Wang <mingke.wang@freescale.com
>     <mailto:mingke.wang@freescale.com>>
> 
>     +---
>     + gst/subparse/gstssaparse.c | 150
>     ++++++++++++++++++++++++++++++++++++++++-----
>     + 1 file changed, 134 insertions(+), 16 deletions(-)
>     + mode change 100644 => 100755 gst/subparse/gstssaparse.c
>     +
>      diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
>      old mode 100644
>      new mode 100755
>     -index 06ecef9..0ab5dce
>     +index c849c08..4b9636c
>      --- a/gst/subparse/gstssaparse.c
>      +++ b/gst/subparse/gstssaparse.c
>     -@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_codes
>     (GstSsaParse * parse, gchar * txt)
>     +@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes
>     (GstSsaParse * parse, gchar * txt)
>        * gst_ssa_parse_push_line:
>        * @parse: caller element
>        * @txt: text to push
>     @@ -24,7 +29,7 @@ index 06ecef9..0ab5dce
>        * @start: timestamp for the buffer
>        * @duration: duration for the buffer
>        *
>     -@@ -269,27 +270,133 @@ gst_ssa_parse_remove_override_codes
>     (GstSsaParse * parse, gchar * txt)
>     +@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_codes
>     (GstSsaParse * parse, gchar * txt)
>        * Returns: result of the push of the created buffer
>        */
>       static GstFlowReturn
>     @@ -169,7 +174,7 @@ index 06ecef9..0ab5dce
>         GST_LOG_OBJECT (parse, "Text : %s", t);
> 
>         if (gst_ssa_parse_remove_override_codes (parse, t)) {
>     -@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse,
>     gchar * txt,
>     +@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse,
>     gchar * txt,
>         gst_buffer_fill (buf, 0, escaped, len + 1);
>         gst_buffer_set_size (buf, len);
>         g_free (escaped);
>     @@ -196,7 +201,7 @@ index 06ecef9..0ab5dce
> 
>         ret = gst_pad_push (parse->srcpad, buf);
> 
>     -@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * sinkpad,
>     GstObject * parent, GstBuffer * buf)
>     +@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad,
>     GstObject * parent, GstBuffer * buf)
>         GstClockTime ts;
>         gchar *txt;
>         GstMapInfo map;
>     @@ -204,7 +209,7 @@ index 06ecef9..0ab5dce
> 
>         if (G_UNLIKELY (!parse->framed))
>           goto not_framed;
>     -@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad * sinkpad,
>     GstObject * parent, GstBuffer * buf)
>     +@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad,
>     GstObject * parent, GstBuffer * buf)
>         /* make double-sure it's 0-terminated and all */
>         gst_buffer_map (buf, &map, GST_MAP_READ);
>         txt = g_strndup ((gchar *) map.data, map.size);
>     @@ -220,6 +225,3 @@ index 06ecef9..0ab5dce
> 
>         if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
>           GstSegment segment;
>     ---
>     -1.7.9.5
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
>     index 4adf605460..aaeb611fec 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
>     @@ -1,20 +1,21 @@
>     -From 4330915d88dc4dd46eb4c28d756482b767c2747f Mon Sep 17 00:00:00 2001
>     +From 53b5868491cf99ee797192395dbfeb69df23edd2 Mon Sep 17 00:00:00 2001
>      From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      Date: Mon, 26 Oct 2015 17:30:14 +0200
>     -Subject: [PATCH 4/4] rtsp: drop incorrect reference to gstreamer-sdp in
>     +Subject: [PATCH] rtsp: drop incorrect reference to gstreamer-sdp in
>       Makefile.am
> 
>      Upstream-Status: Pending [review on oe-core maillist]
>      Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +
>      ---
>       gst-libs/gst/rtsp/Makefile.am | 1 -
>       1 file changed, 1 deletion(-)
> 
>      diff --git a/gst-libs/gst/rtsp/Makefile.am
>     b/gst-libs/gst/rtsp/Makefile.am
>     -index 4f6d9f8..0afa370 100644
>     +index 79027cb..2987e23 100644
>      --- a/gst-libs/gst/rtsp/Makefile.am
>      +++ b/gst-libs/gst/rtsp/Makefile.am
>     -@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>     +@@ -79,7 +79,6 @@ GstRtsp-@GST_API_VERSION@.gir:
>     $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
>                     --libtool="$(LIBTOOL)" \
>                     --pkg gio-2.0 \
>                     --pkg gstreamer-@GST_API_VERSION@ \
>     @@ -22,6 +23,3 @@ index 4f6d9f8..0afa370 100644
>                     --pkg-export gstreamer-rtsp-@GST_API_VERSION@ \
>                     --add-init-section="$(INTROSPECTION_INIT)" \
>                     --output $@ \
>     ---
>     -2.6.2
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
>     deleted file mode 100644
>     index b924e38824..0000000000
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
>     +++ /dev/null
>     @@ -1,69 +0,0 @@
>     -From ed09c8fd2c9c2b5384b72cc70af3728be6694e64 Mon Sep 17 00:00:00 2001
>     -From: Mingke Wang <mingke.wang@freescale.com
>     <mailto:mingke.wang@freescale.com>>
>     -Date: Thu, 19 Mar 2015 14:20:26 +0800
>     -Subject: [PATCH 4/4] subparse: set need_segment after sink pad received
>     - GST_EVENT_SEGMENT
>     -
>     -subparse works in push mode, chain funciton will be called once
>     -up stream element finished the seeking and flushing.
>     -if set need_segment flag in src pad event handler, the segment
>     -event will be pushed earlier, result in the subtitle text will
>     -be send out to down stream from the beginning.
>     -
>     -Upstream-Status: Submitted
>     [https://bugzilla.gnome.org/show_bug.cgi?id=747498
>     <https://bugzilla.gnome.org/show_bug.cgi?id=747498>]
>     -
>     -Signed-off-by: Mingke Wang <mingke.wang@freescale.com
>     <mailto:mingke.wang@freescale.com>>
>     -
>     -diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
>     -old mode 100644
>     -new mode 100755
>     -index b565e93..7741ccc
>     ---- a/gst/subparse/gstsubparse.c
>     -+++ b/gst/subparse/gstsubparse.c
>     -@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad,
>     GstObject * parent, GstEvent * event)
>     -         goto beach;
>     -       }
>     -
>     -+      /* Apply the seek to our segment */
>     -+      gst_segment_do_seek (&self->segment, rate, format, flags,
>     -+          start_type, start, stop_type, stop, &update);
>     -+
>     -+      GST_DEBUG_OBJECT (self, "segment after seek: %"
>     GST_SEGMENT_FORMAT,
>     -+          &self->segment);
>     -+
>     -       /* Convert that seek to a seeking in bytes at position 0,
>     -          FIXME: could use an index */
>     -       ret = gst_pad_push_event (self->sinkpad,
>     -           gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
>     -               GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, 0));
>     -
>     --      if (ret) {
>     --        /* Apply the seek to our segment */
>     --        gst_segment_do_seek (&self->segment, rate, format, flags,
>     --            start_type, start, stop_type, stop, &update);
>     --
>     --        GST_DEBUG_OBJECT (self, "segment after seek: %"
>     GST_SEGMENT_FORMAT,
>     --            &self->segment);
>     --
>     --        self->need_segment = TRUE;
>     --      } else {
>     -+      if (!ret) {
>     -         GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
>     -       }
>     -
>     -@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad,
>     GstObject * parent, GstEvent * event)
>     -       gst_event_parse_segment (event, &s);
>     -       if (s->format == GST_FORMAT_TIME)
>     -         gst_event_copy_segment (event, &self->segment);
>     --      GST_DEBUG_OBJECT (self, "newsegment (%s)",
>     --          gst_format_get_name (self->segment.format));
>     -+      GST_DEBUG_OBJECT (self, "newsegment (%s) %" GST_SEGMENT_FORMAT,
>     -+          gst_format_get_name (self->segment.format), &self->segment);
>     -+
>     -+      self->need_segment = TRUE;
>     -
>     -       /* if not time format, we'll either start with a 0 timestamp
>     anyway or
>     -        * it's following a seek in which case we'll have saved the
>     requested
>     ---
>     -1.7.9.5
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
>     new file mode 100644
>     index 0000000000..c81fb0f6aa
>     --- /dev/null
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-glimagesink-Downrank-to-marginal.patch
>     @@ -0,0 +1,32 @@
>     +From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
>     +From: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +Date: Thu, 24 Sep 2015 19:47:32 +0300
>     +Subject: [PATCH] glimagesink: Downrank to marginal
>     +
>     +On desktop, where there is good OpenGL, xvimagesink will come up first,
>     +on other platforms, OpenGL can't be trusted because it's either
>     software (like
>     +in a VM) or broken (like on embedded)., so let ximagesink come above.
>     +
>     +Upstream-Status: Submitted
>     [https://bugzilla.gnome.org/show_bug.cgi?id=751684
>     <https://bugzilla.gnome.org/show_bug.cgi?id=751684>]
>     +
>     +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     +---
>     + ext/gl/gstopengl.c | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
>     +index a4b2540..0ccaacd 100644
>     +--- a/ext/gl/gstopengl.c
>     ++++ b/ext/gl/gstopengl.c
>     +@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
>     + #endif
>     +
>     +   if (!gst_element_register (plugin, "glimagesink",
>     +-          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
>     ++          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
>     +     return FALSE;
>     +   }
>     +
>     +--
>     +2.1.4
>     +
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
>     index c8e6287a55..a4727e23ea 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
>     @@ -1,4 +1,4 @@
>     -From af0dac26f62aaceb4bf266720911953793e0fc5d Mon Sep 17 00:00:00 2001
>     +From 41de2ec64ab06bb58c82c1659adaa3811bc5bcf8 Mon Sep 17 00:00:00 2001
>      From: zhouming <b42586@freescale.com <mailto:b42586@freescale.com>>
>      Date: Wed, 14 May 2014 10:16:20 +0800
>      Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
>     @@ -8,18 +8,19 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
>     <https://bugzilla.gnome.org/show_bug.cgi?id=728312>
>      Upstream-Status: Pending
> 
>      Signed-off-by: zhouming <b42586@freescale.com
>     <mailto:b42586@freescale.com>>
>     +
>      ---
>     - gst-libs/gst/tag/gsttagdemux.c |   13 +++++++++++++
>     + gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
>       1 file changed, 13 insertions(+)
>       mode change 100644 => 100755 gst-libs/gst/tag/gsttagdemux.c
> 
>      diff --git a/gst-libs/gst/tag/gsttagdemux.c
>     b/gst-libs/gst/tag/gsttagdemux.c
>      old mode 100644
>      new mode 100755
>     -index 9b6c478..ae2294a
>     +index 8a127c8..71c5d78
>      --- a/gst-libs/gst/tag/gsttagdemux.c
>      +++ b/gst-libs/gst/tag/gsttagdemux.c
>     -@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (GstPad * pad,
>     GstObject * parent, GstQuery * query)
>     +@@ -1759,6 +1759,19 @@ gst_tag_demux_pad_query (GstPad * pad,
>     GstObject * parent, GstQuery * query)
>             }
>             break;
>           }
>     @@ -39,6 +40,3 @@ index 9b6c478..ae2294a
>           default:
>             res = gst_pad_query_default (pad, parent, query);
>             break;
>     ---
>     -1.7.9.5
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
>     new file mode 100644
>     index 0000000000..d5a7f6bdc2
>     --- /dev/null
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/link-with-libvchostif.patch
>     @@ -0,0 +1,45 @@
>     +From 9866f51e5e0913f1e453eb574618bf7432f38cb6 Mon Sep 17 00:00:00 2001
>     +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     +Date: Wed, 11 Apr 2018 10:46:33 +0800
>     +Subject: [PATCH] Add -lvchostif to link when using -lEGL on rpi
>     +
>     +This is required because libEGL from userland uses sybols
>     +from this library.
>     +
>     +lib/libEGL.so.1.0.0                                               
>                                                                        
>                                                                        
>                                           121: 00000000     0 FUNC   
>     GLOBAL DEFAULT  UND vc_dispmanx_element_add
>     +  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND
>     vc_dispmanx_element_add
>     +
>     +These symbols are provided by libvchostif as seen below
>     +
>     +lib/libvchostif.so
>     +   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9
>     vc_dispmanx_element_add
>     +   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9
>     vc_dispmanx_element_add
>     +
>     +With this explicit link, plugins fail during runtime
>     +
>     +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load
>     plugin '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating
>     /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
>     +(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load
>     plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating
>     /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
>     +
>     +Upstream-Status: Pending
>     +Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>
>     +---
>     + m4/gst-gl.m4 | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
>     +index 1e97240..ab7774c 100644
>     +--- a/m4/gst-gl.m4
>     ++++ b/m4/gst-gl.m4
>     +@@ -231,7 +231,7 @@ case $host in
>     +                             HAVE_EGL=yes
>     +                             HAVE_GLES2=yes
>     +                             HAVE_EGL_RPI=yes
>     +-                            EGL_LIBS="-lbcm_host -lvcos -lvchiq_arm"
>     ++                            EGL_LIBS="-lbcm_host -lvchostif -lvcos
>     -lvchiq_arm"
>     +                             EGL_CFLAGS=""
>     +                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi
>     platform])
>     +                           ])
>     +--
>     +2.7.4
>     +
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
>     index 413eff0695..23950b67f2 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
>     @@ -1,4 +1,4 @@
>     -From 10d2a977ee1d469f0bf9059bb2d0b55fd2eecbac Mon Sep 17 00:00:00 2001
>     +From 7ffa6e3d00e1d8a060f3f4c2bb9a72691af05d79 Mon Sep 17 00:00:00 2001
>      From: Andre McCurdy <armccurdy@gmail.com <mailto:armccurdy@gmail.com>>
>      Date: Wed, 20 Jan 2016 13:00:00 -0800
>      Subject: [PATCH] make gio_unix_2_0 dependency configurable
>     @@ -17,16 +17,17 @@ instead of AG_GST_CHECK_FEATURE.
>      Upstream-Status: Pending
> 
>      Signed-off-by: Andre McCurdy <armccurdy@gmail.com
>     <mailto:armccurdy@gmail.com>>
>     +
>      ---
>       configure.ac <http://configure.ac> | 7 +++++++
>       1 file changed, 7 insertions(+)
> 
>      diff --git a/configure.ac <http://configure.ac> b/configure.ac
>     <http://configure.ac>
>     -index 9c52aeb..26cacd6 100644
>     +index 12807bc..35a0bf3 100644
>      --- a/configure.ac <http://configure.ac>
>      +++ b/configure.ac <http://configure.ac>
>     -@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)
>     - fi dnl of EXT plugins
>     +@@ -806,9 +806,16 @@ AM_CONDITIONAL(HAVE_PNG, test "x$HAVE_PNG" =
>     "xyes")
>     + AM_CONDITIONAL(HAVE_JPEG, test "x$HAVE_JPEG" = "xyes")
> 
>       dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
>      +AC_ARG_ENABLE([gio_unix_2_0],
>     @@ -42,6 +43,3 @@ index 9c52aeb..26cacd6 100644
>       AM_CONDITIONAL(USE_GIO_UNIX_2_0, test "x$HAVE_GIO_UNIX_2_0" = "xyes")
> 
>       dnl *** finalize CFLAGS, LDFLAGS, LIBS
>     ---
>     -1.9.1
>     -
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
>     <http://gstreamer1.0-plugins-base_1.12.4.bb>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
>     <http://gstreamer1.0-plugins-base_1.12.4.bb>
>     deleted file mode 100644
>     index dd895bbcb1..0000000000
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.4.bb
>     <http://gstreamer1.0-plugins-base_1.12.4.bb>
>     +++ /dev/null
>     @@ -1,18 +0,0 @@
>     -require gstreamer1.0-plugins-base.inc
>     -
>     -LIC_FILES_CHKSUM =
>     "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>     -                   
>     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
>     -                    file://common/coverage/coverage-report.pl
>     <http://coverage-report.pl>;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
>     -
>     -SRC_URI = " \
>     -   
>     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz
>     <http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz>
>     \
>     -    file://get-caps-from-src-pad-when-query-caps.patch \
>     -    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
>     -   
>     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
>     -    file://make-gio_unix_2_0-dependency-configurable.patch \
>     -   
>     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>     -"
>     -SRC_URI[md5sum] = "b35b04071f69b8ab69a7f3a497ff0131"
>     -SRC_URI[sha256sum] =
>     "4c306b03df0212f1b8903784e29bb3493319ba19ebebf13b0c56a17870292282"
>     -
>     -S = "${WORKDIR}/gst-plugins-base-${PV}"
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
>     <http://gstreamer1.0-plugins-base_1.14.0.bb>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
>     <http://gstreamer1.0-plugins-base_1.14.0.bb>
>     new file mode 100644
>     index 0000000000..370cd0368c
>     --- /dev/null
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.0.bb
>     <http://gstreamer1.0-plugins-base_1.14.0.bb>
>     @@ -0,0 +1,70 @@
>     +require gstreamer1.0-plugins.inc
>     +
>     +LICENSE = "GPLv2+ & LGPLv2+"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
>     +                   
>     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
>     +                    file://common/coverage/coverage-report.pl
>     <http://coverage-report.pl>;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
>     +
>     +SRC_URI = " \
>     +           
>     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz
>     <http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz>
>     \
>     +            file://get-caps-from-src-pad-when-query-caps.patch \
>     +            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
>     +            file://make-gio_unix_2_0-dependency-configurable.patch \
>     +           
>     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>     +           
>     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
>     +           
>     file://0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch \
>     +           
>     file://0003-riff-add-missing-include-directories-when-calling-in.patch \
>     +           
>     file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
>     +            file://0009-glimagesink-Downrank-to-marginal.patch \
>     +           
>     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
>     +            file://link-with-libvchostif.patch \
>     +            "
>     +SRC_URI[md5sum] = "370271327dd23110421a9c2927ac989a"
>     +SRC_URI[sha256sum] =
>     "7e904660ff56e02b036cf7fdfb77a50a540828ca9d2614d69ba931772e5b6940"
>     +
>     +S = "${WORKDIR}/gst-plugins-base-${PV}"
>     +
>     +DEPENDS += "iso-codes util-linux"
>     +
>     +inherit gettext
>     +
>     +PACKAGES_DYNAMIC =+ "^libgst.*"
>     +
>     +PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES',
>     'opengl', 'gles2 egl', '', d)}"
>     +PACKAGECONFIG ??= " \
>     +    ${GSTREAMER_ORC} \
>     +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
>     +    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
>     +    ${PACKAGECONFIG_GL} \
>     +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland
>     egl', '', d)} \
>     +"
>     +
>     +X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
>     +X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
>     +X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
>     +
>     +PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
>     +PACKAGECONFIG[cdparanoia]   =
>     "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
>     +PACKAGECONFIG[gio-unix-2.0] =
>     "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
>     +PACKAGECONFIG[ivorbis]      =
>     "--enable-ivorbis,--disable-ivorbis,tremor"
>     +PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
>     +PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
>     +PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
>     +PACKAGECONFIG[theora]       =
>     "--enable-theora,--disable-theora,libtheora"
>     +PACKAGECONFIG[visual]       =
>     "--enable-libvisual,--disable-libvisual,libvisual"
>     +PACKAGECONFIG[vorbis]       =
>     "--enable-vorbis,--disable-vorbis,libvorbis"
>     +PACKAGECONFIG[x11]          =
>     "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>     +PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
>     +PACKAGECONFIG[opengl]       =
>     "--enable-opengl,--disable-opengl,virtual/libgl libglu"
>     +PACKAGECONFIG[gles2]        =
>     "--enable-gles2,--disable-gles2,virtual/libgles2"
>     +PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
>     +PACKAGECONFIG[wayland]      =
>     "--enable-wayland,--disable-wayland,wayland-native wayland
>     wayland-protocols libdrm"
>     +PACKAGECONFIG[jpeg]         = ",,jpeg"
>     +
>     +FILES_${MLPREFIX}libgsttag-1.0 +=
>     "${datadir}/gst-plugins-base/1.0/license-translations.dict"
>     +
>     +do_compile_prepend() {
>     +        export
>     GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs"
>     +}
>     +
>     +FILES_${PN}-dev +=
>     "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
>     -- 
>     2.14.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 


