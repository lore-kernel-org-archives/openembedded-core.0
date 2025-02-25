Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F100C18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9045.1740493838620160987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1L+PeQuJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220d398bea9so90738845ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493838; x=1741098638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQTstOI4GlOpnwRORtNVHPwVtZ5oYfmYcuO2DnLWqpw=;
        b=1L+PeQuJj3HedcF51wjZCHitUQqs2kQrOlrlcRE01r5MGnIv0Zj8/BbrVMGXtLibFq
         2SYW+Wetah9b+aBPVEPs2W7Ga5gpUE7664LqYQs0YUdqYIm8ul5QTGMJI3s1TyyOGTht
         16oS3Z3a0PvrGG1pbQvjm4wtZAzThU6Tgzvc9p68rTGgRcATAB3nHluqSdfdDFlMk2Gd
         1yxtIeZYBJPVWgqr+h2xzd7gvGBSJ1pIbK0YdsHbBSPp1XVGdOUisMdCxPLUeWuvndnf
         KB+g35p1C+L5jllq33u7ltWp5OuQ3TvgKgeGaCbvNJ5GzGvPJ/4oa83EZxnaSQbyJQYO
         Y3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493838; x=1741098638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQTstOI4GlOpnwRORtNVHPwVtZ5oYfmYcuO2DnLWqpw=;
        b=pJS0A8NyMAUKb97eJluEbki5HDLxJWSdEn9XL3TMmxn9+U2oVtLFV2p+adA6PSBd3Y
         ODflIkoXhxggzUQb2tnqrqyj9XObv6lwMKJA8RZjESP7gF4Z7aCKuJcKFOOMBBh0i+Be
         8vSp7qw4YIC9rEPQuB/4rBeRhlxtVPkUA3HK+9Nlt2qSG5W/hgznIfReeV+5VXT5SbUE
         /nTKKqyWIXzmsgWMbgHim7XHB/ka/BZYKVXJLwQOd5h/gQdOcaPx/tQNaPuH6bXfdzH1
         H16MwOgQarVBj71NnMFlGv2ZtYC7fTlvX49aWilWIDjfYIh1HewAo2tbvV1qn7hGsolH
         mTZA==
X-Gm-Message-State: AOJu0YzJx0XS4kHdx+LQjbGNw3ItGgZd/ZfqvS8Lq3ILLpmPhGExr/X7
	MXVpGAvqoAQv2fRWqHTaGINTUaqVVp3oAvnK1hCZwbeFJzPG0HBh+uEDjwR5QoHu88/HUMJ0o8X
	F
X-Gm-Gg: ASbGncuTaPA8gHiH30XzOyB9SIJJoim6EFvBo87x0LCUMfZC+XkbApkSYRw5xnYDIU0
	F5gwm3F/qiE56f2LSn+7NDaGVRyTkg14Nwk8vTVGWDt64oP/bre72/e2SG5XIOxXncYDnMFAx0a
	ypuoqfw4+glUtyHbBmI7FOtY7v+ajuSttVWBxGlkDTAOYDNgW70fKmbHSrK5VxKqnoyimA43git
	+pIxlGjrTFk0/xjmsuapDYtopxBc7Xrbc0x8vAODS34tFIfXlH3tzi+n7GRhLWS8AT8aDHzCNsX
	8ialNHSYGtslBFd0/w==
X-Google-Smtp-Source: AGHT+IEmdP3UW7xMzXGnlVwWX4qV9dVOE+jesh4+I3sTEvF2Yclc9ImJpOxw85V94mFmIc3hh/NnGw==
X-Received: by 2002:a05:6a00:3e0e:b0:730:7600:aeab with SMTP id d2e1a72fcca58-73426ce7678mr24388975b3a.13.1740493837827;
        Tue, 25 Feb 2025 06:30:37 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/22] ffmpeg: fix CVE-2025-25473
Date: Tue, 25 Feb 2025 06:29:56 -0800
Message-ID: <599ee3f195bc66d57797c121fa0b73a901d6edfa.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211906

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit c08d30 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
new file mode 100644
index 0000000000..c9527751b5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
@@ -0,0 +1,36 @@
+From c08d300481b8ebb846cd43a473988fdbc6793d1b Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 17 Jan 2025 00:05:31 -0300
+Subject: [PATCH] avformat/avformat: also clear FFFormatContext packet queue
+ when closing a muxer
+
+packet_buffer is used in mux.c, and if a muxing process fails at a point where
+packets remained in said queue, they will leak.
+
+Fixes ticket #11419
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-25473
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/c08d300481b8ebb846cd43a473988fdbc6793d1b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index cee86ae..fe458dd 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -724,6 +724,7 @@ void avformat_free_context(AVFormatContext *s)
+     av_dict_free(&si->id3v2_meta);
+     av_packet_free(&si->pkt);
+     av_packet_free(&si->parse_pkt);
++    avpriv_packet_list_free(&si->packet_buffer);
+     av_freep(&s->streams);
+     ff_flush_packet_queue(s);
+     av_freep(&s->url);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 2173105fd3..4b99c0fa21 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-36618.patch \
            file://CVE-2024-28661.patch \
            file://CVE-2024-35369.patch \
+           file://CVE-2025-25473.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


