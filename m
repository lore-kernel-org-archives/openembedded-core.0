Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195E1D6D22D
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.79050.1732733423642839846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rPLBC7Di;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7250906bc63so69323b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733423; x=1733338223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYWpOG9M+x/cv2ZdooKwsIX3JcCfRs24UM9FmSuHCNI=;
        b=rPLBC7Dikoocs/0WQssQJVP2fYpgqvK1i8Hjafe2wyxVLb3FlSPi+yQPfpRObqEu09
         FpebJwn7psSTjUKzSrWZ73oxRagnvKa9pQo0pBTsfCv47E6dQCP5eyOIr1lsaX0K+W5I
         pcXlFtvJvIjThCyn/XYk8ZKLJwxParoaqAUmPLWSo4zpfGgjhkE55e0jKNvHrIG/aWCc
         ETJMACJQHZqMEDv9oiIJkVnjHRDkNr8mYBjjBm5p8N08xgurybbmWejftx5nw6lkYq3O
         psUOMjrBjRVzYjwliTm4vbHmnrOm/Y6JUaRMLGOdsgMjmYKfd6VECI3vylPtkzljRgnD
         n7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733423; x=1733338223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYWpOG9M+x/cv2ZdooKwsIX3JcCfRs24UM9FmSuHCNI=;
        b=sNEWcywfYMQfRj+AFflW/jTguqAa9bcNg93w4xRWiibyxJxqUHdKGCWaDB+nH1MEKC
         61mSZ1iZeEvDNP6EJKnXq9EElpzbs8BanbiI7suhgLeiX3aP88aRhLuAxIvIieYvs82g
         jKcZv7ugw6nGQHPc9Jt0dVirZNnHOVchC+dU8MpzSriDdv5qNWpNrqJ3nT4WGi6P+i4J
         DXthqa/Ck7GIAwAAacHThBs4Udx/6YdchjDkJZUlwonQsDfkYZ+mvQZc+qogp/hG6hiK
         RDvPMFTJpZvv60nGMe43RDLiPHO3DonLTNc7zKIfuOVWPYjXy52dtt2UxTYwH2yuu3Fh
         6ZaQ==
X-Gm-Message-State: AOJu0YzTqiKMfvDbz0FDB9oSAH6sFaS2NtAo1IwxrtTFML6SowwguLg1
	3csPVQN2G9TccVUHg0NKr9NvdtaCngYzSi7u/vNrt2tJVGHR7/Q0yNAF9Dpqa13mZe+dPNNeIOb
	F
X-Gm-Gg: ASbGnctKaW1Q/edVLDtbgK0hKkWf7HRScfJ9HGRPA2exYp5E1X8FkWPxc7TB5Uf8wsO
	bTmy0GSF4zhJLWFCk6Vwz9WECtpXyxnMYavY3OVrBtyJsWFkO6naJ3Pj7vsNg2g3468Rxl+8hur
	sPUDRBYXbqiC+uOEotEqKeounH3P2JHW4G3nyrWZC5tBVDilK9AsPCHawlEdtPzyFXbs/Yap+8g
	IgPUW/TisLl/QJDV1XMXgua7mEeiuDY36TXaXw=
X-Google-Smtp-Source: AGHT+IH2lbMbll0b/3fbtDApEgJhmeLwy/qObPKp0/ZL5dszBnfCYk6tX693Ha+FzUDXrhvGo/SKXA==
X-Received: by 2002:a05:6a00:3029:b0:724:f4bd:13c0 with SMTP id d2e1a72fcca58-7253effba74mr699490b3a.0.1732733422826;
        Wed, 27 Nov 2024 10:50:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] ffmpeg: fix CVE-2023-51796
Date: Wed, 27 Nov 2024 10:50:01 -0800
Message-Id: <ec7301d63376197ed3e89282545109f046d63888.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207950

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a local
attacker to execute arbitrary code via the libavfilter/f_reverse.c:269:26
in areverse_request_frame.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51796.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch
new file mode 100644
index 0000000000..4ec0aa5aee
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51796.patch
@@ -0,0 +1,39 @@
+From 61e73851a33f0b4cb7662f8578a4695e77bd3c19 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 23 Dec 2023 18:04:32 +0100
+Subject: [PATCH 3/4] avfilter/f_reverse: Apply PTS compensation only when pts
+ is  available
+
+Fixes: out of array access
+Fixes: tickets/10753/poc16ffmpeg
+
+Regression since: 45dc668aea0edac34969b5a1ff76cf9ad3a09be1
+Found-by: Zeng Yunxiang
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51796
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/61e73851a33f0b4cb7662f8578a4695e77bd3c19]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/f_reverse.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libavfilter/f_reverse.c b/libavfilter/f_reverse.c
+index f7a7e71..7b919d6 100644
+--- a/libavfilter/f_reverse.c
++++ b/libavfilter/f_reverse.c
+@@ -251,7 +251,9 @@ static int areverse_request_frame(AVFilterLink *outlink)
+     if (ret == AVERROR_EOF && s->nb_frames > 0) {
+         AVFrame *out = s->frames[s->nb_frames - 1];
+         out->pts     = s->pts[s->flush_idx++] - s->nb_samples;
+-        s->nb_samples += s->pts[s->flush_idx] - s->pts[s->flush_idx - 1] - out->nb_samples;
++        if (s->nb_frames > 1)
++            s->nb_samples += s->pts[s->flush_idx] - s->pts[s->flush_idx - 1] - out->nb_samples;
++
+
+         if (av_sample_fmt_is_planar(out->format))
+             reverse_samples_planar(out);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ee13081e4d..8e0fc090ac 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51798.patch \
            file://CVE-2023-47342.patch \
            file://CVE-2023-50007.patch \
+           file://CVE-2023-51796.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


