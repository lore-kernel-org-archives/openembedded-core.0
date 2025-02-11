Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D5EC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3286.1739304568981537591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vKrr15CJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f6d264221so44210695ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304568; x=1739909368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+lEWE9mKvo0VIL0NNQ/Y6Ge7JHS2rFwkemlt1mdyLs=;
        b=vKrr15CJgowwI+mDJ3fqmRFzTGqJ846/nDLN3ia3H/21Bch6ia+p1pz1cVHiEXMnkn
         q2J1QCnNjjOX34jZ+ysnDVBXIEixgB1/HP3msKgJtXeizPeOh4Fkil08+ipohNRMh/lU
         6HR3rUBfNTtp9fqaaGKiLu3gmJEKRWaHfr4Rv8cI69k7Ph2I/KM9ycnrD0yFQbzfUuce
         2k/io6CJ96FbujHZ0J7LxKNKfhF2UGIgdCxEJCEKrmU2FL5csj0Zy4DUOeVpWMxJmC7L
         h57e4gd6YVIY0GxcOM98ejV89/VoxNPJr6SafVuNk9LwNDNlyAxKv+QffwO0nH0Qy4Hw
         WueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304568; x=1739909368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+lEWE9mKvo0VIL0NNQ/Y6Ge7JHS2rFwkemlt1mdyLs=;
        b=Ihyh5Mousv6Bs3gFLLoM1ybCguVRksNRqgf+h8AkfgcmoQ5ziHoh3hVEG3ClwfaTME
         +mMry7lADRWQHo6GKU8f5eqtn1eoKnBuCgnuGrIpWIt770hm/L/15kqgNaFK72DRLuAs
         4hfGUIkky9dRwTmf4hbJQsTp/8WPVOTet00UDgBqH4Fkl9hJbV9x/cbZ1Pf4cjT9khhj
         swABL6suVnGT9CfRIlOhTrMp2CmRdHxBd6DckC92R6+Mg4u05RYJgyZRKWdgENtYPqHN
         XCa2rq/rgPaHpTVFv601DnW+nFa8zHCTfRlxBK9dHmB2JQ3he/QdN1ghSeqeyRwi95CD
         2ylQ==
X-Gm-Message-State: AOJu0YxchD3VoD3jbixcQLaD6CnFy9ucW1Eg4yA+evJA+tI9OA/gGXbk
	Bg97Cp1eJo/kkpaI0FW7GPWeenO/DYwvonnpP65BP32GabSfPrIMkAEMlMjHLmrePTu0J5bhHea
	X
X-Gm-Gg: ASbGncuG12ddfKm5yWLR5fdrGqs50Wg5dSAGTS+VZwT7rgRHMKmoOT6Jr+CpF6pK3oU
	dHdTZvItayq/7SKR189PvfVBixBW2P9gCX/Ctuc6hTcMxu4aNC44YI1V9s/ZHQy8Xe8ayFk/iSd
	/lncCMS9UiW0/MxOWLMCBDjbumvL8reJtd5dHhk+Y+0YrHaC4rAwUOzipuI+vrtNPOK+nN08Jgq
	iJVuobXtQtFKl/0OBrKROIOq48OZD44Ecss53Kv4vh8SY95fqOdqaR/gWweORXO5urqXcjZaj6c
	Az51
X-Google-Smtp-Source: AGHT+IHdgnWUNOgANYlNEjhYaCDRcVUmJavCQ+rRjm3upHQwFfAiphHcjrYZHHuc6UB9yTHw6i0k8w==
X-Received: by 2002:a17:902:e5c4:b0:21f:5933:b3eb with SMTP id d9443c01a7336-220bbb22a01mr8603875ad.31.1739304568269;
        Tue, 11 Feb 2025 12:09:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/14] ffmpeg: fix CVE-2024-36618
Date: Tue, 11 Feb 2025 12:09:04 -0800
Message-ID: <21230d5dfe908533958712e06316a253e16b9d2e.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211174

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the AVI demuxer of the libavformat library
which allows for an integer overflow, potentially resulting in a denial-of-service
(DoS) condition.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
new file mode 100644
index 0000000000..5caca2da7c
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
@@ -0,0 +1,36 @@
+From 7a089ed8e049e3bfcb22de1250b86f2106060857 Mon Sep 17 00:00:00 2001
+From: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+Date: Tue, 12 Mar 2024 23:23:17 +0100
+Subject: [PATCH] avformat/avidec: Fix integer overflow iff ULONG_MAX <
+ INT64_MAX
+
+Affects many FATE-tests, see
+https://fate.ffmpeg.org/report.cgi?time=20240312011016&slot=ppc-linux-gcc-13.2-ubsan-altivec-qemu
+
+Reviewed-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Andreas Rheinhardt <andreas.rheinhardt@outlook.com>
+
+CVE: CVE-2024-36618
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/7a089ed8e049e3bfcb22de1250b86f2106060857]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/avidec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/avidec.c b/libavformat/avidec.c
+index 00bd7a9..bc95466 100644
+--- a/libavformat/avidec.c
++++ b/libavformat/avidec.c
+@@ -1696,7 +1696,7 @@ static int check_stream_max_drift(AVFormatContext *s)
+     int *idx = av_calloc(s->nb_streams, sizeof(*idx));
+     if (!idx)
+         return AVERROR(ENOMEM);
+-    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1LU) {
++    for (min_pos = pos = 0; min_pos != INT64_MAX; pos = min_pos + 1ULL) {
+         int64_t max_dts = INT64_MIN / 2;
+         int64_t min_dts = INT64_MAX / 2;
+         int64_t max_buffer = 0;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 3ef2d9099d..37416ef01a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -44,6 +44,7 @@ SRC_URI = " \
     file://CVE-2024-36613.patch \
     file://CVE-2024-36616.patch \
     file://CVE-2024-36617.patch \
+    file://CVE-2024-36618.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


