Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3EAC30659
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.4385.1719778129520809601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WvqujiTL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7020666ed0cso715515a34.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778129; x=1720382929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzEGq7U+sSJ7N4zMIv2+eq/+IZHrhardH0BJPJyhmHg=;
        b=WvqujiTLHhpiMROMOZ/1yKcHp/xkBgA0g89Mo1xoYNvl6VXwqEcU++Zp5aSRSDaUOZ
         5G0Zq/OW0a77UcA0iCP6dz4KU+mmq61Z8uVBybffqY9S1vGyeOCNfXWlu2eHNriCB9oz
         slpylMPuEv49kpIN21SxSMsR7w1NEglzHptTh/VnBzTNh6yMM4NspWfjYcuCkvPYwxdc
         pZohcw/r4ANn6x9exPDe0igtPUX6dmRKsO5KH0/mUdLWzQWYKPxfnFCYEcEDrjLSSxBM
         XGXC8dL/1SjNoA7BffL5o1+kWX8vJlZeDqf/XptfI/hm232Lbtq9CvXmF27TPvlNcASy
         d33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778129; x=1720382929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzEGq7U+sSJ7N4zMIv2+eq/+IZHrhardH0BJPJyhmHg=;
        b=VIlfXOXWiShKQFNqDZnn0TRiCubH+zMAOPAfKJE5A/Ibvgoi2l0brX3dai8UixKbO7
         GRzoSoSE6mRZhfyxwDV4b8dMqdu+ZkpiF2jUQD2D7AF8Vszy59gMbno44DH27/nSTPs2
         oTPX5MuAm5AoxEDGXKVmh4+OFhwkbhyELEgmGs9507CI1qhJfHqeypkDHDV+svlhoyue
         W9V/CN9l6Ta3ttYNlox+UzK+Z09wE+MEx4ZUNWEt56zJkHVON9CK5Xl6eQ9LvyTTkSUG
         xCsD0b4RqXrWxrdtiPNsNpEqc1XocPOUW5XYJZfO/PW+4+zE1BqESHv6T0TIrNZ0K6rs
         JQbw==
X-Gm-Message-State: AOJu0YwsF3gQailTQUviyMGGjqz7Wws32521BBe3Mjuzx05Lr2RH2TEz
	YTx1EtkXB3BSaFXaeJAOcHREko/Sl+uOXAuWCyCcbVaxsYlOPRVJLyLhIrFUC/5uA3WfAHk9M7E
	icfs=
X-Google-Smtp-Source: AGHT+IEuS7XkwdCm1//8SIxjz7YuvV7RbYDecXF/onz0cJariC/intj90UxrT6xwVUtWOuMZ7qGMVw==
X-Received: by 2002:a9d:6455:0:b0:700:cec9:d6f5 with SMTP id 46e09a7af769-702076fa4a4mr4894717a34.38.1719778128588;
        Sun, 30 Jun 2024 13:08:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/35] ffmpeg: backport patch to fix errors with GCC 14
Date: Sun, 30 Jun 2024 13:07:42 -0700
Message-Id: <6b3ca9f5745c438de74ef4e2e041ee95583b8dc6.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201267

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52001cabd021b7c856acf426b668b99a72561de0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/vulkan_fix_gcc14.patch      | 102 ++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/vulkan_fix_gcc14.patch
new file mode 100644
index 0000000000..960d34943e
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
index c0bce2db7a..dea1f54580 100644
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
2.34.1


