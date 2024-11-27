Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32280D6D230
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.78793.1732733425147656202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vSVF/ZXS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724f42c1c38so103434b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733424; x=1733338224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5Dd9p51M0E2yKpFRdYZUwVWqEBzpUri6gH1ksS6eLI=;
        b=vSVF/ZXSUgSopmrCdY6FzJeNKG2FuqxHrNyX/WVv/RDlAAfVwPu+qw7+8a/67k8R3m
         m0Bo9XZqSoUxoiHNvdgnphOmQ8UUyUZwI0ozF3NzYNk7SrUAFhBhtSL1ZBgvT5B79w+M
         txlBQo50gxYUdcocidU2pHS4VzW7l4wti2KP31b3DeADbPQnngIzjQ5+NYG8EB/ozQlx
         ex0ol2VDymli5lK4ITrtg04u7gzHKNJ+9HmTnBjx21JQZXDVtRscOyw2vh/VRs1Pv8+B
         7n4LIYjO5fsO78r/qmOPHHJKciO2lmcCTg1QVj2uBMGJ/jbJYchpNwmL0haFGrjYwtBb
         Qf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733424; x=1733338224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5Dd9p51M0E2yKpFRdYZUwVWqEBzpUri6gH1ksS6eLI=;
        b=JpFPu8QuZeQHws74imIBVL5aCWAFOTXylXsbmsWBnBTGMhKuIRekZ45I95eC28hakQ
         gwXEiRDHj/XDBD7xxAR8IafFtEOW/tOgZ8vcfeQrVwDK1XaUMe6cZ9VXRlqUz2gzoSzM
         4/045piv87HZQPNA5LtbYYQTSl0rNbtNddJPze2aw1ToCV+eeNpA1Sk4VtwOyXhG+VcD
         FW1SWfqDqkcvPlMTj9rr4MF7jV3e9s7xFl5YhOBxOnl7My6yXiHslTdzKswqr/YwP701
         36xBVjLrJB6Cr++dU+6+AhnhhXauaaGp1mGfXGEgMST6LjZKu9HMt9HtiqgAx/qIWQRL
         zYKQ==
X-Gm-Message-State: AOJu0Yz8bzg8S+AkycBId7ISZ9EmGKJpqRbedGKvJMR40t7SKOSyXdC8
	K/gIConSU0sEM/ybRrrThI2mEA5hA+GfoFrXdyBvG7Cw5j8KAViiCuMaW9p3UloAj6D/xijnvcX
	V
X-Gm-Gg: ASbGncvytsW66eBbxpgh1kTUK3Zjf/ArrSqsJeua+kzqQBhk1q4v/Mc9Qx2wtobLq15
	PA/DS5hkOvXBVS2XuAUTz7pVFCKAFqJpSM9UpW7H+2/c21YYMB/RgtJQBw4ytp2OAwAwaC4/t6x
	5J4MmsY+F9Q8uzLW3zfUXhaI1BiLU6jRZMRqixxShBKQeMXhmFn0JyYfRTSws75NKXlDmQPnvRZ
	KOZypmGLm0+4dfYJVAa9LZVpUm6TosqnacSAnY=
X-Google-Smtp-Source: AGHT+IF7T+mq0oNiJM/SkljsFx1ZJmzLcPzgr+yaWuMIgYjlZeIrkX8rMC9hO3HTZ+D5AqWhWJ8mxA==
X-Received: by 2002:a05:6a00:809:b0:724:680d:d12c with SMTP id d2e1a72fcca58-72530060ccamr5329473b3a.12.1732733424303;
        Wed, 27 Nov 2024 10:50:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] ffmpeg: fix CVE-2024-7055
Date: Wed, 27 Nov 2024 10:50:02 -0800
Message-Id: <7335a81112673616240f010d4930b4982b10c355.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207951

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in FFmpeg up to 7.0.1. It has been classified as critical.
This affects the function pnm_decode_frame in the library /libavcodec/pnmdec.c.
The manipulation leads to heap-based buffer overflow. It is possible to initiate
the attack remotely. The exploit has been disclosed to the public and may be used.
Upgrading to version 7.0.2 is able to address this issue. It is recommended to upgrade
the affected component. The associated identifier of this vulnerability is VDB-273651.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-7055.patch         | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
new file mode 100644
index 0000000000..0a573330a2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-7055.patch
@@ -0,0 +1,38 @@
+From 5372bfe01e4a04357ab4465c1426cf8c6412dfd5 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 18 Jul 2024 21:12:54 +0200
+Subject: [PATCH 4/4] avcodec/pnmdec: Use 64bit for input size check
+
+Fixes: out of array read
+Fixes: poc3
+
+Reported-by: VulDB CNA Team
+Found-by: CookedMelon
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 3faadbe2a27e74ff5bb5f7904ec27bb1f5287dc8)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-7055
+
+Upstream-Status: Backport [https://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5372bfe01e4a04357ab4465c1426cf8c6412dfd5]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/pnmdec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/pnmdec.c b/libavcodec/pnmdec.c
+index 01f9dad..1b3f20a 100644
+--- a/libavcodec/pnmdec.c
++++ b/libavcodec/pnmdec.c
+@@ -256,7 +256,7 @@ static int pnm_decode_frame(AVCodecContext *avctx, void *data,
+         }
+         break;
+     case AV_PIX_FMT_GBRPF32:
+-        if (avctx->width * avctx->height * 12 > s->bytestream_end - s->bytestream)
++        if (avctx->width * avctx->height * 12LL > s->bytestream_end - s->bytestream)
+             return AVERROR_INVALIDDATA;
+         scale = 1.f / s->scale;
+         if (s->endian) {
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 8e0fc090ac..7b03b7cbc0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-47342.patch \
            file://CVE-2023-50007.patch \
            file://CVE-2023-51796.patch \
+           file://CVE-2024-7055.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


