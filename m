Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5916C53A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 04:09:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Dec 2018 20:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,312,1539673200"; d="scan'208";a="106780839"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.29])
	by fmsmga008.fm.intel.com with ESMTP; 03 Dec 2018 20:09:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2018 12:09:48 +0800
Message-Id: <20181204040948.24409-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] gstreamer1.0-vaapi: downgrade vaapisink to marginal rank
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
X-List-Received-Date: Tue, 04 Dec 2018 04:09:51 -0000

Using vaapisink (which doesn't supports DRI3 [1] and uses DRI2) with
default poky configuration currently results in an unresponsive display
because DRI2 rendering doesn't work (as of xserver 1.20.3) in non-composited
environments [2].

Downgrade vaapisink to marginal for now so playbin (and in turn gst-play
and gtk-play examples) uses next best sink element and works out of box.

[1] https://github.com/intel/libva/issues/122
[2] https://gitlab.freedesktop.org/xorg/xserver/issues/13

(From OE-Core rev: 7911039a3a82a29166f3be2ff5bdd719430e5a80)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-vaapsink-downgrade-to-marginal.patch | 46 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.14.2.bb    |  3 +-
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
index 34f2be9043..f0ed2fa869 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.2.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
-          "
+           file://0001-vaapsink-downgrade-to-marginal.patch \
+           "
 
 SRC_URI[md5sum] = "12ee9c16dfa0bb1808c76683e1c9a328"
 SRC_URI[sha256sum] = "7f1064e27f5abd3a42ef66b425f1a2b9dbae7748c81bd9d090ce52a1aaf30d8a"
-- 
2.17.1


