Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8290C71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.95891.1749584316810852410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/53WJqG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236192f8770so1668995ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584316; x=1750189116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93mf7hk/khpH0AHKI0KXpNH1rK2qS2Rrxu2hT+Lncy0=;
        b=R/53WJqGDsbWRcOzoYTcUEggM5OXiN5/5xQTaUr6YG70qPi9AUnMzBhcefjEjrmY6L
         uWm/M2vCp59FJfEboCnb+bnG5arw7aOy1qN2imewQHpb7hdfjKHaoPtIjyZqzE8JiQ/R
         FD/sBRCLoVExizSE4aDXLHrTuxS9xS4qgmm9P7PNssjGKXlBw2SJr27+LcrVUDENPuAj
         3zNfcxhkHq4E22bLo2I698BoqNpkCk3KGv4/zNv1DeA849iT0zJhvB2YdBxRoseAAbb/
         5wn2PMF4AbF8U4CpMr8PmUI4ZeY8ehpEs35sZHLsd3krFdtlMvtkPVzQ0svFkDbj7oYt
         50Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584316; x=1750189116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93mf7hk/khpH0AHKI0KXpNH1rK2qS2Rrxu2hT+Lncy0=;
        b=ADAqegdK+ytGRcNzj3yfdRekiSgexeaA+9jHFQqKdfkq5nWLArdTnC3nwn/LZZ8ha8
         +yKwmAHcCIxKz3vJQuO3l3kF9f7UyEtzhoZ396kzn6N5vabEuMqv0e+GHVxAfHL51wOX
         9WerRblBlHBgy0vUo7TsYoE+Js73BnaDrmI2nYlkYd/1bf4X2LoqwUwIiqRLtZJt271g
         VPfgvKU/RqDJ2PByJCJxraPx2cMe886CCr+K/rzjde0sMbHQsZVEJOdw34tCmy0i90aB
         h6vFrLMIiHQZKepX4i7ghUvv+polIetzvz8tWECe97QPqYdSC9sdVrc1J5BLuaaIuN2y
         8CDg==
X-Gm-Message-State: AOJu0YwP/Ed+h4THYeqlZ1ru9NxJppBIVmX94JTYKKhK3dnWhDobJwHd
	tQr2R6jKUhDW4Oj+lJO0kmJL6j/OJbyREHFN9cnBlJFObDXl9HhTnAwNM4QEIU7ziLR2vRTQv44
	n3gIp
X-Gm-Gg: ASbGncuims01yes/e/mjDkd9jcW7XAAJahoUd0AN8Itm0gIDicNUCQBmJvOaf67y4cU
	fI/vTtRL2YB4kwRm8+GSP3GhJlOx9S/6eoQBroyd5bI6RTiF3OZZDRqHKlNo5qdZPxKno+RN967
	/Y952lhWAjdhqddmuHtecGMlTfwIXrEtRFS++iJueHW5rmlfrhLhPBFWOB06lLZrVZydSkNnSnh
	0Ln8gOEjpkKUEKkfR4m5kjpwml55WRPVJ+HBDOcolYliOgS1ajkBcfNpHmZbL0gxLVrmn/r+Dxi
	29RZEEcAwHp9Mucm3nFwGZTbu4GbAQPLRLHqKF5JFj43yAUmoIPlrg==
X-Google-Smtp-Source: AGHT+IHE0wKYVez99w0sodQUdYk9nCJepytLegfbD+bFoqX6Dd0aVwN35E7OlpGmJK6WoaMYIwholA==
X-Received: by 2002:a17:902:ef07:b0:234:24a8:bee9 with SMTP id d9443c01a7336-2364169f471mr7256865ad.4.1749584315845;
        Tue, 10 Jun 2025 12:38:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] ffmpeg: upgrade 5.0.1 -> 5.0.3
Date: Tue, 10 Jun 2025 12:38:11 -0700
Message-ID: <dadb16481810ebda8091b36e3ee03713c90b5e7e.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218427

From: Archana Polampalli <archana.polampalli@windriver.com>

Refreshed CVE-2024-36613.patch against to the current version
Removed below patches since already fixed in this version

0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch [1]
0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch [2]
0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch [3]
0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch [4]
CVE-2022-48434.patch [5]

[1] https://github.com/FFmpeg/FFmpeg/commit/1eb002596e3761d88de4aeea3158692b82fb6307
[2] https://github.com/FFmpeg/FFmpeg/commit/293dc39bcaa99f213c6b7a703e11f146abf5d3be
[3] https://github.com/FFmpeg/FFmpeg/commit/2cdddcd6ec90c7a248ffe792d85faa4d89eab9f7
[4] https://github.com/FFmpeg/FFmpeg/commit/481e81be1271ac9a0124ee615700390c2371bd89
[5] https://github.com/FFmpeg/FFmpeg/commit/3bc28e9d1ab33627cea3c632dd6b0c33e22e93ba

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch         | 18 +++++++++---------
 .../{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb}       |  7 +------
 2 files changed, 10 insertions(+), 15 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
index 300b8d1e49..8dc43c3b68 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36613.patch
@@ -1,8 +1,7 @@
 From 1f6fcc64179377114b4ecc3b9f63bd5774a64edf Mon Sep 17 00:00:00 2001
 From: Michael Niedermayer <michael@niedermayer.cc>
 Date: Sat, 30 Sep 2023 00:51:29 +0200
-Subject: [PATCH 2/4] avformat/dxa: Adjust order of operations around block
- align
+Subject: [PATCH] avformat/dxa: Adjust order of operations around block  align
 
 Fixes: 51896/clusterfuzz-testcase-minimized-ffmpeg_dem_DXA_fuzzer-5730576523198464
 Fixes: signed integer overflow: 2147483566 + 82 cannot be represented in type 'int'
@@ -22,17 +21,18 @@ Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libavformat/dxa.c b/libavformat/dxa.c
-index 16fbb08..53747c8 100644
+index 474b852..b4d9d00 100644
 --- a/libavformat/dxa.c
 +++ b/libavformat/dxa.c
-@@ -120,7 +120,7 @@ static int dxa_read_header(AVFormatContext *s)
-         }
-         c->bpc = (fsize + c->frames - 1) / c->frames;
-         if(ast->codecpar->block_align)
+@@ -122,7 +122,7 @@ static int dxa_read_header(AVFormatContext *s)
+         if(ast->codecpar->block_align) {
+             if (c->bpc > INT_MAX - ast->codecpar->block_align + 1)
+                 return AVERROR_INVALIDDATA;
 -            c->bpc = ((c->bpc + ast->codecpar->block_align - 1) / ast->codecpar->block_align) * ast->codecpar->block_align;
 +            c->bpc = ((c->bpc - 1 + ast->codecpar->block_align) / ast->codecpar->block_align) * ast->codecpar->block_align;
+         }
          c->bytes_left = fsize;
          c->wavpos = avio_tell(pb);
-         avio_seek(pb, c->vidpos, SEEK_SET);
---
+-- 
 2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 4b99c0fa21..127552396d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -24,11 +24,6 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
-           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
-           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
-           file://0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch \
-           file://CVE-2022-48434.patch \
            file://CVE-2024-32230.patch \
            file://CVE-2023-51793.patch \
            file://CVE-2023-50008.patch \
@@ -53,7 +48,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-25473.patch \
           "
 
-SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
+SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
 
 # CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
 # and not ffmepg itself.
-- 
2.43.0


