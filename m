Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41A2CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:30:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.4209.1757446211307697742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kWw2g8TT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b523af71683so1771355a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757446210; x=1758051010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ziq/lbESgHt3Fhm/UeSYw2nbNtjU5K2FE/+HF8h6sec=;
        b=kWw2g8TTsDAIiw7mHYsUJL0/7H5U4wXnmY6WjIp8NhDsGD8hLWxDxYaZ7NzqYo+GvJ
         lyNiGfhpbVSgFSQN6DDmP09Klc3OrAHakEEiZpErKKqsXSYqPAHmY7qEmPzl0U/W1Loh
         JGUVCSshTvDuTZi9Tz0fOACMGbnGujI9T5V68Vu25htEd74gzLBpuYyBkRWspMTkQoiq
         9DhaFoB5CaePpcEp8THsrd0vkfejPJ7evF70d/4+1ZF/NvVejL/5NRhtf9KD/CJpFlVp
         JJ1YhjqAjeyiC3xk5Qa/FljIUs1aBQu+duQRLnxK0V0RLuU1PTabPgBRt6SPEkhGlQXz
         aDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446210; x=1758051010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziq/lbESgHt3Fhm/UeSYw2nbNtjU5K2FE/+HF8h6sec=;
        b=YKexS35VDKxKDf44AmUmKyvTwb6OIP8csqoecoJeLQrHoKte+brWDp9AijtB9+wKAl
         JBKn1CYe3lP/hdnbMe00+N6uvsRzMWEFH5kIISF34EBpKl84kWzIhWP15a5qzaU/Q4OP
         1V9WtzZDEkoCeit86TP92MWypmKA51Oc7xrMtY0K8JOqn3Ae8PGLI/uh1NBkkTTQQ3oC
         hJHQ5YMIDNY0mAaTCnsPSuCJuZyPVDHVOzsk0hlcma5yzwV8dihgPYPXGRs13LsFbUAP
         F1FLqW/3V09fmALxdrvMqrPIugPCTn0FF1PtXxWHOPOqtS+lYMk8VPIlFfeijsvAV9kx
         CTRw==
X-Gm-Message-State: AOJu0Yyd2nZl2rNWYQFuWuciO1gSHA8HP1B8wdREWPS5AStG0wCj9f47
	e3yIxEjApFW9xUc9U0MEX3baTiCtm60F261rFnxPx1nRsbM0RIn0K8up9ZCZRT9Pd+0Iw7+Chm7
	dqS+h
X-Gm-Gg: ASbGncsjUfsYs+44pd9W90BkaTfwLvoOTKPuuzJU7PCYBWnE45gbRedtLO38VUNuwms
	JfVKz5WZjc4bQX34fd0vC8Fgp7KL0yQjTZMHvAOeTxa7qhXbWjB8i5rG6fZtNETUGsSS5q7KL+O
	cFG8A52vepT0tlpeexCbErxhLYlCqxynJdKsFuDhpYRtnukXoSu6CLThfdP45PcYdzZ2IBFns42
	J+FYhYMf4Bw2iVFqV3GQzuFw8QMN+AJvEHmhSAwd7X4YW9f8UBlzFpT+3rQlVZr6GkZm5JMpUcm
	Q48AJBP4TPc8MdQ+OJ1nZ1dh7tVZVu2PnHOvKMqAVwrrzffMaAAmVGHR7ZdyQl0FG8LaHj44aiy
	HoSrtJ0a+lLqN4GPRTlz/mpIE
X-Google-Smtp-Source: AGHT+IG2LLWuZ1Z8SRMYe4yqvd5EPX9HKiVHgWeD4AWXry+yTkbWW5TpVTTMV2esLdos+eFQ+xkYbg==
X-Received: by 2002:a17:903:2105:b0:24c:c8d1:2bec with SMTP id d9443c01a7336-25172862367mr108028475ad.40.1757446210344;
        Tue, 09 Sep 2025 12:30:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c560:31a3:4ee8:6083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2b0e5965sm5093855ad.143.2025.09.09.12.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:30:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/5] ffmpeg: fix CVE-2025-7700
Date: Tue,  9 Sep 2025 12:29:59 -0700
Message-ID: <a8344e051e4c705df69f4787726a9eca5c780eff.1757446071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757446071.git.steve@sakoman.com>
References: <cover.1757446071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223133

From: Archana Polampalli <archana.polampalli@windriver.com>

NULL Pointer Dereference in FFmpeg ALS Decoder (libavcodec/alsdec.c)

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-7700.patch         | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch
new file mode 100644
index 0000000000..758e38a0b1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch
@@ -0,0 +1,52 @@
+From aad4b59cfee1f0a3cf02f5e2b1f291ce013bf27e Mon Sep 17 00:00:00 2001
+From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Date: Thu, 10 Jul 2025 16:26:39 +0000
+Subject: [PATCH] libavcodec/alsdec.c: Add check for av_malloc_array() and
+ av_calloc()
+
+Add check for the return value of av_malloc_array() and av_calloc()
+to avoid potential NULL pointer dereference.
+
+Fixes: dcfd24b10c ("avcodec/alsdec: Implement floating point sample data decoding")
+Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 35a6de137a39f274d5e01ed0e0e6c4f04d0aaf07)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-7700
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/aad4b59cfee1f0a3cf02f5e2b1f291ce013bf27e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/alsdec.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/alsdec.c b/libavcodec/alsdec.c
+index 9c3be4e..ba85973 100644
+--- a/libavcodec/alsdec.c
++++ b/libavcodec/alsdec.c
+@@ -2115,8 +2115,8 @@ static av_cold int decode_init(AVCodecContext *avctx)
+         ctx->nbits  = av_malloc_array(ctx->cur_frame_length, sizeof(*ctx->nbits));
+         ctx->mlz    = av_mallocz(sizeof(*ctx->mlz));
+
+-        if (!ctx->mlz || !ctx->acf || !ctx->shift_value || !ctx->last_shift_value
+-            || !ctx->last_acf_mantissa || !ctx->raw_mantissa) {
++        if (!ctx->larray || !ctx->nbits || !ctx->mlz || !ctx->acf || !ctx->shift_value
++            || !ctx->last_shift_value || !ctx->last_acf_mantissa || !ctx->raw_mantissa) {
+             av_log(avctx, AV_LOG_ERROR, "Allocating buffer memory failed.\n");
+             ret = AVERROR(ENOMEM);
+             goto fail;
+@@ -2127,6 +2127,10 @@ static av_cold int decode_init(AVCodecContext *avctx)
+
+         for (c = 0; c < avctx->channels; ++c) {
+             ctx->raw_mantissa[c] = av_calloc(ctx->cur_frame_length, sizeof(**ctx->raw_mantissa));
++            if (!ctx->raw_mantissa[c]) {
++                av_log(avctx, AV_LOG_ERROR, "Allocating buffer memory failed.\n");
++                return AVERROR(ENOMEM);
++	    }
+         }
+     }
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 8da11f196d..f205c4a5db 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-25473.patch \
            file://CVE-2025-22919.patch \
            file://CVE-2025-22921.patch \
+           file://CVE-2025-7700.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.43.0


