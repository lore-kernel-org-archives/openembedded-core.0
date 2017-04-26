Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C3FAC6093E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 07:01:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 26 Apr 2017 00:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,253,1488873600"; d="scan'208";a="1161072659"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2017 00:01:48 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7BFBE6A4006;
	Wed, 26 Apr 2017 00:01:36 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 10:01:42 +0300
Message-Id: <1493190102-1662-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gstreamer1.0-vaapi: Fix playback breaking bug
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
X-List-Received-Date: Wed, 26 Apr 2017 07:01:49 -0000

gstreamer-vaapi fails to play files with specific frame sizes
because of buffer allocation issues. Fix is a backport.

Fixes [YOCTO #11311].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ideobufferpool-create-allocator-if-needed.patch | 61 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch b/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
new file mode 100644
index 0000000..f666adc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
@@ -0,0 +1,61 @@
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport [commit 59a731be6b in '1.10' branch]
+
+
+From 02a6002c3a80b3a5301c0943b1a1518bbdf439fc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
+ <vjaquez@igalia.com>
+Date: Fri, 21 Apr 2017 19:07:18 +0200
+Subject: [PATCH] vaapivideobufferpool: create allocator if needed
+
+Backport to branch 1.10
+
+Sometimes a video decoder could set different buffer pool
+configurations, because their frame size changes. In this case we
+did not reconfigure the allocator.
+
+This patch enables this use case, creating a new allocator inside
+the VAAPI buffer pool if the caps changed, if it is not dmabuf-based.
+If so, it is just reconfigured, since it doesn't have a surface pool.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=781577
+---
+ gst/vaapi/gstvaapivideobufferpool.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/gst/vaapi/gstvaapivideobufferpool.c b/gst/vaapi/gstvaapivideobufferpool.c
+index a3b9223f..9a50614b 100644
+--- a/gst/vaapi/gstvaapivideobufferpool.c
++++ b/gst/vaapi/gstvaapivideobufferpool.c
+@@ -159,6 +159,27 @@ gst_vaapi_video_buffer_pool_set_config (GstBufferPool * pool,
+     gst_object_replace ((GstObject **) & priv->allocator, NULL);
+   priv->video_info = new_vip;
+ 
++  {
++    guint surface_alloc_flags;
++    gboolean vinfo_changed = FALSE;
++
++    if (allocator) {
++      const GstVideoInfo *alloc_vinfo =
++          gst_allocator_get_vaapi_video_info (allocator, &surface_alloc_flags);
++      vinfo_changed = gst_video_info_changed (alloc_vinfo, &new_vip);
++    }
++
++    if (vinfo_changed && allocator && priv->use_dmabuf_memory) {
++      gst_allocator_set_vaapi_video_info (allocator, &new_vip,
++          surface_alloc_flags);
++    } else if (!priv->use_dmabuf_memory && (vinfo_changed || !allocator)) {
++      /* let's destroy the other allocator and create a new one */
++      allocator = gst_vaapi_video_allocator_new (priv->display, &new_vip,
++          surface_alloc_flags);
++      gst_buffer_pool_config_set_allocator (config, allocator, NULL);
++    }
++  }
++
+   if (!gst_buffer_pool_config_has_option (config,
+           GST_BUFFER_POOL_OPTION_VAAPI_VIDEO_META))
+     goto error_no_vaapi_video_meta_option;
+-- 
+2.11.0
+
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
index c4a884d..44c66de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
@@ -2,4 +2,6 @@ require gstreamer1.0-vaapi.inc
 SRC_URI[md5sum] = "318af17f906637570b61dd7be9b5581d"
 SRC_URI[sha256sum] = "03e690621594d9f9495d86c7dac8b8590b3a150462770ed070dc76f66a70de75"
 
+SRC_URI += "file://vaapivideobufferpool-create-allocator-if-needed.patch"
+
 DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.1.4


