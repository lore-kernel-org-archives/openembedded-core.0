Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68454CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:41:34 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6665.1792095041540743804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=kq0S2Jxn;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e635220b9so398762685a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792095040; x=1792699840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N51SpO0fXhmWZ8/TDheRTC0lZOYPRVtd3/HO5Q8/NM=;
        b=kq0S2Jxn1Tx5CSOkh2b7VN5YCJWgD9L4F+KgJvu8j2+iccgqmE0bn8pMptdt2FO+bO
         jEOehRSo9zkfg1QI/RI2axQbyQn654THpThlEh2D8Cbu8IzCbhXS8o1Cq/V9Jmos5dx8
         Jb8pAT08iEx1TxIl5aDGhznHW1ImSWej0/izlJnz4P3TjnJhYa2kI3c6SNMtKr8hcmly
         rNjG4TjVoom2gHKz/k2+7cXfBgk9QcOVw77Auz0i/CDJ1kusJ872i5Et1D9/Tj2XwcsV
         ic0Yn+ZWztzC37KEg8whFsDKsKyUF9RxZryGH6PmDoGDArML+8e9VQWGt0m+BPcLsoom
         FBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095040; x=1792699840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8N51SpO0fXhmWZ8/TDheRTC0lZOYPRVtd3/HO5Q8/NM=;
        b=zYNXLs6SYFSwR7P9Rkm0n1eZgQpxeF22JH9nLZH4im6UOKI6VA2nmwUkwc1sTFmsYc
         C97SP0zMW37fQNBOQjUXMY8qcqFXZ0T3wd5FBpDNOqkJvEOENKtHzqh0hE3znKYaXTJI
         brPDL3/qrK6sB5J7qjPt0mVPcJOXFQGEfIXmOf+TAht1BspCVINUNz8Z/R2FSsahzMpH
         Acvo2IrI2BCH8qKPm8yONnIZTu1owjtpCeJmdqEBxjF6mYs8IcHEWky1cTOQqCusE9Mb
         I86Z3zIl6k2TWWyQ8M/6qaOaZZiGZvHTegs1moAPayO+7qnVJ6LIzQjEEAD9JiKySMjf
         e33w==
X-Gm-Message-State: AFq9FYK/7jSGSLmsGy6ka8ct8UPbYmZ+ZCqU43DBcLuVbVSxj5bTU36d
	cBMi4p4ZcGHqz4FGlkS6pKdscUeQFJPUTH0//SdmCJIFQts6UMH3+CXvVaQVE1IBqWONjHrRoIp
	0QED7
X-Gm-Gg: AYBFou3Xb68uqT2OmwDwA7z22yaZrDzYDdfWwEATr/A4FejHf8dU4kBOzL7BTc0yu0M
	5XebufnJWN01ksDgXkC7OzkoDkTrbPCqjPwXmoRxwEzoZZZPoZhCi322q962FfPc9bpF5aAbSvE
	Qovh2MFDhtHpIZOx/8PXGeWPu94QNSy2AeZx9G6xDsu5sWv0WgfDhJyAqjS1ju6Nvdb+vZzhnyD
	Bvyj6VxXc6HUHzpmOmNrnGJlfnL9zMK3goq2gm+MUqxWQnjDk8UqxQK8vDy5fHNsnaUQecRMYQG
	j0Dh4S6AXlw/lDMVbfGZqyEEXcedr0p670pF+0bcAiYIoBoajRZZhP3gfOGIM45g5HLNZa62KdF
	DrHA0TLs57kOYr3yr/2G0RKS8kqq0vvW8sRCYDb6PgXzz0v+y2nX5d0uvDDmULeSq/2PbjL2asL
	yI9+pndQKq3WCw/JwbsSRMFcLaQEq1aFwx3x4YNpbYSNxnjelhXLxe/ys1CdgJJvSVRZGX4wtsR
	myqdXSkkkNPBHW4Gmm8PL9TWuiv/S5GiIZ6ZI5XdqYz/xvn6bujbU+J
X-Received: by 2002:a05:620a:1a17:b0:93d:92a9:1a5e with SMTP id af79cd13be357-93ebd2608c7mr3301906585a.37.1792095040392;
        Thu, 15 Oct 2026 13:10:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16c21esm21092085a.16.2026.10.15.13.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:10:34 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][PATCH 2/2] tune-riscv.inc: add 'riscv64gcv' tune
Date: Thu, 15 Oct 2026 16:10:18 -0400
Message-ID: <20261015201018.2103620-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015201018.2103620-1-tgamblin@baylibre.com>
References: <20261015201018.2103620-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247911

Add a new RISC-V tune option which adds the 'v' (vector) extension,
compared to the default.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 8a14971d5f..ed71dc06ba 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${TUNE_RISCV_PKGARCH}"
+
 TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
 
-- 
2.56.0


