Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B44AC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.5728.1678402721652551172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tf48U63f;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so7892357pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soWiDCXuWHJrdHQREE9J+Y3CHsnPBPa1uuB+FvPWzlc=;
        b=tf48U63fMefWYSlgUpyBknwrtRL6915372ijnk6k0xQP1SOHinhhYQbsGsbWkDQwdb
         CJ9cMOjs58Y/9SBb5pch0XkoiMpOy4TR0g6GMcKHy0fql74chqM7NSZvzdANG/ilaNVo
         bWuK4O83JB51fYXneAwWyDDf0u/gd0LBsldaCgvdkArJ0/Q3VE7HjFmwSpbapomUj7Fz
         lY3UUUu925UNI7SU1jpr1+i/SVC42ZdEONscvfZeQHcFOJpD7Mha442q6gG8oicMEsNZ
         Us4fezAm0QuDrYNbuSHSqmYK7DzND+ZnRkaXkNa3bzCMJ/3wCb08O46jyhNfw2YzA6JY
         ag8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soWiDCXuWHJrdHQREE9J+Y3CHsnPBPa1uuB+FvPWzlc=;
        b=r0Y5dS0wG0DKbNx2ECPAtfOKdn4ON5pol+WOgVe0WH3EXNProkc95PJUFSZRsoK43t
         RTskdX6d6zdBWmS9+2321+wwUlmavLs8nA8wzS/XKGEkb3X2cLPy40i2TSMmCO1pdFNg
         U7OftAN4rG3EPjRPJgveGj5eKUzURs6fB8WSlOitWB+z0FiykCGcabkXooW43JXV8Q6q
         msiuBMhdo1yQNF3u52eDoMvCrzdrRnIoL9iahYiP+BLFF77APIhVYSNEG3WHUN1bw4rQ
         vsYl7CeC4EtVlrE48SujYPYaBcPCtiY9ANTJxLFKHmKd1Kk0S4ciLed3EPd4aTPhyAd+
         +P1w==
X-Gm-Message-State: AO0yUKX6CX/cuRmKJxywPeWQch06Inh6IY9d0QX8zwE9Ihbhz7P7D87c
	h+OJSZiKFVME54mYMVhVgCQvwLtRVMjsKdlKEMM=
X-Google-Smtp-Source: AK7set9H8A/TdZrNb/csGGJYEQfPh/MaLLYmZOnznreDbE4fX1n1cLeAUlBhivK21qm59lAnhXScDA==
X-Received: by 2002:a05:6a20:7283:b0:cc:f047:afb4 with SMTP id o3-20020a056a20728300b000ccf047afb4mr25661311pzk.37.1678402720587;
        Thu, 09 Mar 2023 14:58:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/27] ffmpeg: fix build failure when vulkan is enabled
Date: Thu,  9 Mar 2023 12:57:51 -1000
Message-Id: <52a87317f3451a3cd169afd92708611c4221ab87.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178289

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

The patch fixes the following errors observed when building ffmpeg in
vulkan-enabled distros:

| src/libavutil/hwcontext_vulkan.c:363:7: error: 'VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME' undeclared here (not in a function); did you mean 'VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME'?
|   363 |     { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME
| src/libavutil/hwcontext_vulkan.c:364:7: error: 'VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME' undeclared here (not in a function); did you mean 'VK_EXT_VIDEO_ENCODE_H265_EXTENSION_NAME'?
|   364 |     { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VK_EXT_VIDEO_ENCODE_H265_EXTENSION_NAME

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b16c8696be9d56edb5ff77210abfff9a784fad89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
new file mode 100644
index 0000000000..95bd608a27
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
@@ -0,0 +1,34 @@
+From: Lynne <dev@lynne.ee>
+Date: Sun, 25 Dec 2022 00:03:30 +0000 (+0100)
+Subject: hwcontext_vulkan: remove optional encode/decode extensions from the list
+X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690
+
+hwcontext_vulkan: remove optional encode/decode extensions from the list
+
+They're not currently used, so they don't need to be there.
+Vulkan stabilized the decode extensions less than a week ago, and their
+name prefixes were changed from EXT to KHR. It's a bit too soon to be
+depending on it, so rather than bumping, just remove these for now.
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb0455d64690]
+---
+
+diff --git a/libavutil/hwcontext_vulkan.c b/libavutil/hwcontext_vulkan.c
+index f1db1c7291..2a9b5f4aac 100644
+--- a/libavutil/hwcontext_vulkan.c
++++ b/libavutil/hwcontext_vulkan.c
+@@ -358,14 +358,6 @@ static const VulkanOptExtension optional_device_exts[] = {
+     { VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME,            FF_VK_EXT_EXTERNAL_WIN32_MEMORY  },
+     { VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,         FF_VK_EXT_EXTERNAL_WIN32_SEM     },
+ #endif
+-
+-    /* Video encoding/decoding */
+-    { VK_KHR_VIDEO_QUEUE_EXTENSION_NAME,                      FF_VK_EXT_NO_FLAG                },
+-    { VK_KHR_VIDEO_DECODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
+-    { VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT_NO_FLAG                },
+-    { VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
+-    { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
+-    { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_EXT_NO_FLAG                },
+ };
+ 
+ /* Converts return values to strings */
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 7970740254..2ab34166df 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
            file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
+           file://ffmpeg-fix-vulkan.patch \
            "
 
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
-- 
2.34.1


