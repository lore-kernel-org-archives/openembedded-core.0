Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBC0C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.7394.1739913022129771143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PCPCwBG3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fbf5c2f72dso9030765a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913021; x=1740517821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KeJzT4O+utcbruYUEWzyhXhaMSVH0Ht1TeSlOZl+6U=;
        b=PCPCwBG3l6qywPnC6L2y1LbXS+HdbhMan8taWlbQzyvT3IwhnINDOlTdGlaXqbHzeN
         msLrMqLgo7UAL9T3ZQFMf5yK9r9/hnLNda7hNqKFP/Vbfi4k2v4Ui6JkJXEmkciStr4p
         0OUvk/2xemQ1aFennx0pxmAZy88VKfBlHk9mrMKAPdZRePy0Zgv3F+q+CYXflr/8nhw+
         /S73M9ZrgVUU1QS8qW0xuFCpDDdLBt2aQeFneT/z/X15EDTCR70/1noO7ccwSXazPJls
         YWKG7yeEG2NlB0XzkuVaL1dnI7jJzxbE3ZLVQWElBheR72QppL83NIj/YdNVhGNldTwj
         9YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913021; x=1740517821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KeJzT4O+utcbruYUEWzyhXhaMSVH0Ht1TeSlOZl+6U=;
        b=NyNsvjdqGlIVOaQs7Q1P3MqnuFEBSmusJDjUygDs0761nRnac8GCUe1vrPUF4wU8vQ
         XQ+KhJafpHwpt1Y0uPohs8imGwqG1h32dU+EhKMPWlaOJXxxzKRrXnG5XHToMSmOtkH3
         FC3gPp8EyJeENfjbySYUsXljnrEsqkQW3hhU4E7FC19EL8wUiZdseHO93331YDJeLk+x
         8i1107CoXBzWxSTKI694xEdd8+uRM9wfT24Wl0ZQPSKijccPcf66uXviHzfnvNEKtq/b
         JfmdgNOR9OurbML3pGTJ0Ox2ba1Duh/ra3HZHy0E6Y4hxu5Rsm82swOhUnwZK3DOElzq
         KOmA==
X-Gm-Message-State: AOJu0YwVgYKyxnv3svhpxlXg4jA3X7/1HgoO66hT6juqm1V/Tk4Y/R+w
	OxqkyQUl9EXLxR/iLARZy1k4JfYxuYLRI8u9HnnRjdSPpGIL5fsLfMeOrPwiukRyV3ZJ4bSMgx0
	z
X-Gm-Gg: ASbGnctAijNqGJYRM9VtpK9V7bSxSsZqPeYWqZoc1mQeSrn/OnqnZm6BS//AtXNVC0V
	arxEslGIPetSX5axwlENfaFFlreCjNXz/tnnL3V5UJtvv5+rh7dXUbQOq6exD+OVgV6hs8VTmBl
	Vj5SLTNpzMPe+LUnQ2UiRDz4PoadiNr/MruqwzojLd7darUj5z66twD7X/gFBHYgTUR50dMA7M4
	BbvRwOygXpdOa5tiJWH42YmUCjaOwOHltlD2Kzl+gUAxwgVWWL2Sk23kU99C5P+0Pg1ZA5GLbb1
	XsARtAU=
X-Google-Smtp-Source: AGHT+IHmOI3YOsXKa9N4AwwwdOG63AXIFUkhSEJZwRpOta+Thm5v4iEQkEC3gYQfxZ2smUlv627IBg==
X-Received: by 2002:a17:90b:38ce:b0:2ee:b2fe:eeeb with SMTP id 98e67ed59e1d1-2fcb5a99658mr1204341a91.22.1739913021340;
        Tue, 18 Feb 2025 13:10:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/12] ffmpeg: fix CVE-2024-36613
Date: Tue, 18 Feb 2025 13:10:00 -0800
Message-ID: <35e7313d5da4cefa405b0b07c2ce4239aa92a69b.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211646

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg n6.1.1 has a vulnerability in the DXA demuxer of the libavformat library
allowing for an integer overflow, potentially resulting in a denial-of-service (DoS)
condition or other undefined behavior.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        | 38 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
new file mode 100644
index 0000000000..300b8d1e49
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
@@ -0,0 +1,38 @@
+From 1f6fcc64179377114b4ecc3b9f63bd5774a64edf Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 30 Sep 2023 00:51:29 +0200
+Subject: [PATCH 2/4] avformat/dxa: Adjust order of operations around block
+ align
+
+Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
+Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 50d8e4f27398fd5778485a827d7a2817921f8540)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36613
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/1f6fcc64179377114b4ecc3b9f63bd5774a64edf]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/dxa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/dxa.c b/libavformat/dxa.c
+index 16fbb08..53747c8 100644
+--- a/libavformat/dxa.c
++++ b/libavformat/dxa.c
+@@ -120,7 +120,7 @@ static int dxa_read_header(AVFormatContext *s)
+         }
+         c->bpc = (fsize + c->frames - 1) / c->frames;
+         if(ast->codecpar->block_align)
+-            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
++            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
+         c->bytes_left = fsize;
+         c->wavpos = avio_tell(pb);
+         avio_seek(pb, c->vidpos, SEEK_SET);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 049d9fd9ec..91259baa5e 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-35367.patch \
            file://CVE-2024-35368.patch \
            file://CVE-2025-0518.patch \
+           file://CVE-2024-36613.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


