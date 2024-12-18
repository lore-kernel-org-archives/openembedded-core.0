Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701CDE77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.117200.1734559358399625004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CenZMZ77;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-72909c459c4so119483b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559357; x=1735164157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GAfxCqdD6H9Vl+lQF4FUkFZyxaJJPf7d1ZH0JB5vOU=;
        b=CenZMZ77jOhcyAXVx1acAhT0mEhUKgMfwfUlTEmSVZRjky5JvnVchKmXDPB5kqDgI/
         mxWMDt4uZ3w5Uzk+HEDEwNIRqAZtidkGJ5QGH1lnKEgCyzsvjE8P39RPEBCvHw/qaows
         RwH/j/LQ3TVPUz8E8203G5Y+bjcoW4cotP0bxhOsQfzysoEPJ18zNG1gbFrSB7dP/dBS
         os3V1ItRJVPjvzI56MKdatMwpMWKXLwsnxJAo0F2j0331YsVWD5mcjD0Y45JSUlNdoTU
         J8M0CEsIsQulmJwQtS8h41XYzehimTC+/KdbCjDRVe3a683TA+wB3UIFnsMoyh03ZwRV
         08EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559357; x=1735164157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GAfxCqdD6H9Vl+lQF4FUkFZyxaJJPf7d1ZH0JB5vOU=;
        b=Kmm61YYBNhKpPpkT0MSGz8dPybBBopQ+oM6+HSI090OJDKgsbVOnLiDfYmmOX42brK
         oz5pNU0R/j2iB00JKk0DQT/Vfs2FqOzFIQSArqwWoQ8cv3soGsu0Cgn4lqGTtzWWBtZU
         TBv9aCoqz+ha7vJYTpUJFCZv3VjVVnl/Xxx1AdJR0dQRnCys1aj3cz6ekYbGZfxVwQKZ
         pMcRcb0rmTTBaQ0sBQAoU2KxeLhjN4Co6GwVzgBroWUZ8vWOMRbfU3vUYjyWI9yVtudD
         yAyTQLRbjnwmC7uffJ5c7tOBrN/mZAXPeJ5El/6cFb9ptSiq9+a1Vu1bboS1FLIABIA0
         HPaw==
X-Gm-Message-State: AOJu0YzPooY/ULVSLuJHUvWY/rTu2+47Gk8YYvS+yJFIqmvSqn7aZQBN
	yF53o7HDXe9B7Oumwz+Q9CV2TjwkkuSi/TQtVmkLg0Gg7fvd8ikZtaDFry/oI0KYM6knqS1truk
	D
X-Gm-Gg: ASbGncvF89NnpRHyZ3ptafOF1AfCsVyyT6ySCLuIzQvJkdFhYTRBtwybuFnGn8nJ3D8
	tzk/pfdIKSmjIHRJMm7dt+K6HV/ofSznXAw+Le9jsvGJsgb5Jre16jC9WeYjYSfAS8l74pYBI2o
	sgGUwmeqWidYlz4kp83dHqfWMv7x4zTM2fh4e+Exss6jwKKGNjniIpKoFN1IaYrirsLO6yOZUzh
	T5/rdYCXgC1wTVkGR265aI/dxsav2G/AfD51I9ooFwIEA==
X-Google-Smtp-Source: AGHT+IF5NBHRnGdfHTBlmhyM6LIUn6JU9ApmkWUrwcgrHLvsZOQT2CxaDVYJn4DfjfY2XR49vuSsaw==
X-Received: by 2002:a05:6a20:7343:b0:1e0:e027:2eaf with SMTP id adf61e73a8af0-1e5b48229fbmr7641085637.19.1734559357511;
        Wed, 18 Dec 2024 14:02:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] ffmpeg: fix CVE-2024-35366
Date: Wed, 18 Dec 2024 14:02:07 -0800
Message-Id: <a07bc254011736c0f0445607c56609be677ea8a7.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208883

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 is Integer Overflow. The vulnerability exists in the parse_options
function of sbgdec.c within the libavformat module. When parsing certain options,
the software does not adequately validate the input. This allows for negative
duration values to be accepted without proper bounds checking.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35366.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
new file mode 100644
index 0000000000..f7f16a5b92
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35366.patch
@@ -0,0 +1,35 @@
+From 0bed22d597b78999151e3bde0768b7fe763fc2a6 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 00:39:49 +0100
+Subject: [PATCH] avformat/sbgdec: Check for negative duration
+
+Fixes: signed integer overflow: 9223372036854775807 - -8000000 cannot be represented in type 'long'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_SBG_fuzzer-5133181743136768
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-35366
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0bed22d597b78999151e3bde0768b7fe763fc2a6]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/sbgdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/sbgdec.c b/libavformat/sbgdec.c
+index b2662ea..281fe62 100644
+--- a/libavformat/sbgdec.c
++++ b/libavformat/sbgdec.c
+@@ -386,7 +386,7 @@ static int parse_options(struct sbg_parser *p)
+                 case 'L':
+                     FORWARD_ERROR(parse_optarg(p, opt, &oarg));
+                     r = str_to_time(oarg.s, &p->scs.opt_duration);
+-                    if (oarg.e != oarg.s + r) {
++                    if (oarg.e != oarg.s + r || p->scs.opt_duration < 0) {
+                         snprintf(p->err_msg, sizeof(p->err_msg),
+                                  "syntax error for option -L");
+                         return AVERROR_INVALIDDATA;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 8f4a8d34c0..dd95629648 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2023-50007.patch \
     file://CVE-2023-49528.patch \
     file://CVE-2024-7055.patch \
+    file://CVE-2024-35366.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


