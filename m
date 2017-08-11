Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC1F78603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:28:30 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id DCF184CB5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:28:30 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:28:19 +0200
Message-Id: <1502486900-16180-10-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
References: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 09/10] gstreamer1.0-vaapi: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:28:31 -0000

* Remove backported patch:
  1. vaapivideobufferpool-create-allocator-if-needed.patch

* Add PACKAGECONFIG_GL variable to make it possible for BSP layers to
  customize what should be the default, EGL or GLX

* Set virtual/egl instead of virtual/mesa as egl dependency in case
  platform specific drivers provide virtual/egl functionality

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...ideobufferpool-create-allocator-if-needed.patch | 61 ----------------------
 .../gstreamer/gstreamer1.0-vaapi.inc               | 13 ++++-
 .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |  7 ---
 .../gstreamer/gstreamer1.0-vaapi_1.12.2.bb         |  5 ++
 4 files changed, 16 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
index ef0734b..abfcc65 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
@@ -22,12 +22,21 @@ REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 PACKAGES =+ "${PN}-tests"
 
+# OpenGL packageconfig factored out to make it easy for distros
+# and BSP layers to pick either glx, egl, or no GL. By default,
+# try detecting X11 first, and if found (with OpenGL), use GLX,
+# otherwise try to check if EGL can be used.
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', \
+                        bb.utils.contains('DISTRO_FEATURES',     'opengl', 'egl', \
+                                                                       '', d), d)}"
+
 PACKAGECONFIG ??= "drm \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
+                   ${PACKAGECONFIG_GL} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,udev libdrm"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/mesa"
+PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxrandr libxrender"
 
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
new file mode 100644
index 0000000..fbd9f86
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "bea015f33696a15ad9575fb71af862ed"
+SRC_URI[sha256sum] = "23c714e0474b3c7ae6ff8884aebf8503a1bc3ded335fa2d2b2ac31788466163a"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.7.4


