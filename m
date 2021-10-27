Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CD7C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:02 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456715"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456715"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617002"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:16:59 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/36] mesa: gallium/dri Make YUV formats we're
 going to emulate external-only
Date: Wed, 27 Oct 2021 23:16:11 +0800
Message-Id: 
 <09f6038fbf479f8047fa566ff6b50bffc7a47f99.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157519

From: Pablo Saavedra Rodi?o <psaavedra@igalia.com>

This patch fixes the red label issues on video for Raspberry 4-64 Mesa VC4
driver and for iMX53 Adreno A200 GPU using the Mesa Freedreno driver.

Issue was originally reported in meta-webkit [1] and later contributed
in Mesa [2] where it was already merged in master.

[1] https://github.com/Igalia/meta-webkit/issues/185
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-YUV-formats-we-re-going-to-emulate-.patch | 52 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch b/meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch
new file mode 100644
index 0000000000..899450eb2a
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038]
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
2.31.1


