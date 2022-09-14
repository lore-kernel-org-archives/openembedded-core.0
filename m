Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447ABC54EE9
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.1750.1663122377134087184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dPtS5zj0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id k21so3166283pls.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=QUpPtvLmF3/Dr/kRMK7dIZ+jsxQs9UeaIPEh978q5EQ=;
        b=dPtS5zj0zNo8guFL3srTm2SlCw3j76gqtEVNfApdKzH+l742OOdsjMGPEIpVMzOi8z
         5t5H6umRpOC+ntmJ/34mdWVgLSn2HKVyWsPRz41PzXZ5RmV8zoqXsYoMeCB25Qk6R3Y9
         FuAJajypSWYSvSEoMtepRBqPGPjar5dNKDKXLa8kXwkN40/ev1DiuLY/jjmiUu6z15Vw
         JYMgV+TlNM+04EYPenp9RVdia/TbYwb4XYEt7ytd4x+d96JjeRerzbXoGieJeUE0hqxh
         GDekMA4yePbRGapFO4OOvH8fLMSaRiJJXb1XIIktUumQaM0oFV7GpaSrGAtXP/dIDMje
         bZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QUpPtvLmF3/Dr/kRMK7dIZ+jsxQs9UeaIPEh978q5EQ=;
        b=OVebAhaNWM1YOK+9WEVpufHOw+Rus+qZbJxDc+t6rMxsYpPiQ9PqX68MEq1yzhCKLY
         iK+QrILojUgI+TOKR11RIJfTaM+kaWSDLX89svjj/YDXEfCv47rJibR3HGpKZWlj8wTp
         P/R+PrpE1zKO6ggBPFpvsjVepbly6CO6UhGcHGluNZYS8kRlb/1ZB242GmzO68eeGdgE
         /3An1ZYkRUYJP1qWfh6qFAFyqchArbI+RWs1nqLPM+3efUDMuE9q0aAMTPWLxBgaE/+J
         RRbJ6Q9xSEp1JRiDCb/afrvsMtOUcONT7vtsi5VxI2P3RmaI2zUDquBAJfQf4CAZvON3
         ExwA==
X-Gm-Message-State: ACrzQf18Kz/LEyU4CGj7bawHuUQH68uqiQfWC4BEDhpSsmSyYQNaXV4O
	pgg1+nlmASRA1HHZQX7uFVmx4kH3mxoRjQcC
X-Google-Smtp-Source: 
 AMsMyM4fbyAJENJ2D5PxTCqTZw/+uJYOLBvUVNlwusImWiRYwjc7wFCYyMw2Lz9RRB7nl5FbVLpSSA==
X-Received: by 2002:a17:90a:8c8e:b0:202:883b:2644 with SMTP id
 b14-20020a17090a8c8e00b00202883b2644mr2282840pjo.89.1663122376177;
        Tue, 13 Sep 2022 19:26:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] virglrenderer: fix CVE-2022-0135
Date: Tue, 13 Sep 2022 16:25:16 -1000
Message-Id: 
 <5eea0b24c6fcd90aab0737c7a3f7431535a02890.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170624

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


