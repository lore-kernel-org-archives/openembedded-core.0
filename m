Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE0EEE49A1
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:25 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71904.1767125542492542489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L15E6ud8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso13852949b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125542; x=1767730342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIHsAwdtowXIkU6SWG6fE6wau492LyWqp/kqtc083MI=;
        b=L15E6ud8/a6Mc1BLOfhDEC4ANN0t9xodUodGUb3R5WlxpV50XJqqjGLCKPa7CMlo0u
         Erg9UGeWmwM3kwJzyaDyx4WUTHxvD+Wu72DHsHFjYgYQhXpvM8ylo9VCwnxxdFiIunGT
         eGOPDgFLf+lK89nggQofFk3w6vsDG+MAv4DnbYfEqmdGVjMgY2PZ0Y7cQ7wBK3bfIQkE
         hO16JpxcJXe+NBcqlMlxD9ydJcJVgWT26H+k/jdnRYlwAZV0aM5WaArYVJm6/kJUfhtg
         xAdIg/IXvnNfcBxP1+Bb1qvRyfhkjr/5BI6g0oYalV3qr4rs1jvBIhPhq8G8mukBrc8Q
         AdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125542; x=1767730342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bIHsAwdtowXIkU6SWG6fE6wau492LyWqp/kqtc083MI=;
        b=vsaU0BDrHRwVzcZVZlw4wXUfCALORMtlr6o7NZzTjThLJJMy1oq6tiqUBbp6WSGW7b
         8ZGZVaoL8QaYkdGn8P9TKFICJPUQo148+/k3KqPJIDRSpGTY23jroDswry1SzWvp4naw
         82r/fA0BY8qnJ5ItfmFUnGeRrkIFHPdw6YNfwUJetmqj1ilQy/gegScoRQqBFz8qwM4w
         p3AhDhwvwsUgR4iCKTAIUCfhrwYOCDJ92zrU9p5dWIQGxn06uJQT4EvFJ4kkAioKHf5F
         1A2cw6AiHaWKIOGwGJ0GXjpzHDayxVDFLPyftIXtFSK/dGP0+mQFIkQvcVswSkz2K1Sb
         LdHA==
X-Gm-Message-State: AOJu0Ywg8xCAqjenk+rj6r34gQ/fyJj5r85ZZuvteu/3VfGc1rbYn1SX
	qZjqC5eBHFyP0PDuRbwS4emIZIKvgO2xKTLGuv1J4n2vKxWCLQOi0QChD0ReGU9r2sRMoNRYSm8
	dWmLZ
X-Gm-Gg: AY/fxX7bWIxGVLoVJKPNQ96Tl1LECEwATgk6hmDBMtG5rE8wbTXSa348Dew6+hATfip
	ioJa/efYMtdRGC8tYvf+9hZfyY1tu5AQ7qyoKlaPZ5blm/GGfkF2elAOEkWHuSfDl3ImbQsooJr
	VPrBB4g1W1WK+nu8wopxMd6E7WskMY1VZTNLhRTTXXat2j6TVZs15pSVPqA16ehY65jhBZbjYG9
	jSbhTBtKBm+AiHpGf2saaPIRo5bcmqcId5Sb/8S5T7STZjt6kChd8M6Qgu85XHaE3XaSAaAmQ4B
	5mRvOT3Sf9raVUHCvl0Scw6Nacrd1wIr94b7PJL0Tuz17sEPVLLTi8HnI21Wt6wp5kGCp7+ACNA
	uKVpcasVIUOSvydcgMJZyMIEgHR4CvTjQ4eZMzs0qot17z7jT+5tzLfmDr10AeDbCngjVAN/GDQ
	7Tcw==
X-Google-Smtp-Source: AGHT+IG/Rfy81yVcQCOx3SuRsMPwdlQ7kK8gAghRAoIE5LSXhwc5SDwMbF4d1cSYwm4R3CfrOE5gmA==
X-Received: by 2002:a05:6a20:3d84:b0:342:2a1b:86fa with SMTP id adf61e73a8af0-376a94cb4a7mr31359073637.45.1767125541678;
        Tue, 30 Dec 2025 12:12:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/29] libarchive: upgrade 3.8.2 -> 3.8.3
Date: Tue, 30 Dec 2025 12:11:37 -0800
Message-ID: <621b8a5289eec7bc5c66fe62d823f7e685571b22.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228699

From: Peter Marko <peter.marko@siemens.com>

Release Notes [1]:
Libarchive 3.8.3 is a bugfix and security release.
Security fixes:
* lib: Create temporary files in the target directory (#2753)
* lha: Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET] (#2768)
* 7-zip: Fix a buffer overrun when reading truncated 7zip headers (#2769)
Notable bugxies:
* lz4 and zstd: Support both lz4 and zstd data with leading skippable frames (#2771)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/compare/v3.8.2...v3.8.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4b32b43a607bf708e5433366a3ef6cbcd5b8b221)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.3.bb
index d4f367009a..e3706ba3bb 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "5f2d3c2fde8dc44583a61165549dc50ba8a37c5947c90fc02c8e5ce7f1cfb80d"
+SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


