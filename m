Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F15D75E5B
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.35758.1732310825030970169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gIPjcL4j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-212874cd62cso18025895ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310824; x=1732915624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xhdifjKpJM7/1EfysM3L+1uNi05F+v2FSkP9STdI2E=;
        b=gIPjcL4jmrCrDXUX8golQeaYyEveVwIxV92CMhawxhNJBlm/0Pe5J8OYhmGVDzqu1X
         fCBTV6gWjtoDJXG1vqYKNoRwZBeVFw+b67+Qa8wSLeUxW3AhI/QVCsedGcpkdIC7iFcT
         10AjHSfoxoeZTPn9aaGn19ZvpXkLmoxFJe0BC+dSeAZ7GwMCqHCyhjtBlxBaZtKtU3gY
         ut/WAmUjw2tzgWTX6h2atk4uDeG+nh5v7FeEY8o+BQd/zPbo+bBalG4jgnEhQ7z9VcUn
         BByHCVyt12J3LEU0CcS5WFsH9pSODAnFcq2j9QS9a1VgxotyvyNAkO8APfwaa9B1OkSr
         C37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310824; x=1732915624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xhdifjKpJM7/1EfysM3L+1uNi05F+v2FSkP9STdI2E=;
        b=XNFyoN4V50P+Z4I63oXzOX09p9+2GxES0HKpsvnV2WXm8NApZnt/EzE/pfqoCQY7bK
         7jH/bKBvxxgz9DR8DYcVtzlsM53i44hhF1brA7dVEYiYW9tXY1VK+o2BjQotrzHZwKjR
         5smdppGVwoamE2nUKnkGu4yZKzl0s14Y+MHHZJOc0qguvq+b2yplgDUQb8CbZChs2uoz
         VLV6tg9FGbVBVPgk1WMi2ZEC4lRh+zMFybPXftzzS5bmBChLskVmEywWdwgYzsU07qsL
         ZRKLhiiNIJ52RMeRGRrcyWscggb5CSXRDYJI/o20VmDHzYbOic5tvTgCOdXfnMEORUCI
         9rrg==
X-Gm-Message-State: AOJu0YyE4ktf+5IajsaBLcgjAoXwQS5xurrrPDGdxq7kunhbgM/PhdJm
	ekJdbjr0/0B5jhOrkw1jT6Dg7dVLGkge1JvWIoh0HtOZYSl4tBmQ9aM6O+lcriu3BwFQx72ZBuZ
	u
X-Gm-Gg: ASbGncuEbs0IE4Imo8VDFA6fA+InNKDSWmdtFHA8qtaffJ5Psuzn6M2qNKs13DsW5kN
	g/kNDNrsvM6bA+XQkHvDAW8MzGqqFz5xqYsDcq3IQipsN2hGCnCg403+t8Wp34d97CpVc8vfpY4
	BS2B3164e5nt/kMBcdORVgjN/7pUKZCwwEj2kQSFtdzSObZyicZmJMnk3Kkv2OSnVNVbjhiXZRc
	VrsMEcKVN+CLrbsidO/0PN8HWL4czkCwNumPnU=
X-Google-Smtp-Source: AGHT+IGf2+lE+wMTYZCJaFbioCzVEl6YTdzBTxZ4oQnMNOmExa8Z9+6f0UGQdrofWHQCTvhSokqglw==
X-Received: by 2002:a17:902:c949:b0:20b:6624:70b2 with SMTP id d9443c01a7336-2129f5db7b8mr48662935ad.19.1732310822904;
        Fri, 22 Nov 2024 13:27:02 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/19] ffmpeg: fix CVE-2023-51794
Date: Fri, 22 Nov 2024 13:26:29 -0800
Message-Id: <248dc3b20971fb95f0ceb2a34959f857c89ae008.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207661

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.N113007-g8d24a28d06 allows a
local attacker to execute arbitrary code via the libavfilter/af_stereowiden.c:120:69.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-51794.patch        | 35 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch
new file mode 100644
index 0000000000..a33ae5ffe9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-51794.patch
@@ -0,0 +1,35 @@
+From 50f0f8c53c818f73fe2d752708e2fa9d2a2d8a07 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 23 Dec 2023 04:03:01 +0100
+Subject: [PATCH] avfilter/af_stereowiden: Check length
+
+Fixes: out of array access
+Fixes: tickets/10746/poc13ffmpeg
+
+Found-by: Zeng Yunxiang
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-51794
+
+Upstream-Status: Backport [https://github.com/ffmpeg/FFmpeg/commit/50f0f8c53c818f73fe2d752708e2fa9d2a2d8a07]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_stereowiden.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavfilter/af_stereowiden.c b/libavfilter/af_stereowiden.c
+index 7cce1a8..f1a5b10 100644
+--- a/libavfilter/af_stereowiden.c
++++ b/libavfilter/af_stereowiden.c
+@@ -74,6 +74,8 @@ static int config_input(AVFilterLink *inlink)
+
+     s->length = s->delay * inlink->sample_rate / 1000;
+     s->length *= 2;
++    if (s->length == 0)
++        return AVERROR(EINVAL);
+     s->buffer = av_calloc(s->length, sizeof(*s->buffer));
+     if (!s->buffer)
+         return AVERROR(ENOMEM);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index ae02310af8..80a4e5b96f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2023-50008.patch \
            file://CVE-2024-31582.patch \
            file://CVE-2024-31578.patch \
+           file://CVE-2023-51794.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.34.1


