Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066E7D6D226
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.78790.1732733422080438291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LnPYOSyC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724f1004c79so71095b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733421; x=1733338221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UpDQbVOcjVqEe1BZSnCHsE9JKI74E8LLqSTbLjbo1w=;
        b=LnPYOSyC1ge18j17i5NbgRQcT9GnKmJGkHQVjJtQUKWILx0FYnqD7nhIBzGiNkTNHq
         EYDhRx5aFWDjX1dGFbOd+HfXxdJ5HcJ+FVMs3R4G3EUFy3uEvPdc3uNFD2AeS8KDskMb
         krWs0egMTtJQywB7o1hHo21lM+B1MMkoYz6tAmufLk1tJLoSt8vFVClf0+UP5I944NwG
         wH9GyBvBvXhOsxrj8jBMIVnpTGin8JUAliY+oiPo7532p5P9uUeHMaztVdcE4SNI0YSV
         w5y09jI1sepUw0bMSftqXPy6j2RLo75s78ekRztGeM1YVravD3xx7lq4P4nZTx01IGRB
         OpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733421; x=1733338221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UpDQbVOcjVqEe1BZSnCHsE9JKI74E8LLqSTbLjbo1w=;
        b=Aln2kqCWBV1PTLXsajopgVimoX8rASeGWv/zu9Fh6f81w+rs0P/0QIeUYvYupLhjI5
         z6HpebL+3+BgT+rXNGZpm8/Bw/gNQUmi0sSzlFaJFmhKF2KXLJqGTLAac7vYr9p9Lkyi
         rG9thNdHMmvyzI8laFHw50plsFvnGrQm941ZMcCC7Nuvih1/jJqljFLEi5q7CwbO5nRP
         HcL7YP04LBnlZ823qISBYYy9D9B1ywjxKFCosKzBxm1n8xLpY9VpV5nBMOn/tsIGaMOQ
         hxCjTxZ38AAgKXCLvmJoJc7OTBvOyn/AqcLsNBPWxjO3QLUug7TM7yQxtKIyxtm9tQSX
         5Ovg==
X-Gm-Message-State: AOJu0YzSbArb7P2VSBzn/c/0V4B+yeCfoH0/YId2Ae7sLlzNCqpK8Axp
	r90gGt8o4gNrGoT2m2xNpsAKkasZzfd3AoyvKvh4nLg7LUAL0/m3P5Z4RyunwXK/RMwnpIK7Av4
	Y
X-Gm-Gg: ASbGncsbTey/1v4z+h9a1e6SvsBRH0t9R/1yWC+o8ldbJYWh9PCOO5ej67asadMzbYl
	/tI7chUGhlqlSyIT31L3cE9epCrj4CiGCdJLzjoMSTXiRoaX5NeSkuHObxzdS3N9ddSn3LMTUB6
	iTBzqYBwwhQ5gk8muZhjOcOmTWT8ZRsmHuqO3+DbFiM85DELuknHo3RZeRR99dfAHvGzbDwBkpU
	W9NpZKUkbpwLdExVyQw8jFSRdyDZeyowpOQ37U=
X-Google-Smtp-Source: AGHT+IEofE1YPJQApqIIw0ZkkulCeJBvMlDZ7d2fOg6fePfSZEgq2HCR5FkOwt9a4W0a9NwU6V4QVQ==
X-Received: by 2002:a05:6a00:230a:b0:71e:f14:869c with SMTP id d2e1a72fcca58-72530030396mr5765680b3a.6.1732733421392;
        Wed, 27 Nov 2024 10:50:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] ffmpeg: fix CVE-2023-50007
Date: Wed, 27 Nov 2024 10:50:00 -0800
Message-Id: <88a1fc5a6445e72e6cc78c39a6feff3aa96beea6.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207949

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via theav_samples_set_silence function in the
libavutil/samplefmt.c:260:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50007.patch        | 78 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
new file mode 100644
index 0000000000..fd4dc486ee
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50007.patch
@@ -0,0 +1,78 @@
+From b1942734c7cbcdc9034034373abcc9ecb9644c47 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 11:45:34 +0100
+Subject: [PATCH 2/4] avfilter/af_afwtdn: fix crash with EOF handling
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
+index 09b504d..1839190 100644
+--- a/libavfilter/af_afwtdn.c
++++ b/libavfilter/af_afwtdn.c
+@@ -410,6 +410,7 @@ typedef struct AudioFWTDNContext {
+
+     uint64_t sn;
+     int64_t eof_pts;
++    int eof;
+
+     int wavelet_type;
+     int channels;
+@@ -1071,7 +1072,7 @@ static int filter_frame(AVFilterLink *inlink, AVFrame *in)
+         s->drop_samples = 0;
+     } else {
+         if (s->padd_samples < 0 && eof) {
+-            out->nb_samples += s->padd_samples;
++            out->nb_samples = FFMAX(0, out->nb_samples + s->padd_samples);
+             s->padd_samples = 0;
+         }
+         if (!eof)
+@@ -1210,23 +1211,26 @@ static int activate(AVFilterContext *ctx)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index d233ced662..ee13081e4d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51794.patch \
            file://CVE-2023-51798.patch \
            file://CVE-2023-47342.patch \
+           file://CVE-2023-50007.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


