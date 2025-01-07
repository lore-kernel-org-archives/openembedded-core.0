Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79869E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.20170.1736256702085858797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NJOl4tC1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21631789fcdso166769795ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256701; x=1736861501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPUcMfEHS8dNNsvxRlb4lY6kCd/LBOcihkN3z3XBLZs=;
        b=NJOl4tC1/c9BDjtoHdERgT9fbQa0WoXKZH0LicXx2yA4gL/tZQz+fnVPx+DGyjOU6Z
         9bvLINEbRyuDB2EmWibS3DCVb/PLjZXdo07fjEhhLF/IKKEnl/uZq6eXgdrGrD+ApkCK
         ybfT3fH35LD6ifg0yh4x91A7kww2cliVPgj9eQfHQUZHQCKj8FOm+xSQCYdJB3d+6XHe
         GVs1o8hyM+w7yG00f5haGrNYcR4d9UJK/BTRLG/sEuysGdeqbhoZuT3lz3fUgKQ3s3kv
         q/kaHjnKPMmQhs+RuCXeFQYy+8nSlaCx64d+Pk8qf1FIjScShPTE+O80kMHcrTDbOQRt
         AFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256701; x=1736861501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gPUcMfEHS8dNNsvxRlb4lY6kCd/LBOcihkN3z3XBLZs=;
        b=cm7oUuLkl2Vr0/iIos2WeKd/ehNS8HvMMC/mvAupvUELqayqL33hYotCU79xzeSzrL
         vM/HRq0wAQoXvotGVxQo10AZKWbK5DZtZSg83Q8vhPMV8vLZFhI5XTk5kEOuwRojAA0u
         X5134SeZEoZ2G5vktFV8YB3C3ly3gwMnr44q1dSdJDO8PaoOAvDvuahmxmZKQxrxSMGG
         ZJkTQ5eILpK5HOudm5klzmGAsHpkvRWbtnv2Vl4/2z4DFCh1TE+uh0rwXy6dkXFDyYzP
         sTA5thTgmV0Y0u8rdb9368ReLARJvUV4f/pWbuG6O4drS16/1KhRJKDW4rBdEreRHaEf
         dcig==
X-Gm-Message-State: AOJu0Yz+FtrYU9f9GLgnA0YY+RejPlxik+yvzQsKBrKsEqjMeLF5RENx
	lP7+vuw1/05z9uL/WuHVgkIWhg5atc0utuj27c9YQYxSXHB1SiWDxTHr03kN4F+GJXiI4lgN0lA
	U
X-Gm-Gg: ASbGnctEzi210hYvGVGrUL7GqoxkZrirU20ogRvyo0BxiqdAN/hjyf8lRPdZR0TFmrD
	54ivYy50ad6fRz3PpSEVj4tI84GfaSksZn/NjOKaRRExojcQQA7xoPXXo0zsevwT+3lNH5YYsBD
	YuZVxrl5RlSk9UNgER2JphPAewISq0BogyH0mgPAnVjVaq6a7wjvY/3Ri/WhVSNrZEoJCRWCppn
	XFqRq37PeG9Y1qaSn4PF4hVNbUxLbJLLQzzOWG3hoDZgQ==
X-Google-Smtp-Source: AGHT+IHQUtN3v6YWmGUKk9Mee37j8IuFmESSD6jUJrYVQRR3REcOBjVTSEnkLPhIK9PM12OgHJKSHg==
X-Received: by 2002:aa7:8041:0:b0:725:cd8b:d798 with SMTP id d2e1a72fcca58-72d103f6ff7mr4403247b3a.9.1736256701354;
        Tue, 07 Jan 2025 05:31:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] ffmpeg: fix CVE-2024-35368
Date: Tue,  7 Jan 2025 05:31:15 -0800
Message-ID: <bc73c3ef68826ffbb6de960b7bfa4b784e289ea8.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209464

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n7.0 is affected by a Double Free via the rkmpp_retrieve_frame
function within libavcodec/rkmppdec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
new file mode 100644
index 0000000000..555d569825
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
@@ -0,0 +1,41 @@
+From 4513300989502090c4fd6560544dce399a8cd53c Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Sun, 24 Sep 2023 13:15:48 +0200
+Subject: [PATCH] avcodec/rkmppdec: Fix double-free on error
+
+After having created the AVBuffer that is put into frame->buf[0],
+ownership of several objects (namely an AVDRMFrameDescriptor,
+an MppFrame and some AVBufferRefs framecontextref and decoder_ref)
+has passed to the AVBuffer and therefore to the frame.
+Yet it has nevertheless been freed manually on error
+afterwards, which would lead to a double-free as soon
+as the AVFrame is unreferenced.
+
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35368
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/4513300989502090c4fd6560544dce399a8cd53c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/rkmppdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/rkmppdec.c b/libavcodec/rkmppdec.c
+index 7665098c6a..6889545b20 100644
+--- a/libavcodec/rkmppdec.c
++++ b/libavcodec/rkmppdec.c
+@@ -463,8 +463,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
+
+             frame->hw_frames_ctx = av_buffer_ref(decoder->frames_ref);
+             if (!frame->hw_frames_ctx) {
+-                ret = AVERROR(ENOMEM);
+-                goto fail;
++                av_frame_unref(frame);
++                return AVERROR(ENOMEM);
+             }
+
+             return 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ac4ade276c..9aecdf07e0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-7055.patch \
            file://CVE-2024-35366.patch \
            file://CVE-2024-35367.patch \
+           file://CVE-2024-35368.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


