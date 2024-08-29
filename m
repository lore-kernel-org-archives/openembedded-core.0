Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D53C83F1E
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.15300.1724938370743876054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=036dgYg4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7bb75419123so365276a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938370; x=1725543170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfHu7hmTmxCzrLtu0eoe9WsIjYJELJEiOe/aJpzOAOQ=;
        b=036dgYg4HRhqU4iALeM8T9fcEhaMHHB+HaPaGP8rNIF8OOHkfAtm92GJ/NQZTg5z0I
         iBoj6aQhHxTO2wO2SA+qjru8pEjynl0fNAp4c8c5ozTaSAinQ94kqRqQRsEibsAHI2l1
         EjZVQfKiNciq5bVi7miSppQULpReBFDfeiYBy5gNimmAZjr11YAePz0DzRAH3nxCjwJP
         mWz2zU3ph8Po6WCSBDz9XUXEglGTQUefpqHWfGF87+Wj8h6P8MscIANKkL9FitElhvI+
         hl6t1/nzdleKLo7g/6vEdXTJ5IXXNy4TkYfjjGiCYvw+RrDyIKW8ZTm1qeMU0Muqu3up
         1VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938370; x=1725543170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfHu7hmTmxCzrLtu0eoe9WsIjYJELJEiOe/aJpzOAOQ=;
        b=Qa3FkVCDCMDxr3CcfsO/z8CjihYwXzCC/rvwXkEwgesgk7gZqqeWLrWuU/OERtlz7B
         SEE4D6ZG2M3L2eKkBUiFMAiIfxp3Wx0RrsxWFwu8bZTSHkwuRa4S3KAFB6lHTkLmPEVg
         4f6pE3Rrgd7v3YRQIZeVjwGlHV20xDhjJjI1kUlVHuFlVtn+6Y/lRTx2BfBwLQWmHeZo
         XZ3QA6hIbQWHA8ekJy3yWD2WD41f7WRZejkKwHQs/tNdHvvPijtysMl+kNyEEaGV/hgf
         DJ2VbuY4+Bm3Te8e3XKUt1Cu9G3jt6+KCvauZS+BeP5Uatxq51JkhOuE3+P2zG+V/qZa
         7m2w==
X-Gm-Message-State: AOJu0YzLJg8NlsorXxV0sRnpmwWBW5tnqHYLiMLxJSQShSKwukbx22Fs
	nJBUattmdxlbm/esAddgYgoOns9xveDDwDicBbnJTv8kevNSSGWiy+luhMCWX+IvZHEErvR5wLU
	LdZU=
X-Google-Smtp-Source: AGHT+IHBF0bosa0Z/EfhuBrjGwo3i4mn/WWJkKuapjRSXXR6RsQwpPb0wS/gs4mzxbOmQDSr4E6lqA==
X-Received: by 2002:a17:902:ced0:b0:202:1aee:e414 with SMTP id d9443c01a7336-2050c40dfa2mr28510395ad.41.1724938369876;
        Thu, 29 Aug 2024 06:32:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] ffmpeg: fix CVE-2024-32230
Date: Thu, 29 Aug 2024 06:32:28 -0700
Message-Id: <b78fd9322b80734ec54440a01a36323a9b1b83f1.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203925

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg 7.0 is vulnerable to Buffer Overflow. There is a negative-size-param bug at
libavcodec/mpegvideo_enc.c:1216:21 in load_input_picture in FFmpeg7.0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-32230.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
new file mode 100644
index 0000000000..0f30c9ecf5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-32230.patch
@@ -0,0 +1,36 @@
+From 96449cfeaeb95fcfd7a2b8d9ccf7719e97471ed1 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 8 Apr 2024 18:38:42 +0200
+Subject: [PATCH]  avcodec/mpegvideo_enc: Fix 1 line and one column images
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
+index e460ca4..fb4aaa2 100644
+--- a/libavcodec/mpegvideo_enc.c
++++ b/libavcodec/mpegvideo_enc.c
+@@ -1198,8 +1198,8 @@ static int load_input_picture(MpegEncContext *s, const AVFrame *pic_arg)
+                 int dst_stride = i ? s->uvlinesize : s->linesize;
+                 int h_shift = i ? s->chroma_x_shift : 0;
+                 int v_shift = i ? s->chroma_y_shift : 0;
+-                int w = s->width  >> h_shift;
+-                int h = s->height >> v_shift;
++                int w = AV_CEIL_RSHIFT(s->width , h_shift);
++                int h = AV_CEIL_RSHIFT(s->height, v_shift);
+                 const uint8_t *src = pic_arg->data[i];
+                 uint8_t *dst = pic->f->data[i];
+                 int vpad = 16;
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 9b74d78fb1..13051f4e36 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://CVE-2024-31578.patch \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
+    file://CVE-2024-32230.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


