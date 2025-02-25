Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A757C021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9043.1740493836943545922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PXF29SHN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c8cf98bbso34252965ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493836; x=1741098636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8Xj/KITlVKL3r5MY5WIyINP5lj9iU1i3ntkfR97Q1o=;
        b=PXF29SHN5670VZr2nwysn8KpJIunE4ntClhO8X5uBAW6T+GClPX5iS7YOKCEKyYxNK
         oJW0phyox0FZz2uR9iKu0cWETNoJwJlorXsMC3zUisu5XXYR3kjNC7gLMM5kvRBDNF/m
         FclpOoGAkMHvHUvXG3LQ1ZAFJu5p2ejECBRWgjsqrsV7y4Q6zNbmeVtloaemRPxwWmSY
         SUyLs0HJyrR68lSTXREroVXZD83ygT+vGZhjo62cW214gLUl3IXP1p9jRL3hn6EGLHTV
         QcCt/mjtAnNNwkSal9eCaUjsYvCgZPTOdZKHWMHVhzUftPrQgwyN1mehpdr/Sc2+gwsr
         3kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493836; x=1741098636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8Xj/KITlVKL3r5MY5WIyINP5lj9iU1i3ntkfR97Q1o=;
        b=v9GgjcDqNnM+SakIuOxVSVEMdwHvTsLpzgYT9B/hgVO2a9HBQowfTiJlv/NV0TKH6H
         66/2PRjgPGgHHJoxXXzN9lbuARtxe9E8a4YgkKu5iohPPN+xAcKH8jbNG4mTxPesCZaG
         v8fEfw09KvQMD6Lmenzy09ivakNwlrcrdul431G58PXGfeJbRqk/UmP89oUWi/FQE9xL
         yAomT5hjbiV7QxRR1THrytznnhuqeXJfsZ6Z1nFxyQ0LKw1MGuPFCqRhRa63bG5VNQH9
         8kwG6rdsYTrWEFO9ciPtrNmfiND03XvzC2VHp6uiD1sLMt8xzRiddj+QJVEg44K9r77G
         y9fw==
X-Gm-Message-State: AOJu0YxNUwPAT3WOqOj+U9GpMl0clfu3zQSmtTINWVRQ1+Z8P+b0/uAR
	2Sm9mQAyaOV0xJVLuPy3KaBur8etbpZwMlID0oxc05/rdtGtULKRiXx6iZM9AiIw1ELvSiMGGTn
	z
X-Gm-Gg: ASbGncs7gLcoPdTacY6GUY/T1HrpM1heY5HZkohcbg6xHg4qfPuW2lQezqD03yZmhJr
	TjV4Pf0RIyuJL0n7/w6fw5RJAa4auk0nsxwiQL1eaK+WWXrplUvuhd4NTimjKfa6R8MDjxEglPo
	tW/6tNTWC7xzkGtsL1xJNxa7lo58oTNyOzDHcA80IT0Y+xC1S23ybZOMVvHq44YV7u2ZKxk/GWB
	UdjpHJBHVQRULjLQTJDVsw8+ruhI3zHeSkTrQbpcgqAi+GKD+73yAy3KoWnOOH89wcCasVYbKOZ
	pHAS/jUlciXuxeT34w==
X-Google-Smtp-Source: AGHT+IE3IkFsNWdmedX3fmfj58sucEWBaJaRtdEe7Lp864m5BiGXPzvho+pfPQ4yoietGcQVoWpLug==
X-Received: by 2002:a05:6a00:2e05:b0:730:8a5b:6e61 with SMTP id d2e1a72fcca58-73426c908bcmr28635544b3a.2.1740493836105;
        Tue, 25 Feb 2025 06:30:36 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/22] ffmpeg: fix CVE-2024-35369
Date: Tue, 25 Feb 2025 06:29:55 -0800
Message-ID: <3efef582892a5a9286041837098b80aa59d1b688.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211905

From: Archana Polampalli <archana.polampalli@windriver.com>

In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module,
a potential security vulnerability exists due to insufficient validation of
certain parameters when parsing Speex codec extradata. This vulnerability
could lead to integer overflow conditions, potentially resulting in undefined
behavior or crashes during the decoding process.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
new file mode 100644
index 0000000000..b408ee2edc
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
@@ -0,0 +1,38 @@
+From 0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Sat, 17 Feb 2024 09:45:57 -0300
+Subject: [PATCH] avcodec/speexdec: further check for sane frame_size
+ values
+
+Prevent potential integer overflows.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-35369
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 5b016df..f1f739a 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1419,9 +1419,10 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+         return AVERROR_INVALIDDATA;
+     s->bitrate = bytestream_get_le32(&buf);
+     s->frame_size = bytestream_get_le32(&buf);
+-    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0))
++    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0) ||
++        s->frame_size >     INT32_MAX >> (s->mode > 0))
+         return AVERROR_INVALIDDATA;
+-    s->frame_size *= 1 + (s->mode > 0);
++    s->frame_size <<= (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 2048e51962..2173105fd3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36617.patch \
            file://CVE-2024-36618.patch \
            file://CVE-2024-28661.patch \
+           file://CVE-2024-35369.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


