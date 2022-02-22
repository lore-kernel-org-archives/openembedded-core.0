Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42130C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.13657.1645542520813188935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mPoVsNxM;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542521; x=1677078521;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=533XJ3vkuBcwNE1F27tzzW2F7fMSXrymF+A24MruQAc=;
  b=mPoVsNxMUlygTyoRswNJsFR4ZMNrb1Snr1NE+Ahv+C1BH0utPXbrl6F3
   izRKDtPX/OlnIvomLSfJm0YLeOwJ+JFRuQqCjtVG4VrejEvRKD3F8vqMj
   HO2p2HOgKSJA2XKq91/SH0gYXiEy0m8BnOOIQ1C8qJgsegFc/yCrIFTGy
   QwTuVcUBNoHg3KX68f4KnmMvG41cLz3cTunDUsJdEEIHgJk01UKgBXyJS
   usmryZsLgtZTe6qYc5zzO8JxilTIw/P2OB95s50rbgp4AX7ZM3z6X6Vgm
   zaypqBJe89OXtXkuLYG7G1fmXzLmF1lN9qbSPQxfxTWnJojbjf8NFYTKa
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305198"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258722"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 22/38] virglrenderer: fix CVE-2022-0135 and -0175
Date: Tue, 22 Feb 2022 23:07:23 +0800
Message-Id: 
 <2d1ed522def1386ce2810c4634a394774b42228c.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162158

From: Joe Slater <joe.slater@windriver.com>

CVE-2022-0135 concerns out-of-bounds writes in read_transfer_data().
CVE-2022-0175 concerns using malloc() instead of calloc().

We "cherry-pick" from upstream.  The actual cherry-picks are from
upstream master to branch-0.9.1 and are the patches entered here.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91f7511df79c5c1f93add9f2827a5a266453614e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../virglrenderer/cve-2022-0135.patch         | 117 ++++++++++++++++++
 .../virglrenderer/cve-2022-0175.patch         | 107 ++++++++++++++++
 .../virglrenderer/virglrenderer_0.9.1.bb      |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
new file mode 100644
index 0000000000..ae42dc8f6c
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
@@ -0,0 +1,117 @@
+From 63aee871365f9c9e7fa9125672302a0fb250d34d Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 30 Nov 2021 09:16:24 +0100
+Subject: [PATCH 2/2] vrend: propperly check whether the shader image range is
+ correct
+
+Also add a test to check the integer underflow.
+
+Closes: #251
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
+
+cherry-pick from anongit.freedesktop.org/virglrenderer
+commit 2aed5d4...
+
+CVE: CVE-2022-0135
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/vrend_decode.c          |  3 +-
+ tests/test_fuzzer_formats.c | 57 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/src/vrend_decode.c b/src/vrend_decode.c
+index 91f5f24..6771b10 100644
+--- a/src/vrend_decode.c
++++ b/src/vrend_decode.c
+@@ -1249,8 +1249,9 @@ static int vrend_decode_set_shader_images(struct vrend_context *ctx, const uint3
+    if (num_images < 1) {
+       return 0;
+    }
++
+    if (start_slot > PIPE_MAX_SHADER_IMAGES ||
+-       start_slot > PIPE_MAX_SHADER_IMAGES - num_images)
++       start_slot + num_images > PIPE_MAX_SHADER_IMAGES)
+       return EINVAL;
+ 
+    for (uint32_t i = 0; i < num_images; i++) {
+diff --git a/tests/test_fuzzer_formats.c b/tests/test_fuzzer_formats.c
+index 154a2e5..e32caf0 100644
+--- a/tests/test_fuzzer_formats.c
++++ b/tests/test_fuzzer_formats.c
+@@ -958,6 +958,61 @@ static void test_vrend_set_signle_abo_heap_overflow() {
+     virgl_renderer_submit_cmd((void *) cmd, ctx_id, 0xde);
+ }
+ 
++static void test_vrend_set_shader_images_overflow()
++{
++    uint32_t num_shaders = PIPE_MAX_SHADER_IMAGES + 1;
++    uint32_t size = num_shaders * VIRGL_SET_SHADER_IMAGE_ELEMENT_SIZE + 3;
++    uint32_t cmd[size];
++    int i = 0;
++    cmd[i++] = ((size - 1)<< 16) | 0 << 8 | VIRGL_CCMD_SET_SHADER_IMAGES;
++    cmd[i++] = PIPE_SHADER_FRAGMENT;
++    memset(&cmd[i], 0, size - i);
++
++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
++}
++
++/* Test adapted from yaojun8558363@gmail.com:
++ * https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/250
++*/
++static void test_vrend_3d_resource_overflow() {
++
++    struct virgl_renderer_resource_create_args resource;
++    resource.handle = 0x4c474572;
++    resource.target = PIPE_TEXTURE_2D_ARRAY;
++    resource.format = VIRGL_FORMAT_Z24X8_UNORM;
++    resource.nr_samples = 2;
++    resource.last_level = 0;
++    resource.array_size = 3;
++    resource.bind = VIRGL_BIND_SAMPLER_VIEW;
++    resource.depth = 1;
++    resource.width = 8;
++    resource.height = 4;
++    resource.flags = 0;
++
++    virgl_renderer_resource_create(&resource, NULL, 0);
++    virgl_renderer_ctx_attach_resource(ctx_id, resource.handle);
++
++    uint32_t size = 0x400;
++    uint32_t cmd[size];
++    int i = 0;
++    cmd[i++] = (size - 1) << 16 | 0 << 8 | VIRGL_CCMD_RESOURCE_INLINE_WRITE;
++    cmd[i++] = resource.handle;
++    cmd[i++] = 0; // level
++    cmd[i++] = 0; // usage
++    cmd[i++] = 0; // stride
++    cmd[i++] = 0; // layer_stride
++    cmd[i++] = 0; // x
++    cmd[i++] = 0; // y
++    cmd[i++] = 0; // z
++    cmd[i++] = 8; // w
++    cmd[i++] = 4; // h
++    cmd[i++] = 3; // d
++    memset(&cmd[i], 0, size - i);
++
++    virgl_renderer_submit_cmd((void *) cmd, ctx_id, size);
++}
++
++
+ int main()
+ {
+    initialize_environment();
+@@ -980,6 +1035,8 @@ int main()
+    test_cs_nullpointer_deference();
+    test_vrend_set_signle_abo_heap_overflow();
+ 
++   test_vrend_set_shader_images_overflow();
++   test_vrend_3d_resource_overflow();
+ 
+    virgl_renderer_context_destroy(ctx_id);
+    virgl_renderer_cleanup(&cookie);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
new file mode 100644
index 0000000000..7fbab75091
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
@@ -0,0 +1,107 @@
+From 5ca7aca001092c557f0b6fc1ba3db7dcdab860b7 Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 30 Nov 2021 09:29:42 +0100
+Subject: [PATCH 1/2] vrend: clear memory when allocating a host-backed memory
+ resource
+
+Closes: #249
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
+
+cherry-pick from anongit.freedesktop.org/virglrenderer
+commit b05bb61...
+
+CVE: CVE-2022-0175
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/vrend_renderer.c        |  2 +-
+ tests/test_virgl_transfer.c | 51 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 52 insertions(+), 1 deletion(-)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index b8b2a36..2650cf2 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -6788,7 +6788,7 @@ vrend_resource_alloc_buffer(struct vrend_resource *gr, uint32_t flags)
+    if (bind == VIRGL_BIND_CUSTOM) {
+       /* use iovec directly when attached */
+       gr->storage_bits |= VREND_STORAGE_HOST_SYSTEM_MEMORY;
+-      gr->ptr = malloc(size);
++      gr->ptr = calloc(1, size);
+       if (!gr->ptr)
+          return -ENOMEM;
+    } else if (bind == VIRGL_BIND_STAGING) {
+diff --git a/tests/test_virgl_transfer.c b/tests/test_virgl_transfer.c
+index bf7f438..3c53c3d 100644
+--- a/tests/test_virgl_transfer.c
++++ b/tests/test_virgl_transfer.c
+@@ -952,6 +952,56 @@ START_TEST(virgl_test_transfer_near_res_bounds_with_stride_succeeds)
+ }
+ END_TEST
+ 
++START_TEST(test_vrend_host_backed_memory_no_data_leak)
++{
++   struct iovec iovs[1];
++   int niovs = 1;
++
++   struct virgl_context ctx = {0};
++
++   int ret = testvirgl_init_ctx_cmdbuf(&ctx);
++
++   struct virgl_renderer_resource_create_args res;
++   res.handle = 0x400;
++   res.target = PIPE_BUFFER;
++   res.format = VIRGL_FORMAT_R8_UNORM;
++   res.nr_samples = 0;
++   res.last_level = 0;
++   res.array_size = 1;
++   res.bind = VIRGL_BIND_CUSTOM;
++   res.depth = 1;
++   res.width = 32;
++   res.height = 1;
++   res.flags = 0;
++
++   uint32_t size = 32;
++   uint8_t* data = calloc(1, size);
++   memset(data, 1, 32);
++   iovs[0].iov_base = data;
++   iovs[0].iov_len = size;
++
++   struct pipe_box box = {0,0,0, size, 1,1};
++
++   virgl_renderer_resource_create(&res, NULL, 0);
++   virgl_renderer_ctx_attach_resource(ctx.ctx_id, res.handle);
++
++   ret = virgl_renderer_transfer_read_iov(res.handle, ctx.ctx_id, 0, 0, 0,
++                                          (struct virgl_box *)&box, 0, iovs, niovs);
++
++   ck_assert_int_eq(ret, 0);
++
++   for (int i = 0; i < 32; ++i)
++      ck_assert_int_eq(data[i], 0);
++
++   virgl_renderer_ctx_detach_resource(1, res.handle);
++
++   virgl_renderer_resource_unref(res.handle);
++   free(data);
++
++}
++END_TEST
++
++
+ static Suite *virgl_init_suite(void)
+ {
+   Suite *s;
+@@ -981,6 +1031,7 @@ static Suite *virgl_init_suite(void)
+   tcase_add_test(tc_core, virgl_test_transfer_buffer_bad_strides);
+   tcase_add_test(tc_core, virgl_test_transfer_2d_array_bad_layer_stride);
+   tcase_add_test(tc_core, virgl_test_transfer_2d_bad_level);
++  tcase_add_test(tc_core, test_vrend_host_backed_memory_no_data_leak);
+ 
+   tcase_add_loop_test(tc_core, virgl_test_transfer_res_read_valid, 0, PIPE_MAX_TEXTURE_TYPES);
+   tcase_add_loop_test(tc_core, virgl_test_transfer_res_write_valid, 0, PIPE_MAX_TEXTURE_TYPES);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
index 65bd1af942..c18018759b 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.9.1.bb
@@ -12,6 +12,8 @@ DEPENDS = "libdrm virtual/libgl virtual/libgbm libepoxy"
 SRCREV = "363915595e05fb252e70d6514be2f0c0b5ca312b"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=branch-0.9.1 \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://cve-2022-0135.patch \
+           file://cve-2022-0175.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.35.1


