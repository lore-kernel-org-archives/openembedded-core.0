Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2583DE69199
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87683.1766434099244850950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwfujg6K;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso5456151a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434097; x=1767038897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzc4FNYMRkF2zdCkMY9jX4W1q8CpzpYUP3WQA20MBGA=;
        b=hwfujg6KsVVPdrNsSvMRvZmJIUGhpXYJEuI29sJ0PEfrzIly6474D1VVdpazuGCIY+
         FSclMb1+ldzx8bu76+7dTWoKSyt8QkmiTqfQRNGXAWUIJhjxvm0xHClzUbka/SZYeZhp
         BYohI8ssyYp7yFfokwCNjEelR/AmvVV1Bx0gTq+oxQ95MrTT4rFWdfcxO6OOEQVkTdFf
         U2ct/vvUpJgDmTlcgNcMHle7Di3vN+Ew69JHVU24W14YQ55TeLEEbWxNF+bY/ZR92mTE
         2f4FDHi+Ub50yJwJvDwsclgEAXjc1Bu3Yz7PKoIU/FYr3nsanqrk6Cd+shS+/aDXfpWt
         QBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434097; x=1767038897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lzc4FNYMRkF2zdCkMY9jX4W1q8CpzpYUP3WQA20MBGA=;
        b=iyDRaJiBMDv8PbAWUecxlzr4i5X1Ld5pZsh/PReI2Ff+AiWFWDY2TiRHYPX6ef+cHN
         cwwirLX+HOGwIXoVyO+oqIb6+ioqIOuDvwKk/gYsleGIxHn6UlDhSn6UUJri5xqCdfdS
         96vcmhNoBg/HICItNYO0G1+7zqXGWrjfljf10i2R2837Xs6Esp7DyWGHOJ53lycUnFHX
         YnKhvc9fUrEdmvt8xG9qup8/JEC4tuGnJFJFjxSFh7ufBwspvSeLekvYBqlqXJC4jBeF
         NAVmsDK9hYjfUPLPGDa81RqU4/9d4vqrohRgFMC1lPHwKztcEicl428x5NcBE5ciUYOr
         0KqA==
X-Gm-Message-State: AOJu0Yw4VNiww75VxovMSdL24r6r7AvHFJM9wEdob+NO4aUZV0mGYwdJ
	i1YOB8rp4F1LfFFAfhX7KycwboX9hGv4OgXaCHrH8BmuLV529kYmPR9W2OR7kg==
X-Gm-Gg: AY/fxX7sbV5gJvxKyYPNwGkkZWYrzkLBIOqi5iqOxwTmpI9v9CATt+WxRvb8R8qho0F
	Uyz/lhp0LlJSqyjLnuxqpQ/xU+ok5hEuy5sqia5R75Agwgx1I0Lt5h2CMUXicWpp/SRpY5Ssz1e
	GjSmwzfOV9N//STO93eQ/ntGufdp/DOZI2bPGbnP4deAnYqlSZJwVTTpR/sTvlNT9W+z0d5FMHz
	gVOEtgjJo0C2UgONWjYcbn+PXnh+qmSmItdUHsGPYoqXZLmuUW02Xb20XKz8681RhgTZ2gUCBOb
	CxYPS794+V2Podhicr5D8tmwsQd1qUbtwAL1UPZTXG5DZ8u7dU/kjnb2Tq/jUCLcAgaJv2hbQ9h
	djrad9/cruV7k/zKZmjDmRRH6yvJXAglZJbzsDKRd/lIj9n0ZpjQZnSgeEeocc1z9505wosVLPs
	4iJZ7+3Cfek22bh1pcGprqcDzY5kqSqJvAENJzMjdDuOyvmNA=
X-Google-Smtp-Source: AGHT+IH3U5iXj87PNOXF2GJL14Hc+VVu/egZAJZjcd0UYuCeqqZUTxu9JYEZqHYOme3eTCHfC+q38A==
X-Received: by 2002:a17:907:7244:b0:b7a:1bdd:3311 with SMTP id a640c23a62f3a-b803728857fmr1190987566b.62.1766434097418;
        Mon, 22 Dec 2025 12:08:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 045/114] makedumpfile: upgrade 1.7.7 -> 1.7.8
Date: Mon, 22 Dec 2025 21:06:27 +0100
Message-ID: <20251222200739.2278706-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228370

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-makedumpfile-replace-hardcode-CFLAGS.patch           | 4 ++--
 .../{makedumpfile_1.7.7.bb => makedumpfile_1.7.8.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.7.bb => makedumpfile_1.7.8.bb} (96%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 796e036ab8..554402454f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From 59b8d59504c1bafff52a8794e67c6025fcd418a4 Mon Sep 17 00:00:00 2001
+From bb16dc839a8a45cc7d2e271ebbe41d7e39a799bd Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -24,7 +24,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 21 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index aa73252..76fcafd 100644
+index 05ab5f2..57328f8 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
similarity index 96%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
index 99393e0984..6b582729a1 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "e4ae6b5ee04edeeb03db89bee372904157e3378d"
+SRCREV = "65e0b5488ffe840035c6e165a5149dc5da769d97"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
-- 
2.47.3


