Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB266C021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:27 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3280.1739304564746040192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aaoQDscB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6d264221so44210105ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304564; x=1739909364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ooa1guMHWLItz4/Cskx982JOGwQ/k+btIQBr3hzGM9s=;
        b=aaoQDscBsQPb8AviWbGBvw6LeTVtm9AX8oGMSwFbGUxQahYk5hyi6MQ0A25F6AUk/t
         Fh9TGgEfICNrRde+0/Oe7+soXq/NYHLDZc3w9fT/iTeKKhz8duDVSQMO98S8wgguewrg
         7bIj8TYh61vZAbFvF/NzPkMYIeo62uUccJcGhPsmva6ptjvL1D+rYWU7iZ+MoZLPPEaS
         V74xuL7QELxqwv96Kpt5KgFIE8jPuazGin2JcVVHz+VCzVBktOrbL2LKu5uES5fD8oee
         OupVv0rpQZPrZZGigu5O+EYGXqtdwn0NZ2mtSSqsH4+esBcI+qs7fctqvRZlMadiNJOh
         3yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304564; x=1739909364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ooa1guMHWLItz4/Cskx982JOGwQ/k+btIQBr3hzGM9s=;
        b=ko5Q+bN/Mnst0Uc68GJR97SsiHzbaVhxzbZpT5hP/DQIShalr2PD343omzuIn9gfQ7
         JgrCLs8C4Gb3vHvJWniJn0h74085DUUOFKi/zvnKgD43e1IZbg/Za5bwCLscmId+zFjC
         AS+qYIoh6qwnqR9rmQF5VI7JHbVSwWqv4ReCLCFCk2bGIecRUb70RQEOdtos3Gbiz2N9
         rl17sI0L4OQfq7hNbmzzQJ1dT87KQTehtizW2FBvvx+lkn8slqQdh9gwmj6/2V5Vw+MO
         /V4sLWjyWzRT0/X7qxSepG8er7tFOv33olwwlD48jJVRqjgdD1/Hpgpez5FuYYh9k12z
         mGbA==
X-Gm-Message-State: AOJu0YyhOLxomaGk8Sanig8QDhMBMCE6ZpCOlFW/slNKYMQpdSD90VMR
	BeGQmAWwnQlmlVcElv5qRDD3+H2jYO3EA1+s8aEbSv35w414eWaEhwR6fsyTxITa50ERXC0b9JF
	J
X-Gm-Gg: ASbGncvsbm1ULavrnWDVDjg3/dAdOaTpMLZk963PeNp98teSZG7xwCKHkRmsJSY0/1X
	e/feKlPlgt6LQLlyY/SbmGDWpfafR7oRE2MgZcgKpbGVc0GYMZ4gQ3AMJavH8VAWEsr87xr54T+
	fQV2tkCjPQqsUcU3yMBu5zvQVu0FGaMP30kdSN2gzoA2wvNcn2O+F3+5c9u72mfDqME3SKsjeVX
	PgECedEoL3gV0FNMJ2lt7OLLDSHg/c4VGNBGSwHf8cpem3wUqUaoV5kJ6LnbWyABmg0wBikZ6yS
	sZWw
X-Google-Smtp-Source: AGHT+IEnC9cGc8DBZgqL16Q/re2CWg88YM4b5pS4zOhgKlilRq2q4NtlR+GHTPvfBJS9P/f5YvcCZA==
X-Received: by 2002:a17:902:cf0d:b0:21f:dd1:8359 with SMTP id d9443c01a7336-220bbb1edd1mr10307075ad.29.1739304564007;
        Tue, 11 Feb 2025 12:09:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/14] ffmpeg: fix CVE-2024-36613
Date: Tue, 11 Feb 2025 12:09:01 -0800
Message-ID: <5661bac10db7e20064c10660c47c361b7d2418ee.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211171

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the DXA demuxer of the libavformat library
allowing for an integer overflow, potentially resulting in a denial-of-service
(DoS) condition or other undefined behavior.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
new file mode 100644
index 0000000000..0061b7ad98
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
@@ -0,0 +1,37 @@
+From 50d8e4f27398fd5778485a827d7a2817921f8540 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Sep 2023 00:51:29 +0200
+Subject: [PATCH] avformat/dxa: Adjust order of operations around block align
+
+Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
+Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 50d8e4f27398fd5778485a827d7a2817921f8540)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36613
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/50d8e4f27398fd5778485a827d7a2817921f8540]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/dxa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/dxa.c b/libavformat/dxa.c
+index 474b852..b4d9d00 100644
+--- a/libavformat/dxa.c
++++ b/libavformat/dxa.c
+@@ -122,7 +122,7 @@ static int dxa_read_header(AVFormatContext *s)
+         if(ast->codecpar->block_align) {
+             if (c->bpc > INT_MAX - ast->codecpar->block_align + 1)
+                 return AVERROR_INVALIDDATA;
+-            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
++            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
+         }
+         c->bytes_left = fsize;
+         c->wavpos = avio_tell(pb);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index fb3f954904..5e22fd4080 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://CVE-2024-35367.patch \
     file://CVE-2024-35368.patch \
     file://CVE-2024-35365.patch \
+    file://CVE-2024-36613.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


