Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 82CC677A56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 15:03:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 08:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,312,1496127600"; d="scan'208";a="988968175"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 05 Jul 2017 08:03:08 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 390A75801CF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:03:07 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 18:03:19 +0300
Message-Id: <1499267003-20382-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/12] gstreamer1.0-vaapi: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Wed, 05 Jul 2017 15:03:10 -0000

Remove backport patch:
        1. vaapivideobufferpool-create-allocator-if-needed.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ideobufferpool-create-allocator-if-needed.patch | 61 ----------------------
 .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |  7 ---
 .../gstreamer/gstreamer1.0-vaapi_1.12.1.bb         |  5 ++
 3 files changed, 5 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch b/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
deleted file mode 100644
index f666adc..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Backport [commit 59a731be6b in '1.10' branch]
-
-
-From 02a6002c3a80b3a5301c0943b1a1518bbdf439fc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
- <vjaquez@igalia.com>
-Date: Fri, 21 Apr 2017 19:07:18 +0200
-Subject: [PATCH] vaapivideobufferpool: create allocator if needed
-
-Backport to branch 1.10
-
-Sometimes a video decoder could set different buffer pool
-configurations, because their frame size changes. In this case we
-did not reconfigure the allocator.
-
-This patch enables this use case, creating a new allocator inside
-the VAAPI buffer pool if the caps changed, if it is not dmabuf-based.
-If so, it is just reconfigured, since it doesn't have a surface pool.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=781577
----
- gst/vaapi/gstvaapivideobufferpool.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/gst/vaapi/gstvaapivideobufferpool.c b/gst/vaapi/gstvaapivideobufferpool.c
-index a3b9223f..9a50614b 100644
---- a/gst/vaapi/gstvaapivideobufferpool.c
-+++ b/gst/vaapi/gstvaapivideobufferpool.c
-@@ -159,6 +159,27 @@ gst_vaapi_video_buffer_pool_set_config (GstBufferPool * pool,
-     gst_object_replace ((GstObject **) & priv->allocator, NULL);
-   priv->video_info = new_vip;
- 
-+  {
-+    guint surface_alloc_flags;
-+    gboolean vinfo_changed = FALSE;
-+
-+    if (allocator) {
-+      const GstVideoInfo *alloc_vinfo =
-+          gst_allocator_get_vaapi_video_info (allocator, &surface_alloc_flags);
-+      vinfo_changed = gst_video_info_changed (alloc_vinfo, &new_vip);
-+    }
-+
-+    if (vinfo_changed && allocator && priv->use_dmabuf_memory) {
-+      gst_allocator_set_vaapi_video_info (allocator, &new_vip,
-+          surface_alloc_flags);
-+    } else if (!priv->use_dmabuf_memory && (vinfo_changed || !allocator)) {
-+      /* let's destroy the other allocator and create a new one */
-+      allocator = gst_vaapi_video_allocator_new (priv->display, &new_vip,
-+          surface_alloc_flags);
-+      gst_buffer_pool_config_set_allocator (config, allocator, NULL);
-+    }
-+  }
-+
-   if (!gst_buffer_pool_config_has_option (config,
-           GST_BUFFER_POOL_OPTION_VAAPI_VIDEO_META))
-     goto error_no_vaapi_video_meta_option;
--- 
-2.11.0
-
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
deleted file mode 100644
index 44c66de..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "318af17f906637570b61dd7be9b5581d"
-SRC_URI[sha256sum] = "03e690621594d9f9495d86c7dac8b8590b3a150462770ed070dc76f66a70de75"
-
-SRC_URI += "file://vaapivideobufferpool-create-allocator-if-needed.patch"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb
new file mode 100644
index 0000000..e3ec98b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "e5c07f867640a9507b8590adf9fba589"
+SRC_URI[sha256sum] = "de4e9697a856660ccbf27f45ffa86b1a97af426f7823ec65a48f2e9daac9e4a1"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.4.0


