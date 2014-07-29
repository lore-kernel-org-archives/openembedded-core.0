Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 15C5D70897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 21:00:16 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 8B83D331A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:53:33 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 22:53:22 +0200
Message-Id: <1406667203-14914-6-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
References: <1406667203-14914-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 6/7] gstreamer1.0-libav: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 29 Jul 2014 21:00:21 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../videodec-Don-t-use-non-growable-pool.patch     | 75 ----------------------
 ...-libav_1.2.4.bb => gstreamer1.0-libav_1.4.0.bb} |  7 +-
 2 files changed, 3 insertions(+), 79 deletions(-)
 delete mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch
 rename recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.4.bb => gstreamer1.0-libav_1.4.0.bb} (78%)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch b/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch
deleted file mode 100644
index d9b796b..0000000
--- a/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 62a4d065ed7bd117d869fd8bcb61274c2870ddf5 Mon Sep 17 00:00:00 2001
-From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
-Date: Thu, 27 Mar 2014 18:53:53 -0400
-Subject: [PATCH] videodec: Don't use non-growable pool
-
-As we don't know how many output buffers we need to operate, we need to
-avoid pool that can't grow. Otherwise the pipeline may stall, waiting
-for buffers. For now, we require it to be able to grow to at least
-32 buffers, which I think is a fair amount of buffers for decoders.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=726299
-
-Commit 2a337d926cc30cd7eaae13a4b46eea68ba89e368 in master branch
-
-Upstream Status:  Backported
-
-Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
----
- ext/libav/gstavviddec.c |   22 +++++++++++++++++++++-
- 1 file changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
-index 6c9c0c9..d80fd52 100644
---- a/ext/libav/gstavviddec.c
-+++ b/ext/libav/gstavviddec.c
-@@ -46,6 +46,7 @@ GST_DEBUG_CATEGORY_EXTERN (GST_CAT_PERFORMANCE);
- #define DEFAULT_DIRECT_RENDERING	TRUE
- #define DEFAULT_DEBUG_MV		FALSE
- #define DEFAULT_MAX_THREADS		0
-+#define REQUIRED_POOL_MAX_BUFFERS       32
- 
- enum
- {
-@@ -1620,7 +1621,7 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
-   GstBufferPool *pool;
-   guint size, min, max;
-   GstStructure *config;
--  gboolean have_videometa, have_alignment;
-+  gboolean have_videometa, have_alignment, update_pool;
-   GstAllocator *allocator = NULL;
-   GstAllocationParams params = { 0, 15, 0, 0, };
- 
-@@ -1639,6 +1640,22 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
- 
-   gst_query_parse_nth_allocation_pool (query, 0, &pool, &size, &min, &max);
- 
-+  /* Don't use pool that can't grow, as we don't know how many buffer we'll
-+   * need, otherwise we may stall */
-+  if (max != 0 && max < REQUIRED_POOL_MAX_BUFFERS) {
-+    gst_object_unref (pool);
-+    pool = gst_video_buffer_pool_new ();
-+    max = 0;
-+    update_pool = TRUE;
-+
-+    /* if there is an allocator, also drop it, as it might be the reason we
-+     * have this limit. Default will be used */
-+    if (allocator) {
-+      gst_object_unref (allocator);
-+      allocator = NULL;
-+    }
-+  }
-+
-   config = gst_buffer_pool_get_config (pool);
-   gst_buffer_pool_config_set_params (config, state->caps, size, min, max);
-   /* we are happy with the default allocator but we would like to have 16 bytes
-@@ -1726,6 +1743,9 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
-   /* and store */
-   gst_buffer_pool_set_config (pool, config);
- 
-+  if (update_pool)
-+    gst_query_set_nth_allocation_pool (query, 0, pool, size, min, max);
-+
-   gst_object_unref (pool);
-   if (allocator)
-     gst_object_unref (allocator);
diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb b/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb
similarity index 78%
rename from recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
rename to recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb
index 9e23219..bc79d54 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.0.bb
@@ -3,7 +3,7 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/LICENSE;md5=df1087a33b5cafe5e70b3452aac81515 \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    file://videodec-Don-t-use-non-growable-pool.patch \
 "
-SRC_URI[md5sum] = "6454f9f22b3aa37694781633e0d20a9c"
-SRC_URI[sha256sum] = "2a69480d63fc2db93249d9e2e229ab3541bbc2db881b0f64de13d0bfc7d1f037"
+SRC_URI[md5sum] = "60811ae08c26fa093a96996582962c75"
+SRC_URI[sha256sum] = "c82c7a657863f2e27ac5cba539b0bd0a8114ad6bd4ba33bae777e4dbfab9e380"
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-- 
1.8.3.2


