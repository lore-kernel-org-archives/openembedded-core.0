Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 348DC77025
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 19:06:52 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 917DD38F7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 21:06:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 21:06:30 +0200
Message-Id: <1461870393-3545-5-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH v2 5/8] gstreamer1.0-plugins-bad: upgrade to version 1.8.1
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
X-List-Received-Date: Thu, 28 Apr 2016 19:06:55 -0000

0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch is a
backport, and is no longer needed.

configure-allow-to-disable-libssh2.patch got replaced by a patch that does
the same thing but has been submitted.

Vulkan is disabled for now since libxcb alone is not enough - the Vulkan
headers and libraries are needed as well.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 24 ++++---
 ...-don-t-hardcode-libtool-name-when-running.patch |  4 +-
 .../0001-glimagesink-Downrank-to-marginal.patch    |  2 +-
 ...window-fix-memory-leak-of-navigation-thre.patch | 35 ----------
 .../configure-allow-to-disable-libssh2.patch       | 78 ++++++++++++----------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 28 --------
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb    | 21 ++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 20 ------
 8 files changed, 82 insertions(+), 130 deletions(-)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 9e2b94e..0663d22 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -38,7 +38,9 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,nettle"
+# ensure OpenSSL is used for HLS AES description instead of nettle
+# (OpenSSL is a shared dependency with dtls)
+PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
@@ -46,7 +48,9 @@ PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
 PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
-PACKAGECONFIG[opus]            = "--enable-opus,--disable-opus,libopus"
+# the opus encoder/decoder elements are now in the -base package,
+# but the opus parser remains in -bad
+PACKAGECONFIG[opusparse]       = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdread libdvdnav"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
@@ -62,15 +66,15 @@ PACKAGECONFIG[wayland]         = "--enable-wayland --enable-egl,--disable-waylan
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have not been ported to 1.0 (yet):
-#   apexsink dc1394 lv2 linsys musepack nas timidity teletextdec sdl xvid wininet
-#   acm gsettings sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
-#   patchdetect real sdi videomeasure gsettings
+#   apexsink dc1394 lv2 linsys musepack nas timidity sdl xvid wininet
+#   sndio cdxaparse dccp faceoverlay hdvparse tta mve nuvdemux
+#   patchdetect sdi videomeasure
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
-#   openni2 winks direct3d directsound winscreencap
+#   openni2 winks direct3d directsound winscreencap acm
 #   apple_media android_media avc bs2b chromaprint daala dts gme gsm kate ladspa
-#   libde265 mimic mpeg2enc mplex ofa openh264 opensles pvr soundtouch spandsp
-#   spc vdpau wasapi x265 zbar
+#   libde265 mimic mpeg2enc mplex nvenc ofa openh264 opensles pvr soundtouch spandsp
+#   spc teletextdec tinyalsa vdpau vulkan wasapi x265 zbar
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -81,6 +85,7 @@ EXTRA_OECONF += " \
     --enable-decklink \
     --enable-dvb \
     --enable-fbdev \
+    --enable-netsim \
     --enable-shm \
     --enable-vcd \
     --disable-acm \
@@ -109,6 +114,7 @@ EXTRA_OECONF += " \
     --disable-mplex \
     --disable-musepack \
     --disable-nas \
+    --disable-nvenc \
     --disable-ofa \
     --disable-openexr \
     --disable-openh264 \
@@ -125,7 +131,9 @@ EXTRA_OECONF += " \
     --disable-spc \
     --disable-teletextdec \
     --disable-timidity \
+    --disable-tinyalsa \
     --disable-vdpau \
+    --disable-vulkan \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-wininet \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 154d340..33efc50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -17,7 +17,7 @@ diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
 index f968357..7cc2c7a 100644
 --- a/gst-libs/gst/gl/Makefile.am
 +++ b/gst-libs/gst/gl/Makefile.am
-@@ -149,7 +149,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
+@@ -167,7 +167,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
  		--library=libgstgl-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -30,7 +30,7 @@ diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefil
 index 09eb97c..b746885 100644
 --- a/gst-libs/gst/insertbin/Makefile.am
 +++ b/gst-libs/gst/insertbin/Makefile.am
-@@ -43,7 +43,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
+@@ -44,7 +44,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
  		--library=libgstinsertbin-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
index 1085e95..c81fb0f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-glimagesink-Downrank-to-marginal.patch
@@ -18,7 +18,7 @@ diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
 index a4b2540..0ccaacd 100644
 --- a/ext/gl/gstopengl.c
 +++ b/ext/gl/gstopengl.c
-@@ -101,7 +101,7 @@ plugin_init (GstPlugin * plugin)
+@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
  #endif
  
    if (!gst_element_register (plugin, "glimagesink",
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
deleted file mode 100755
index 3491a15..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 95cda7fbcf1a81289d9315c801c8e2b3d896f4cb Mon Sep 17 00:00:00 2001
-From: Haihua Hu <b55597@freescale.com>
-Date: Mon, 30 Nov 2015 09:36:09 +0800
-Subject: [PATCH 2/5] [glplugin] glwindow: fix memory leak of navigation
- thread
-
-When exit navigation thread, call g_thread_join() to release
-the resource hold by it.
-
-Upstream-Status: Backport [1.7.1]
-
-bugzilla URL: https://bugzilla.gnome.org/show_bug.cgi?id=758820
-
-Signed-off-by: Haihua Hu <b55597@freescale.com>
----
- gst-libs/gst/gl/gstglwindow.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/gst-libs/gst/gl/gstglwindow.c b/gst-libs/gst/gl/gstglwindow.c
-index 44b74ca..42ef296 100644
---- a/gst-libs/gst/gl/gstglwindow.c
-+++ b/gst-libs/gst/gl/gstglwindow.c
-@@ -343,6 +343,9 @@ gst_gl_window_finalize (GObject * object)
-     while (window->nav_alive) {
-       g_cond_wait (&window->nav_destroy_cond, &window->nav_lock);
-     }
-+    /* release resource hold by navigation thread */
-+    g_thread_join(window->priv->navigation_thread);
-+    window->priv->navigation_thread = NULL;
-     g_mutex_unlock (&window->nav_lock);
-   }
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
index d52afd5..05b35aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
@@ -1,33 +1,32 @@
-From f59c5269f92d59a5296cbfeeb682d42095cd88ad Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Thu, 18 Sep 2014 02:24:07 -0400
-Subject: [PATCH] gstreamer1.0-plugins-bad: allow to disable libssh2
+From 4f0ce1f34c99685ab9f5cdeb621280e6c05f42a8 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Fri, 2 Oct 2015 17:31:33 +0200
+Subject: [PATCH] configure: Make libssh2 usage optional and independent of
+ Curl checks
 
-libssh2 is automatically linked to if present, this undetermined
-dependency may cause build errors like:
+Curl can optionally use libssh2, but there's a realistic chance that other
+plugins might need/support this library in the future as well
+(since SSH support is fairly widespread), so make it its own separate
+check.
 
-  .../x86_64-poky-linux/4.9.0/ld: cannot find -lssh2
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=755989]
 
-libssh2 isn't an oe-core recipe, so allow to disable it from
-configure.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
 ---
- configure.ac |   23 +++++++++++++++++------
- 1 file changed, 17 insertions(+), 6 deletions(-)
+ configure.ac | 31 ++++++++++++++++++++++---------
+ 1 file changed, 22 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0e95c5c..12153b4 100644
+index 28a01e7..79b0e12 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1901,6 +1901,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chromaprint], chromaprint, [
- ])
+@@ -575,6 +575,28 @@ else
+   AG_GST_DISABLE_PLUGIN(dccp)
+ fi
  
- dnl *** Curl ***
++dnl *** libssh2 ***
 +AC_ARG_ENABLE([libssh2],
-+     [  --enable-libssh2		enable LIBSSH2 support @<:@default=auto@:>@],
++     [  --enable-libssh2        enable libssh2 support @<:@default=auto@:>@],
 +     [case "${enableval}" in
 +       yes)  NEED_SSH2=yes ;;
 +       no)   NEED_SSH2=no ;;
@@ -35,10 +34,22 @@ index 0e95c5c..12153b4 100644
 +       *) AC_MSG_ERROR([bad value ${enableval} for --enable-libssh2]) ;;
 +     esac],[NEED_SSH2=auto])
 +
- translit(dnm, m, l) AM_CONDITIONAL(USE_CURL, true)
- AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
-   PKG_CHECK_MODULES(CURL, libcurl >= 7.21.0, [
-@@ -1915,12 +1924,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
++if test "x$NEED_SSH2" != "xno"; then
++  PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
++    HAVE_SSH2="yes"
++    AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
++  ], [
++    HAVE_SSH2="no"
++  ])
++fi
++AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
++AC_SUBST(SSH2_CFLAGS)
++AC_SUBST(SSH2_LIBS)
++
+ dnl *** opengl ***
+ AC_ARG_ENABLE([opengl],
+      [  --enable-opengl         Enable Desktop OpenGL support @<:@default=auto@:>@],
+@@ -2068,15 +2090,6 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
    ])
    AC_SUBST(CURL_CFLAGS)
    AC_SUBST(CURL_LIBS)
@@ -48,17 +59,12 @@ index 0e95c5c..12153b4 100644
 -  ], [
 -    HAVE_SSH2="no"
 -  ])
-+  if test "x$NEED_SSH2" != "xno"; then
-+    PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
-+      HAVE_SSH2="yes"
-+      AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
-+    ], [
-+      HAVE_SSH2="no"
-+    ])
-+  fi
-   AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
-   AC_SUBST(SSH2_CFLAGS)
-   AC_SUBST(SSH2_LIBS)
+-  AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
+-  AC_SUBST(SSH2_CFLAGS)
+-  AC_SUBST(SSH2_LIBS)
+ ],,,[AM_CONDITIONAL(USE_SSH2, false)])
+ 
+ dnl **** DASH ****
 -- 
-1.7.9.5
+1.9.1
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
deleted file mode 100644
index 8eb47c2..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-include gstreamer1.0-plugins-bad.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
-                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
-                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
-                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
-
-# Note: The mpg123 plugin was moved to gst-plugins-ugly prior to the 1.7.2
-# release, so this line should be removed during the update to 1.8.x
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
-PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
-
-# Note: The gsettings plug-in was dropped prior to the 1.7.2 release,
-# so this line should be removed during the update to 1.8.x
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=914291808ad10621d6a74031f3d46d45eef5a3a3
-EXTRA_OECONF += "--disable-gsettings"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://configure-allow-to-disable-libssh2.patch \
-    file://0001-glimagesink-Downrank-to-marginal.patch \
-    file://0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch \
-"
-
-SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
-SRC_URI[sha256sum] = "971b29101d6a9c5e3fe94d99d977a227f58f0b2d29b6ca2c7f292052542b3a61"
-
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
new file mode 100644
index 0000000..c433600
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.1.bb
@@ -0,0 +1,21 @@
+include gstreamer1.0-plugins-bad.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+    file://configure-allow-to-disable-libssh2.patch \
+    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
+    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
+    file://0001-glimagesink-Downrank-to-marginal.patch \
+"
+
+SRC_URI[md5sum] = "e508da2a8a5c3d12264fe3415be2f451"
+SRC_URI[sha256sum] = "0bbd58f363734fc0c4a620b2d6fb01d427fdafdbda7b90b4e15d03b751ca40f5"
+
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index ef6581b..1774984 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -27,26 +27,6 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
-# over-ride the default hls PACKAGECONFIG in gstreamer1.0-plugins-bad.inc to
-# pass an additional --with-hls-crypto=XXX option (new in 1.7.x) and switch HLS
-# AES decryption from nettle to openssl (ie a shared dependency with dtls).
-# This should move back to the common .inc once the main recipe updates to 1.8.x
-PACKAGECONFIG[hls] = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
-
-# The tinyalsa plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=c8bd74fa9a81398f57d976c478d2043f30188684
-PACKAGECONFIG[tinyalsa] = "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
-
-# The vulkan based video sink plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=5de6dd9f40629562acf90e35e1fa58464d66617d
-PACKAGECONFIG[vulkan] = "--enable-vulkan,--disable-vulkan,libxcb"
-
-# The dependency-less netsim plugin was added prior to the 1.7.2 release
-# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=e3f9e854f08e82bfab11182c5a2aa6f9a0c73cd5
-EXTRA_OECONF += " \
-    --enable-netsim \
-"
-
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
2.5.0


