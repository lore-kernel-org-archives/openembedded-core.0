Return-Path: <chee.yang.lee@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4DE60583
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 08:06:43 +0000 (UTC)
IronPort-SDR: g3v3/s6/l6Norz9D0pGpUMcoLMWveKILf3vPCpXGdcS+CRR78MORj6GVhrvqVGuOq34Ev058St
	dekfFELBtRYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Mar 2020 01:06:43 -0700
IronPort-SDR: HbXaxZ5YNJObcHTbA2F7eK30tcn6ENQ0mpGt7NqgU1oBxD8qIg3+JzqbYvT5PsBcp5xEPplXA/
	xVeXg2Hzvy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="291861742"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2020 01:06:43 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 16:06:42 +0800
Message-Id: <1584691602-12741-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH][zeus] virglrenderer : fix CVE-2019-18388
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
X-List-Received-Date: Fri, 20 Mar 2020 08:06:43 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../virglrenderer/CVE-2019-18388.patch             | 141 +++++++++++++++++++++
 .../virglrenderer/virglrenderer_0.8.0.bb           |   3 +-
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.patch
new file mode 100644
index 0000000..43563e4
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18388.patch
@@ -0,0 +1,141 @@
+From 0d9a2c88dc3a70023541b3260b9f00c982abda16 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Thu, 10 Oct 2019 09:42:25 +0200
+Subject: [PATCH] vrend: Check resource creation more thoroughly
+
+While we are at it:
+  - free memory if texture allocation fails
+
+Closes #144
+Closes #145
+Closes #146
+
+v2: Move the error string creation to extra patch (Emil)
+v3: Fix whitespace errors (Emil) and one logic error
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/commit/0d9a2c88dc3a70023541b3260b9f00c982abda16]
+CVE: CVE-2019-18388
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+---
+ src/vrend_renderer.c | 58 ++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 56 insertions(+), 2 deletions(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 0c6b5efd..1fb657b7 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -6044,6 +6044,8 @@ static int check_resource_valid(struct vrend_renderer_resource_create_args *args
+ 
+    if (args->format >= VIRGL_FORMAT_MAX)
+       return -1;
++   bool format_can_texture_storage = has_feature(feat_texture_storage) &&
++         (tex_conv_table[args->format].flags & VIRGL_TEXTURE_CAN_TEXTURE_STORAGE);
+ 
+    /* only texture 2d and 2d array can have multiple samples */
+    if (args->nr_samples > 0) {
+@@ -6061,15 +6063,18 @@ static int check_resource_valid(struct vrend_renderer_resource_create_args *args
+       /* buffer and rect textures can't have mipmaps */
+       if (args->target == PIPE_BUFFER || args->target == PIPE_TEXTURE_RECT)
+          return -1;
++
+       if (args->last_level > (floor(log2(MAX2(args->width, args->height))) + 1))
+          return -1;
+    }
++
+    if (args->flags != 0 && args->flags != VIRGL_RESOURCE_Y_0_TOP)
+       return -1;
+ 
+-   if (args->flags & VIRGL_RESOURCE_Y_0_TOP)
++   if (args->flags & VIRGL_RESOURCE_Y_0_TOP) {
+       if (args->target != PIPE_TEXTURE_2D && args->target != PIPE_TEXTURE_RECT)
+          return -1;
++   }
+ 
+    /* array size for array textures only */
+    if (args->target == PIPE_TEXTURE_CUBE) {
+@@ -6088,6 +6093,9 @@ static int check_resource_valid(struct vrend_renderer_resource_create_args *args
+       if (!has_feature(feat_texture_array))
+          return -1;
+    }
++   if (format_can_texture_storage && !args->width) {
++      return -1;
++   }
+ 
+    if (args->bind == 0 ||
+        args->bind == VIRGL_BIND_CUSTOM ||
+@@ -6124,11 +6132,55 @@ static int check_resource_valid(struct vrend_renderer_resource_create_args *args
+           args->target == PIPE_TEXTURE_CUBE_ARRAY) {
+          if (args->depth != 1)
+             return -1;
++         if (format_can_texture_storage && !args->height) {
++            return -1;
++         }
+       }
+       if (args->target == PIPE_TEXTURE_1D ||
+           args->target == PIPE_TEXTURE_1D_ARRAY) {
+          if (args->height != 1 || args->depth != 1)
+             return -1;
++         if (args->width > vrend_state.max_texture_2d_size) {
++            return -1;
++         }
++      }
++
++      if (args->target == PIPE_TEXTURE_2D ||
++          args->target == PIPE_TEXTURE_RECT ||
++          args->target == PIPE_TEXTURE_2D_ARRAY) {
++         if (args->width > vrend_state.max_texture_2d_size ||
++             args->height > vrend_state.max_texture_2d_size) {
++            return -1;
++         }
++      }
++
++      if (args->target == PIPE_TEXTURE_3D) {
++         if (format_can_texture_storage &&
++             (!args->height || !args->depth)) {
++            return -1;
++         }
++         if (args->width > vrend_state.max_texture_3d_size ||
++             args->height > vrend_state.max_texture_3d_size ||
++             args->depth > vrend_state.max_texture_3d_size) {
++            return -1;
++         }
++      }
++      if (args->target == PIPE_TEXTURE_2D_ARRAY ||
++          args->target == PIPE_TEXTURE_CUBE_ARRAY ||
++          args->target == PIPE_TEXTURE_1D_ARRAY) {
++         if (format_can_texture_storage &&
++             !args->array_size) {
++            return -1;
++         }
++      }
++      if (args->target == PIPE_TEXTURE_CUBE ||
++          args->target == PIPE_TEXTURE_CUBE_ARRAY) {
++         if (args->width != args->height) {
++            return -1;
++         }
++         if (args->width > vrend_state.max_texture_cube_size) {
++            return -1;
++         }
+       }
+    }
+    return 0;
+@@ -6458,8 +6510,10 @@ int vrend_renderer_resource_create(struct vrend_renderer_resource_create_args *a
+       vrend_create_buffer(gr, args->width);
+    } else {
+       int r = vrend_renderer_resource_allocate_texture(gr, image_oes);
+-      if (r)
++      if (r) {
++         FREE(gr);
+          return r;
++      }
+    }
+ 
+    ret = vrend_resource_insert(gr, args->handle);
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index e91ccc6..0480d90 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -11,7 +11,8 @@ SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://CVE-2019-18390.patch \
            file://CVE-2019-18391.patch \
            file://CVE-2020-8002.patch  \
-           "
+           file://CVE-2019-18388.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


