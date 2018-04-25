Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A34571B69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3P7qEc5031039
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 00:52:14 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 25 Apr 2018 00:52:13 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 15:23:19 +0800
Message-ID: <2931b5c5c155c41854915e850647c150382cef44.1524640773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524640773.git.kai.kang@windriver.com>
References: <cover.1524640773.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/8] gstreamer1.0-plugins-bad: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 07:52:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0-plugins-bad from 1.12.4 to 1.14.0.

* GStreamer OpenGL integration library is moved to -base, so move
  packageconfigs 'opengl', 'egl' and 'gles2' to -base
* move packageconfig 'wayland' to -base
* move configure option '--disable-cocoa' to -base
* move packageconfig 'gtk' to -good
* move configure option '--disable-qt' to -goood
* drop packageconfig 'schroedinger' that the plugin has been removed

Drop patches of vulkan which are merged by upstream. Refresh patch
0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch and
remove patches which are moved to -base from bb file.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 21 -------
 ...-don-t-hardcode-libtool-name-when-running.patch | 34 +-----------
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch | 29 ----------
 ...y-Use-ifdef-for-platform-specific-defines.patch | 37 -------------
 ...n-Use-the-generated-version-of-vkconfig.h.patch | 64 ----------------------
 .../0009-glimagesink-Downrank-to-marginal.patch    | 32 -----------
 .../link-with-libvchostif.patch                    | 35 ------------
 ....12.4.bb => gstreamer1.0-plugins-bad_1.14.0.bb} |  9 +--
 8 files changed, 5 insertions(+), 256 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.4.bb => gstreamer1.0-plugins-bad_1.14.0.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index ca2ea9e963..b693b16b03 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -10,18 +10,10 @@ SRC_URI_append = " \
     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
 
-# opengl packageconfig factored out to make it easy for distros
-# and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
-
-# gtk is not in the PACKAGECONFIG variable by default until
-# the transition to gtk+3 is finished
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
     bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile uvch264 webp \
 "
 
@@ -33,13 +25,10 @@ PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
 PACKAGECONFIG[dc1394]          = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
-PACKAGECONFIG[egl]             = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
-PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=nettle,--disable-hls,nettle"
 PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
@@ -48,7 +37,6 @@ PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
 PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
 PACKAGECONFIG[openal]          = "--enable-openal,--disable-openal,openal-soft"
 PACKAGECONFIG[opencv]          = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[opengl]          = "--enable-opengl,--disable-opengl,virtual/libgl libglu"
 PACKAGECONFIG[openjpeg]        = "--enable-openjpeg,--disable-openjpeg,openjpeg"
 # the opus encoder/decoder elements are now in the -base package,
 # but the opus parser remains in -bad
@@ -57,7 +45,6 @@ PACKAGECONFIG[resindvd]        = "--enable-resindvd,--disable-resindvd,libdvdrea
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 PACKAGECONFIG[sbc]             = "--enable-sbc,--disable-sbc,sbc"
-PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
@@ -65,7 +52,6 @@ PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 lib
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
-PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
 # these plugins have no corresponding library in OE-core or meta-openembedded:
@@ -74,11 +60,6 @@ PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 #   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles soundtouch spandsp
 #   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp
 
-# qt5 support is disabled, because it is not present in OE core, and requires more work than
-# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
-# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
-# in a gstreamer1.0-plugins-bad bbappend).
-
 EXTRA_OECONF += " \
     --enable-decklink \
     --enable-dvb \
@@ -92,7 +73,6 @@ EXTRA_OECONF += " \
     --disable-avc \
     --disable-bs2b \
     --disable-chromaprint \
-    --disable-cocoa \
     --disable-daala \
     --disable-direct3d \
     --disable-directsound \
@@ -115,7 +95,6 @@ EXTRA_OECONF += " \
     --disable-openh264 \
     --disable-openni2 \
     --disable-opensles \
-    --disable-qt \
     --disable-soundtouch \
     --disable-spandsp \
     --disable-spc \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 8d99dc6ccc..2f9a97e0cc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -11,38 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- gst-libs/gst/allocators/Makefile.am | 2 +-
- gst-libs/gst/gl/Makefile.am         | 2 +-
- gst-libs/gst/insertbin/Makefile.am  | 2 +-
- gst-libs/gst/mpegts/Makefile.am     | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ gst-libs/gst/insertbin/Makefile.am | 2 +-
+ gst-libs/gst/mpegts/Makefile.am    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
-index e50d077..623f092 100644
---- a/gst-libs/gst/allocators/Makefile.am
-+++ b/gst-libs/gst/allocators/Makefile.am
-@@ -37,7 +37,7 @@ GstBadAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstbadalloca
- 		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
- 		--library=libgstbadallocators-@GST_API_VERSION@.la \
- 		--include=Gst-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg-export gstreamer-badallocators-@GST_API_VERSION@ \
- 		--output $@ \
-diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index 2ae4773..dfa7a7d 100644
---- a/gst-libs/gst/gl/Makefile.am
-+++ b/gst-libs/gst/gl/Makefile.am
-@@ -178,7 +178,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		--include=Gst-@GST_API_VERSION@ \
- 		--include=GstBase-@GST_API_VERSION@ \
- 		--include=GstVideo-@GST_API_VERSION@ \
--		--libtool="$(top_builddir)/libtool" \
-+		--libtool="$(LIBTOOL)" \
- 		--pkg gstreamer-@GST_API_VERSION@ \
- 		--pkg gstreamer-base-@GST_API_VERSION@ \
- 		--pkg gstreamer-video-@GST_API_VERSION@ \
 diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
 index 1f8ea30..4b98ef6 100644
 --- a/gst-libs/gst/insertbin/Makefile.am
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
deleted file mode 100644
index 2235a57afa..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5622ca3b61603dc316a0f1fbede3f9aa353a5e48 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 12 May 2017 16:47:12 +0300
-Subject: [PATCH] gstreamer-gl.pc.in: don't append GL_CFLAGS to CFLAGS
-
-Dependencies' include directories should not be added in this way;
-it causes problems when cross-compiling in sysroot environments.
-
-Upstream-Status: Pending
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- pkgconfig/gstreamer-gl.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
-index 8e7a303..d167be1 100644
---- a/pkgconfig/gstreamer-gl.pc.in
-+++ b/pkgconfig/gstreamer-gl.pc.in
-@@ -13,4 +13,4 @@ Version: @VERSION@
- Requires: gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
- 
- Libs: -L${libdir} -lgstgl-@GST_API_VERSION@
--Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
-+Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
deleted file mode 100644
index caaa62d48a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1523ab462c1bf19055960ced255f4872b6cf9f5c Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 5 Jul 2017 11:00:42 +0300
-Subject: [PATCH 1/2] vkdisplay: Use ifdef for platform specific defines
-
-VK_KHR_*_SURFACE_EXTENSION_NAME are only available when corresponding
-WSI is enabled.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=784539]
----
- ext/vulkan/vkdisplay.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ext/vulkan/vkdisplay.c b/ext/vulkan/vkdisplay.c
-index 550134cd8..ade5d4583 100644
---- a/ext/vulkan/vkdisplay.c
-+++ b/ext/vulkan/vkdisplay.c
-@@ -448,11 +448,15 @@ gst_vulkan_display_type_to_extension_string (GstVulkanDisplayType type)
-   if (type == GST_VULKAN_DISPLAY_TYPE_NONE)
-     return NULL;
- 
-+#if GST_VULKAN_HAVE_WINDOW_XCB
-   if (type & GST_VULKAN_DISPLAY_TYPE_XCB)
-     return VK_KHR_XCB_SURFACE_EXTENSION_NAME;
-+#endif
- 
-+#if GST_VULKAN_HAVE_WINDOW_WAYLAND
-   if (type & GST_VULKAN_DISPLAY_TYPE_WAYLAND)
-     return VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME;
-+#endif
- 
-   return NULL;
- }
--- 
-2.13.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
deleted file mode 100644
index 0df145dd25..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c23e1dc22deb495561cffb877edb2746b740a1fa Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 5 Jul 2017 11:07:05 +0300
-Subject: [PATCH 2/2] vulkan: Use the generated version of vkconfig.h
-
-Build fails in ext/vulkan/xcb and ext/vulkan/wayland when:
-* building from tarball
-* building out-of-tree
-* Only one WSI integration (xcb or wayland) is enabled by configure.ac
-This is because vkconfig.h from source directory gets used instead
-of the generated one.
-
-Add the correct build directory to "-I". Use angle bracket
-include in vkapi.h so that it actually looks in the include search
-path instead of defaulting to the same (source tree) directory.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=784539]
----
- ext/vulkan/vkapi.h             | 2 +-
- ext/vulkan/wayland/Makefile.am | 1 +
- ext/vulkan/xcb/Makefile.am     | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/ext/vulkan/vkapi.h b/ext/vulkan/vkapi.h
-index e9c23aa92..a37c29d0f 100644
---- a/ext/vulkan/vkapi.h
-+++ b/ext/vulkan/vkapi.h
-@@ -23,7 +23,7 @@
- 
- #define VK_PROTOTYPES
- 
--#include "vkconfig.h"
-+#include <vkconfig.h>
- #include "vk_fwd.h"
- #include "vkmacros.h"
- 
-diff --git a/ext/vulkan/wayland/Makefile.am b/ext/vulkan/wayland/Makefile.am
-index f92d85e2c..10cfb70e6 100644
---- a/ext/vulkan/wayland/Makefile.am
-+++ b/ext/vulkan/wayland/Makefile.am
-@@ -14,6 +14,7 @@ noinst_HEADERS = \
- 
- libgstvulkan_wayland_la_CFLAGS = \
- 	-I$(top_srcdir)/gst-libs \
-+	-I$(top_builddir)/ext/vulkan \
- 	-I$(top_srcdir)/ext/vulkan \
- 	-I$(top_builddir)/gst-libs \
- 	$(GST_PLUGINS_BASE_CFLAGS) \
-diff --git a/ext/vulkan/xcb/Makefile.am b/ext/vulkan/xcb/Makefile.am
-index 7debcff9e..b5103551b 100644
---- a/ext/vulkan/xcb/Makefile.am
-+++ b/ext/vulkan/xcb/Makefile.am
-@@ -14,6 +14,7 @@ noinst_HEADERS = \
- 
- libgstvulkan_xcb_la_CFLAGS = \
- 	-I$(top_srcdir)/gst-libs \
-+	-I$(top_builddir)/ext/vulkan \
- 	-I$(top_srcdir)/ext/vulkan \
- 	-I$(top_builddir)/gst-libs \
- 	$(GST_PLUGINS_BASE_CFLAGS) \
--- 
-2.13.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
deleted file mode 100644
index c81fb0f6aa..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0009-glimagesink-Downrank-to-marginal.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c6b37a80806f9128de47f1ccc3f2354f8d436bb6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 24 Sep 2015 19:47:32 +0300
-Subject: [PATCH] glimagesink: Downrank to marginal
-
-On desktop, where there is good OpenGL, xvimagesink will come up first,
-on other platforms, OpenGL can't be trusted because it's either software (like
-in a VM) or broken (like on embedded)., so let ximagesink come above.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/gl/gstopengl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index a4b2540..0ccaacd 100644
---- a/ext/gl/gstopengl.c
-+++ b/ext/gl/gstopengl.c
-@@ -118,7 +118,7 @@ plugin_init (GstPlugin * plugin)
- #endif
- 
-   if (!gst_element_register (plugin, "glimagesink",
--          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
-+          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
-     return FALSE;
-   }
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
deleted file mode 100644
index c382b17586..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/link-with-libvchostif.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Add -lvchostif to link when using -lEGL on rpi
-
-This is required because libEGL from userland uses sybols
-from this library.
-
-lib/libEGL.so.1.0.0                                                                                                                                                                                                                              121: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
-  1552: 00000000     0 FUNC    GLOBAL DEFAULT  UND vc_dispmanx_element_add
-
-These symbols are provided by libvchostif as seen below
-
-lib/libvchostif.so
-   252: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
-   809: 0000b161   192 FUNC    GLOBAL DEFAULT    9 vc_dispmanx_element_add
-
-With this explicit link, plugins fail during runtime
-
-(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstomx.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
-(gst-plugin-scanner:571): GStreamer-WARNING **: Failed to load plugin '/usr/lib/gstreamer-1.0/libgstopengl.so': Error relocating /usr/lib/libgstgl-1.0.so.0: vc_dispmanx_element_add: symbol not found
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: gst-plugins-bad-1.10.4/configure.ac
-===================================================================
---- gst-plugins-bad-1.10.4.orig/configure.ac
-+++ gst-plugins-bad-1.10.4/configure.ac
-@@ -785,7 +785,7 @@ case $host in
-                             HAVE_EGL=yes
-                             HAVE_GLES2=yes
-                             HAVE_EGL_RPI=yes
--                            EGL_LIBS="-lbcm_host -lvcos -lvchiq_arm"
-+                            EGL_LIBS="-lbcm_host -lvchostif -lvcos -lvchiq_arm"
-                             EGL_CFLAGS=""
-                             AC_DEFINE(USE_EGL_RPI, [1], [Use RPi platform])
-                           ])
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb
index 82c7ffcb1d..9c4b19d45f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.0.bb
@@ -9,15 +9,10 @@ SRC_URI = " \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-    file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://link-with-libvchostif.patch \
-    file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
-    file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
 "
-SRC_URI[md5sum] = "64bf16cf15edaab1c0e02c8dee7170d0"
-SRC_URI[sha256sum] = "0c7857be16686d5c1ba6e34bd338664d3d4599d32714a8eca5c8a41a101e2d08"
+SRC_URI[md5sum] = "555bbe7232fb4653c31b78e1f79068cf"
+SRC_URI[sha256sum] = "ed5e2badb6f2858f60017b93334d91fe58a0e3f85ed2f37f2e931416fafb4f9f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.14.1


