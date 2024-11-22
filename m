Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94710E6919E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.35407.1732310820935523024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VNnPZbr2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso1962485b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310820; x=1732915620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdbFLgcMW63uIqMW9M0uvs49pAc6eSTMO+jauY5mKmw=;
        b=VNnPZbr2MDtvr0yfJyP0Z4vBRQB+g5vUjyXKZDRNEmn0bxevQSfP0QaZXKybSiczYM
         THrh/QBYHWOhNeiMc8bh8jszoPBbnLbWc2+xRg9u2zaJn4Wb7bqyyJscsL+v7a/1HlDO
         kqWANz45xXH2sxEDXYSpPX9B75XQ3KnS9fPeybO1FWq3Ib6yK+RElRgLMzXuA5jJ38U+
         ai7zQ6VhLDT9giqykA2OE8zoNKdSsN7/EL/Q5HW6mBlna2LsUaFwQu8B+PLG3WS5CRDV
         FCVgdaXtJE5t6PjLPQGiQb2RyVsGAQ62x6qXdpoxJZDILCa2xmFMlGWNmvJikgK8BQBU
         gU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310820; x=1732915620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdbFLgcMW63uIqMW9M0uvs49pAc6eSTMO+jauY5mKmw=;
        b=C8OyzqDqBa1orczyurkJvbiToSrbsSotQ6N+iWi8WGdlgq24o0otT7FlSfdeVWDsVp
         Jwxj3aSGoi1xOH55K+gzPChdNlcsS0UzE28fEO8c5JID+T0S7pWo4huJpRb95GYKfcrb
         0mJ+Raf5v+juHWdt+8L2i55DQmabW/EbOfEYT3xE0yNT8akdzUYl2k60Ed2N5WtQs+eP
         oyR7lpvEJdGPoZBvXZfyaUyJvqeDU7BsqiEVmOakfKZ6cTKUqV7BN/kGD3WbmwIP6SAm
         5KOKxyEwVhG16CTr8X4UBSSiVgZ/dMeyKr4FNNejma15oy/gUW9fsDkjxVbvlYB3fXM5
         YE7g==
X-Gm-Message-State: AOJu0Yzr5QEk+fHAOR9No9pTDHmG9BYoNCWaDACS8VSZi3H+vgpY5Ir0
	zgVJXxEmXsIGN1hqJg5rlttBJz+9d6JiLFnUfEmjtFoW3pSgU12oKfvZSJOqcJCeTcIifSlkRR9
	5
X-Gm-Gg: ASbGncthsAtzEcg6S+GgPyUgNShXsOyIu+Kz9mhpDBAS/xGR4z5GdgPuyAXiTyiU30I
	QO4n3sQ5goBvPsHUVzcf6JCr5YFqNiT/bH2q+oxR+8QCCSkmPUNyyvGOIu255X15E4piBrJjSuR
	Znrm0huQIBkk1Q5HLmUzO6PK0J7TomfEnrzixenafOlCorLsUVusSqH/aMDaDhQxSOs4f4+sRLD
	1yGJTWu4OhxCisAHp3W3g9WG+3p3k+tjDDm/cs=
X-Google-Smtp-Source: AGHT+IGIwIuapSu2REx6W4QM4dW4YinzJGgEuqcR2zQs6C+gaCZMtbl9Tzr3fFxVA4UrqpCO6Z5NfA==
X-Received: by 2002:a17:902:e54c:b0:212:5b57:80e2 with SMTP id d9443c01a7336-2129f28ecb0mr58379225ad.48.1732310820172;
        Fri, 22 Nov 2024 13:27:00 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] ffmpeg: fix CVE-2024-31582
Date: Fri, 22 Nov 2024 13:26:27 -0800
Message-Id: <d675ceadf5844524e9f77c2c9b76b9ca42e699fc.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207658

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg version n6.1 was discovered to contain a heap buffer overflow vulnerability
in the draw_block_rectangle function of libavfilter/vf_codecview.c. This vulnerability
allows attackers to cause undefined behavior or a Denial of Service (DoS) via crafted input.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
new file mode 100644
index 0000000000..99b46dc4ea
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
@@ -0,0 +1,34 @@
+From 99debe5f823f45a482e1dc08de35879aa9c74bd2 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Fri, 29 Dec 2023 05:56:43 +0800
+Subject: [PATCH 4/5] avfilter/vf_codecview: fix heap buffer overflow
+
+And improve the performance by a little bit.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31582
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_codecview.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/libavfilter/vf_codecview.c b/libavfilter/vf_codecview.c
+index aac038e..816d633 100644
+--- a/libavfilter/vf_codecview.c
++++ b/libavfilter/vf_codecview.c
+@@ -215,9 +215,6 @@ static void draw_block_rectangle(uint8_t *buf, int sx, int sy, int w, int h, int
+         buf[sx + w - 1] = color;
+         buf += stride;
+     }
+-
+-    for (int x = sx; x < sx + w; x++)
+-        buf[x] = color;
+ }
+
+ static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ee7485a445..4a743c6dd7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-32230.patch \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
+           file://CVE-2024-31582.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


