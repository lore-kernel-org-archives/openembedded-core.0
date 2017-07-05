Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 39C2D77809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="874973831"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2017 05:28:44 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C7E7E5801CF;
	Wed,  5 Jul 2017 05:28:43 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:36 +0300
Message-Id: <c481a3ded2a1df05896706ddc6e962e7ad997d29.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/6] gstreamer1.0-plugins-bad: Add vulkan PACKAGECONFIG
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:44 -0000

This adds a Vulkan video sink (using xcb and/or wayland).

Add a few patches to fix the build.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  4 +-
 ...y-Use-ifdef-for-platform-specific-defines.patch | 37 +++++++++++++
 ...n-Use-the-generated-version-of-vkconfig.h.patch | 64 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  2 +
 4 files changed, 105 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 0ccfc89..4f6bc85 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -66,6 +66,7 @@ PACKAGECONFIG[srtp]            = "--enable-srtp,--disable-srtp,libsrtp"
 PACKAGECONFIG[uvch264]         = "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
 PACKAGECONFIG[voaacenc]        = "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
+PACKAGECONFIG[vulkan]          = "--enable-vulkan,--disable-vulkan,vulkan"
 PACKAGECONFIG[wayland]         = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 
@@ -78,7 +79,7 @@ PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 #   openni2 winks direct3d directsound winscreencap acm apple_media
 #   android_media avc bs2b chromaprint daala dts fdkaac gme gsm kate ladspa libde265
 #   lv2 mimic mpeg2enc mplex musepack nvenc ofa openh264 opensles pvr soundtouch spandsp
-#   spc teletextdec tinyalsa vdpau vulkan wasapi x265 zbar
+#   spc teletextdec tinyalsa vdpau wasapi x265 zbar
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -136,7 +137,6 @@ EXTRA_OECONF += " \
     --disable-timidity \
     --disable-tinyalsa \
     --disable-vdpau \
-    --disable-vulkan \
     --disable-wasapi \
     --disable-wildmidi \
     --disable-wininet \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
new file mode 100644
index 0000000..caaa62d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch
@@ -0,0 +1,37 @@
+From 1523ab462c1bf19055960ced255f4872b6cf9f5c Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 5 Jul 2017 11:00:42 +0300
+Subject: [PATCH 1/2] vkdisplay: Use ifdef for platform specific defines
+
+VK_KHR_*_SURFACE_EXTENSION_NAME are only available when corresponding
+WSI is enabled.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=784539]
+---
+ ext/vulkan/vkdisplay.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ext/vulkan/vkdisplay.c b/ext/vulkan/vkdisplay.c
+index 550134cd8..ade5d4583 100644
+--- a/ext/vulkan/vkdisplay.c
++++ b/ext/vulkan/vkdisplay.c
+@@ -448,11 +448,15 @@ gst_vulkan_display_type_to_extension_string (GstVulkanDisplayType type)
+   if (type == GST_VULKAN_DISPLAY_TYPE_NONE)
+     return NULL;
+ 
++#if GST_VULKAN_HAVE_WINDOW_XCB
+   if (type & GST_VULKAN_DISPLAY_TYPE_XCB)
+     return VK_KHR_XCB_SURFACE_EXTENSION_NAME;
++#endif
+ 
++#if GST_VULKAN_HAVE_WINDOW_WAYLAND
+   if (type & GST_VULKAN_DISPLAY_TYPE_WAYLAND)
+     return VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME;
++#endif
+ 
+   return NULL;
+ }
+-- 
+2.13.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
new file mode 100644
index 0000000..0df145d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch
@@ -0,0 +1,64 @@
+From c23e1dc22deb495561cffb877edb2746b740a1fa Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 5 Jul 2017 11:07:05 +0300
+Subject: [PATCH 2/2] vulkan: Use the generated version of vkconfig.h
+
+Build fails in ext/vulkan/xcb and ext/vulkan/wayland when:
+* building from tarball
+* building out-of-tree
+* Only one WSI integration (xcb or wayland) is enabled by configure.ac
+This is because vkconfig.h from source directory gets used instead
+of the generated one.
+
+Add the correct build directory to "-I". Use angle bracket
+include in vkapi.h so that it actually looks in the include search
+path instead of defaulting to the same (source tree) directory.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=784539]
+---
+ ext/vulkan/vkapi.h             | 2 +-
+ ext/vulkan/wayland/Makefile.am | 1 +
+ ext/vulkan/xcb/Makefile.am     | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ext/vulkan/vkapi.h b/ext/vulkan/vkapi.h
+index e9c23aa92..a37c29d0f 100644
+--- a/ext/vulkan/vkapi.h
++++ b/ext/vulkan/vkapi.h
+@@ -23,7 +23,7 @@
+ 
+ #define VK_PROTOTYPES
+ 
+-#include "vkconfig.h"
++#include <vkconfig.h>
+ #include "vk_fwd.h"
+ #include "vkmacros.h"
+ 
+diff --git a/ext/vulkan/wayland/Makefile.am b/ext/vulkan/wayland/Makefile.am
+index f92d85e2c..10cfb70e6 100644
+--- a/ext/vulkan/wayland/Makefile.am
++++ b/ext/vulkan/wayland/Makefile.am
+@@ -14,6 +14,7 @@ noinst_HEADERS = \
+ 
+ libgstvulkan_wayland_la_CFLAGS = \
+ 	-I$(top_srcdir)/gst-libs \
++	-I$(top_builddir)/ext/vulkan \
+ 	-I$(top_srcdir)/ext/vulkan \
+ 	-I$(top_builddir)/gst-libs \
+ 	$(GST_PLUGINS_BASE_CFLAGS) \
+diff --git a/ext/vulkan/xcb/Makefile.am b/ext/vulkan/xcb/Makefile.am
+index 7debcff9e..b5103551b 100644
+--- a/ext/vulkan/xcb/Makefile.am
++++ b/ext/vulkan/xcb/Makefile.am
+@@ -14,6 +14,7 @@ noinst_HEADERS = \
+ 
+ libgstvulkan_xcb_la_CFLAGS = \
+ 	-I$(top_srcdir)/gst-libs \
++	-I$(top_builddir)/ext/vulkan \
+ 	-I$(top_srcdir)/ext/vulkan \
+ 	-I$(top_builddir)/gst-libs \
+ 	$(GST_PLUGINS_BASE_CFLAGS) \
+-- 
+2.13.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053..b4a2ab7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,8 @@ SRC_URI = " \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
+    file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
2.1.4


