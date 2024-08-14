Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901FEC531DD
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.96291.1723636945960426087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j3QfBjPu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d396f891c4so1352197a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636945; x=1724241745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtK9OBl/YfcfRxWZMi2VMraOORAFOYztTbTobMRTJNQ=;
        b=j3QfBjPuyU3C5zRxOGv0n9PgDQsCO5O8ZhDyCa6sLjr55bSxpUKel1975kYFO54dDw
         MRg3cAsru3kqiStAErapP+4fXtzPvedfEvN1bySx/aHpuvuegVQR7FYQaQp7YCHe15tc
         /TmCcEw7elw/xzAc8zxJAEP3rEO3yqtwZC/Jj4GM8GxOh29UuUBlG+OrE6jdI8Q7wZVs
         22erQTYQq05WVvCIL1yY1BiUU4ft+5lk+SfQqwFjcIi6c0d5A7GvQGbV9Z2FxvqAa0RA
         RsFGqDON8xfFC8+qtDqS2i4m0cdPoLAXcjT+RpGoC9+FQ9V3wsHwzQ21/do5+IJzFwJN
         LnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636945; x=1724241745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtK9OBl/YfcfRxWZMi2VMraOORAFOYztTbTobMRTJNQ=;
        b=m/4tviG2K4u84wD30iMniH9hgri+K3Ar8V/bFvk7ERF50ZG7dq3fes52nhxKbDaKJF
         LZLAxvgu1R2WyVMJ6hMstSXPv0z28PHyaMYRtdEWnK5/AdzaSdUdx5KA5usMT92nQ+md
         J20Gazqmz/ezzzrIMBiA+SumgSFcH7xZEdJLSQFschTz1BFSmGHRS6scG5C6Gx1zr0RO
         PI7TqnY39MbToR7YBE9mj1S/UAEPlJc9uXt9SbbEzUBUGhOsZXxLLECH/IYRCOrPyqS4
         eGmITGYfuvA9tHx6OXg7lq1Rp+YRA24vKFL8lwdDC5cVfhjooI9eSCPtTPSubDpEqkIW
         ivfg==
X-Gm-Message-State: AOJu0YwhNZVZnRVqpQuwLFEVLYeE9Gx648rAn2ovjJtzLbckbsfKeHFW
	/N4KI12i+fWfpea04txfwtbStJjjACbT2sAngHcBgahKVwykj9O2HCpRplgEcztI3YlZ81YeVqa
	3ELU=
X-Google-Smtp-Source: AGHT+IHehjtfcxs61KZT6dRO79ncHFl1oOFluk7fo1lI18Iwhpu3CveD7ySrilkZeZslfmwFd/B0NA==
X-Received: by 2002:a17:90a:7c0b:b0:2c9:999d:a22d with SMTP id 98e67ed59e1d1-2d3aab74e0cmr2752770a91.30.1723636944752;
        Wed, 14 Aug 2024 05:02:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/9] ffmpeg: fix CVE-2023-50008
Date: Wed, 14 Aug 2024 05:02:04 -0700
Message-Id: <db277d82455a1dd877f6b23eb6ab08b37364a3f2.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203315

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via the av_malloc function in libavutil/mem.c:105:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        | 29 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
new file mode 100644
index 0000000000..4b8935628f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
@@ -0,0 +1,29 @@
+From 5f87a68cf70dafeab2fb89b42e41a4c29053b89b Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 12:08:20 +0100
+Subject: [PATCH] avfilter/vf_colorcorrect: fix memory leaks
+
+CVE: CVE-2023-50008
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/5f87a68cf70dafeab2fb89b42e41a4c29053b89b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_colorcorrect.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/vf_colorcorrect.c b/libavfilter/vf_colorcorrect.c
+index 1c4dea5..6bdec2c 100644
+--- a/libavfilter/vf_colorcorrect.c
++++ b/libavfilter/vf_colorcorrect.c
+@@ -497,6 +497,8 @@ static av_cold void uninit(AVFilterContext *ctx)
+     ColorCorrectContext *s = ctx->priv;
+
+     av_freep(&s->analyzeret);
++    av_freep(&s->uhistogram);
++    av_freep(&s->vhistogram);
+ }
+
+ static const AVFilterPad colorcorrect_inputs[] = {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 05919e6ffd..9b74d78fb1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -30,6 +30,7 @@ SRC_URI = " \
     file://CVE-2023-49502.patch \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
+    file://CVE-2023-50008.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


