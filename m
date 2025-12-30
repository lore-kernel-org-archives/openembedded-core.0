Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476DEE49B4
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71908.1767125549857671828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z5gAtZ4G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so91363965ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125549; x=1767730349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX0qFH2HKN/GBj8yw15Puba2g4QAVqLkVq1375L9w6Q=;
        b=z5gAtZ4G+VFZUcarzbvyqtu7ukVSaCUgkexfPWTWsYdxiPFPu4SLM+i/go9J5R7t1z
         SIlMq0H30Bk9NtlmT6Ch5SfxWgKConSdnb7lkMOp+YYswPZ3l/CM7TspJnPrscfxoD5Z
         g49M1/Cs56Cl+yjpdbvo6VlCOmRipr0HpFAa8bsg6ZQ+6LXvxNuU+4WaF6HPGQS8c2SV
         vwjLLVqIjWIeflfVNWoRu771H+B37/1KBo2O0vIe8nbOP85h3Lm+1gzL6BiaPksNdFzV
         877sSnBUJItvXX9TocaHZ8ETrPOmO68QlHmkpAiKlNlWXf6ZfRi0H4KVIB7JqNzpzrkc
         KFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125549; x=1767730349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oX0qFH2HKN/GBj8yw15Puba2g4QAVqLkVq1375L9w6Q=;
        b=RXvCEFkK0BApsXOBAoS3M3QDcF+Ge1R5kU1HPgmuh6YuQ5c0CiQ2QO7bgjTA+fR+ZE
         PPhapcLhiRxntyOhJ/g00dmGrHS1XqQgB16E+3yWy6zy/fvTZ5+27MjmY9iSMVlJUteW
         TyG2V+VFE5SlpvaGEEG2DACATrV5WKvZ96crBtbJJbX4DPu9yibIhGN156rToKSKIzNM
         PYliD+k0CmPfNxUMoUkYDoeg1f0tgliOJMMGVYJavOZ9ZATCiq5JV2Rtyr4TQLo1rQj4
         sbPCpdPNlU7ZIghHpm4ABgq9nBp15Annmnz6N7Hh5DA+9LcVQCRNIIzLk/d6MYWLvmo+
         aiUw==
X-Gm-Message-State: AOJu0YxovcCGMvoxwJHxSMrWvGjwrkR7QSGeSNt53U/LtgFUEOoy0Zbq
	X/EfjzbGTGKDwXBvWXNlaxG2yyUzDdAizI0BPWrEPPxBxF4fmo5cRd4t5Vo9ycF3V0EkRs9Rudr
	2c8/c
X-Gm-Gg: AY/fxX5dyINotfQWgT4LQjnXRDm1vFoPo8P5BR5tO9E/n+DjBDmn0QbE9NtLCyLz9qI
	JsRt5s+L9v5QIQH8lka+5lbgViptJfd11qDTATeb70w5RlNrvGgmRAfktsTnTiwFqsTadjT2OPJ
	uZ0I3YScukbN7JX75HeP3CwbwbQ4bIf4dj+f0kLXBs4FOOo+KrpmMdooqnMOhLlxNJmf5U3uBaA
	+HlxCuPmRlIzvNWb+lo+i6IsQEZ/nZT/PEk6FJG2fwJwphynq0WHU8Y6dSF+KhkCsfV6p1U0CI4
	JzIZ7+rEcPYdjrr730RPAJ8RFO/cQeMZOu54XByzJC3TSJPWUTtkCt6F2O1XwxZmcDuEhk/fUvr
	rFSqC5Ktzn15SMCIf6XIYMVrBogGbPCU5q7eE97igf53cMH6v1fcLbZpf1BGoKEDJFFikDCOHan
	VIDQ==
X-Google-Smtp-Source: AGHT+IGZHSyqfalwFo6boDny3BV+xq+613mQo0oJ1G6mHbGZtcOObqRLIkRuSRsCXZ26VifZsYqH9A==
X-Received: by 2002:a17:903:1b65:b0:297:e69d:86ac with SMTP id d9443c01a7336-2a2f2836516mr348234185ad.39.1767125549073;
        Tue, 30 Dec 2025 12:12:29 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/29] gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:42 -0800
Message-ID: <aaab1a578dd9e86873e791de4755e1b3d6d41a5a.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228704

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1535c02a7ddd9fa87e5634bcfcdbf212d7621d0f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
index c3ee529497..aa6c431daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
+SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


