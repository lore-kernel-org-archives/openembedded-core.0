Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D737E7718D
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.116958.1734559361053532446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PO6gmA6E;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21644e6140cso1520895ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559360; x=1735164160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pctzNtJSfPqhVZN74KCy9ZD/K+XpdHBOBUNptv/AXNs=;
        b=PO6gmA6E8AkKFEGuIs4TTywOyqrU4YqBt+NluntY6QXEfbuljoUufT205G176kZmtt
         2xCkdFlM1dV/YmQUExz7GAxGEdi0m5hTWKmEOnMxvvVcQ9WShXCdRzXj+sIZGk7Dn718
         0jrWILnQjDIZcQeuC4axx+7hj2QzjSftZ2OXG9v/oGe8rOH8mlTlZpYM2vOtOlntUZnE
         oG/EbHF294ni1F1GpSzk/q7yZP4wQ1WQh+iBursoLq4HhQnuKaxCjXbElmvtKeXpO/0+
         3CZ8bJ2lkyG6jMXaYw4s6jiaIImeD3iQLEwEeExPBAb6HytB6GEEoYy3O089pRWiqUZx
         8hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559360; x=1735164160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pctzNtJSfPqhVZN74KCy9ZD/K+XpdHBOBUNptv/AXNs=;
        b=Phb7P8jGdGxuRow/4rozf8lGGIGwADdDbDyfuFP1RA8ZPzcKFS1ne+3vUQLbGgW/Ns
         5QyRg31CBQODYaJJYq2fXOsB3dv8EadVnhasTDLTsQzpJkRnmv3nkerT7xQ1s8L52Iq/
         9Ek+Swt8SsMoOH/1uzL4fCRg9nGlWp3OD2/HmfJrWiw9OKBy+R3gghW+YqxjNST0LQuE
         FU2xQAzbVagBv93q3ZeMVaSAPksjirrTF3BvQyZz73+7ec2eT3nAU/eyQBp6/A1/uiFW
         BHJy85nC/lWxI2vIMsXk7X88h0mQLlve9ELpn0fadILjfLrbOdgWY1lSMS3/ceUsD+5s
         u/Fg==
X-Gm-Message-State: AOJu0Yw6gJO6IA78X56dIJmwXEpV9hcqP8ZVyXC7vxGcz7AjPjSOUqg8
	tHrGNQNQPQ9yZ+RMTLp9uFKYAf+H6xmXCR1KudVp+TE8Kfe1zvX3IFB5y/oG53RJfYtey03z7G5
	k
X-Gm-Gg: ASbGnctguPLbgMT7s/Ig7CPjyNdmrsgrDVajcuNhrS61JUYvAtZ49YDWSvkdTr5gN7x
	lGpkkFzUPJGG/DB9dA/+U5csoJs6lytzYWynoICE/Y6AsP+YmXO6fRi1C+7QL+YNja1+6WfUJ12
	TqyGZNc4j5DcsjG1YS/Sx6ccSzLfFkDTHJzwAzDnww7LFY71IL61kH1RDOUZQygrkFwVlTavlzO
	CF4cXycKI8Hf7Y7ooiI9oXkg/mqE5oqOR9z6alWdppY8A==
X-Google-Smtp-Source: AGHT+IHo72agtT3t0kF7pwQvUdPud9dCkP0vdVnvEcCVMlP9t7iwEZNSzLlYn7ou+xix+RdMMHKURg==
X-Received: by 2002:a17:902:f786:b0:216:5854:1062 with SMTP id d9443c01a7336-218d728cd1fmr50035035ad.57.1734559360320;
        Wed, 18 Dec 2024 14:02:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] ffmpeg: fix CVE-2024-35368
Date: Wed, 18 Dec 2024 14:02:09 -0800
Message-Id: <53528caafa576a2f6417436cc0dba8be06e75048.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208885

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n7.0 is affected by a Double Free via the rkmpp_retrieve_frame
function within libavcodec/rkmppdec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35368.patch        | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35368.patch
new file mode 100644
index 0000000000..7b802762eb
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
+index 5768568..2ca368e 100644
+--- a/libavcodec/rkmppdec.c
++++ b/libavcodec/rkmppdec.c
+@@ -462,8 +462,8 @@ static int rkmpp_retrieve_frame(AVCodecContext *avctx, AVFrame *frame)
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
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 94d4cb82d5..c3cfc87669 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -39,6 +39,7 @@ SRC_URI = " \
     file://CVE-2024-7055.patch \
     file://CVE-2024-35366.patch \
     file://CVE-2024-35367.patch \
+    file://CVE-2024-35368.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


