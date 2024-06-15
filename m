Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5A2C27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 11:12:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.10613.1718449920723799450
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 04:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=StM7hClb;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec0f3b9bb8so16088231fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 04:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718449919; x=1719054719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BP245e6JdoTh9TQLpjKIXgKZg+5q1UCvH3Lbxw2Xga4=;
        b=StM7hClbwceGAnyey3InsNraMWHM0hCa9uNYS2u+YmekenkpFkAuIKZReMUczKK5MV
         vvqCwpuWW9h7/832tBM54MAIhMzFFct4H1LzGsJItb4235BIn4uB59Y0UQbnWYJGu/+r
         z9+RJAgD829bhi2h3jl8PWjxpTRRpOyl7PGyih8jBxq6l39Xmo7KDnTP28y9O0SbcwZO
         dbpKYcIkL+j/Ov9Rwz96zIWNRjYHq3ZET3N+mQafTEwxhhsWGlDwdeo30L7IiX+MTIRk
         Z5ATuL+YElXIIzUO3+11+7+CxxpsGFCTdDXIQNSAJtbzNhTvC4IKLmmrhSug20EHOGwb
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718449919; x=1719054719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP245e6JdoTh9TQLpjKIXgKZg+5q1UCvH3Lbxw2Xga4=;
        b=KdWcsCqL8DNW4sli1nG7fUFZ7MTaHw7RIv1Vs+pGUA7QwIGkMmO0XkW/Rg2CaI7XUe
         VNDxLF4TuWjQrn7PRvJOnvAExNkUS/nOTZk9s0vdGynXB5L4ST15vr8xdlq6it8lmmaf
         HTblDhQR1Q7HmyWE/mQPDjt2ksGLLHg9SM+uB2ys0RQSQnW41Vnwh+cDmAYJNexnuLNm
         kzg8R5PaqGX24EnvVkgvB/UTtFl1Cif6P0ArkWQ0S/Wpt1EAdGdLIm69c+7v20iXjfHq
         tntkzww7yF6zlklEWzKnOXl67vtFdu0pU8OJf20hHNDCQzdBAbNdSP1+OVtoc3bNlTKy
         5ltA==
X-Gm-Message-State: AOJu0Yw9JhiBK/YUtkCb4WP0IRtEpZMlo2ypTxfgsp9MudwafkSezRrn
	u3ga6m89Ht5Ly+6MZtudFiJp4AEcIoIRyFtohjFN31O26Sj6C5xIDNdjxhowjZCIQqR0O/fqZov
	8Sg0=
X-Google-Smtp-Source: AGHT+IFn6IwJtPkDhRhCKCt10bvlpnjRLwIppw/ZT7+Gm+HLomh2KS/kCVtnookqPMGvIqD8QZAowg==
X-Received: by 2002:a2e:964c:0:b0:2ea:ea79:4fa6 with SMTP id 38308e7fff4ca-2ec0e6004fbmr36567621fa.36.1718449918144;
        Sat, 15 Jun 2024 04:11:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78110sm7655251fa.90.2024.06.15.04.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 04:11:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: backport patch to fix errors with GCC 14
Date: Sat, 15 Jun 2024 14:11:57 +0300
Message-Id: <20240615111157.1792081-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 11:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200667

On ARMv7 compilation of ffmpeg breaks if Vulkan support is enabled.
Backport a patch from the trunk to fix compilation issues:

| src/libavcodec/vulkan_av1.c: In function 'vk_av1_create_params':
| src/libavcodec/vulkan_av1.c:214:43: error: initialization of 'long long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
|   214 |         .videoSessionParametersTemplate = NULL,
|       |                                           ^~~~
| src/libavcodec/vulkan_av1.c:214:43: note: (near initialization for '(anonymous).videoSessionParametersTemplate')
| make: *** [/oe/build/tmp-rpb_wayland-glibc/work/armv7at2hf-neon-linaro-linux-gnueabi/ffmpeg/6.1.1/ffmpeg-6.1.1/ffbuild/common.mak:81: libavcodec/vulkan_av1.o] Error 1
| make: *** Waiting for unfinished jobs....
| src/libavcodec/vulkan_decode.c: In function 'ff_vk_decode_prepare_frame':
| src/libavcodec/vulkan_decode.c:191:26: error: assignment to 'VkImageView' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
|   191 |     vkpic->img_view_ref  = NULL;
|       |                          ^
| src/libavcodec/vulkan_decode.c:192:26: error: assignment to 'VkImageView' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
|   192 |     vkpic->img_view_out  = NULL;
|       |                          ^
| src/libavcodec/vulkan_decode.c:193:26: error: assignment to 'VkImageView' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
|   193 |     vkpic->img_view_dest = NULL;
|       |                          ^
| make: *** [/oe/build/tmp-rpb_wayland-glibc/work/armv7at2hf-neon-linaro-linux-gnueabi/ffmpeg/6.1.1/ffmpeg-6.1.1/ffbuild/common.mak:81: libavcodec/vulkan_decode.o] Error 1

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../ffmpeg/ffmpeg/vulkan_fix_gcc14.patch      | 102 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch
new file mode 100644
index 000000000000..960d34943ef1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch
@@ -0,0 +1,102 @@
+From 2f24f10d9cf34ddce274496c4daa73f732d370c1 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Wed, 20 Dec 2023 12:32:43 +0000
+Subject: [PATCH] libavcodec: fix -Wint-conversion in vulkan
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+FIx warnings (soon to be errors in GCC 14, already so in Clang 15):
+```
+src/libavcodec/vulkan_av1.c: In function ‘vk_av1_create_params’:
+src/libavcodec/vulkan_av1.c:183:43: error: initialization of ‘long long unsigned int’ from ‘void *’ makes integer from pointer without a cast [-Wint-conversion]
+  183 |         .videoSessionParametersTemplate = NULL,
+      |                                           ^~~~
+src/libavcodec/vulkan_av1.c:183:43: note: (near initialization for ‘(anonymous).videoSessionParametersTemplate’)
+```
+
+Use Vulkan's VK_NULL_HANDLE instead of bare NULL.
+
+Fix Trac ticket #10724.
+
+Was reported downstream in Gentoo at https://bugs.gentoo.org/919067.
+
+Signed-off-by: Sam James <sam@gentoo.org>
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/2f24f10d9cf34ddce274496c4daa73f732d370c1]
+---
+ libavcodec/vulkan_av1.c    | 2 +-
+ libavcodec/vulkan_decode.c | 6 +++---
+ libavcodec/vulkan_h264.c   | 2 +-
+ libavcodec/vulkan_hevc.c   | 2 +-
+ libavcodec/vulkan_video.c  | 2 +-
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/libavcodec/vulkan_av1.c b/libavcodec/vulkan_av1.c
+index 4998bf7ebc55f..9730e4b08dd40 100644
+--- a/libavcodec/vulkan_av1.c
++++ b/libavcodec/vulkan_av1.c
+@@ -180,7 +180,7 @@ static int vk_av1_create_params(AVCodecContext *avctx, AVBufferRef **buf)
+         .sType = VK_STRUCTURE_TYPE_VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR,
+         .pNext = &av1_params,
+         .videoSession = ctx->common.session,
+-        .videoSessionParametersTemplate = NULL,
++        .videoSessionParametersTemplate = VK_NULL_HANDLE,
+     };
+ 
+     err = ff_vk_decode_create_params(buf, avctx, ctx, &session_params_create);
+diff --git a/libavcodec/vulkan_decode.c b/libavcodec/vulkan_decode.c
+index a89d84fcaa972..fdbcbb450a1e0 100644
+--- a/libavcodec/vulkan_decode.c
++++ b/libavcodec/vulkan_decode.c
+@@ -188,9 +188,9 @@ int ff_vk_decode_prepare_frame(FFVulkanDecodeContext *dec, AVFrame *pic,
+         return 0;
+ 
+     vkpic->dpb_frame     = NULL;
+-    vkpic->img_view_ref  = NULL;
+-    vkpic->img_view_out  = NULL;
+-    vkpic->img_view_dest = NULL;
++    vkpic->img_view_ref  = VK_NULL_HANDLE;
++    vkpic->img_view_out  = VK_NULL_HANDLE;
++    vkpic->img_view_dest = VK_NULL_HANDLE;
+ 
+     vkpic->destroy_image_view = vk->DestroyImageView;
+     vkpic->wait_semaphores = vk->WaitSemaphores;
+diff --git a/libavcodec/vulkan_h264.c b/libavcodec/vulkan_h264.c
+index e727aafb162d3..39c123ddca57e 100644
+--- a/libavcodec/vulkan_h264.c
++++ b/libavcodec/vulkan_h264.c
+@@ -315,7 +315,7 @@ static int vk_h264_create_params(AVCodecContext *avctx, AVBufferRef **buf)
+         .sType = VK_STRUCTURE_TYPE_VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR,
+         .pNext = &h264_params,
+         .videoSession = ctx->common.session,
+-        .videoSessionParametersTemplate = NULL,
++        .videoSessionParametersTemplate = VK_NULL_HANDLE,
+     };
+ 
+     /* SPS list */
+diff --git a/libavcodec/vulkan_hevc.c b/libavcodec/vulkan_hevc.c
+index 99fdcf3b45839..033172cbd6958 100644
+--- a/libavcodec/vulkan_hevc.c
++++ b/libavcodec/vulkan_hevc.c
+@@ -653,7 +653,7 @@ static int vk_hevc_create_params(AVCodecContext *avctx, AVBufferRef **buf)
+         .sType = VK_STRUCTURE_TYPE_VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR,
+         .pNext = &h265_params,
+         .videoSession = ctx->common.session,
+-        .videoSessionParametersTemplate = NULL,
++        .videoSessionParametersTemplate = VK_NULL_HANDLE,
+     };
+ 
+     HEVCHeaderSet *hdr;
+diff --git a/libavcodec/vulkan_video.c b/libavcodec/vulkan_video.c
+index 5fa8292b28eaf..fb20315db4bbf 100644
+--- a/libavcodec/vulkan_video.c
++++ b/libavcodec/vulkan_video.c
+@@ -287,7 +287,7 @@ av_cold void ff_vk_video_common_uninit(FFVulkanContext *s,
+     if (common->session) {
+         vk->DestroyVideoSessionKHR(s->hwctx->act_dev, common->session,
+                                    s->hwctx->alloc);
+-        common->session = NULL;
++        common->session = VK_NULL_HANDLE;
+     }
+ 
+     if (common->nb_mem && common->mem)
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index c0bce2db7a77..dea1f545804e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     https://www.ffmpeg.org/releases/${BP}.tar.xz \
     file://av1_ordering_info.patch \
     file://vulkan_av1_stable_API.patch \
+    file://vulkan_fix_gcc14.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.39.2


