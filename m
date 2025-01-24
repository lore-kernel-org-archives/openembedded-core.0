Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31656C0218D
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.15742.1737734232320718310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MF2ORZ5v;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so3402695a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734231; x=1738339031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrAsS4KtlMSeW1Rx0Hw0kTpA/iJKb4XdSt4f3yxOXtU=;
        b=MF2ORZ5vVZY5AOS46frsLE83vxyKtZf6mNKsUB64lUsRYzhr18aRtIbRAuCGLkkAO9
         Ffdmag6UY4KT2WQpCcT7F2yHri3zEB0NO+5JwXL6u7cCnRorODWC/31snfCl2zsMuqha
         7eikumLvcEiyDzWHzTCNymAEvSa4pBjHt3kJPAKD7phUZU0MEW3Cn52Wl9zzs1iF1ysZ
         uwiJAPbOAIsuY0zurrsT35z7abzXCxAdeIGkgsXhxVQMoOhRBo3TSdcGE1UgrBVqccHX
         flQ29gXlsGjqY8M2KJD/pyNfnOYjGpnDJfxO6J5Qe3VLYxKFmSx3beoa9e8Junls9oyq
         7RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734231; x=1738339031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrAsS4KtlMSeW1Rx0Hw0kTpA/iJKb4XdSt4f3yxOXtU=;
        b=RBBFmoWZF3nluTBnNoUboFgw03gDjOg1l6v9CFGE3QbUPHESmamrwq/toMUZeWli86
         T+zZtgoM6Mnez/5kuKZ2oJx31wa8pMC/84T9bvNV6lkLj+VZO6ptYlr2GY/5XGfflFDB
         peliwowERSmPllyK6PjUOa//0tZrE0dhEZmybeCsiN+JxS7amlr36tf8v1+3TDXJWn88
         C++Fz2uVkkA/cAQVEc1pgrtFb83RBcSUWYGxMZ0w0X32/CGdfFfGMhcR+At8an4BNUh8
         3FWIWDHnmZQu9UQyRzx9FBrz7Bw/SlZ3yGDPasRXq11drUJrJ1r8IHm6CIuzWrMWm4d9
         6WPg==
X-Gm-Message-State: AOJu0YxR+IjRZ3rrVXlemuZ8+oqn4vEs3gZAnFTQ96qAzxsGpRRxzE4D
	+pNT2JwqxSeZsoUNkuwosDS5wXu6jangi5UATa9I+IPw7jzqXXM2NtqOvAM7pcJ6a17LCT2WkRg
	n4pM=
X-Gm-Gg: ASbGncssz7yfi6bTl3H8pth5hs+8TgKH9Pqrhk/jzKZP+14FgSRYOVse1AygL2xGaf1
	+6m6T+1vT8Y3ucZ51l1N4N3wr65u1IuEddUfkYJND12gcfleh8smiOr9FHd0aM/yDir7QMnFwtk
	Y1MHHsL0N1k0qadjfyY5UzInyV9ErJy5bidj7Lkwin/I7O4zuEG8zVVKuSS7dCdYBYfREnahRWl
	swXXhm0Fobw1cbhZxvy2bhxghSk4NHcZJdK6hnTIj7Hnq+XcMSOO+3+zercO2Y/kUhiBQ==
X-Google-Smtp-Source: AGHT+IGJpq/zx0QhyksowVHTPQdKKr3jQzDStXWPJdIi3N5X73IXl9BK0To/fOf5UWNtBpjJDeKVjg==
X-Received: by 2002:a17:90a:fc44:b0:2f4:49d8:e718 with SMTP id 98e67ed59e1d1-2f782c6ffb5mr44953604a91.9.1737734231551;
        Fri, 24 Jan 2025 07:57:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 5/6] rust-target-config: Fix TARGET_C_INT_WIDTH with correct size
Date: Fri, 24 Jan 2025 07:56:53 -0800
Message-ID: <2ed3b74eb45802cfa64ec9ab460422e098e975d5.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210232

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
index 334f2e7d5f..58d2ae2117 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -198,7 +198,7 @@ MAX_ATOMIC_WIDTH[mipsel] = "32"
 DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64] = "big"
 TARGET_POINTER_WIDTH[mips64] = "64"
-TARGET_C_INT_WIDTH[mips64] = "64"
+TARGET_C_INT_WIDTH[mips64] = "32"
 MAX_ATOMIC_WIDTH[mips64] = "64"
 
 ## mips64-n32-unknown-linux-{gnu, musl}
@@ -212,7 +212,7 @@ MAX_ATOMIC_WIDTH[mips64-n32] = "64"
 DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64el] = "little"
 TARGET_POINTER_WIDTH[mips64el] = "64"
-TARGET_C_INT_WIDTH[mips64el] = "64"
+TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
@@ -226,14 +226,14 @@ MAX_ATOMIC_WIDTH[powerpc] = "32"
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
@@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
-TARGET_C_INT_WIDTH[riscv64gc] = "64"
+TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-- 
2.43.0


