Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8209ED5AE74
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2900.1765620098236516562
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c3dsIbsn;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09d981507so1093155ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620097; x=1766224897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc74VvfCPhWbQsc1Qs00xSDnYrKCWRc+oK9vZR5f4mA=;
        b=c3dsIbsnIbnIep8SCHRYP9e5WxaqM2tZO4RbnszqIrSyeQ29jxzmQlxj6ih8H/pRVc
         iwoPKtuYQUIj8fKAyKBlo3wa2k17sVnvjN4M9fB/m6qRsU3D47TCqMo5cBav6Tvq4OhC
         elq8aRAof3z5PSef+72Z5dtpq2xXahtCY3SCM4eL5Vv0+TWQ77nyjGuhBA1mwvKd1CAE
         7wsl93uu3i48jiJON6AdvUz4nG/76ClFvFNpPYBxXgoHbhQnYxJfE/T2RxwcIDdtBICv
         dQ6nub+TBpYE7++3uy1ydS58gsKlK2Igp/zpaD+AEv4eGX0P14EiBap736e8rSEpIGVV
         3q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620097; x=1766224897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tc74VvfCPhWbQsc1Qs00xSDnYrKCWRc+oK9vZR5f4mA=;
        b=Eo1cNPOLDqeQgsmBMLpezs6vJk2AJZrFUas2q6f9Zc7ltm6D6RtNe6oFaMkUnvtRfk
         r51NpQrSu88+vhhgVpV7o2TW2FTv7+brfM7K1JJrv3ZWDjg9+gFSGDGMVvlVIERKNwXg
         ZZbIFirhl90Ju7YpRQpYef7DkK9h3nHzwp5JzxWuXAtAMwn72N+6Til1plv6Br6/Rxoi
         XAUm0nVJB+Uod1PGgJlIXIQc31c3GF6r2dvmYo59YFcvXykRhTth+d+QQS/+2lLrTi1W
         hopPOS8S3h7mIx1LG62lAXhCvQzFXegqOSM8Yux0Ze+2KtEJbeIeVmEm4WEJ76/8rqui
         eMSg==
X-Gm-Message-State: AOJu0Yw1yD2L1tSsXx34EQQnEQBKMXEwBjKeBn/XiB0UsrYm3//aWQEg
	bGCWPeD14XXwapqZQAn4fikTLhW27dHqxjIEG+FuzCp/6mPMIkd/reU+sLToQafq
X-Gm-Gg: AY/fxX4+jginDRG9ztOLHS8e07Ps4BZ99IHowe7shVJ6EFzIBbscstrf7TTHaA7NEre
	ttFi5P9xmms1nqHKNCusq8VWJE+etqDfkXS83nEEatBQDtF5dp7L2KfRSNHpxxyDsxDUPLVNdgg
	z154SIdxb8qsKyqYK/p5jyT42oF5rxYfJYmXZUO9LzX5eD4MLv8YoruQMQUJZa/HpMyg9AZjAUK
	U3SykLoN/BpHROme34voiVhXO7YAJB7FG69C0Izmpx6oj9ssUCqa4MULxkb+NA501i6yql24W+K
	f/GGLqgY48htVf5yuN2nalZz1HLK9gntmd5RtOWamyGhLUpe5+DexBViwQ+XAAuSgnkM9GlYBv8
	UZ6QR2etjCG63gBb+ipgZZHmEKEIXcZg5T7IbZhh+LL2B5uHOo4zg76f54SSVMBKM9fYBmbRjlx
	G453R3baO87Sf2lQAFTGp0Xvbb
X-Google-Smtp-Source: AGHT+IHrDbhR3c6yLrukpblYkJd1pvX08YOwDsdJSH6Oxxm2Bw4mjuIHx1zA+i+UR6F0ypgockSEEw==
X-Received: by 2002:a17:902:e546:b0:29f:175b:1ec7 with SMTP id d9443c01a7336-29f24e6fbacmr45153545ad.16.1765620097315;
        Sat, 13 Dec 2025 02:01:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][whinlatter][PATCH 43/67] mpg123: upgrade 1.33.2 -> 1.33.3
Date: Sat, 13 Dec 2025 15:29:07 +0530
Message-ID: <20251213095931.2571498-43-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227661

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
* Fix build with newer toolchain on Android by using __ANDROID__ macro (bug 380).
* Consolidate and more consistently use .rodata switch in macro.

https://github.com/madebr/mpg123/blob/master-with-github-ci/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 3436917ee9d22736a685357dbac51d44870c1006)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mpg123/{mpg123_1.33.2.bb => mpg123_1.33.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.2.bb => mpg123_1.33.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
index 23bb400ce5..b1897fe95d 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2c54fabbfa696dce8f9b137c8ef7a429a061f8fe633cd7d0a511809855f2c219"
+SRC_URI[sha256sum] = "6a0c6472dd156e213c2068f40115ebbb73978c2d873e66bae2a250e2d2198d26"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

