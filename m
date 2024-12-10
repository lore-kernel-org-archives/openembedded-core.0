Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBECEE77183
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3941.1733864201395690274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u3yHZc+s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee74291415so4349733a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864201; x=1734469001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr3m1Gd70iVeL8EmvxB6+77SqZ6pe13zHDBW0Mm87ws=;
        b=u3yHZc+sxkdnR5oOyeM5NOnx0oayaaVh3PToLZfz2LKzNvDhd2Sixw3ZGhlSWrH9U4
         6rFu9TaClIvVh+hl4qs9hcenYpZIvKTI8vI+wAz+9dIyqJOyav7qRYa9u6QwjUbgG+XW
         6xCqBbTksp8AIqayP2ReWzikAXPUIhAiwDcbKjGpMVWADfDzOidi09LyYlZrkMsipxQY
         c4mrjliFKw6iHC82dS5L2gK43S0xFoCSSzI41cBV7s8ivyptoTOutk8mfKJ/1fTLOg0G
         bKQ5BPh/oSKDg9xZaDTh8UN3z+mgWdemuPyLcFqjut4Mpfqx04+iejwYiYeFisSndMZN
         1CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864201; x=1734469001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr3m1Gd70iVeL8EmvxB6+77SqZ6pe13zHDBW0Mm87ws=;
        b=siULvUzqwKT3o0vf/jPi5yqndVdcvJba4kXX59JR+OCsd3Tv1moWC3cd6bEaL6cXZx
         KR794yTTM0J0HQAL1ehqaiKZZ2xaslACpA9gyoar4dZToUGntB0EIj0NxhRUxfVHYBC5
         053A8Eag5Dke3Etu1o3jlA413m3+UJmznKo/ipnvg8DAphLfuJJuEYeDwHKFdf6sfnE8
         Xvpc4bOnZPIrAilPD4U88yHYp5+AUKYXk2d1I6V8/+nLgzj3bD2Va+nlrBGhx9b3vLK3
         DCEbC8GNqi36/p7UGw2HJF7J3kvRXpr9BCkU0YVc7ACFgJF5ZHSfF1sudXKl0sABVykD
         Y+Pw==
X-Gm-Message-State: AOJu0YwVgpj6qrM1Xutva3b/jlwAxewREr7W8dby4a6fflFVdVYEMzDj
	m7l0AeTMDUvZ+KoyXooiGhVXghwg4jBJI2gZKR++RTQ3cidmrMeL2WuRc5vhMm7ZekHSfEXWZ5b
	U
X-Gm-Gg: ASbGncvw8dR0i4x3/KfWKzBRrwuXB9x3M//benMC/mV2CRZ8u9gnSTheKlj0inJF1wM
	IHsBLw+rGIjTCNJ35HVfUtN8eHcrb9lvVDqrS3OPBcqbtf/GbbElEqCa+m4S7UHZEHPITXkSaju
	aqSJqdv7+SVTd6nSRa4DNdFfnPICUu409QIQzwl1TGTqCfaosP2X6+jFPQIeEDpmw4PjcEts7Ug
	YFosBSXaZAheDODwvx+uC9Aaq7zBsUU17eepy2MIn0=
X-Google-Smtp-Source: AGHT+IFdRwB/cd8wDX0XkMCAfigZJkypFtk4QMeAaPupjOUN0fvws6pj9SvcwfxkXPB5h4HIWRbaXQ==
X-Received: by 2002:a17:90b:35d2:b0:2ee:accf:9685 with SMTP id 98e67ed59e1d1-2f127f565b0mr631482a91.4.1733864200627;
        Tue, 10 Dec 2024 12:56:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] ffmpeg: fix CVE-2023-50007
Date: Tue, 10 Dec 2024 12:56:19 -0800
Message-Id: <b63ba0bff9e5b5e73d50b2b3ff805418fa98d7e5.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208546

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local
attacker to execute arbitrary code via theav_samples_set_silence function
in the libavutil/samplefmt.c:260:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
new file mode 100644
index 0000000000..d86e39707e
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
@@ -0,0 +1,78 @@
+From b1942734c7cbcdc9034034373abcc9ecb9644c47 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 11:45:34 +0100
+Subject: [PATCH 2/3] avfilter/af_afwtdn: fix crash with EOF handling
+
+CVE: CVE-2023-50007
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b1942734c7cbcdc9034034373abcc9ecb9644c47]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_afwtdn.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/libavfilter/af_afwtdn.c b/libavfilter/af_afwtdn.c
+index 0fcfa77..63b7f5f 100644
+--- a/libavfilter/af_afwtdn.c
++++ b/libavfilter/af_afwtdn.c
+@@ -408,6 +408,7 @@ typedef struct AudioFWTDNContext {
+
+     uint64_t sn;
+     int64_t eof_pts;
++    int eof;
+
+     int wavelet_type;
+     int channels;
+@@ -1069,7 +1070,7 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+         s->drop_samples = 0;
+     } else {
+         if (s->padd_samples < 0 && eof) {
+-            out->nb_samples += s->padd_samples;
++            out->nb_samples = FFMAX(0, out->nb_samples + s->padd_samples);
+             s->padd_samples = 0;
+         }
+         if (!eof)
+@@ -1208,23 +1209,26 @@ static int activate(AVFilterContext *ctx)
+
+     FF_FILTER_FORWARD_STATUS_BACK(outlink, inlink);
+
+-    ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
+-    if (ret < 0)
+-        return ret;
+-    if (ret > 0)
+-        return filter_frame(inlink, in);
++    if (!s->eof) {
++        ret = ff_inlink_consume_samples(inlink, s->nb_samples, s->nb_samples, &in);
++        if (ret < 0)
++            return ret;
++        if (ret > 0)
++            return filter_frame(inlink, in);
++    }
+
+     if (ff_inlink_acknowledge_status(inlink, &status, &pts)) {
+-        if (status == AVERROR_EOF) {
+-            while (s->padd_samples != 0) {
+-                ret = filter_frame(inlink, NULL);
+-                if (ret < 0)
+-                    return ret;
+-            }
+-            ff_outlink_set_status(outlink, status, pts);
+-            return ret;
+-        }
++        if (status == AVERROR_EOF)
++            s->eof = 1;
+     }
++
++    if (s->eof && s->padd_samples != 0) {
++        return filter_frame(inlink, NULL);
++    } else if (s->eof) {
++        ff_outlink_set_status(outlink, AVERROR_EOF, s->eof_pts);
++        return 0;
++    }
++
+     FF_FILTER_FORWARD_WANTED(outlink, inlink);
+
+     return FFERROR_NOT_READY;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index acff21f558..05a4c05e24 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2024-32230.patch \
     file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
+    file://CVE-2023-50007.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


