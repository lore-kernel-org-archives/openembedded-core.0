Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA434C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.3135.1737601221126790049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oA3mOWQH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso2585159a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601220; x=1738206020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAwBoQgjlqdN0lt1W5MQV8pK/e1W9mKfJrTU2unM280=;
        b=oA3mOWQHsOUj5sP1Sz6oH4xSrVZkiy2icGLGEvdE23yN8hWJnsyeMZvIPwBVBMmnoy
         06raI7v25FlkexPMGAETQ0xXcnsM78hnJ3RFPqrWhtjU9TPgT8rKdLMVdzc74phbmXjM
         u+nHLFfWCCZSG0Xd9zy++aBYG20R+KL+TsOBTF8EDla66rmGrLfTI8cb0vgHHlVIcMce
         j2PPSPGGEGlOT8MMLWZ9bA6ss2i9MBV84D9xQHNUeirwyuTQvjuXjV32DAa3u+SlU0iX
         0y9c94HsXA7ip3UkWJuRKmlp1I/MHehUFor0fZfbhbKlB37y+vLOfJpGzHScDN3WvSHD
         6nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601220; x=1738206020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAwBoQgjlqdN0lt1W5MQV8pK/e1W9mKfJrTU2unM280=;
        b=fpvAvKC/JgoUqUfKz7hdE5IwPYDzSeMTR+/MBkKXtU+b9pEbiVvF1jg8LlJjGCFcmq
         2Hen3kHSJAMQfKKw868I+j39PBZ1h6KKEL1403BOGKb6twPmbVR7/u/rswM8IMgnUfzo
         ugcyUPuktwV07IeD3xpFaIgAZeLDCnb8ToeDuUehbSx4Sw0YAUNbWe8yFlQpUL737NvU
         QOEnkB/47XwWoMHo+0W4x8rdwk9TSXrn0N0wA8/3YgPWXS7DwX1d5HHl1EJtPWRpYDez
         dWl6mK+QXFmrqrtAhVkzhWnwFUL67ipzUAmqAWDcK0yNrgOvlwjy3bV1KD7A2cnOPUkw
         f/3A==
X-Gm-Message-State: AOJu0YyUp1Cp4zt1bLmWrzjZtcvcrq4x9ldS4Y/TJVDNBjI4rcZN7bM6
	mWb+0Ngpw9UGZT1x+HMqQu7EYOgOjhkC9fNyiLwasKPKQnAKnu/3nDVS5oxei1niP2tfR4voq7H
	lGKs=
X-Gm-Gg: ASbGncu0P8FS2kFwpeBddeeZdbXQbM6OYqymS4+k3GtHmxqVJkzo3P+e7mwbNJRc/hU
	oflLgN1QR4iHnipWZ6vMTS+CtapgbPq4VtmlzOs5dpPMLDX20ZjJGL0YqYSl/cliud17Jn0iZLH
	4BliZVe/J4/OqGkxBBlgnV8d44WaG43Dl/WH7aRKjT38ulmHkkLEuxVRmDKoWSGakXhpiEfifbp
	ywzCR63yyFA8AlrAf0FGT8CrgKkUaC3doTrTIDvm9QVLRX8ecn6R4Dr0JXtTsiQO1D9gg==
X-Google-Smtp-Source: AGHT+IHy6LDoMG/iQjjXAEMdZtu0RdR/VaPZhOCkB2rss7GEF6IHQedul3X6LSVlMHRQdwMmeC/CXw==
X-Received: by 2002:a05:6a00:8c0b:b0:72a:a9d9:55ff with SMTP id d2e1a72fcca58-72f7d069edemr2042803b3a.0.1737601220335;
        Wed, 22 Jan 2025 19:00:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] rust-target-config: Fix TARGET_C_INT_WIDTH with correct size
Date: Wed, 22 Jan 2025 18:59:57 -0800
Message-ID: <0e02d0feba8bd48a27c41db875dcd33d46e4dc0d.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737601063.git.steve@sakoman.com>
References: <cover.1737601063.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210172

From: Harish Sadineni <Harish.Sadineni@windriver.com>

[YOCTO #15600]

The TARGET_C_INT_WIDTH value was incorrectly set to 64 instead of 32.
It is updated for PPC, Mips, and riscv64 architectures.

Discussion links for solution:
 https://lists.openembedded.org/g/openembedded-core/message/207486
 https://lists.openembedded.org/g/openembedded-core/message/207496

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9df8cd8b29064d115dab3bfd1ea14f94a5c0238)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 926b0630b1..1bd7626bd8 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -195,7 +195,7 @@ MAX_ATOMIC_WIDTH[mipsel] = "32"
 DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64] = "big"
 TARGET_POINTER_WIDTH[mips64] = "64"
-TARGET_C_INT_WIDTH[mips64] = "64"
+TARGET_C_INT_WIDTH[mips64] = "32"
 MAX_ATOMIC_WIDTH[mips64] = "64"
 
 ## mips64-n32-unknown-linux-{gnu, musl}
@@ -209,7 +209,7 @@ MAX_ATOMIC_WIDTH[mips64-n32] = "64"
 DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64el] = "little"
 TARGET_POINTER_WIDTH[mips64el] = "64"
-TARGET_C_INT_WIDTH[mips64el] = "64"
+TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
@@ -223,14 +223,14 @@ MAX_ATOMIC_WIDTH[powerpc] = "32"
 DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
-TARGET_C_INT_WIDTH[powerpc64] = "64"
+TARGET_C_INT_WIDTH[powerpc64] = "32"
 MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
-TARGET_C_INT_WIDTH[powerpc64le] = "64"
+TARGET_C_INT_WIDTH[powerpc64le] = "32"
 MAX_ATOMIC_WIDTH[powerpc64le] = "64"
 
 ## riscv32gc-unknown-linux-{gnu, musl}
@@ -244,7 +244,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
-TARGET_C_INT_WIDTH[riscv64gc] = "64"
+TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-- 
2.43.0


