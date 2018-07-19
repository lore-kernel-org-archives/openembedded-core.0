Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id AAD69607DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:16:51 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id DB798F08;
	Thu, 19 Jul 2018 13:16:51 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
Date: Thu, 19 Jul 2018 13:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719110720.GA1436@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 11:16:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

As a general rule, I think adding packageconfigs to an oe-core recipe 
that has dependencies outside of oe-core and meta-openembedded is 
questionable. Take the qt5 packageconfig for example. It is *not* part 
of gstreamer1.0-plugins-good in oe-core, and for good reason - it needs 
extra switches for passing paths to moc, uic etc.

Now, what if a recipe outside of oe-core and meta-openembedded is just 
like that? It needs its own customizations, its own switches. It would 
be better off setting up its own packageconfig, just like what that 
bbappend in meta-qt5 does.

I suppose with libvisual such a central packageconfig would work, but 
isn't the whole idea of oe-core to be lean? And yet, now we start adding 
more and more packageconfigs even though the recipes are in some other 
layers that are not part of the central ones (oe-core and 
meta-openembedded)?

You might as well add dozens of packageconfigs to 
gstreamer1.0-plugins-bad, just in case some obscure layer adds a recipe 
for OpenEXR or spandsp for example.


On 2018-07-19 13:07, Martin Jansa wrote:
> On Thu, Jul 19, 2018 at 12:07:09PM +0200, Carlos Rafael Giani wrote:
>> * Add patches for gbm, libpng, libjpeg to conditionally enable/disable
>>    them in the configure script
>> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>>    the visual packageconfig needs to go
> No, it doesn't need to go and shouldn't.
>
> Why are you trying to force people who already have libvisual recipe
> (maybe from one of these 2
> layers: http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libvisual )
> to create gstreamer1.0-plugins-base bbappend just to return the
> PACKAGECONFIG and remove the --disable-libvisual from EXTRA_OECONF?
> It doesn't make any sense. Extra PACKAGECONFIGs for stuff you might not
> use doesn't cause any extra overhead, yes they are less tested than the
> stuff which people usually have enabled/disabled, but still having the
> PACKAGECONFIG available makes it much easier for project layers to
> correctly configure recipes in upstream layers.
>
>> * Reorder the packageconfigs alphabetically
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>> ---
>>   ...r-explicitely-enabling-disabling-GBM.patch |  70 ++++++++++++
>>   ...for-explicitely-enabling-disabling-P.patch | 107 ++++++++++++++++++
>>   .../gstreamer1.0-plugins-base_1.14.1.bb       |  29 +++--
>>   3 files changed, 196 insertions(+), 10 deletions(-)
>>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
>>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
>> new file mode 100644
>> index 0000000000..79e0b78aaf
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
>> @@ -0,0 +1,70 @@
>> +From 7f93afc497010384da9f9d15163c31a862bd1dfa Mon Sep 17 00:00:00 2001
>> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
>> +Date: Thu, 19 Jul 2018 10:30:54 +0200
>> +Subject: [PATCH 10/11] gl: Add switch for explicitely enabling/disabling GBM
>> + support
>> +
>> +https://bugzilla.gnome.org/show_bug.cgi?id=796833
>> +---
>> + m4/gst-gl.m4 | 38 +++++++++++++++++++++++++++++---------
>> + 1 file changed, 29 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
>> +index 1e9724094..20b2233de 100644
>> +--- a/m4/gst-gl.m4
>> ++++ b/m4/gst-gl.m4
>> +@@ -117,6 +117,15 @@ AC_ARG_ENABLE([dispmanx],
>> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-dispmanx]) ;;
>> +      esac],[NEED_DISPMANX=auto])
>> +
>> ++AC_ARG_ENABLE([gbm],
>> ++     [  --enable-gbm        Enable Mesa3D GBM support (requires EGL) @<:@default=auto@:>@],
>> ++     [case "${enableval}" in
>> ++       yes)  NEED_GBM=yes ;;
>> ++       no)   NEED_GBM=no ;;
>> ++       auto) NEED_GBM=auto ;;
>> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
>> ++     esac],[NEED_GBM=auto])
>> ++
>> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
>> + save_CPPFLAGS="$CPPFLAGS"
>> + save_LIBS="$LIBS"
>> +@@ -172,15 +181,26 @@ case $host in
>> +         AC_CHECK_LIB([EGL], [fbGetDisplay], [HAVE_VIV_FB_EGL=yes])
>> +     fi
>> +
>> +-    if test "x$HAVE_EGL" = "xyes"; then
>> +-        PKG_CHECK_MODULES(DRM, libdrm >= 2.4.55, HAVE_DRM=yes, HAVE_DRM=no)
>> +-        AC_SUBST(DRM_CFLAGS)
>> +-        AC_SUBST(DRM_LIBS)
>> +-        if test "x$HAVE_DRM" = "xyes" -a "x$HAVE_GUDEV" = "xyes"; then
>> +-          PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=yes, HAVE_GBM_EGL=no)
>> +-          AC_SUBST(GBM_CFLAGS)
>> +-          AC_SUBST(GBM_LIBS)
>> +-       fi
>> ++    if test "x$HAVE_EGL" = "xyes" -a "x$NEED_GBM" != "xno"; then
>> ++      PKG_CHECK_MODULES(DRM, libdrm >= 2.4.55, HAVE_DRM=yes, HAVE_DRM=no)
>> ++      AC_SUBST(DRM_CFLAGS)
>> ++      AC_SUBST(DRM_LIBS)
>> ++      if test "x$NEED_GBM" = "xyes"; then
>> ++        if test "x$HAVE_DRM" = "xno"; then
>> ++          AC_MSG_ERROR([GBM support requested but libdrm is not available])
>> ++        fi
>> ++        if test "x$HAVE_GUDEV" = "xno"; then
>> ++          AC_MSG_ERROR([GBM support requested but gudev is not available])
>> ++        fi
>> ++      fi
>> ++      if test "x$HAVE_DRM" = "xyes" -a "x$HAVE_GUDEV" = "xyes"; then
>> ++        PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=yes, HAVE_GBM_EGL=no)
>> ++        if test "x$HAVE_GBM_EGL" = "xno" -a "x$NEED_GBM" = "xyes"; then
>> ++          AC_MSG_ERROR([GBM support requested but gbm library is not available])
>> ++        fi
>> ++        AC_SUBST(GBM_CFLAGS)
>> ++        AC_SUBST(GBM_LIBS)
>> ++      fi
>> +     fi
>> +
>> +     dnl FIXME: Mali EGL depends on GLESv1 or GLESv2
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
>> new file mode 100644
>> index 0000000000..3e22332dab
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
>> @@ -0,0 +1,107 @@
>> +From 092aadfc1df69c46d920b0cd39f98d363d6988b3 Mon Sep 17 00:00:00 2001
>> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
>> +Date: Thu, 19 Jul 2018 11:16:05 +0200
>> +Subject: [PATCH 11/11] gl: Add switches for explicitely enabling/disabling PNG
>> + and JPEG support
>> +
>> +https://bugzilla.gnome.org/show_bug.cgi?id=796833
>> +---
>> + m4/gst-gl.m4 | 66 ++++++++++++++++++++++++++++++++++++----------------
>> + 1 file changed, 46 insertions(+), 20 deletions(-)
>> +
>> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
>> +index 20b2233de..f8809981c 100644
>> +--- a/m4/gst-gl.m4
>> ++++ b/m4/gst-gl.m4
>> +@@ -126,6 +126,24 @@ AC_ARG_ENABLE([gbm],
>> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
>> +      esac],[NEED_GBM=auto])
>> +
>> ++AC_ARG_ENABLE([png],
>> ++     [  --enable-png        Enable libpng support @<:@default=auto@:>@],
>> ++     [case "${enableval}" in
>> ++       yes)  NEED_PNG=yes ;;
>> ++       no)   NEED_PNG=no ;;
>> ++       auto) NEED_PNG=auto ;;
>> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-png]) ;;
>> ++     esac],[NEED_PNG=auto])
>> ++
>> ++AC_ARG_ENABLE([jpeg],
>> ++     [  --enable-jpeg        Enable libjpeg support @<:@default=auto@:>@],
>> ++     [case "${enableval}" in
>> ++       yes)  NEED_JPEG=yes ;;
>> ++       no)   NEED_JPEG=no ;;
>> ++       auto) NEED_JPEG=auto ;;
>> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-jpeg]) ;;
>> ++     esac],[NEED_JPEG=auto])
>> ++
>> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
>> + save_CPPFLAGS="$CPPFLAGS"
>> + save_LIBS="$LIBS"
>> +@@ -1043,9 +1061,13 @@ dnl Needed by plugins that use g_module_*() API
>> + PKG_CHECK_MODULES(GMODULE_NO_EXPORT, gmodule-no-export-2.0)
>> +
>> + dnl libpng is optional
>> +-PKG_CHECK_MODULES(LIBPNG, libpng >= 1.0, HAVE_PNG=yes, HAVE_PNG=no)
>> +-if test "x$HAVE_PNG" = "xyes"; then
>> +-  AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
>> ++if test "x$NEED_PNG" != "xno"; then
>> ++  PKG_CHECK_MODULES(LIBPNG, libpng >= 1.0, HAVE_PNG=yes, HAVE_PNG=no)
>> ++  if test "x$HAVE_PNG" = "xyes"; then
>> ++    AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
>> ++  elif test "x$NEED_PNG" = "xyes"; then
>> ++    AC_MSG_ERROR([libpng support requested but libpng is not available])
>> ++  fi
>> + fi
>> + AC_SUBST(HAVE_PNG)
>> + AC_SUBST(LIBPNG_LIBS)
>> +@@ -1053,25 +1075,29 @@ AC_SUBST(LIBPNG_CFLAGS)
>> +
>> + dnl libjpeg is optional
>> + AC_ARG_WITH(jpeg-mmx, [  --with-jpeg-mmx, path to MMX'ified JPEG library])
>> +-OLD_LIBS="$LIBS"
>> +-if test x$with_jpeg_mmx != x; then
>> +-  LIBS="$LIBS -L$with_jpeg_mmx"
>> +-fi
>> +-AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
>> +-JPEG_LIBS="$LIBS -ljpeg-mmx"
>> +-LIBS="$OLD_LIBS"
>> +-if test x$HAVE_JPEG != xyes; then
>> +-  JPEG_LIBS="-ljpeg"
>> +-  AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
>> +-fi
>> ++if test "x$NEED_JPEG" != "xno"; then
>> ++  OLD_LIBS="$LIBS"
>> ++  if test x$with_jpeg_mmx != x; then
>> ++    LIBS="$LIBS -L$with_jpeg_mmx"
>> ++  fi
>> ++  AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
>> ++  JPEG_LIBS="$LIBS -ljpeg-mmx"
>> ++  LIBS="$OLD_LIBS"
>> ++  if test x$HAVE_JPEG != xyes; then
>> ++    JPEG_LIBS="-ljpeg"
>> ++    AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG="yes", HAVE_JPEG="no")
>> ++  fi
>> +
>> +-if test x$HAVE_JPEG = xyes; then
>> +-  AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
>> +-else
>> +-  JPEG_LIBS=
>> ++  if test x$HAVE_JPEG = xyes; then
>> ++    AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
>> ++  elif test "x$NEED_JPEG" = "xyes"; then
>> ++    AC_MSG_ERROR([libjpeg support requested but libjpeg is not available])
>> ++  else
>> ++    JPEG_LIBS=
>> ++  fi
>> ++  AC_SUBST(JPEG_LIBS)
>> ++  AC_SUBST(HAVE_JPEG)
>> + fi
>> +-AC_SUBST(JPEG_LIBS)
>> +-AC_SUBST(HAVE_JPEG)
>> + ])
>> +
>> + dnl --------------------------------------------------------------------------
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
>> index 8d7d3c6192..a848fa0e01 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.1.bb
>> @@ -17,6 +17,8 @@ SRC_URI = " \
>>               file://0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch \
>>               file://0009-glimagesink-Downrank-to-marginal.patch \
>>               file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
>> +            file://0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch \
>> +            file://0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch \
>>               file://link-with-libvchostif.patch \
>>               "
>>   SRC_URI[md5sum] = "c42154ab6f85c59f0e449d8d7e290342"
>> @@ -30,12 +32,15 @@ inherit gettext
>>   
>>   PACKAGES_DYNAMIC =+ "^libgst.*"
>>   
>> +# opengl packageconfig factored out to make it easy for distros
>> +# and BSP layers to pick either (desktop) opengl, gles2, or no GL
>>   PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
>> +
>>   PACKAGECONFIG ??= " \
>>       ${GSTREAMER_ORC} \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
>> -    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
>>       ${PACKAGECONFIG_GL} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
>> +    gio-unix-2.0 jpeg ogg pango png theora vorbis zlib \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
>>   "
>>   
>> @@ -45,26 +50,30 @@ X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
>>   
>>   PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
>>   PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
>> +PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
>> +PACKAGECONFIG[gbm]          = "--enable-gbm,--disable-gbm,virtual/libgbm libgudev libdrm"
>>   PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
>> +PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
>>   PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
>> +PACKAGECONFIG[jpeg]         = "--enable-jpeg,--disable-jpeg,jpeg"
>>   PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
>> +PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
>>   PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
>>   PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
>> +PACKAGECONFIG[png]          = "--enable-png,--disable-png,libpng"
>>   PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
>> -PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
>>   PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
>>   PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>> -PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
>> -PACKAGECONFIG[opengl]       = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
>> -PACKAGECONFIG[gles2]        = "--enable-gles2,--disable-gles2,virtual/libgles2"
>> -PACKAGECONFIG[egl]          = "--enable-egl,--disable-egl,virtual/egl"
>>   PACKAGECONFIG[wayland]      = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
>> -PACKAGECONFIG[jpeg]         = ",,jpeg"
>> +PACKAGECONFIG[zlib]         = "--enable-zlib,--disable-zlib,zlib"
>> +
>> +EXTRA_OECONF += " \
>> +    --disable-libvisual \
>> +"
>>   
>> +FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
>>   FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
>>   
>>   do_compile_prepend() {
>>           export GIR_EXTRA_LIBS_PATH="${B}/gst-libs/gst/tag/.libs:${B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst/rtp/.libs:${B}/gst-libs/gst/allocators/.libs"
>>   }
>> -
>> -FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
>> -- 
>> 2.17.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


