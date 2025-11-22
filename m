Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE60CFD30D
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3773.1763849713582996392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DyrGRWyt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297ef378069so28462825ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849713; x=1764454513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XL/kfWHJOz6SAfs7LRjmiptXG+ae6Kl5tTRWnbH2jZI=;
        b=DyrGRWytG6MIQCVdYgrUdazXPhAmGOlSNdgpaH3eAK2PgpbBvcROLA4lpa99WHBGn+
         L5gNqy4o/9wmk2/ushXxMier043NbhBT7GY4BZxqGR3Se2KgFexbPet7zEhpYWerTtQg
         /CGLsjNshxSDUbcrxizqOMK6eO6wMhfW6Ixbq0BbSd6CBVZd+zmAKsjmmMooxd0nZQ2b
         zMsxvTpWChcWG1oASoOtxM+K4d5wLg3hF9A/WYIi12uGG3nNpx8dEjqLiEtdwIiHP+Gc
         ck6xlFGLNk51kdO44UGRkx1wwn3+07zDfn9Nh4HsIu3BpgX5ByzT1lFkC39adbsZ4W/A
         URgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849713; x=1764454513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XL/kfWHJOz6SAfs7LRjmiptXG+ae6Kl5tTRWnbH2jZI=;
        b=Qdgcn3OLsX2rApB7eM+rI7TkL6KO6M4UBNfzCBDBH8IhPJ+ilmOtceUXkb/eCYovWr
         ghWaxTpwUG9FeJge/TV61NGq/s6vqOjyR2+Q+RI8+7UB+k0d0TuaZAg2YFKWtrfO+naS
         yKyProkcHMv4tISZmeVnS99K2VCX3O9UWEWWolhC+rNnjtqf4Oaz7hQyCJ9cEw4YQzO8
         SwyaYS92ZCmsJYmw8s5Xc8w3uwqmDLM95bOQgaewPEMMLpUZiEWkNIK4TNRZig31LkST
         v/F2bttgygFBkiQx9akpc5fA/H+1JC2W3l488NaA+Az2DWcBJu/lYSLj8zaPJLoOP4vM
         PZ5g==
X-Gm-Message-State: AOJu0YzMV5JfrqrDUJ0VT/Q1xjO+gUwgJ3A1S2lcEvvUv02uWySobD4d
	EsqUYRjuVXCGxSkXLNKkflZx9UC99gomK505ACtwy1BDEdZTe7stLv/9dy++PTDcRun4N+KFjvt
	n49Hz
X-Gm-Gg: ASbGnct8L8X+JLrllZInaZr7D+V30nGG0JIMBbi5N2ZgoOdLjJaouhOq8GpFGnIKZKN
	cMFodb1FDI5OjbdRjivrS4V7ISRINPq7+gQrzqIHEQY+pmjw6BGxULC6GByICELqxxWQW/oLBuf
	p5bfoxpuiy3oNotCr/4TjjJTClciEFTMnyfK3nxofwdN4ryJ7mOj2LoAmhlMBDJ3ffWFK9VjHWX
	i22GlpMg7e5sU7N0TcNxbun7iucjo0XYT0hP6mNLickfcvfnn1MzHtSIZyEdVOBV1VTP/qJAAFF
	PgqnjOTxTFx1crX60qHX/c4jX0qNZBexmodvQ/juIeKghC9FNE00cEUIc3ko5au+detb8Vhi4XM
	nwLNXcVZY2h+jO55Dp2jikoi2MlrLDSRnoM5CtEGbDTjVsd3mAeh6pggSiuJHKQMWSzhEm4F/vl
	/5cec04hA9+rG9
X-Google-Smtp-Source: AGHT+IGVyL9vFJGOqfQC7stNNStE7bvZmN8AKBag39ex2EFgUgOqdLgqR6cA4wMkTu4+5qQ4KK3GeA==
X-Received: by 2002:a17:90a:ae91:b0:340:be44:dd11 with SMTP id 98e67ed59e1d1-34733f2a450mr5256055a91.27.1763849712826;
        Sat, 22 Nov 2025 14:15:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/21] oeqa/sdk/buildepoxy: skip test in eSDK
Date: Sat, 22 Nov 2025 14:14:27 -0800
Message-ID: <7cfacaee1b3319e561036512a849e762d0f68a5e.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226719

From: Peter Marko <peter.marko@siemens.com>

Currently meson inside eSDKs only works with fully populated eSDKs,
but our testing uses minimal eSDKS, so skip the test if the eSDK is a
minimal build.  A bug has been filed to resolve this.

This is minimal change extracted from OE-Core commit which has this only
as a minor comment: 575e0bf52db0467d88af4b5fe467b682f10ca62a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 5b9c36fcec..2f21210c79 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -10,6 +10,7 @@ import tempfile
 import unittest
 
 from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdkext.context import OESDKExtTestContext
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
@@ -22,6 +23,9 @@ class EpoxyTest(OESDKTestCase):
         if libc in [ 'newlib' ]:
             raise unittest.SkipTest("MesonTest class: SDK doesn't contain a supported C library")
 
+        if isinstance(self.tc, OESDKExtTestContext):
+            self.skipTest(f"{self.id()} does not support eSDK (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15854)")
+
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
-- 
2.43.0


