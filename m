Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940F2E6919C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.35753.1732310819638770498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bJgz0fsn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21269c8df64so27634105ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310819; x=1732915619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLK5qQZL2bKjP0P+vsYYRsRkzPfgqRmd5mZ11I8jhDA=;
        b=bJgz0fsnxT9KkyTBrd2TsOV//v1RoR+SkTdDMDQHflw7TsCGBg5NNkq+HvrHTW4vzo
         3A2fBPc+BWSbEzzlWavuzlgrdQPKkNDMl7gQqR6ej91IIVVa3ej2sbiDF89shLOI2Cp2
         LRCsK+a6pXos/KhrbJ0Gn8C0pzrof7MODdY/MvavDW1I7GxW3gh8qPH08BW0RCCBHt3t
         IMhDhN7I6DGPTOO2QkLVqMceJocKQwXiEK6nQsKohiyskszn/rL5sfq6NvTB2I+cDhwW
         yUzg1wFc7a+b65XiwU4YRZ802qxNOsbrQT7YZS2uJU4bNh4XS1NCNcBXW1y6+gfGgpqr
         LMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310819; x=1732915619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLK5qQZL2bKjP0P+vsYYRsRkzPfgqRmd5mZ11I8jhDA=;
        b=JYIWSngiruwbl0vW73l+6fCHgWBJrFbCQl+5r8qgdJRYYx3n5tmk9bmpSq3gT1ZmWM
         vGM7n/Njda0CAOqFAi8HlDhv6DM1ZYopWCL4pZhMfZy3BVoTXnb6IYaGu2ENl8qi+aea
         MmWqVXq+C5uFvexGeKuetIbW0+3zsN1ynpgqeFA0eMTXDFIl9n5I6qGu1F6qhQ3xFfk9
         n3ATSpLdDh6Q138nn7ZfY+51bD5w+oXhAXMyh4UDUJxeOSlv89CNYefJwxAQ39ABPWV9
         juCcolIr2Q+yKvDLXHVYwOr8EuFvlejeR0GY9FcrmLs8Ih2iTRxDUZHfqVDHZO7LajIQ
         MolA==
X-Gm-Message-State: AOJu0Yy2btWlZZe5uLqX7j/pQ5bB/GOb7DGFRVTJ84SFqFTOOnzqtzpR
	bSHwks7zmKey1qFGhJ36hJ/0q8SayIpNllTqsbrsMHCoIyXU+1NcdEWK11TLxM1kZ+Xt7bkpGKT
	b
X-Gm-Gg: ASbGncuqhQXg6qwn2z8eSP1Vu6ZkFEOLKV0TKhSYVdCxGOr/ij40rAfzPPjo58zmYZV
	jgNbsZbueis/Ut2YDfWK37ZIGSooDOCko3xORQigX6kirhirUMql+/77w60xcY5AyHRATF9wGpH
	kF8D6+UOQd6gCRm0hC/1PJThvu1Gb4ffte31B+P/jYa54+gSlaZKGUzt9GCOhv6yLLfxkhIJFWT
	9ADmHudcvTUbrDoH38Znaim3s/4whqfFQ5dY+w=
X-Google-Smtp-Source: AGHT+IFCxNVaHaBJhDppEPYpXHcgjmlo4u5T3rEq8BHRHInV05+TESBC4Vikac4+VsqH4xaq3H+VEg==
X-Received: by 2002:a17:902:e843:b0:212:4a39:aa20 with SMTP id d9443c01a7336-2129f67adf1mr57136465ad.3.1732310818824;
        Fri, 22 Nov 2024 13:26:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/19] ffmpeg: fix CVE-2023-50008
Date: Fri, 22 Nov 2024 13:26:26 -0800
Message-Id: <433c84c528bb9920399abfe9e9461d26a929bc7a.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207657

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a local attacker
to execute arbitrary code via the av_malloc function in libavutil/mem.c:105:9 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-50008.patch        | 29 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
new file mode 100644
index 0000000000..aff234dabd
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-50008.patch
@@ -0,0 +1,29 @@
+From 5f87a68cf70dafeab2fb89b42e41a4c29053b89b Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Mon, 27 Nov 2023 12:08:20 +0100
+Subject: [PATCH 3/5] avfilter/vf_colorcorrect: fix memory leaks
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
+index ee97b62..ac2de2a 100644
+--- a/libavfilter/vf_colorcorrect.c
++++ b/libavfilter/vf_colorcorrect.c
+@@ -498,6 +498,8 @@ static av_cold void uninit(AVFilterContext *ctx)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 9a99951f91..ee7485a445 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2022-48434.patch \
            file://CVE-2024-32230.patch \
            file://CVE-2023-51793.patch \
+           file://CVE-2023-50008.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


