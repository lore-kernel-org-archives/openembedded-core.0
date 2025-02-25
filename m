Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FFAC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9041.1740493835159781588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vjqSiZCV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-221206dbd7eso118032055ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493834; x=1741098634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgnFRWm0vs/xm16bXeKCEfA8DsPGwmdNGZLw40TAkNo=;
        b=vjqSiZCVkyQlHjB4z5qx3TxdMbo3bGe3dcEuLAV8SPLx8DV9zVk72aVQp+4i4A12rS
         qYuK/gDgfPh80L8tQ1olzhNb2cQKdyOkkJqNy7uvMz1ezQZTscL+UXyLWKZdZodRE4XK
         W7mw/nJIkm65jZ4R8wAHqrEfIeLnsEluQkm+zByuCMGsfUgrOaqEVrvsM+dwh53KYaOC
         k2ccAxp09EcHC21E6fx/tShVUa/y16kVrhOxYOP5VMO7p15NJBgvoofOCh6E1cfH22sZ
         ZCOskw3wBEMhLtMVVNevluuhYrVUkZD+5YESRp+Ayi53IO3ibbbobj2g4kLzpXcGDwWs
         yYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493834; x=1741098634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgnFRWm0vs/xm16bXeKCEfA8DsPGwmdNGZLw40TAkNo=;
        b=wIyGaqTsSTHD3xOfIdo7D4SgIW4a4eAcqwo8Aqx/Mh1GarYkDQFLW56/7s+3u9Ze9L
         M+ITN/2nY6b7h8H+vYl3ORGIQkkYTrRSSwB65KAO8ufNfRd09+4ykayXqwv5dJngI8qc
         h0e6tgJy1FTQ04HitEAe53IeHNLX/yCV/569C//oIthma3TktBqsit8HPKR7UJ6TEgtC
         mpJ04WHatDNvNZGG4/cBDhngpj+/2JIBfZGLAN0XpGBS5SNAf0vI92MttaHFAy09A50a
         d2TUmcmIN8aZVyAoUfeCi36LpmRqWpFLssJ67t/UMpCyakOTXKOb40YU34z46a/1Vj4M
         LSqw==
X-Gm-Message-State: AOJu0YxqhoKy9b0WsWaW90yyntcgBJq32W8NH8LO6yN6ivED837p4SLP
	DQIJDmdbtWotPiue+Pl6IQPFe8WQhMTNdtEo6qEW9KQ4k3xpuj427epk7+bRN/YxBfBVG3O9yM1
	r
X-Gm-Gg: ASbGnctZUL2BMC7GyYRTkSWS+qQAauUFSgWTVuwznUuO0cyxAGIw0GTI7zAUTbS9vo3
	a6zrHFnQDgVDrPysVWXXhhslhmlv3tNjknZiGCMTdJLIiXW9ZSu/4hiWm846TzJcHn7jQ/Oy4Jo
	pSK2VRUoGR6OSNO6sC1V0HlU9MajArKwocuxDw+E66kZ2Nj/wmzrqQOlmxlUjDCxM8Mlze93x5s
	iUjirgdWu3vrcXNVSRW6paOwEbv4W5g6Om/knw+isqoKU1dHBSALX2xyOZGlcxjgZnezdRaGTgr
	sBSdfoebWndjyjpS1A==
X-Google-Smtp-Source: AGHT+IEvELaHcxHmIv2O8fJIBBM4RVMpNQP+oGMRaXmLSfM+W7BMX1P9PQdBBf4YJYGepdIz3aBRDg==
X-Received: by 2002:a05:6a21:7889:b0:1ee:8a68:f83e with SMTP id adf61e73a8af0-1eef3ca3ee5mr32453122637.20.1740493834396;
        Tue, 25 Feb 2025 06:30:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/22] ffmpeg: fix CVE-2024-28661
Date: Tue, 25 Feb 2025 06:29:54 -0800
Message-ID: <cbe8929662f8ea873a3686517516bc5754a3cd18.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211904

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 40 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
new file mode 100644
index 0000000000..fd5009bccc
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
@@ -0,0 +1,40 @@
+From 66b50445cb36cf6adb49c2397362509aedb42c71 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 16 Feb 2024 11:17:13 -0300
+Subject: [PATCH] avcodec/speexdec: check for sane frame_size values
+
+Regression since ab39cc36c72bb73318bb911acb66873de850a107.
+
+Fixes heap buffer overflows
+Fixes ticket #10866
+
+Reported-by: sploitem <sploitem@gmail.com>
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-28661
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/66b50445cb36cf6adb49c2397362509aedb42c71]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index ee95417..5b016df 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1419,8 +1419,9 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+         return AVERROR_INVALIDDATA;
+     s->bitrate = bytestream_get_le32(&buf);
+     s->frame_size = bytestream_get_le32(&buf);
+-    if (s->frame_size < NB_FRAME_SIZE << s->mode)
++    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0))
+         return AVERROR_INVALIDDATA;
++    s->frame_size *= 1 + (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index aa317513a1..2048e51962 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36616.patch \
            file://CVE-2024-36617.patch \
            file://CVE-2024-36618.patch \
+           file://CVE-2024-28661.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


