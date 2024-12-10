Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF882E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:46 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.3943.1733864202740917386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UcLUnlNB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd45005a09so2037588a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864202; x=1734469002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xkk2+YxQJ0zIsJWXce1x5t5snM40mftNztTDmM/Ilvo=;
        b=UcLUnlNB9pIWizqKCNCqmC4VEZbI6HgavjwDry+hOBrUVj6mE2R9nKYCSv3LY+eml8
         2ITvvGgEVduNch9tC7MgtMev4Jh9keZ0hCuCqiuRpBOM2d4Zqqh/9BbwOGqJKrDnisit
         v88YJFuFxODVv8M40UcmgrhJxRiFT+0pybFW53bttR2zUUzPRrssjDhkl8kB/8/DoUhV
         BPK8dE81l/sCJY5LBf0UdP4w4b+S2D77jHoawCYmmDa9OwktCaKbO38fe4DOf59nykgI
         33Kx/5r63s9vp89175afX3C71OSDZ5ogPcv14C+/Pu7jRs5GTkhyw+zZ/KyS8m1/1jk4
         YWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864202; x=1734469002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xkk2+YxQJ0zIsJWXce1x5t5snM40mftNztTDmM/Ilvo=;
        b=AKk197L3dw1KgJapFhrIk/KuUqQE+GtJiLxcZk8aOT4tYgqf1wR9n7JD+dfn4wmHR8
         WhQgxPVvfw+/mBpeWWGPKbbDySBR2zs2nfKuSIud2VR77Q8J09Ox7mifFw0geAKmuGC7
         +g5J/abSY9imRsGiKzAnKb9wouTJVYDTfzM8yydWiogJThgDGLYzMW1Ps9003jEbtWjC
         fNZ3/pOcJSRNiEcrf5eF2CCRetfdme2YY7JDrsDMzg/JVeFVOeHGQ46UuKYIpOlJayxm
         VvyjEpWVdZIPRlieXmLi1GxaGHm/D+wFzTVlSoYQPCNocFe1l9gVIXNd8l7XzJff7REg
         s+TQ==
X-Gm-Message-State: AOJu0Yxg2AUDXa29Yy4fVMN2FZH7pd8Xl56inJctY7MxNhVk44LhL7VS
	F+OuBDQWjFnPJyD+5ywaM5YmulQRvYUqnt8LVLsYCpLKmF2848RoPjkySu3NCT2TiqzwK/Os6TI
	U
X-Gm-Gg: ASbGncu+o2xlQgk03xKOArC7YhlU05DWrpxLL9iWKNfQK+MqEJek3sOoZt8v3Up3PS2
	qjieFI5sfv5OkhAJ7358FJv6zrlDVxPfwXUC0CSJRGbQ0VIYoqKxa1BJN1a2NCGX1LTDm987LvG
	CdPFqYKvkOo7qu5KI4RSU6OqY/ZqmsPXQS+wr9+jrJdb+b1FcmRz7U4m1pCVlvs9Sxr2gA0BiUQ
	97iqLRqVCJo/3+3IvfGviwNBe0LE7OHDkGEqOUGZz8=
X-Google-Smtp-Source: AGHT+IECgvFyKhF9fhoOYO210Fl4K4ple1qRXqXYFzn7Lu4bq9nFYHkqRwL2zI2vLMJd1w8eKecP2w==
X-Received: by 2002:a17:90a:578e:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2f127fee938mr653546a91.20.1733864201949;
        Tue, 10 Dec 2024 12:56:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] ffmpeg: fix CVE-2023-49528
Date: Tue, 10 Dec 2024 12:56:20 -0800
Message-Id: <a5e0e1f8be3c6611c09158c80e26848ae3d4f4e7.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208547

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in FFmpeg version n6.1-3-g466799d4f5, allows a
local attacker to execute arbitrary code and cause a denial of service (DoS)
via the af_dialoguenhance.c:261:5 in the de_stereo component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49528.patch        | 58 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
new file mode 100644
index 0000000000..37e1ab61d1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49528.patch
@@ -0,0 +1,58 @@
+From 2d9ed64859c9887d0504cd71dbd5b2c15e14251a Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Sat, 25 Nov 2023 12:54:28 +0100
+Subject: [PATCH 3/3] avfilter/af_dialoguenhance: fix overreads
+
+CVE: CVE-2023-49528
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/2d9ed64859c9887d0504cd71dbd5b2c15e14251a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_dialoguenhance.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/libavfilter/af_dialoguenhance.c b/libavfilter/af_dialoguenhance.c
+index 1762ea7..29c8ab1 100644
+--- a/libavfilter/af_dialoguenhance.c
++++ b/libavfilter/af_dialoguenhance.c
+@@ -96,12 +96,12 @@ static int config_input(AVFilterLink *inlink)
+     if (!s->window)
+         return AVERROR(ENOMEM);
+
+-    s->in_frame       = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->center_frame   = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->out_dist_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_frame = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_out   = ff_get_audio_buffer(inlink, s->fft_size * 4);
+-    s->windowed_prev  = ff_get_audio_buffer(inlink, s->fft_size * 4);
++    s->in_frame       = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->center_frame   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->out_dist_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_frame = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_out   = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
++    s->windowed_prev  = ff_get_audio_buffer(inlink, (s->fft_size + 2) * 2);
+     if (!s->in_frame || !s->windowed_out || !s->windowed_prev ||
+         !s->out_dist_frame || !s->windowed_frame || !s->center_frame)
+         return AVERROR(ENOMEM);
+@@ -250,6 +250,7 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
+     float *right_osamples  = (float *)out->extended_data[1];
+     float *center_osamples = (float *)out->extended_data[2];
+     const int offset = s->fft_size - s->overlap;
++    const int nb_samples = FFMIN(s->overlap, s->in->nb_samples);
+     float vad;
+
+     // shift in/out buffers
+@@ -258,8 +259,8 @@ static int de_stereo(AVFilterContext *ctx, AVFrame *out)
+     memmove(left_out, &left_out[s->overlap], offset * sizeof(float));
+     memmove(right_out, &right_out[s->overlap], offset * sizeof(float));
+
+-    memcpy(&left_in[offset], left_samples, s->overlap * sizeof(float));
+-    memcpy(&right_in[offset], right_samples, s->overlap * sizeof(float));
++    memcpy(&left_in[offset], left_samples, nb_samples * sizeof(float));
++    memcpy(&right_in[offset], right_samples, nb_samples * sizeof(float));
+     memset(&left_out[offset], 0, s->overlap * sizeof(float));
+     memset(&right_out[offset], 0, s->overlap * sizeof(float));
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 05a4c05e24..a793817ec2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2023-49501.patch \
     file://CVE-2024-28661.patch \
     file://CVE-2023-50007.patch \
+    file://CVE-2023-49528.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


