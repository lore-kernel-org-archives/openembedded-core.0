Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F81D6ACFD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.78789.1732733420808302975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I7yQXEq2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724fee568aaso104052b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733420; x=1733338220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5Wz4AGgxyc3wk+5At+uEiz2UXLYqRA7C4G+RG4VKnE=;
        b=I7yQXEq28PTDjwqLb7RIVoUFRkNetEO8tZby891aXwUyjbmp3upCNzLoJzdI3KF5Eb
         yY82Z5xjeeX60pZ0JKFl5pHjNZ+f6z1D2f6lLJzG270evweJhhxa1h38Fwh1eMPGP0E6
         Wq/NYx1Y2gINIAsjOpSK2P+Il/FalhWnc9RVmOQj37r3bqFO5/c7nTGlu0jkX1wIE0/0
         tv3l3hmK/LrnglfWIrSL5rzfuFoPMhGu3nNOGJhEgmshfBrKRiiGK6Y/NHlV5Lz+p8kl
         BmGYCWeCcT3mEJXG94viWNs3Xzm9SMPCTu9lk1Yhb8FU6w5KfTCtF3WgFxmZhAWwIs3v
         TIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733420; x=1733338220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Wz4AGgxyc3wk+5At+uEiz2UXLYqRA7C4G+RG4VKnE=;
        b=bgFxsbXRKZxCijdoWvJRmN9o9f76oLFiBpI5D7XtI8H1bC96IZZJf1/r12cCiTrbEV
         OofX9DHgLQ3NtY6vknNECYxUXZpzGZKr0REMXqD6IFK2SOZoUn7IBg7TJIz6mDUNSY9p
         YYnSVYV8Fpkca6Vs9D3RaEJNmD+eXVhBRemtsu7mioYgFWJ1mYsynrvbWEql03hozYyu
         pZwajRiqiR3WDyYI9UFG1VsrSfxrUKvWZ++yL8S9HDnsJJebxUsMiGG8hnosoEZ9kh8g
         4mQ9a6sTun/Yqaw0aH7bITJ+xno5jyr5DTrRjA83iV4MtcdSgtzp8xpcKhnExxJy1wj7
         N00g==
X-Gm-Message-State: AOJu0YzjxocZDORAENh4bKOZFVsu6o6mBJU7EyUd2RxXW0yLVfU2VjCZ
	o13i2K7u6PJ+/rQxqa//ud8gatJftxUui5iUXo3UPlhz4NEsK2t9d3eqxEzw876gJ7GtYRYSjkU
	Y
X-Gm-Gg: ASbGncsBoKW0K9Bp1leUZ8zOetZe+nmJGMHh7nCYpHE1nUnOSbgjqgBI2qUAJdkCmMi
	A6uKv0mODQgMBLT54i3bCDiPDc0G9MDvMDOwBL3Ux8lq0KmJkWEXADV2neCsOjWgPvfXwMmhXN1
	e10t81dIv9x9gwFe05jenG1HwypJ+j5D+C0DUzk4tmEXLX/VUufmZyh+I0kMl5MxkUUYvzYXHnm
	tJ2xq173aJsfJOANeyMweAxhUcBF2mxhk2DvX0=
X-Google-Smtp-Source: AGHT+IHo7eo/0WoaFVeiv+Oq3/yoQZ9f1nW09u9CFFNEsNEnqpCABiX7/f0iY1DuxCSmgMJr3YL4MA==
X-Received: by 2002:a05:6a00:410b:b0:725:31f2:5d0f with SMTP id d2e1a72fcca58-72531f25d78mr5415856b3a.8.1732733419988;
        Wed, 27 Nov 2024 10:50:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] ffmpeg: fix CVE-2023-47342
Date: Wed, 27 Nov 2024 10:49:59 -0800
Message-Id: <725fe951917606fe141aab4d2f1c14617b280943.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207948

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-47342.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch
new file mode 100644
index 0000000000..39842229c1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-47342.patch
@@ -0,0 +1,39 @@
+From e4d5ac8d7d2a08658b3db7dd821246fe6b35381f Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 19 Oct 2023 22:07:36 +0200
+Subject: [PATCH] avformat/rtsp: Use rtsp_st->stream_index
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: out of array access
+Fixes: rtpdec_h264.c149/poc
+
+Found-by: Hardik Shah of Vehere
+Reviewed-by: Martin Storsjö <martin@martin.st>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-47342
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/e4d5ac8d7d2a08658b3db7dd821246fe6b35381f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/rtsp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/rtsp.c b/libavformat/rtsp.c
+index 70c1894..d435bd0 100644
+--- a/libavformat/rtsp.c
++++ b/libavformat/rtsp.c
+@@ -406,7 +406,7 @@ static void parse_fmtp(AVFormatContext *s, RTSPState *rt,
+         if (rtsp_st->sdp_payload_type == payload_type &&
+             rtsp_st->dynamic_handler &&
+             rtsp_st->dynamic_handler->parse_sdp_a_line) {
+-            rtsp_st->dynamic_handler->parse_sdp_a_line(s, i,
++            rtsp_st->dynamic_handler->parse_sdp_a_line(s, rtsp_st->stream_index,
+                 rtsp_st->dynamic_protocol_context, line);
+         }
+     }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index b8bd77972b..d233ced662 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-31578.patch \
            file://CVE-2023-51794.patch \
            file://CVE-2023-51798.patch \
+           file://CVE-2023-47342.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


