Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D416C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.7391.1739913020757798542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tu/Xbb3h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso8257946a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913020; x=1740517820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtkMgEv7s2oR+UK0fcBTJ1j7HtQfbZvbVlKrBXOpS94=;
        b=tu/Xbb3hayI9SX6UVfTekgeRVpJwILMCZdljnwVt8TVjIwsGHNVxnseyLNkxqyRKF1
         jzf5suaSzhjftIfwBDOm5UwYMuAbKkbMoQuvkOgM3Z+zz+F/ygUB0qSM/0jfecIDpJQU
         /gX/VrJZohZ4r84HxuwjFBM4r8upTPm/36/Srs89PVeejOp9zZWzZOf/eQfhboCsk2BZ
         I+wGXNSOvr2LiIIYSsAPcWXyfnWMuzm8gC3urW0uPSJfOHQFWjsKa2PcRDkiTFFvuEB+
         DRwl5z4QxR+Wj/EDR7I202AMD5k94nfJoK2GBWpvARAPMABwOi3Vs7SxnuVDcAFHu2LY
         0ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913020; x=1740517820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtkMgEv7s2oR+UK0fcBTJ1j7HtQfbZvbVlKrBXOpS94=;
        b=twxgZPc1ls6gh4QYrpXEZGh6SeAOjWZiNzo6o378N+svzJrI2/oUS/8bF2N2e7ku8S
         nZTePnZ+YdbwUfJqof3ui7AXMMWC7oEOImyC3ZCzy+Z5TerY3xM+weuXelRL80ztyJyL
         5cns7o8xgtknxI5iF4rY67w9pdDheAu5bSlmReum3IlNdDDqNvQc9v7wHb+V9bgJ2djo
         aPaUE5vUc5CTRssrNiFjuLc5jPXIbLC5hbWGDxAMlpzM8Sx80Wc8XJMiItnsfxlERcCx
         F8c1npHrnVxsjN5APVoa4GWows12ZfS9YxkZ077Ea5hcpTvtl8HIlE/IpKk6XcfsFRM9
         wQ7w==
X-Gm-Message-State: AOJu0Yy2nyZeT/4R3qSnpZ6BwMW8+vfyFgSI8UpY+FFM8WDWygSbgnqn
	uLg0AscF0fanGshINUWVyf/DkZQ+YZPsAtI9plqJtHSWepS4Axdldd68m6iN2cP45XxPuinZd8a
	1
X-Gm-Gg: ASbGncs5PKQktKlV0qFjczheYqkz4do7SRPhr2Y9YqvSDdi4Fo4H7XDn9ydlRHuQ7nt
	37lEDPrF6ohizjGWKqLS2rw4y4HkeyHD0UL79gJFn7pj37OYt9JNVgDD0b4tWO52X6a1zX8d7BB
	+nrQilRMgANQy0kTTsL0EAXwTwfmg9AqM+cLm490tI/sz00lq7UaCUEeac0TIdDqXkfp1lVQ1+f
	Imv70F8/1XCQ6AxOVKkpX4I7A3Frzc7vsmmrAIc8JHdDxNsRAHL/ssvwY46ag7pja8mBgOloYZu
	9xj7ph4=
X-Google-Smtp-Source: AGHT+IGkMxpRDFv/2QtVd74nJ//nXcWy/GK7oSsMki+W1LwZXgXeRvotE6O0JJWkp9kWWki6rnGofQ==
X-Received: by 2002:a17:90b:3c82:b0:2fa:13f7:960 with SMTP id 98e67ed59e1d1-2fc40f0e9dbmr23915854a91.13.1739913020000;
        Tue, 18 Feb 2025 13:10:20 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/12] ffmpeg: CVE-2025-0518
Date: Tue, 18 Feb 2025 13:09:59 -0800
Message-ID: <a1c6c856f606c418ce0b0ad445a9dcd2d6de2ed6.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211645

From: Archana Polampalli <archana.polampalli@windriver.com>

Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows Read
Sensitive Constants Within an Executable. This vulnerability is associated with
program files https://github.Com/FFmpeg/FFmpeg/blob/master/libavfilter/af_pan.C .
This issue affects FFmpeg: 7.1. Issue was
fixed:  https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
This issue was discovered by: Simcha Kosman

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
new file mode 100644
index 0000000000..d7623a5b9d
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
@@ -0,0 +1,34 @@
+From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 6 Jan 2025 22:01:39 +0100
+Subject: [PATCH 1/4] avfilter/af_pan: Fix sscanf() use
+
+Fixes: Memory Data Leak
+
+Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-0518
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_pan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
+index a8a1896..6f8d2a4 100644
+--- a/libavfilter/af_pan.c
++++ b/libavfilter/af_pan.c
+@@ -178,7 +178,7 @@ static av_cold int init(AVFilterContext *ctx)
+         sign = 1;
+         while (1) {
+             gain = 1;
+-            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
++            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
+                 arg += len;
+             if (parse_channel_name(&arg, &in_ch_id, &named)){
+                 av_log(ctx, AV_LOG_ERROR,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 9aecdf07e0..049d9fd9ec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-35366.patch \
            file://CVE-2024-35367.patch \
            file://CVE-2024-35368.patch \
+           file://CVE-2025-0518.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


