Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88655E7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.20207.1736256700613759542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iuRxHOd7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216634dd574so150458325ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256700; x=1736861500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLR6YOYf4CknG6CFRcQMd9wNvsrn55SyyGDhcXFfzr4=;
        b=iuRxHOd7dT4BelvnbhXAz9tYXiWvXia99+VKIE93SiJMcU76iFkau6zSisJEE0Ge2V
         aK8eqvhlOz+H7pbD+c8nGLyXJoxT3GJrMSIaY8jWtahpbMunQTJz+Tyab7vTNHSwbBbf
         ihG8Tu7lr7xA2iuQODZO4cLX39LvYFM/ePjXNQjYjG8ko+UsbOBtyxgPmtQzKyCTl3Z3
         mgyjPnQ8uhyetOyY3xKU+s0jTtI7GePvH3QgSwQuIVU2Vbz/IYYNR9ujoRSLyrQfTc2z
         h+7gQfUDwmIVL5Q0oZcw+dG7zD2sksS1xcB2KemH6oVdNofqwfAgWodIHaHAGVe4Non9
         r6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256700; x=1736861500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLR6YOYf4CknG6CFRcQMd9wNvsrn55SyyGDhcXFfzr4=;
        b=HrnxgrDxN/kUcCJYiMArimZ3jrXxAn/huu3rMpu7pPGzqEnZjaVsnvuDUSnwzJnzLs
         b6O6OZrmZej6JHYh7bYd6/VUW5kI71CZ7L2onA9m4sxiEGz9g17HWhsMzV0vrgNNMtGn
         64+t8Al/5NTqVlVpq+5hLgZ93O0FCLWWErCphThbS8ELa9Q3LVhTqwTmVAzHu3Q3r4Ol
         OGP7s5ejii9pHeG6fSGhqF1Llb4tPlKmAW/maH48SkrWpM/+aCPshFx+ZOkez4x3YpXa
         rZevzBo2AcLsdEKOtpGl16NItM42qQtIK8tdvQ8nx5WOeqF0rT06KeoDFG20DJ1Jqw7V
         KfQA==
X-Gm-Message-State: AOJu0YwdpjSGo2Xzl3F+fjROD+QqjeaSAfu4QqGZ8re0vvufoBIA/dS/
	hIsI5TQbaGq0mMCLYitcMZZHGKghytjF1aJZ5fGfNuLmuC0hba5iD1JQiuX1Kt8bJX0Y9JdCKxj
	e
X-Gm-Gg: ASbGncvTjDEARu4qY8oN4z2Izmk0NOXoPHplR4M5Xjnth8vAe2Tt1sIaR0P681qZ8Zm
	YaqJ5wFJsmGlZxerJTAkPkpdoFkOmUkuXJkDPbev1PdHCvoU2jSAWNL3T3//2WZvzGg54yBNg4X
	IUBFRPgIQMA3XW0/6HznJ1EsLiF9XpJtv7lVD6KFgV5B1rJG75VOJa9p7gdFTpnUNtXIz1m0eCp
	GeVuYlUD4Uuy3NtBdu7uNX2mZs0Jwl5z5F0ty+kV4rcYw==
X-Google-Smtp-Source: AGHT+IF23XeX2kQDSTvevVOgMkx5hpyEKTDas7OBQhOGdDDdKM/zVpoe15JiF+DF92Il/78WojiBEw==
X-Received: by 2002:a05:6a21:3989:b0:1db:e3c7:9974 with SMTP id adf61e73a8af0-1e5e04635b1mr90528882637.12.1736256699874;
        Tue, 07 Jan 2025 05:31:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] ffmpeg: fix CVE-2024-35367
Date: Tue,  7 Jan 2025 05:31:14 -0800
Message-ID: <623dd997856903be54d75e819f93d313b04edd8e.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209463

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has an Out-of-bounds Read via libavcodec/ppc/vp8dsp_altivec.c,
static const vec_s8 h_subpel_filters_outer

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-35367.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
new file mode 100644
index 0000000000..69d42955da
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35367.patch
@@ -0,0 +1,47 @@
+From 09e6840cf7a3ee07a73c3ae88a020bf27ca1a667 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Wed, 13 Mar 2024 02:10:26 +0100
+Subject: [PATCH] avcodec/ppc/vp8dsp_altivec: Fix out-of-bounds access
+
+h_subpel_filters_inner[i] and h_subpel_filters_outer[i / 2]
+belong together and the former allows the range 0..6,
+so the latter needs to support 0..3. But it has only three
+elements. Add another one.
+The value for the last element has been guesstimated
+from subpel_filters in libavcodec/vp8dsp.c.
+
+This is also intended to fix FATE-failures with UBSan here:
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Tested-by: Sean McGovern <gseanmcg@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-35367
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/09e6840cf7a3ee07a73c3ae88a020bf27ca1a667]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/ppc/vp8dsp_altivec.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libavcodec/ppc/vp8dsp_altivec.c b/libavcodec/ppc/vp8dsp_altivec.c
+index 12dac8b0a8..061914fc38 100644
+--- a/libavcodec/ppc/vp8dsp_altivec.c
++++ b/libavcodec/ppc/vp8dsp_altivec.c
+@@ -50,11 +50,12 @@ static const vec_s8 h_subpel_filters_inner[7] =
+ // for 6tap filters, these are the outer two taps
+ // The zeros mask off pixels 4-7 when filtering 0-3
+ // and vice-versa
+-static const vec_s8 h_subpel_filters_outer[3] =
++static const vec_s8 h_subpel_filters_outer[4] =
+ {
+     REPT4(0, 0, 2, 1),
+     REPT4(0, 0, 3, 3),
+     REPT4(0, 0, 1, 2),
++    REPT4(0, 0, 0, 0),
+ };
+
+ #define LOAD_H_SUBPEL_FILTER(i) \
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 39d79c343d..ac4ade276c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-51796.patch \
            file://CVE-2024-7055.patch \
            file://CVE-2024-35366.patch \
+           file://CVE-2024-35367.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


