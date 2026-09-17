Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F030C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1712.1789682911044575896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KvTTM+Fs;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1215045e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682909; x=1790287709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2/95z/lUNITl6R/xcxplsTQsWVLilSANCmdgmfvni+Y=;
        b=KvTTM+FsZD2P0IVKBD09FsoEBQWnk0MtDJbL/B/Ay6GbU/rePqtwEJg2O575w0cg6J
         uf72+UQi6qkJBLBq36jc8KUDKmzeADwe/6b/DcGqW1lmk7EP0vuQTiJgT5XZoFWq3nP+
         HFBu2eTEsluZs8v/jTd48pK/O0J+rIdgd82nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682909; x=1790287709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2/95z/lUNITl6R/xcxplsTQsWVLilSANCmdgmfvni+Y=;
        b=V4EywNG0qQRjhZ+fjj0gtDfNWuooL3sxu6A6Enfu5bBKW43DUSSP8zsgLbpzWUCNey
         ouxDVJF7VkAFKF8covRA0d4zQiuMWru8A/YZjpxMT/ED4UJFQOBnBBVKrFw6gpv9SfYr
         /IJj+BDZ7JXRrvNNzSKTE51PO4C4sMkpPmG8pEGvHkdvmHt1aAZgfKmJnWta0ZFlERug
         c7wwbAtDaYqwcRSXHZZsMWDi0zgOMvVNLzsEthMlDrs+cWC4uWR3yx9meKIXjO1MyDSU
         4O3ZRh4YAiNGsGw60KQEwmnqpGfhWsa46qxyPMYC3StOD/AZJnX5Az3Az5lUpqcLFI6T
         8n0Q==
X-Gm-Message-State: AFuF++m157SVXYXIxaypGlRWrriq/79wdQksmnBNi/C6y+sjHE2zS7lz
	x00ODUHViO7RWtezz2uR8uOAqy3X0jyAH33BMo0Op7vBG4ViZwhlxcU7Q4XpwxA7r2Psw9k7E4l
	fMdS2OVU=
X-Gm-Gg: AYBFou1NfvElL9vM0RUk65rTfVygEO1P1RNDN1lMz1ICtQfpPj2L13IBHtJRKyaymHs
	/z+bOV8Lf0xcNX31VKxiYpe+RWAJQVwxpfaoL2f5ZXL2fD3HLQ3TfeXd8mV+Nun9xmdoFEwC0YB
	qenkH+9QlYnQp4kx3KZrP+SWkfcRsQ/KpP5KTFIg1zF7MPuuCRvCgN8DLT3AEVffq9yEruTWhEX
	UEfF2qF6eGXL7yQjndb2j0FwKSE5h/ra4e5bNGkk68CxdG+wGUvcc5XjH3qD7nAun+55wObXbx2
	XUnZh6RFNBKSZ2uAyxBJzTGlI1leP0QyvwKzjo4dFaJLSuw+cFI936T6ul01p0+GRmrE37TO8dF
	IfSUsNDcXjScCF98T+cv9bFtQnsozUcXJf3ntw2yvertHRkQWHxPuLv5GsevXxk2yz7ET1elfgZ
	Ogik7p6Y9QSIPv5GEN17Rx8EobDGUrPhgLx6NWXEXGbv4Zk4oNE7/TXnazgJGxRBE31xd2o8HTo
	PV3Av8R82R6Iku1JQkFIxOlsMoCukhK0X6a4pv4LOBREyrXq+DGSC5lmLC3tBOhgy2+H5qMGFU=
X-Received: by 2002:a05:600c:1f87:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49fc56ae924mr3944625e9.9.1789682909325;
        Thu, 17 Sep 2026 15:08:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 74/79] ffmpeg: Fix for CVE-2026-64835
Date: Fri, 18 Sep 2026 00:06:59 +0200
Message-ID: <599f1e0f2f8726120db26817eab07b38aed60f02.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246169

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1836ef96846937a6cc2443698a693104f5c0b21e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64835

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64835.patch        | 45 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch
new file mode 100644
index 00000000000..735bd1176f0
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64835.patch
@@ -0,0 +1,45 @@
+From 99c7dfd80d63bf009a102d3278a9f98b2fe68002 Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Mon, 29 Jun 2026 23:46:16 +0200
+Subject: [PATCH 4/9] avcodec/adx: sync decoder channel state on NEW_EXTRADATA
+
+Fixes: out of array access
+Fixes: heaNtmHvklpe
+Fixes: 92396cee602320c714713ca2d93b53684ad57000 (avformat: add CRI AAX demuxer)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64835
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1836ef96846937a6cc2443698a693104f5c0b21e]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/adxdec.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavcodec/adxdec.c b/libavcodec/adxdec.c
+index 21be6fe..10fd81d 100644
+--- a/libavcodec/adxdec.c
++++ b/libavcodec/adxdec.c
+@@ -172,6 +172,7 @@ static int adx_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+     new_extradata = av_packet_get_side_data(avpkt, AV_PKT_DATA_NEW_EXTRADATA,
+                                             &new_extradata_size);
+     if (new_extradata && new_extradata_size > 0) {
++        int old_channels = c->channels;
+         int header_size;
+         if ((ret = adx_decode_header(avctx, new_extradata,
+                                      new_extradata_size, &header_size,
+@@ -180,6 +181,10 @@ static int adx_decode_frame(AVCodecContext *avctx, AVFrame *frame,
+             return AVERROR_INVALIDDATA;
+         }
+ 
++        c->channels      = avctx->ch_layout.nb_channels;
++        c->header_parsed = 1;
++        if (old_channels != c->channels)
++            memset(c->prev, 0, sizeof(c->prev));
+         c->eof = 0;
+     }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index c00c3f32b78..8d3b0dd79e0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64832.patch \
            file://CVE-2026-64833.patch \
            file://CVE-2026-64834.patch \
+           file://CVE-2026-64835.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

