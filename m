Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2505C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 15:40:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.18037.1741880442866115791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 08:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/tfEvfQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224100e9a5cso24255365ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741880442; x=1742485242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfOBQ5k3eJXtLexJghZqmXHfC+sIOejhBiV2hb4RvYc=;
        b=k/tfEvfQSfdCn+PcD9EyJGTrdXnev37YfXUs/eN+NjawQzOotsQ3a9SuI46HrZWgpG
         L3o/ef2t9Hg35Ti2eFMiXYYtgijqFloyWe1LDcVyvcgQQeEauAmuBhI8Oy9QCSdTegB4
         XLooJCws3ftNpJv4MQCacqx0SEZu8VHdUVT17cam07d0U+jUUFjYlXT/IlbLWboywarF
         iYesEeikt0p30Ph1D3O6rGdbiCe4BMy4crynJE/WE8qD1bVY0JkAZtLCIp0oFOH/raXy
         2aXPI4Mnj9mhHoZtbne+Rqb6T1JG+h7VGCNMvy1XdPni2MDtZ2J8j7NqUiwSfbz0N0W1
         xfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880442; x=1742485242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfOBQ5k3eJXtLexJghZqmXHfC+sIOejhBiV2hb4RvYc=;
        b=QYdCo6XjJ6AODNeRtYxGXWCKzmHHw+CzBtD8sedFYXdUdoVACQvSyq54Z1DBI3hqvh
         S3K1ZrTC+Y4jgDg5DgRMgCcJyBwPKvlJo1NAGzDGOL1YImtYgY6UYKXDXYsKSHALX9YO
         4YU+TRnPS15WD5BWO0ZRnzJB1ReWAGScfx9+kBhTskvSY2DqsmR/V5+/hBUK4xdsp4al
         xxSri4R/EHMhOLTryR/x5iqHNloqvpQR/VR373PtbF/LvQ4zf6J2TWHn1FhGhqs59v00
         IHJDr7d9p8fpij/1P/7zA4pTelAx2FUHZxAzTuCW36UTAuyPpLUlTVtxb5tas8tXf6gY
         QhYw==
X-Gm-Message-State: AOJu0YyDsbgTfIDRJ41hHDScbpr/YFKk86PlfZCBIpCbtoaZhdAkcirw
	Weu/rvAcbIVfYxAgKgN9n38UgOGyYsTg4kJZUN9cchjAHcy6LvHLs56nXTCQ
X-Gm-Gg: ASbGncucKnivmWfbj7ukfanqzOQ3ES7xWUWouM1b/yKP9PNEgQM3a4PxMqHpJ9cj4NR
	YBbM/H7pjmhd9y4aNjTGOiO+PorhTI1NYPwTLgAyaxiDI1nwbRJxsh/2xnM7a6vNVhi/lvs4LFK
	Iy3dUKGhwHigzi+PAxf3BPwUlkgcsRclLKXW181RRwAa4KhL6JWXZePosnVl6NiN62M9lam48OE
	5jI4SuQC2N7jealCjLk1wmSky7EYTNl4N9UfwYDCOX9KsGWfU5z27gQXWNkSKAp1U6S3pO5jFiF
	KiTWanhxylg7pVKp0E7DI55CfHWCPmZAGlSr
X-Google-Smtp-Source: AGHT+IGVtG0aKmPKAaxs9nPODvjQcG+S7ZQhwmS+v8d+Qg2wTSEiclPbiy/OL0d6ore1IjwAZCTEow==
X-Received: by 2002:a17:903:2405:b0:220:f140:f7be with SMTP id d9443c01a7336-22428c075b5mr458844565ad.41.1741880441868;
        Thu, 13 Mar 2025 08:40:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::df1f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559fd3sm1522791b3a.69.2025.03.13.08.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:40:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-runtime: Package libstdc++.modules.json
Date: Thu, 13 Mar 2025 08:40:39 -0700
Message-ID: <20250313154039.3256909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 15:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212788

libstdc++.modules.json is new file in libstdc++ from GCC-15
it is the module mapping file used in C++ projects that
utilize C++20 modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 291ace2d09c..afcc13a310c 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -205,6 +205,7 @@ FILES:libstdc++-dev = "\
     ${libdir}/libstdc++.so \
     ${libdir}/libstdc++*.la \
     ${libdir}/libsupc++.la \
+    ${libdir}/libstdc++.modules.json \
 "
 SUMMARY:libstdc++-dev = "GNU standard C++ library - development files"
 FILES:libstdc++-staticdev = "\

