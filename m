Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A970C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7395.1739913023446113996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Old2lFI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa48404207so12031629a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913023; x=1740517823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH/zoKWiu4F/ZdnhCqF9c3h03ui/co/p6T8A46nynG4=;
        b=0Old2lFIXipjMHv1HUmY4w9HsiuIbiLc4ET4ogDKJAMgwYs7E9s6MsfcBLZJk3xvsl
         lvh/sFhG6CNzPuskgZBzlpw1/gT1uuxddUTFyVwn0m6S/YpJmibkjctzn2OprL/oiSy2
         9g4AUNfuoeUW9aTLoNqqjLZUBJVm4E7DaxqRA/mAd41sqCQCNKnTlaetYwjAzC+9tanJ
         gPY9kRIMQZdM/T0z300Lzk1Di6TNa9Ei1lodWoPOSsAaKKN4mA+aSaoIbyDMnKoJsd8D
         +1+k3o/VH4j9ydLPee0vQPnt89qVPBLh+K4gkjiBlZ5Fg8xgQvMO2lmjpBbbbAo/PNx8
         eWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913023; x=1740517823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH/zoKWiu4F/ZdnhCqF9c3h03ui/co/p6T8A46nynG4=;
        b=h9WJPp6xG0P1Z+xUulHCtuS70Q/3dbQEflSfwW/tcSBFEqI2YU0+FL0D/ed0UGkfx9
         HENNlxRZ9638DYYcw3qktoeMxg99i7jzBnzBMcngaqyBaOJ//cSyWv2qW03HbXiWdLAj
         02Mh/k2vFMJ8gecIVtJjEbKuyrOW2uMYp+gyWDLjvqWZlxYg7pBdz8VmuiWOtdZSEhCe
         2oEIFfCEi3UJ7MtKkzFsgP/2xXteWUGa8yac/AB5hZmkV+gbTyZaokDYK+QWAVyd7XNZ
         PuiqB4VG7O1Giv40JD3lhPIHovJfdVZ1LW3jT7xhmMXFYtUwWEWygADNxfKGcVPrQ+l+
         KpFw==
X-Gm-Message-State: AOJu0YyNQq+x7Z0pCBuTSvhn4Ot76KJg+FCMyVH0bvj7AlcmrDvBZeHX
	p30DNBYOOvqbE4OHPMhfQYg34QKCpWCjskooxmvA53c5i8eQLKED8EmIepl8iNn4bsIzvDWtrqe
	h
X-Gm-Gg: ASbGncv8zA7EPmzAnX39/N7kLvyJSSfJrE3Gf38hY+zapfyYHw8/FPhaz8YUSGVtEvU
	/LgpH/vgiGNQ9N+egBwEOBNTALWI4px4Gpm+jMl9Ty1FKpcV7pzGn1sBz4oNxqwf5PfJW5L7W55
	9paDfCGjLQmTSiEPxne0S1rbaEu8YLA1Jdhtuppy+4HeWuOD21qfkYy2DHtH3mm4sETNL6v/SWy
	1qrBn85Scz6xIti5K1mHtTBoFsDP/DB0AY5KjRnzeWD/PElR6zm1GNtRAhGuNxFHTDQf6KHA/xU
	P3JRo2s=
X-Google-Smtp-Source: AGHT+IGQL9t23HYK77xqCeeBTKmwnHKHeK7sV5cCrk4T3QKgkEoZDfYOfvyklPq/LLLcAz/KECUsCA==
X-Received: by 2002:a17:90b:4a09:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2fc4079026cmr28895401a91.0.1739913022673;
        Tue, 18 Feb 2025 13:10:22 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/12] ffmpeg: fix CVE-2024-36616
Date: Tue, 18 Feb 2025 13:10:01 -0800
Message-ID: <ec6e3e2e26bdd7c78e3943db747d68013da8d6df.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211647

From: Archana Polampalli <archana.polampalli@windriver.com>

An integer overflow in the component /libavformat/westwood_vqa.c of FFmpeg n6.1.1
allows attackers to cause a denial of service in the application via a crafted VQA file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36616.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
new file mode 100644
index 0000000000..5e2046dbac
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36616.patch
@@ -0,0 +1,37 @@
+From a8beef67993aa267de87599007143d9f0ba67c23 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 26 Mar 2024 01:00:13 +0100
+Subject: [PATCH 3/4] avformat/westwood_vqa: Fix 2g packets
+
+Fixes: signed integer overflow: 2147483424 * 2 cannot be represented in type 'int'
+Fixes: 62276/clusterfuzz-testcase-minimized-ffmpeg_dem_WSVQA_fuzzer-4576211411795968
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 86f73277bf014e2ce36dd2594f1e0fb8b3bd6661)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2024-36616
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/a8beef67993aa267de87599007143d9f0ba67c23]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/westwood_vqa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/westwood_vqa.c b/libavformat/westwood_vqa.c
+index 9d11606..9499569 100644
+--- a/libavformat/westwood_vqa.c
++++ b/libavformat/westwood_vqa.c
+@@ -259,7 +259,7 @@ static int wsvqa_read_packet(AVFormatContext *s,
+                     break;
+                 case SND2_TAG:
+                     /* 2 samples/byte, 1 or 2 samples per frame depending on stereo */
+-                    pkt->duration = (chunk_size * 2) / wsvqa->channels;
++                    pkt->duration = (chunk_size * 2LL) / wsvqa->channels;
+                     break;
+                 }
+                 break;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 91259baa5e..fc92bb2ec0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -45,6 +45,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-35368.patch \
            file://CVE-2025-0518.patch \
            file://CVE-2024-36613.patch \
+           file://CVE-2024-36616.patch \
           "
 
 SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
-- 
2.43.0


