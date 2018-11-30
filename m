Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C32796D4E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 07:16:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 23:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,297,1539673200"; d="scan'208";a="117399696"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.29])
	by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2018 23:16:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 15:16:09 +0800
Message-Id: <20181130071609.2515-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gstreamer1.0-vaapi: downgrade vaapisink to marginal rank
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
X-List-Received-Date: Fri, 30 Nov 2018 07:16:15 -0000

Using vaapisink (which doesn't supports DRI3 [1] and uses DRI2) with
default poky configuration currently results in an unresponsive display
because DRI2 rendering doesn't work (as of xserver 1.20.3) in non-composited
environments [2].

Downgrade vaapisink to marginal for now so playbin (and in turn gst-play
and gtk-play examples) uses next best sink element and works out of box.

[1] https://github.com/intel/libva/issues/122
[2] https://gitlab.freedesktop.org/xorg/xserver/issues/13

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-vaapsink-downgrade-to-marginal.patch | 46 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.14.4.bb    |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
new file mode 100644
index 0000000000..c861f3bed2
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
@@ -0,0 +1,46 @@
+From 0c28cf7bfa90f8947833722cddf23d513490c6c3 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Wed, 28 Nov 2018 15:08:48 +0800
+Subject: [PATCH] vaapsink: downgrade to marginal
+
+Using vaapisink with default poky configuration results in an
+unresponsive display as of today because DRI2 rendering is currently broken
+in non composited environments [1] and libva doesn't support DRI3 [2].
+
+Downgrade vaapisink to marginal for now so playbin (and in turn gst-play
+and gtk-play examples) use xvimagesink or others out of box.
+
+[1] https://gitlab.freedesktop.org/xorg/xserver/issues/13
+[2] https://github.com/intel/libva/issues/122
+
+Upstream-Status: Pending
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ gst/vaapi/gstvaapi.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/gst/vaapi/gstvaapi.c b/gst/vaapi/gstvaapi.c
+index 9a82454..4d94f2b 100644
+--- a/gst/vaapi/gstvaapi.c
++++ b/gst/vaapi/gstvaapi.c
+@@ -210,7 +210,6 @@ plugin_init (GstPlugin * plugin)
+ {
+   GstVaapiDisplay *display;
+   GArray *decoders;
+-  guint rank;
+ 
+   plugin_add_dependencies (plugin);
+ 
+@@ -235,10 +234,7 @@ plugin_init (GstPlugin * plugin)
+   gst_element_register (plugin, "vaapidecodebin",
+       GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
+ 
+-  rank = GST_RANK_PRIMARY;
+-  if (g_getenv ("WAYLAND_DISPLAY"))
+-    rank = GST_RANK_MARGINAL;
+-  gst_element_register (plugin, "vaapisink", rank, GST_TYPE_VAAPISINK);
++  gst_element_register (plugin, "vaapisink", GST_RANK_MARGINAL, GST_TYPE_VAAPISINK);
+ 
+ #if USE_ENCODERS
+   gst_vaapiencode_register (plugin, display);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
index fdca0b9565..3896434104 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
-          "
+           file://0001-vaapsink-downgrade-to-marginal.patch \
+           "
 
 SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
 SRC_URI[sha256sum] = "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
-- 
2.17.1


