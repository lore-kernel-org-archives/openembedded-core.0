Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A02D59F7D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 07:57:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1818.1765612640827021194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 23:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/Qvq5VN;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3438231df5fso2347468a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 23:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765612640; x=1766217440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q08AKMKlsz5YrRya56dn2AkMZAMXb1oB0+gDufPM4aM=;
        b=V/Qvq5VNEyGDyLdkbRQ/QXz640iwes1K9XatN3aM6WbI3Ez01O5cm600+O2zfPa3Qe
         D2YNsN+EWOGJ3Mc8i6mBjJFMRy4IF/8e/FjVM2/IuABG+1pHIdWhKo4zWqQ7EDErEG7d
         wsL2CCzmtvWl/WTi4dpWTgrxRlrBZ0Q84CEkw7BLNlj/I1txZFv38xCWGnDfb2tc1Ng3
         dveKzcAT0LCYT/MPXxge5S/KuHTz5YyLU0XOwwyDl/8XzLuAh4ncNwsS+vIbs2bFx0d/
         Z2nNwRwACU9zkA3wetO4XBWbaJmoxyWngrDfXBY1VbR/zwFX5FpUAx9gJ5dqL5S8un6H
         554g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765612640; x=1766217440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q08AKMKlsz5YrRya56dn2AkMZAMXb1oB0+gDufPM4aM=;
        b=IJoU2DITySJLcbcxebly16FdbjAkPYrnMustYRanXjBMeXmTYBJDwZlQBht4WORGkQ
         h+Mfuudo/yLS3kHR6KNXHzaQuhE8KXUogAW1UJmaTjTn0uenZ1pxO+CFHkWjFJRB4xVp
         nqv0piYGhiFrP9ZsJ1EffXaRBLp8abfNtNIAz3TJK4WIKBJjsGy2p4DqRBazS7bewvLF
         1PZ+kI+XN4wqDeue8xI5P56wCcBoJBCfonZlUFGJB7KiDK7jjIfFEEPBrDh1fJv/oqqG
         EGcI8nx9M8oI1Xiu6cwIKAtrFpFlUJZmeawW/aZLs9hPci6yzagdu4QT/FB6lkJnOj4N
         ucCQ==
X-Gm-Message-State: AOJu0Yx2XHo91PLILvYnGT97IDE3Mc+t852LUNLw1mGcxTZCfNDDo9Ea
	LaH2Lw05t5/GB9/5zWkFvvbvw9dnPPUJ4b62/PmY4PmOGJmbaZvfox9m+rxWz/ph
X-Gm-Gg: AY/fxX73vprH28l/AkFyWAqHBb7CusCfYyuQFvwV3CRc1WTTetlw4+mDKUp5B6q4q2H
	MjZ1e3o0yuWW2U8dPNsyIx3ECZD9Xa2QlsSeaLlQtxzjSnNEVc7zKuX4vQRsa8eZXnhJY/KeV5Q
	4LYAyPKV9R7QAm5IwbdFU+opBQfbeGO+S2BThWRmdWhSAlmykxcXSnJG/evBJowVBlcxPcXT6Qo
	2YmhTpreP69TCaef19UmOC4KQjVq9mm4bihisDPBcJ3nkGbQRlAv7JcZVBr6cdTKU1fDaZrhSlM
	B+g34MxFGg3QHsInR7KfMwKjvXhYAX0F4bIN4+Yi4Gc4xp5v+JkhK4aynO+OyLKYJoGhD/fG/o1
	mXflTG3ozPjf45VGk4sypJaA1pV+n9SmYXlG33uVaYg4+tV+Q4Fl1L8iha4jdZB3hx0YQro4Fb3
	uiLoJ53EFslAj8UdPG968xgS3H9204TVNZncKlL2E9ZLEH2Svz0LJzREGnD06/IC0XDO3zmI+4i
	rDZLsVwccRqJiftXKrQ85I13xvAN38W
X-Google-Smtp-Source: AGHT+IFBPv4fa12fmi0tJyv9hL/tPWCABrR8GTXgH3iHdHxMdP4QZ5fjNjK0bif+zqH/zdDTE2eaVQ==
X-Received: by 2002:a05:7022:618c:b0:119:e56b:c73e with SMTP id a92af1059eb24-11f39b05409mr2528815c88.3.1765612639517;
        Fri, 12 Dec 2025 23:57:19 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm20051315c88.9.2025.12.12.23.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 23:57:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemtap: Enable riscv32 builds
Date: Fri, 12 Dec 2025 23:57:17 -0800
Message-ID: <20251213075717.924074-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 07:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227615

This builds fine for qemuriscv32 these days

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 86336b0779..c5d10c8fd5 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -9,7 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=https;branch=master;t
 
 SRCREV = "c4fc655170b534478a6b131292b987630c7c0865"
 
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64|riscv32).*-linux'
 COMPATIBLE_HOST:libc-musl = 'null'
 
 # systemtap can't be built without optimization, if someone tries to compile an

