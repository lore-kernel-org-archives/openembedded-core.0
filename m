Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B52CC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.96532.1749584319947589310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u4VS2ryv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so3742798a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584319; x=1750189119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uwvrp0V3Gzrt+h7HV27d0TkWaxlpNRudHjN6bTQqZMM=;
        b=u4VS2ryvH7J3yYveu56gYHu3XWnPEMbXflW3DKDln/LKAMn0vo+JXhfnXxkWYwRTKO
         gb1/5V2QNxJVgNHSQaf+ac8c1vf4GaXvGXDzmbcR7pNz7cIcs3ucIaa8mazTYpksJCwj
         8pXAHEJtjhazkUqQ4a9YL/kJkMrHEpUIclSbz+JRWjG3rpOF6X+cHhbpTaHgZsOglXaw
         9vallaV07hqpMTi5aOXwMzRuXLKg4evSJIaTmPaqfCNClDDOH93dh5SOkgCbxWXMxk6m
         IDxHvdgk2n6jC4tG7aYskXvXs8KE6imKRCuLHPwIvKj+wq1aHVlL/z1TM5SXEoFUOzHp
         /ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584319; x=1750189119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uwvrp0V3Gzrt+h7HV27d0TkWaxlpNRudHjN6bTQqZMM=;
        b=KprhkPI2gdC4CI2E8Cyy839uaaKb9DYMi+ui3uc2RPfjREIzVRwfKJaFAq4XnPwz6m
         ki0AGHxn4doqDRuPFml1YJroHFJNJ+MHCVU799zGbi1xUTATlU1HjrXRyTwMNTc1P8gc
         jYx4weRYgRCt+d5UnhDd9haXlBIR4sb0fpGwt5RsAR5Mx4gPHYngZSSzdhsPzq8lm8r4
         QJfdC0aQc2g9h/lelTCI7RR94Jzt72mAmR/w5tw9T7MESwfc9S1IQq6XX0d98W0hpF1o
         K3S6JuM5Hrn//hC2R9V7HVSO6jdgPys1g8tSRHOcZ3GnJ8rN38uIec+iy7D0hNTd0nQN
         BQXg==
X-Gm-Message-State: AOJu0YxqyDPu5M6iUfjbcmeGc6mt27O6KbFdDl8F8lBwctgNfO5xsuaU
	yDIJJwbBHbaAl7VM52ifl/+HUjXEQ4GuBkvslj7Bp0/WQm2ydFXA7Ru/gTO109OlZ1apvzGyxDy
	lLCm0
X-Gm-Gg: ASbGnctrv3yjMVON1u6o74PDMifT7eYgfjI7+w/jDZ9qU7nLYEs0qIEqE+MqgCCrbJY
	VGjy6u83fgI1nJafAryQYU4eCKV5b08oQnABxhf45dOQaZ3/touDLG2tM0eIlGPoFp0hHuBETwx
	CbSrwHBejekjUEFUA588O7CxQPhaQnjZdIrDeJQoG5peStTxXQ2wIL5oWdFLsyyLg6TWGzkpiki
	Kr4CY9ujJrK8W9IfupDPzy0iXiBSBjV1jPsvLSsCdKpH7mw+iTPy+YDa/yvjBroWf3UXRebaHGW
	3hy3EKbgsZ3pkn7NuckBRNB0QT600Y8BStgYNlVpvtTN0AgUSYlUGg==
X-Google-Smtp-Source: AGHT+IH0vjmAcaHFyrsX2Q6iSWnhz1TyqsYMmkX9eQgfq5SwdpF6Cod+52UlHGBtw/bvvnesYq2vMg==
X-Received: by 2002:a05:6a20:1584:b0:21f:5aa1:3124 with SMTP id adf61e73a8af0-21f865fa6f4mr1235114637.13.1749584319230;
        Tue, 10 Jun 2025 12:38:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] ffmpeg: fix CVE-2025-22921
Date: Tue, 10 Jun 2025 12:38:13 -0700
Message-ID: <948e3fe6d4a0762bcd56e1cc04c4100c46915669.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218429

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation
violation via the component /libavcodec/jpeg2000dec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
new file mode 100644
index 0000000000..1319dd6a7c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
@@ -0,0 +1,34 @@
+From 7f9c7f9849a2155224711f0ff57ecdac6e4bfb57 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 1 Jan 2025 23:58:39 -0300
+Subject: [PATCH] avcodec/jpeg2000dec: clear array length when freeing it
+
+Fixes NULL pointer dereferences.
+Fixes ticket #11393.
+
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-22921
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/7f9c7f9849a2155224711f0ff57ecdac6e4bfb57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/jpeg2000dec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/jpeg2000dec.c b/libavcodec/jpeg2000dec.c
+index a317040..6c0bd25 100644
+--- a/libavcodec/jpeg2000dec.c
++++ b/libavcodec/jpeg2000dec.c
+@@ -1280,6 +1280,7 @@ static int jpeg2000_decode_packet(Jpeg2000DecoderContext *s, Jpeg2000Tile *tile,
+                 }
+             }
+             av_freep(&cblk->lengthinc);
++            cblk->nb_lengthinc = 0;
+         }
+     }
+     // Save state of stream
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 49277f9e2b..4ae444258f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-35369.patch \
            file://CVE-2025-25473.patch \
            file://CVE-2025-22919.patch \
+           file://CVE-2025-22921.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.43.0


