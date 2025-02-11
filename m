Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F64C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.3284.1739304566112312808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZP6NsveB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f44e7eae4so101471055ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304565; x=1739909365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGtuDxmq5Z8CjpxN1MmilN/J2vF/sTuBjLVrr6zPWwU=;
        b=ZP6NsveBkrIPzyiDjx3OM3WlX5b7xnzhdULLYt7P2aEoLKa6EMQ2TnrN4fNWHDmA7E
         js63h7SueIJA1Nzi9DcjimIj55SwPnTncOqiVofIQIImrFxWU+7bz6Mq8/lnmdmsjVsL
         7GqPLKOzZAx0ip4sPLYIua8kl8aP4J4MOMWwQRGqlbzI5SUEeZPAbjA1Mj8jWFIWLpj2
         F8bujC6MdnGV+9LuHts8sa09eWO1znGoAa9I/o7PhpLkj//w2u5aMfwGvjLoHUT7fxDK
         lR9JmRGOoohSUZBlvj5Qatm2iS7mJEzT51Ua/iqpmy4gGPx5O6VLw6vZHksRBq14z+/H
         iKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304565; x=1739909365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGtuDxmq5Z8CjpxN1MmilN/J2vF/sTuBjLVrr6zPWwU=;
        b=gJye4u+0pa8+BxtptnPVZh8x5H848qSY/eZQ+wnFHPDD10Vw7SJufEV6gc+1IsVKkZ
         iOcPF23zZ5JpLJP1TG+VaJEUmhwmtV9mMEcuKv6JPmH0xzlDaVFgyGr6ZHkUeu5NBnHF
         kJeQ91hPIaHHaVRZNi2BlnGQzkvl86T0n8omQlpcgRB6tEg6T7ulladYL0pza3DRjpmR
         /51OE2loPHY+bxSraXqM/QS7M0RnOxIwAjLmRO6jrlTdD4z/ggQIET5+nbLiH8kG7JxA
         j6DU3XGa8nTt/50rMY3T8mdQfBWl3igmGFvezDudM+d0ZuPL+qeEioVurkWuyBErGKoN
         WONA==
X-Gm-Message-State: AOJu0YxG6In1xrtigoTTu7JjIxTajFzNLYM2y1mqVR5ufLnjrrKh5ICX
	cmClkPGO+pJUSKJUzO++0DagLqorW2tV0oIP4r4Q1vMjh4TU34D0vD64oz1kjct6KEsKZmj1xmt
	x
X-Gm-Gg: ASbGnctzRnEGvweLKONDaWJ5YSUjyVO21rMk1wkdlL/umNPkZ/ho0Qlk6QdMbVfbzUp
	czs6ykI8FPSBFCefkPKIwgO8dAuB3PHFOOWUTROsbab32rIuKVNALpZY7iZLOAdZpiVU7xenSpS
	qjUwuAQPd7ncmbBuSfsqoJtPPi1DZotFvsJcuB6Fpji6al5Gu1iuUFdQ/L4PcHt50Bk8oYxASXW
	zfdZElCr8FBlgSLFY36H6ScAz8vZzSUV6FdfOHNFU1QtvLXH8yjmSsTXSIqyQUIVCjTq9S2Js2E
	NJl6
X-Google-Smtp-Source: AGHT+IEGvQx6EJQooy6YTm6YSjjx/oppuQjNfoQa3D4/4/D1uaQmB7+RUyFpVJOB/72EfVMBB8hOcg==
X-Received: by 2002:a17:902:e802:b0:216:554a:2127 with SMTP id d9443c01a7336-220bbc647d2mr10435375ad.41.1739304565402;
        Tue, 11 Feb 2025 12:09:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/14] ffmpeg: fix CVE-2024-36616
Date: Tue, 11 Feb 2025 12:09:02 -0800
Message-ID: <fe7df1727d8ea4868091236ddfff7ea862c1ada8.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211172

From: Archana Polampalli <archana.polampalli@windriver.com>

An integer overflow in the component /libavformat/westwood_vqa.c of FFmpeg n6.1.1
allows attackers to cause a denial of service in the application via a crafted VQA file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
new file mode 100644
index 0000000000..3f02c45b33
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
@@ -0,0 +1,35 @@
+From 86f73277bf014e2ce36dd2594f1e0fb8b3bd6661 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 01:00:13 +0100
+Subject: [PATCH] avformat/westwood_vqa: Fix 2g packets
+
+Fixes: signed integer overflow: 2147483424 * 2 cannot be represented in type 'int'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_WSVQA_fuzzer-4576211411795968
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36616
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/86f73277bf014e2ce36dd2594f1e0fb8b3bd6661]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/westwood_vqa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/westwood_vqa.c b/libavformat/westwood_vqa.c
+index 03b2d9e..024f5d3 100644
+--- a/libavformat/westwood_vqa.c
++++ b/libavformat/westwood_vqa.c
+@@ -262,7 +262,7 @@ static int wsvqa_read_packet(AVFormatContext *s,
+                     break;
+                 case SND2_TAG:
+                     /* 2 samples/byte, 1 or 2 samples per frame depending on stereo */
+-                    pkt->duration = (chunk_size * 2) / wsvqa->channels;
++                    pkt->duration = (chunk_size * 2LL) / wsvqa->channels;
+                     break;
+                 }
+                 break;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 5e22fd4080..3a18580e51 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2024-35368.patch \
     file://CVE-2024-35365.patch \
     file://CVE-2024-36613.patch \
+    file://CVE-2024-36616.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


