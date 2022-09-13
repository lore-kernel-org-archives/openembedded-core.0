Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FBAC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:47:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.782.1663040862082628879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 20:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CqfmeLIt;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663040863; x=1694576863;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GBzOISTvshLwkXOTVyxgJo3JDX5mh1mX2GsddwGRX0g=;
  b=CqfmeLItlj9JGr7Ma/GO+gK5/HbPsu4QFiNOHjJ2qW4QsrGB7pwKu0b2
   NEuBfkCV3mWL8+gn9UEXFrdXtS0R92jGu28wRKKiiKFadlLowFs4bHN3V
   jtAP0VFRRKCzmPM2LWjB494hTN9NLCUjHgSWp6JYWT8GyrBQ8GWlPclHp
   sXC1nLvu0VF8InFMTd4wzYTvG40z4FKEAyqcVsD3O94qIXPyK7hrrN+tj
   rIYwXeTrQizvQ0/BIOqexjOOmFIuUH4iLt6qSCKbmdLoUcPvr7GADbflm
   98ZiAW01w8WMrDIqWiNI25YnxOYhPwDy8LM/QnZhUYmbs7RHxuY/vIsx2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384324366"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="384324366"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 20:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="567425900"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 20:47:42 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/3] virglrenderer: fix CVE-2022-0135
Date: Tue, 13 Sep 2022 11:47:39 +0800
Message-Id: <20220913034739.45165-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220913034739.45165-1-chee.yang.lee@intel.com>
References: <20220913034739.45165-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 03:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170559

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../virglrenderer/CVE-2022-0135.patch         | 100 ++++++++++++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch
new file mode 100644
index 0000000000..4a277bd4d0
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch
@@ -0,0 +1,100 @@
+From 95e581fd181b213c2ed7cdc63f2abc03eaaa77ec Mon Sep 17 00:00:00 2001
+From: Gert Wollny <gert.wollny@collabora.com>
+Date: Tue, 30 Nov 2021 10:17:26 +0100
+Subject: [PATCH] vrend: Add test to resource OOB write and fix it
+
+v2: Also check that no depth != 1 has been send when none is due
+
+Closes: #250
+Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
+Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
+
+https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/95e581fd181b213c2ed7cdc63f2abc03eaaa77ec
+Upstream-Status: Backport
+CVE: CVE-2022-0135
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/vrend_renderer.c        |  3 +++
+ tests/test_fuzzer_formats.c | 43 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/vrend_renderer.c b/src/vrend_renderer.c
+index 28f669727..357b81b20 100644
+--- a/src/vrend_renderer.c
++++ b/src/vrend_renderer.c
+@@ -7833,8 +7833,11 @@ static int vrend_renderer_transfer_write_iov(struct vrend_context *ctx,
+                                           info->box->height) * elsize;
+       if (res->target == GL_TEXTURE_3D ||
+           res->target == GL_TEXTURE_2D_ARRAY ||
++          res->target == GL_TEXTURE_2D_MULTISAMPLE_ARRAY ||
+           res->target == GL_TEXTURE_CUBE_MAP_ARRAY)
+           send_size *= info->box->depth;
++      else if (need_temp && info->box->depth != 1)
++         return EINVAL;
+ 
+       if (need_temp) {
+          data = malloc(send_size);
+diff --git a/tests/test_fuzzer_formats.c b/tests/test_fuzzer_formats.c
+index 59d6fb671..2de9a9a3f 100644
+--- a/tests/test_fuzzer_formats.c
++++ b/tests/test_fuzzer_formats.c
+@@ -957,6 +957,48 @@ static void test_vrend_set_signle_abo_heap_overflow() {
+     virgl_renderer_submit_cmd((void *) cmd, ctx_id, 0xde);
+ }
+ 
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
+@@ -979,6 +1021,7 @@ int main()
+    test_cs_nullpointer_deference();
+    test_vrend_set_signle_abo_heap_overflow();
+ 
++   test_vrend_3d_resource_overflow();
+ 
+    virgl_renderer_context_destroy(ctx_id);
+    virgl_renderer_cleanup(&cookie);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 31c45ef89c..8185d6f7e8 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -13,6 +13,7 @@ SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
 SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://CVE-2022-0135.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.36.1


