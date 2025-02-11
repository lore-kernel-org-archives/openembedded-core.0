Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AEDC021A4
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.3294.1739304570461824875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0kMHC8Ya;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f7f03d7c0so63844235ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304570; x=1739909370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z22lot1L35gX+JSmD0nU2vXlN3v0O2LY31oX8x343fw=;
        b=0kMHC8Ya9kYsk2U0rAX6jwMlESFO8kYE3nITfHOSgFQn56oF88IByGN7lH+fFr9gsa
         jQKVNGRGiR2QiXzNvsjZHqb8iSapALGckIVQbt9G8u16kaVJft9ifUgAbzdSINqRKdrJ
         JoCtTnJXuJgHlSKSU5ae/qWhPIoNl/zuH7nbG43exmv9E8mIDJsJOpGNYhqj+PpPhR8x
         zNEXuwx+EcxWEzkJZRmUH4iLhA6U0yUKr4CXAgNiRpFOtA3kYAHwekbYIenOXTYo8BHb
         Ur7/maSdbR6vvOg5BFPsfNuuhADVsDR8rQlSvNbjXEjXzDrBneJL4f718l+dAu9qEEr4
         laRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304570; x=1739909370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z22lot1L35gX+JSmD0nU2vXlN3v0O2LY31oX8x343fw=;
        b=YpHE8r4cOkEzPKb17oHyJpc/GS7mc1fj+GSWXx66DkNlUgmyWiifQfdiPSoxRz4BPb
         T9wQkrUAOx5ft/X08cQ2ApYl9Ij94Cty5Pjk/UzGPL3kgpWnuNl+SowJ8rgkNz7pmDKc
         yXNueo8nwIWFTp2/NZprFmE1R7d86LuXv8bM6MdORZ1KX113blD4Yk70hxDedMgXnDjq
         J3UzqY1P7EdYfZJZhNySPSrWyfRr+bbqWd6Ng8tRf+yN73V9/sVEzqRr5+JfdE0wLYUQ
         7u95zZ/wmgUaG561rnWTYeaHxKWYylQYX+sgtT7htVltc4mQlXZNzWF6iSW6iZS4gADn
         UPVA==
X-Gm-Message-State: AOJu0Yz3UdmEF/+IsVPDt4f98gYzpSMvoUVM8La0lA0FWHUbXabAWyrM
	9n6js+mxkIj5FZihuo6eoSVC8araSkiT2Lx9RUVzxh3bhA6kYjxSXnQEl+n468/EJf5iBVtnLeN
	g
X-Gm-Gg: ASbGncsWLarADxXTplEK5caoHQGCC5+58OF6RZF/Ksq+0r9cQJPxHNLJ4JxgKDDZLHo
	1Sm1pIFQnHDNaBxbpgdjDTFHrgDZAMO8KlsUSNTuycz+PPc3eJDu0oMKpHmlc4H/CEsG5i4CUL0
	me6RqQe8pxaRvrv6QMcNIYRHR2bk19ZC3KHTVAq4u7NwfEP2olRYQqDaZS3Sx3Yg9rb6wx6UYsZ
	hsE5UcNbbE9x1bMabMYK4EbZFI0s6QpS1OTOqDL7TFgHf7b7zun9nTMj++ChEPoSYtQ6lvzWb8r
	T4vh
X-Google-Smtp-Source: AGHT+IG0nkbSP1lBhv8aAVXJ7+wy5VlNse+/fp29XaItITUhA19Voxo/RRBz629jaao0BxbTYNDjew==
X-Received: by 2002:a17:902:d50c:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-220bbb23785mr9738555ad.19.1739304569740;
        Tue, 11 Feb 2025 12:09:29 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/14] ffmpeg: fix CVE-2024-36619
Date: Tue, 11 Feb 2025 12:09:05 -0800
Message-ID: <161711ba2ef14fa77fba4740b1933c68043c57c7.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211175

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the WAVARC decoder of the libavcodec
library which allows for an integer overflow when handling certain block types,
leading to a denial-of-service (DoS) condition.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36619.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
new file mode 100644
index 0000000000..63d08eabcc
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36619.patch
@@ -0,0 +1,36 @@
+From 28c7094b25b689185155a6833caf2747b94774a4 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 4 Apr 2024 00:15:27 +0200
+Subject: [PATCH] avcodec/wavarc: fix signed integer overflow in block type
+ 6/19
+
+Fixes: signed integer overflow: -2088796289 + -91276551 cannot be represented in type 'int'
+Fixes: 67772/clusterfuzz-testcase-minimized-ffmpeg_AV_CODEC_ID_WAVARC_fuzzer-6533568953122816
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36619
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/28c7094b25b689185155a6833caf2747b94774a4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/wavarc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavcodec/wavarc.c b/libavcodec/wavarc.c
+index 09ed4d4..51d91a4 100644
+--- a/libavcodec/wavarc.c
++++ b/libavcodec/wavarc.c
+@@ -648,7 +648,7 @@ static int decode_5elp(AVCodecContext *avctx,
+                 for (int o = 0; o < order; o++)
+                     sum += s->filter[ch][o] * (unsigned)samples[n + 70 - o - 1];
+
+-                samples[n + 70] += ac_out[n] + (sum >> 4);
++                samples[n + 70] += ac_out[n] + (unsigned)(sum >> 4);
+             }
+
+             for (int n = 0; n < 70; n++)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 37416ef01a..dff78ccc53 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -45,6 +45,7 @@ SRC_URI = " \
     file://CVE-2024-36616.patch \
     file://CVE-2024-36617.patch \
     file://CVE-2024-36618.patch \
+    file://CVE-2024-36619.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


