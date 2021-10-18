Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897B9C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 16:21:53 +0000 (UTC)
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web12.39123.1634574111296620199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 09:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=B5ejolcb;
 spf=pass (domain: igalia.com, ip: 178.60.130.6,
 mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=fT8DmkjD7l/QbR02AnNU+iXC9LxmO7rdhRoGe0ZNinM=;
	b=B5ejolcbQ11TskelYAucSMeE8RAXv+sS7MrPGEZ3+kcEuokcNKwOCob7bptAP0JRZSFO2+4NgM6KLF/bDeYXP9rGE3Vh0Bz9lo5Cj+LiSM+GdzGXNyGIU7NthyAHWnl/DKhKz6gUvhnNsFhhRK8SIhYu48XKwvkFFlbicHGgRUAa1YFCjbjkSJ57QYoeSIVTMlyx2G0KCr928joO56zHFEo/Hoi2yQUjFIxMiBTEYVwjGNxWfroJyUE9peqJ/+ipVTE7yMTYF7BIaCG+w3UE0huV27BsFWoEf0RmArkwFHgz/7RYUyDMuqxlTIEpc9TVQmGG26bVX0ybDvVfLUa/OA==;
Received: from 164.25.165.83.dynamic.reverse-mundo-r.com ([83.165.25.164]
 helo=golpe.local.igalia.com)
	by fanzine.igalia.com with esmtpsa
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1mcVOX-0001Wx-Hc; Mon, 18 Oct 2021 18:21:49 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [OE-core][hardknott][PATCH v4] mesa: gallium/dri Make YUV formats
 we're going to emulate external-only
Date: Mon, 18 Oct 2021 18:21:38 +0200
Message-Id: <20211018162138.238330-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <16AF2C02E4FB2A82.24927@lists.openembedded.org>
References: <16AF2C02E4FB2A82.24927@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 16:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157085

This patch fixes the red label issues on video for Raspberry 4-64 Mesa VC4
driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver.

Issue was originally reported in meta-webkit [1] and later contributed
in Mesa [2] where it was already merged in master.

[1] https://github.com/Igalia/meta-webkit/issues/185
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 ...-YUV-formats-we-re-going-to-emulate-.patch | 52 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch b/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch
new file mode 100644
index 0000000000..7436480238
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch
@@ -0,0 +1,52 @@
+commit 8bd63cd28939d79d6681943b840627eaa3614ee4
+Author: Pablo Saavedra <psaavedra@igalia.com>
+Date:   Mon Oct 18 15:48:42 2021 +0200
+
+    gallium/dri: Make YUV formats we're going to emulate external-only.
+    
+    If we're going to have to bind them as separate planes with colorspace
+    conversion for sampling on the frontend, then we need to report that
+    they're only for external-image samplers, otherwise the lowering won't be
+    applied.
+    
+    Fixes: 4e3a7dcf ("gallium: enable EGL_EXT_image_dma_buf_import_modifiers unconditionally")
+    Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
+    Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038>
+
+Upstream-Status: Accepted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038]
+
+diff --git a/src/gallium/frontends/dri/dri2.c b/src/gallium/frontends/dri/dri2.c
+index b0c0d7e..ef8df5a 100644
+--- a/src/gallium/frontends/dri/dri2.c
++++ b/src/gallium/frontends/dri/dri2.c
+@@ -1445,16 +1445,24 @@ dri2_query_dma_buf_modifiers(__DRIscreen *_screen, int fourcc, int max,
+ 
+    format = map->pipe_format;
+ 
++   bool native_sampling = pscreen->is_format_supported(pscreen, format, screen->target, 0, 0,
++                                                       PIPE_BIND_SAMPLER_VIEW);
+    if (pscreen->is_format_supported(pscreen, format, screen->target, 0, 0,
+-                                     PIPE_BIND_RENDER_TARGET) ||
+-        pscreen->is_format_supported(pscreen, format, screen->target, 0, 0,
+-                                     PIPE_BIND_SAMPLER_VIEW) ||
+-        dri2_yuv_dma_buf_supported(screen, map)) {
+-      if (pscreen->query_dmabuf_modifiers != NULL)
++                                    PIPE_BIND_RENDER_TARGET) ||
++       native_sampling ||
++       dri2_yuv_dma_buf_supported(screen, map))  {
++      if (pscreen->query_dmabuf_modifiers != NULL) {
+          pscreen->query_dmabuf_modifiers(pscreen, format, max, modifiers,
+                                          external_only, count);
+-      else
++         if (!native_sampling && external_only) {
++            /* To support it using YUV lowering, we need it to be samplerExternalOES.
++             */
++            for (int i = 0; i < *count; i++)
++               external_only[i] = true;
++         }
++      } else {
+          *count = 0;
++      }
+       return true;
+    }
+    return false;
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a85f94c75e..7cba03cfcf 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch \
            "
 
 SRC_URI[sha256sum] = "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
-- 
2.30.2


