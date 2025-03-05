Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B110AC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6426.1741212707973281168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NhlVgB+o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22359001f1aso169517365ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212707; x=1741817507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1PBaEbGhcUnJH8EAhGhC7WOOYRZ+Fz1DRNQI8XH03I=;
        b=NhlVgB+owQrQwb8WDZ7vPmPm/SVy180ygjbwrhGwcikUrvFvllbtJkJK18/mDuiTof
         sRUANji7UPqs1j1b5iRWxr5hPZrBsoVz2G/qSYl3uaE4jY6mBaGO73O6wza4uFPITRUU
         IM5mZ/04UIy4VK6+YOqexvXs/BW22Q09xcCQGLrdx3ZMk7ciiZkvSIZM6iI5s/Bs0rfw
         12Mihv+JC+mV7ld2qHvwJTxkwmJHR10jg/BS/yoil52/gHNs60eied1cPYpeifmwGAEY
         0LN7mKycAaXl0GItzuDaYLSz7k3fVdpeIjrPnbNOwqZQLKGrLsg9kcEeonqiroPXXP91
         aGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212707; x=1741817507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1PBaEbGhcUnJH8EAhGhC7WOOYRZ+Fz1DRNQI8XH03I=;
        b=QeKWx53elTY/UwyTywlIXddgZRGXKvtDvRyEDL7WIy1gHWwJos4CkqcdaG9bEQl85X
         Hjvdjn725m4/vqYY8PNi3eG0IeVczp36XV6Xj3D+SOM76j+ouCFyMWgRkJZEN/Ud6aVm
         fBW95zAHvlHS18yqr6hti/zYTQf+IemCbWiJIySE/8Uj/3oxVHAqXMvTHuIlQCOiu372
         RcTYZqx2OuhQcgYP1cK8akAhceifp07pFPh9tI/3sVy++y3Wi+hhLSJSKZXIJoZGktUj
         Z3iSOIzvZxRrYHU3a5TPMNwHp1ZTJ8mrl9UOBGj27WH16QE9UDuD1VsPIfgjF8UnMGPE
         DEkQ==
X-Gm-Message-State: AOJu0Yye4tH5TI8QIzLGJjdSv2HKJDDNC0jsq4MJYY0shaiaySTlU98f
	I+RWrPlMJuD3ewwOuOAHX1Pn2wP4UYrLvheCQS1vrOEe/DH1V2fzkfSFWWwRBPlkC8PiHWAblp1
	R
X-Gm-Gg: ASbGncvdbFSk9P6NyBOE0jIMg+hqZtAasDgT3XOxi3R6NQ/8/tDNTUmVWNTsjpViGSI
	5sN/dJeCBUVn1RqmIO39ixQiopaN3QQDkvotSMeRPkP1w8QUiUmefena26Ld04yd/HjGjhcJTXE
	lglddrj6AAJKVgEVEv57TnDdl9uYFSygA1oH66MopQzI6i8m9+PY8I8ndaBuY/dOLPHu8oOamfd
	0aG0ACZ9itAmMGu5vp745/u58+N00rZF+2N0zKeoJM9dFr145QERN12lUfOZTtofdeF615unBna
	/2QBjH1UbE3Pfm2Qw3+1ZepFCPk0s7nAbns=
X-Google-Smtp-Source: AGHT+IHM1rRuPC+ZCCGr7upPH91AOWp+RUWJC8V8nsUU5jZSlg33LnSie4a31k51ncCr46J+QtAazA==
X-Received: by 2002:a05:6a00:3d4a:b0:736:4b08:cc0e with SMTP id d2e1a72fcca58-73682c53721mr5662083b3a.17.1741212706947;
        Wed, 05 Mar 2025 14:11:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] ffmpeg: fix CVE-2025-22921
Date: Wed,  5 Mar 2025 14:11:13 -0800
Message-ID: <bc9cdf3701b937d40964903a3489898a69525d17.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212364

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git-master,N-113007-g8d24a28d06 was discovered to contain a segmentation
violation via the component /libavcodec/jpeg2000dec.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
new file mode 100644
index 0000000000..20fac68d01
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
@@ -0,0 +1,34 @@
+From 7f9c7f9849a2155224711f0ff57ecdac6e4bfb57 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Wed, 1 Jan 2025 23:58:39 -0300
+Subject: [PATCH] avcodec/jpeg2000dec: clear array length when freeing it
+
+Fixes NULL pointer dereferences.
+Fixes ticket #11393.
+
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-22921
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/7f9c7f9849a2155224711f0ff57ecdac6e4bfb57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/jpeg2000dec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/jpeg2000dec.c b/libavcodec/jpeg2000dec.c
+index 691cfbd..b56902c 100644
+--- a/libavcodec/jpeg2000dec.c
++++ b/libavcodec/jpeg2000dec.c
+@@ -1223,6 +1223,7 @@ static int jpeg2000_decode_packet(Jpeg2000DecoderContext *s, Jpeg2000Tile *tile,
+                 }
+             }
+             av_freep(&cblk->lengthinc);
++            cblk->nb_lengthinc = 0;
+         }
+     }
+     // Save state of stream
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 6af43bcf37..bd1259d392 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -49,6 +49,7 @@ SRC_URI = " \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
     file://CVE-2025-25471.patch \
+    file://CVE-2025-22921.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


