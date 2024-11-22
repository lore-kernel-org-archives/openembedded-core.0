Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88041E6919C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:58 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.35752.1732310818201243302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZLY6/fAh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2126408cf31so19301475ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310817; x=1732915617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUUK830OGBaczR/Pe4RvaKHicf0s6+68ZIWwnIVNDQU=;
        b=ZLY6/fAhH4maeKCPjLeBwCUVuwIqpvYS+24ITtk75tcT8rNvhb+IjS6aVML7MRciP2
         4uaiqsKMw81lmdEzvgk4L3tY+66hdfMkecywl+o/WTQwmcAQbVRyNctkI2VyvcXZBbRw
         tIGlVjLmRcS3tIk53sL4sliBBnVEjOjGLuuzVgmAO1DmHh8dghwHskv1km31Qgg76DOU
         hC+lXt+XKlwgqPf/TOTDalsE/hhxlRis+sspdo5QQwBJZ7vqcuCUqfXywQGCYCbiy+ag
         ODSo8jchckF9nSWRZvHWIH5bMvIGh/sBB/zDArxCYTgP3gyMZPAe5lpz6HhrsAG0vKvY
         qhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310817; x=1732915617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUK830OGBaczR/Pe4RvaKHicf0s6+68ZIWwnIVNDQU=;
        b=I9nvUn3ZqEubupMXwZIjfp9GutTE0s0m2IStRLZzbzaKvI+ecPuZukCnxV9Afv9FER
         DjLQ6ph2b/fcGGtWP9VoJ59Tknmp4wuWWPyRFKY75xWV/nbWOE2AicxbM2Yu0NtsAwkj
         HmydLU66tozNk85ogY81emeOMHsbK0Y/1n8jVLod+lR5DUJy4QAbftNwcBxX7KkD8+YA
         C+okiTFrKNPQ4aBatl6GVWs45IuSGjmTQBaWuO751Dbp2xNGoiF9n9yg9zD+K/Z8elY/
         n8Ndc4y/2BrSkhQrl7Xfj51KpjQvYYwGCgYCmgCbADa5xXcQrGw/GQLFhXn5nkROCOwG
         3zTQ==
X-Gm-Message-State: AOJu0Yy73+8OeAB5HNUJwG5I6ESz/oVsQo/S1IPVGHwGmWquUha5hw81
	vNmbB4jbuITPrweYX+XFEYj127jKa7cxn7l5Fp7kWjLBjpaxb7QCDHz6K8syrDGXp0VAt7RTb5Q
	4
X-Gm-Gg: ASbGncttPeaUIPgRvQ7MvMqv0VCS1idOo5vnAqyntTz4PB8Vqcl0emXQSMkFa+nTKbb
	PRqiRX1fh9GC7ZHKGy/S5NKQqlwl4QcNP7hjlRjBf1Y0GUWq6lpJLjzcL42xgYm2lHgY3XH4d/c
	/eCwGKReS0KsIR6qZo1S0lAMoyhwdEzpQRSWfXCDh1UzHG2Xv+i91FS+2t6mHolT9xVLGylJjp1
	GiSGb7m76e7DvEzNPWAGpmUh4nqqXhaiXjPNKk=
X-Google-Smtp-Source: AGHT+IHajznQ8ik11z/C1/afIsyCn+7snNCnwjuwMk4IT3UOuiKufNO7pOG0oKGKCJcxC1yMy92Grw==
X-Received: by 2002:a17:902:f64d:b0:20c:968e:4dcd with SMTP id d9443c01a7336-2129f51d3demr54745715ad.7.1732310817411;
        Fri, 22 Nov 2024 13:26:57 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] ffmpeg: fix CVE-2023-51793
Date: Fri, 22 Nov 2024 13:26:25 -0800
Message-Id: <be875832526636638a034680f837241c16e2b26d.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207656

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local
attacker to execute arbitrary code via the libavutil/imgutils.c:353:9 in image_copy_plane.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51793.patch        | 67 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch
new file mode 100644
index 0000000000..71eeb92422
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51793.patch
@@ -0,0 +1,67 @@
+From 0ecc1f0e48930723d7a467761b66850811c23e62 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Fri, 22 Dec 2023 12:31:35 +0100
+Subject: [PATCH 2/5] avfilter/vf_weave: Fix odd height handling
+
+Fixes: out of array access
+Fixes: tickets/10743/poc10ffmpeg
+
+Found-by: Zeng Yunxiang and Li Zeyuan
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51793
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/0ecc1f0e48930723d7a467761b66850811c23e62]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_weave.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libavfilter/vf_weave.c b/libavfilter/vf_weave.c
+index 2bd3994..de9f79c 100644
+--- a/libavfilter/vf_weave.c
++++ b/libavfilter/vf_weave.c
+@@ -30,6 +30,7 @@ typedef struct WeaveContext {
+     int double_weave;
+     int nb_planes;
+     int planeheight[4];
++    int outheight[4];
+     int linesize[4];
+
+     AVFrame *prev;
+@@ -79,6 +80,9 @@ static int config_props_output(AVFilterLink *outlink)
+     s->planeheight[1] = s->planeheight[2] = AV_CEIL_RSHIFT(inlink->h, desc->log2_chroma_h);
+     s->planeheight[0] = s->planeheight[3] = inlink->h;
+
++    s->outheight[1] = s->outheight[2] = AV_CEIL_RSHIFT(2*inlink->h, desc->log2_chroma_h);
++    s->outheight[0] = s->outheight[3] = 2*inlink->h;
++
+     s->nb_planes = av_pix_fmt_count_planes(inlink->format);
+
+     return 0;
+@@ -104,19 +108,20 @@ static int weave_slice(AVFilterContext *ctx, void *arg, int jobnr, int nb_jobs)
+         const int height = s->planeheight[i];
+         const int start = (height * jobnr) / nb_jobs;
+         const int end = (height * (jobnr+1)) / nb_jobs;
++        const int compensation = 2*end > s->outheight[i];
+
+         av_image_copy_plane(out->data[i] + out->linesize[i] * field1 +
+                             out->linesize[i] * start * 2,
+                             out->linesize[i] * 2,
+                             in->data[i] + start * in->linesize[i],
+                             in->linesize[i],
+-                            s->linesize[i], end - start);
++                            s->linesize[i], end - start - compensation * field1);
+         av_image_copy_plane(out->data[i] + out->linesize[i] * field2 +
+                             out->linesize[i] * start * 2,
+                             out->linesize[i] * 2,
+                             s->prev->data[i] + start * s->prev->linesize[i],
+                             s->prev->linesize[i],
+-                            s->linesize[i], end - start);
++                            s->linesize[i], end - start - compensation * field2);
+     }
+
+     return 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 40963d1254..9a99951f91 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
            file://CVE-2022-48434.patch \
            file://CVE-2024-32230.patch \
+           file://CVE-2023-51793.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


