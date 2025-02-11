Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E8FC021A5
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.3296.1739304571837564487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wZdWMhA7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f6a47d617so61484875ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304571; x=1739909371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4U5XBBbVi8atKGTNTp2CMT0NzmYGcpm2NQ5BNyIhOj8=;
        b=wZdWMhA77bEG9z2q92mRlEB22Bhc68vewg3+FdTwFiCNfoCvZH/1GAiyhUNJ94PoUg
         HRE0X8mWnbG84RjXwCTLir1ljlB0+LDERSr7r/m9qNpvwIwtj0z9dCHnvL1DZa2p3q8D
         tpDAPSLqs8GfyTvaKiku9esbzBi6lzxmH6lHDgNHXsCKS/E5OFwbX29KphLxR5UT46K+
         3DUtXPSAUdKBFGXm9oAzEXT7B6XJQ+qsJGMXIHOMJMimZFN3dSlNk6Owi68jYMAwtcBj
         nTrLCQ4j1fnFIpypuz9JxLbWwQBxUYZtgS5LuHFQskFoyvmdej8PphkMFCjsUdQILQHZ
         tj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304571; x=1739909371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4U5XBBbVi8atKGTNTp2CMT0NzmYGcpm2NQ5BNyIhOj8=;
        b=V9GEkt7yypY2p4lkWSNV83v8l0Bg3deBcl4pHlJosFo/sFeMW+WpbpeHDFQwRLvKOX
         E+ssDf+EW62H5iIaXvF0QDXzmBjKMXWL/385i6ghT/AHzLqe32blXn0w8Fx7EHLAjCnn
         dR9AIVUHcdcrOG8MiSWZjT7avTmw4iKEk2gwdIE75VQUAwBMFae0HWm1wjLuP4RT95At
         vThCJcUMQ+Vj4ddc8xaowICSDadfnbxBpGOmKJ6TImEBRQXxRIsLoHwodAOoroyVxsKf
         1VS2doDVb1uPD3PHICqUWfFVfDiPml9hHYf1n+JyDhCfbO6ABakvIhIJzzMOkoy1GQB2
         jJrQ==
X-Gm-Message-State: AOJu0YxfcrXMdnMpB7X1Ewj3QjJJPUl3UbjKln4krwjOkV8XBX8fQA7f
	onAq1/G7Hrpk6oSLdXr/+r9Y+ll4pDEpIlRQMKJHYLuGPw/kA/5Y7quGZTEcDnr9vfQ4EISmc4V
	Z
X-Gm-Gg: ASbGncuFezyVe1FJXB4iwZgEgzBxLX4f2aXpFrWbqWKMsCK/B/H68RJcajBLhZtLnYR
	2nzyoKAgQZ0EAKaiKq75LergSybq7KKFI1WTRQtAU7VshDM4Y8vBlnTyafbu44ShlfcwBSA9opM
	Er0pE2x/kI2QsmoGwF8g4gOfP9bQUMJhwi/HFpC2QcKNknPWwgZTojXkLmSmjPskHic4FklavoZ
	B8ffqHhAR/5Bu8wFN6mkE9F0YsSd/mlzwv3sOfFc0zQLRgh5q6Qby1JO9Mhl6pEK9T0y75EEq6Z
	liok
X-Google-Smtp-Source: AGHT+IEt19Vgx13KgfjPWLQyA36i611KWEDam3L0/bE8Ty3Ezuj78GvRrawvZLM82DU9xihqnl4bvA==
X-Received: by 2002:a17:902:ce02:b0:21f:93be:8b12 with SMTP id d9443c01a7336-220bbb1cf46mr9526745ad.30.1739304571028;
        Tue, 11 Feb 2025 12:09:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/14] ffmpeg: fix CVE-2024-35369
Date: Tue, 11 Feb 2025 12:09:06 -0800
Message-ID: <c46bb37a76582ee7352f2bc027920e8ba76e5c15.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211176

From: Archana Polampalli <archana.polampalli@windriver.com>

In FFmpeg version n6.1.1, specifically within the avcodec/speexdec.c module,
a potential security vulnerability exists due to insufficient validation
of certain parameters when parsing Speex codec extradata. This vulnerability
could lead to integer overflow conditions, potentially resulting in undefined
behavior or crashes during the decoding process.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35369.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
new file mode 100644
index 0000000000..72dc8d14a7
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35369.patch
@@ -0,0 +1,37 @@
+From 0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Sat, 17 Feb 2024 09:45:57 -0300
+Subject: [PATCH] avcodec/speexdec: further check for sane frame_size values
+
+Prevent potential integer overflows.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-35369
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/0895ef0d6d6406ee6cd158fc4d47d80f201b8e9c]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 23b8605..a034009 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1420,9 +1420,10 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+         return AVERROR_INVALIDDATA;
+     s->bitrate = bytestream_get_le32(&buf);
+     s->frame_size = bytestream_get_le32(&buf);
+-    if (s->frame_size < NB_FRAME_SIZE << s->mode)
++    if (s->frame_size < NB_FRAME_SIZE << (s->mode > 0) ||
++        s->frame_size >     INT32_MAX >> (s->mode > 0))
+         return AVERROR_INVALIDDATA;
+-    s->frame_size *= 1 + (s->mode > 0);
++    s->frame_size <<= (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index dff78ccc53..91ee6c6b0d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -46,6 +46,7 @@ SRC_URI = " \
     file://CVE-2024-36617.patch \
     file://CVE-2024-36618.patch \
     file://CVE-2024-36619.patch \
+    file://CVE-2024-35369.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


