Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0A8C6FA8E
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 00:11:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.34416.1677283863160303174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 16:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ycZOZGz/;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id m7so1263429lfj.8
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiGGv0NnfIWETT3DrJoEevhUzHxsbvjK3Yil68XSsrU=;
        b=ycZOZGz/Jm35NQ82E2OcyQaqPpJgHq6dD1YzXXaqqHg07q6gKZ+GqQ5etr1HH8V5pB
         k/5CTXXj440MmnNHkucRSqnb2UH+jj+VI7FCcZCTqM5Oun9pLoodGV3KNJ0dwCPE/tJP
         MTvpp/92LlO8LEsbvGK12WS6jZRMYdy0l25VSnQsqLWYMcVMTsFtplOusiSjLM9oossk
         WV8W+K7Ie5A8eMmk8pTL4pe/oiRHWWKPWdePzgF8V0hB1BjLtmEUN7OlEfcKnvGup9AC
         wnE1y+EelM1c6uXTkUYcUuUMRBitm8ThYtBFeHDd7lOYcyfVDzj92si0fJmr9HnMtVx+
         9LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiGGv0NnfIWETT3DrJoEevhUzHxsbvjK3Yil68XSsrU=;
        b=KqudRod9PyhvHyQPDm/WQPwVgD77cSk30GnVvvm8ItVFj0kv6k/1QCM42gsntOXIhi
         Re2WK0bNVJWUX2TzD2yJDQNqdyKGP4+Rsu8qz1KlhYTw58SPP4MFVxxcGvS67QcUd+jw
         m/dcN/uX1dKgZHKe2lmXYAp5dlF2fLfdGIWdgu+2y2OLSeDEcd0E3VQMVs7BPDjN7vmB
         hq8UtqVuYIl7A1FkdLkKsJoC5p5jpfWIxPyYRuqFFZVZp1O/xHeI2frzudG7EISyQDn1
         cToQlxIKUDx7btQaRU3vOefQznyxbqlMyIrgQI7YMc+ireKrcDUd+8vvRJysibSzXYXj
         sZ/g==
X-Gm-Message-State: AO0yUKU0ggPRepRBZcrUDznADOzzWclhNLRviJFWrp+/jFG1IG1qkDp3
	spS+PiKdpe3a14WFuRHiXEXchbIYX5L8PG1K
X-Google-Smtp-Source: AK7set//pKNS0DjLgM3XTEd1GsyVWKZuITsNdWyH0AMzLF0cQx4HtZ6OKN59ABLYqzKsZGyhrJaDZQ==
X-Received: by 2002:a19:ac07:0:b0:4cb:280b:33c9 with SMTP id g7-20020a19ac07000000b004cb280b33c9mr5293325lfc.24.1677283860552;
        Fri, 24 Feb 2023 16:11:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b004cafe989c6dsm38939lfc.91.2023.02.24.16.10.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 16:11:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: fix build failure when vulkan is enabled
Date: Sat, 25 Feb 2023 03:10:56 +0300
Message-Id: <20230225001056.3243739-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177714

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
---
 .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
new file mode 100644
index 000000000000..95bd608a2773
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
index 63abc5d437a8..cccd9f65abf5 100644
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
2.30.2


