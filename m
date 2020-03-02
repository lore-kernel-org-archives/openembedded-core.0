Return-Path: <chee.yang.lee@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 35240612C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 06:33:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 22:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="233258891"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2020 22:33:00 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2020 14:32:59 +0800
Message-Id: <1583130779-81072-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH][zeus] virglrenderer: fix multiple CVEs
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
X-List-Received-Date: Mon, 02 Mar 2020 06:33:02 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix these CVE:
CVE-2019-18390
CVE-2019-18391
CVE-2020-8002

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../virglrenderer/CVE-2019-18390.patch             | 66 ++++++++++++++++++++++
 .../virglrenderer/CVE-2019-18391.patch             | 51 +++++++++++++++++
 .../virglrenderer/CVE-2020-8002.patch              | 39 +++++++++++++
 .../virglrenderer/virglrenderer_0.8.0.bb           |  3 +
 4 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
new file mode 100644
index 0000000..ad61c95
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18390.patch
@@ -0,0 +1,66 @@
+From 24f67de7a9088a873844a39be03cee6882260ac9 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Mon, 7 Oct 2019 10:59:56 +0200
+Subject: [PATCH] vrend: check info formats in blits
+
+Closes #141
+Closes #142
+
+v2 : drop colon in error description (Emil)
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/commit/24f67de7a9088a873844a39be03cee6882260ac9]
+CVE: CVE-2019-18390
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/virgl_hw.h       |  1 +
+ src/vrend_renderer.c | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/virgl_hw.h b/src/virgl_hw.h
+index 145780bf..5ccf3073 100644
+--- a/src/virgl_hw.h
++++ b/src/virgl_hw.h
+@@ -426,6 +426,7 @@ enum virgl_ctx_errors {
+         VIRGL_ERROR_CTX_ILLEGAL_CMD_BUFFER,
+         VIRGL_ERROR_CTX_GLES_HAVE_TES_BUT_MISS_TCS,
+         VIRGL_ERROR_GL_ANY_SAMPLES_PASSED,
++        VIRGL_ERROR_CTX_ILLEGAL_FORMAT,
+ };
+ 
+ #define VIRGL_RESOURCE_Y_0_TOP (1 << 0)
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 14fefb38..aa6a89c1 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -758,6 +758,7 @@ static const char *vrend_ctx_error_strings[] = {
+    [VIRGL_ERROR_CTX_ILLEGAL_CMD_BUFFER]    = "Illegal command buffer",
+    [VIRGL_ERROR_CTX_GLES_HAVE_TES_BUT_MISS_TCS] = "On GLES context and shader program has tesselation evaluation shader but no tesselation control shader",
+    [VIRGL_ERROR_GL_ANY_SAMPLES_PASSED] = "Query for ANY_SAMPLES_PASSED not supported",
++   [VIRGL_ERROR_CTX_ILLEGAL_FORMAT]        = "Illegal format ID",
+ };
+ 
+ static void __report_context_error(const char *fname, struct vrend_context *ctx,
+@@ -8492,6 +8493,16 @@ void vrend_renderer_blit(struct vrend_context *ctx,
+    if (ctx->in_error)
+       return;
+ 
++   if (!info->src.format || (enum virgl_formats)info->src.format >= VIRGL_FORMAT_MAX) {
++      report_context_error(ctx, VIRGL_ERROR_CTX_ILLEGAL_FORMAT, info->src.format);
++      return;
++   }
++
++   if (!info->dst.format || (enum virgl_formats)info->dst.format >= VIRGL_FORMAT_MAX) {
++      report_context_error(ctx, VIRGL_ERROR_CTX_ILLEGAL_FORMAT, info->dst.format);
++      return;
++   }
++
+    if (info->render_condition_enable == false)
+       vrend_pause_render_condition(ctx, true);
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
new file mode 100644
index 0000000..cc641d8
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2019-18391.patch
@@ -0,0 +1,51 @@
+From 2abeb1802e3c005b17a7123e382171b3fb665971 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 8 Oct 2019 17:27:01 +0200
+Subject: [PATCH] vrend: check that the transfer iov holds enough data for the
+ data upload
+
+Closes #140
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/commit/2abeb1802e3c005b17a7123e382171b3fb665971]
+CVE: CVE-2019-18391
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/vrend_renderer.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 694e1d0e..fe23846b 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -7005,15 +7005,22 @@ static int vrend_renderer_transfer_write_iov(struct vrend_context *ctx,
+             invert = true;
+       }
+ 
++      send_size = util_format_get_nblocks(res->base.format, info->box->width,
++                                          info->box->height) * elsize;
++      if (res->target == GL_TEXTURE_3D ||
++          res->target == GL_TEXTURE_2D_ARRAY ||
++          res->target == GL_TEXTURE_CUBE_MAP_ARRAY)
++          send_size *= info->box->depth;
++
+       if (need_temp) {
+-         send_size = util_format_get_nblocks(res->base.format, info->box->width,
+-                                             info->box->height) * elsize * info->box->depth;
+          data = malloc(send_size);
+          if (!data)
+             return ENOMEM;
+          read_transfer_data(iov, num_iovs, data, res->base.format, info->offset,
+                             stride, layer_stride, info->box, invert);
+       } else {
++         if (send_size > iov[0].iov_len - info->offset)
++            return EINVAL;
+          data = (char*)iov[0].iov_base + info->offset;
+       }
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch
new file mode 100644
index 0000000..925f2c8
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2020-8002.patch
@@ -0,0 +1,39 @@
+From 63bcca251f093d83da7e290ab4bbd38ae69089b5 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Wed, 15 Jan 2020 13:43:58 +0100
+Subject: [PATCH] vrend: Don't try launching a grid if no CS is available
+
+Closes #155
+
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>
+
+Upstream-Status: Backport 
+[https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/63bcca251f093d83da7e290ab4bbd38ae69089b5.patch]
+CVE: CVE-2020-8002
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/vrend_renderer.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index a054bad8..2280fc43 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -4604,6 +4604,13 @@ void vrend_launch_grid(struct vrend_context *ctx,
+       }
+       ctx->sub->shader_dirty = true;
+    }
++
++   if (!ctx->sub->prog) {
++      vrend_printf("%s: Skipping compute shader execution due to missing shaders: %s\n",
++                   __func__, ctx->debug_name);
++      return;
++   }
++
+    vrend_use_program(ctx, ctx->sub->prog->id);
+ 
+    vrend_draw_bind_ubo_shader(ctx, PIPE_SHADER_COMPUTE, 0);
+-- 
+2.24.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index d2b11c1..e91ccc6 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -8,6 +8,9 @@ DEPENDS = "libdrm mesa libepoxy"
 SRCREV = "48cc96c9aebb9d0164830a157efc8916f08f00c0"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
+           file://CVE-2019-18390.patch \
+           file://CVE-2019-18391.patch \
+           file://CVE-2020-8002.patch  \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


