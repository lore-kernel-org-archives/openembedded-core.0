Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B946E69191
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:58 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.35747.1732310816845319644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UgojEbO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso1962443b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310816; x=1732915616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxN06KHGOwRadE8ymjj/19qMD9kz4dTiNEmkFP6hsAc=;
        b=UgojEbO5iGKEw58bNgbIs/h2MM/HXn9wrQX1RbcV1bOmgBdsMMx3aF6Gqhppy7dHZU
         EUKNF11SJXlL9yfEWB/Rz0AjEIUm3KaGiQfYKTPE0qQ/Jd2hQB7JXqFUKYeE/M03R3kr
         LKySrnFDAOMaTp4/KQKAzh2ngfYJVke17zTGAx7UB7sr95XcpprrPK8BdXpg8yxcQHPz
         23qJThSH1NHEm2nY1ibnkkV/EJMCj2JMYfMDEFN8R+/v8K2LMtRxK1yUPc9wbiiRvJNJ
         8lGTcRX7z9rmELtFvp2MnFMBZ7V9APQVYnYiaajZqnm3diq59TjecPft81+EwmbQQjA3
         Znrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310816; x=1732915616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxN06KHGOwRadE8ymjj/19qMD9kz4dTiNEmkFP6hsAc=;
        b=FhaKQVbkm4Cw1A8ZpmgnvyDR0dD5YClH8Y7Rz2g80dcIfYLQ7FDXVZCUqaaaBkBCHs
         tB0h07NqEs5BjHaPOyFAKdCMnBztHUuxJ9+kZ16STrU6tT2+XKoIYLzBVcLGjGo2ibKZ
         ujNpx5NzJTU1X1j5CPTKQlfLC617zftGy5ADg8fRRa9+1VXBd4lhWY8WoA2Brmuz31Si
         Lr0avr0wDfRDlNi8wjYnPHp06sJVZcTgoLQBzIIGl4JMib1Y0SvlpWicsv6UWvT7Bik/
         Qqg5B4uh3k9KoEPHfBH0t8hbxB94hVTsgLr4uvSQfsw7SuZ3pV+hji3TyHMqdlkVMzqr
         aS6w==
X-Gm-Message-State: AOJu0YwZnpAcwVEM0IiGivBR8vdmFj0R5n2CXz5CvnfV0U7vpKOU7D6p
	ZqjLBccDigy+VaQMwuDg1kFw8i6dWPlKo0qJMVGFgIF/2fAOezNXcbedHHplVcM5aiNjmthDIry
	F
X-Gm-Gg: ASbGncud4fGMqz01R5usNWnzH/rC7AB1RjjiaSgbMXvZNC13ep1Fibmm1FrCxG4gpy4
	KanpRSELVNnnN0i5VzCbhBOgXTOgrH3eknLzN66wNtRMYi9RPUgRpE5McWeJ8q/AhsqhU6D3jr6
	hz3JZyZnPQesyOpmXghhikdydheCf9goc6r1VVVsGArOwsvNgBIHZ8wWncNjF/X9BSuIUpoSTcZ
	cE7dv3rrfU+zk2lNvFw4EhIFwxWsJ1suCND7Co=
X-Google-Smtp-Source: AGHT+IGJziNGJJ7ZUD2YudEYQncvI1hEx4+XngBkInD3scJiEZ4nizbWo7New1CRX5fm9Z7jqF7Ayg==
X-Received: by 2002:a17:902:f70c:b0:212:6a14:79b1 with SMTP id d9443c01a7336-2129f217d4dmr56659415ad.9.1732310816097;
        Fri, 22 Nov 2024 13:26:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/19] ffmpeg: fix CVE-2024-32230
Date: Fri, 22 Nov 2024 13:26:24 -0800
Message-Id: <6eb7dc3eecbbe115f95864d587fb3d5557321973.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207655

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg 7.0 is vulnerable to Buffer Overflow. There is a negative-size-param
bug at libavcodec/mpegvideo_enc.c:1216:21 in load_input_picture in FFmpeg7.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
new file mode 100644
index 0000000000..0617b9b123
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
@@ -0,0 +1,35 @@
+From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 8 Apr 2024 18:38:42 +0200
+Subject: [PATCH] avcodec/mpegvideo_enc: Fix 1 line and one column images
+
+Fixes: Ticket10952
+Fixes: poc21ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-32230
+
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/mpegvideo_enc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/mpegvideo_enc.c b/libavcodec/mpegvideo_enc.c
+index 128d1a3..3bd84cd 100644
+--- a/libavcodec/mpegvideo_enc.c
++++ b/libavcodec/mpegvideo_enc.c
+@@ -1130,8 +1130,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
+                     int dst_stride = i ? s->uvlinesize : s->linesize;
+                     int h_shift = i ? h_chroma_shift : 0;
+                     int v_shift = i ? v_chroma_shift : 0;
+-                    int w = s->width  >> h_shift;
+-                    int h = s->height >> v_shift;
++                    int w = AV_CEIL_RSHIFT(s->width , h_shift);
++                    int h = AV_CEIL_RSHIFT(s->height, v_shift);
+                     uint8_t *src = pic_arg->data[i];
+                     uint8_t *dst = pic->f->data[i];
+                     int vpad = 16;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 1295d5cdf1..40963d1254 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
            file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
            file://CVE-2022-48434.patch \
+           file://CVE-2024-32230.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


