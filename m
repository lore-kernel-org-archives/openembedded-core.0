Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E27DCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:13:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.4441.1756404827329963385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IkFGRPQr;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso805573f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756404825; x=1757009625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgqWeRkdZp8JgW5N85GMKXDoFOOtSvn2IF9Mmn8m5o4=;
        b=IkFGRPQrjR7ttHEm1TKf5T+VjVP7awgENEV3qcu0QripT3p5uv9wHYPZjmRfXSUyJo
         v5N+QDu5m9+aBg4xnAp/Ag1c8O+xEUZuxzmtUOVOXSpXIuLu61Jt6yMtHUV91r+j7h6U
         BMek8TrTAIUnfXl2iCP2Ts2fM2PoqD9K6yr0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404825; x=1757009625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgqWeRkdZp8JgW5N85GMKXDoFOOtSvn2IF9Mmn8m5o4=;
        b=dAAvkdgeVY4PUzAHQQotPLEkSUngJPN12bXxnLM827eev8ahGa4uW4o9jkCiTjodrM
         H1u4DMe0MD+WyVJdbhPOGMYYp/FflvI5aDZgcu76WMggJFlh9+5LOpOvWnquoOMQsCZU
         vvV83zBamZ6mrEX6ElM4hJeuhH3vLOEEcDsAt16BJdbSdEPjHI1hqwLGdnLpRjH0+bQ6
         mCdhhKHQq+TobP1w7eVB29Bob9bNXcwX5O2kv9xTJUEo1U89//7Kuw3sgwVbg2IRWZah
         3+wY6xQTVdOekqPWuG3daksYc10hD7t9vBNb+qTdEOrFPdaxNvSaR16ChnFu0+6xyGMC
         06pA==
X-Gm-Message-State: AOJu0Yxe4FV0y8MCzGauXCr1vJvdCnIjWgV84fzewsNyPUDtvPMpMNmv
	AlMSLt/PUU0bcGgOP4GJbmQ9yb/u7YFG3kzdnHD0/pFfgkUUckB+O1m0CTBDCpsn0Yo9kQF5en5
	n2YAd
X-Gm-Gg: ASbGncs7Mo+BhVOlTpyClixdSJjwdN4khmSt5K2ke4n0RNAdyeppPxlyJISa3nLKZ8h
	id93ezsuU7rXVlHNHIuK9dogdM3M7p9tUbEklu5RhFclkcDf7Z3N62MbEeq+dC2waIPbgsNyVjC
	kJWn6on0Tdp66akqmEo1QHbJP6BQ1igPMczsNgdJfhUmwg2yPnss9eC0VFR5wA2shpDX+TC8izD
	QCkBTlUGCEKmTe8Vdp2BKVqgAPpfxlueNlwncVX72P6VKlWz+IhKAj6Hkqp7k3C9iMmy5mIhml+
	MruviACEu+fpjNj8PfvlRqtp87YCDlVcL6+Q7jaMiXnKJydRKoZuazw941U0Au/lbSL88hqY1dp
	jUeKoNkOW6Foac5wX+m5u5ISrNQ7OPDOxYWnNmUCVw1hVGCUTTl4R7YC/CgogokTnrxDjyFAO6j
	PFQRqQtSsinZYBmj3qzOKdjjNYfTwh
X-Google-Smtp-Source: AGHT+IHphNKtCbzZ45Crkn1EAq2a26fIV3U7myeRCJpSqThWJLlBaHvuvW854QgqJ2Zr/YgUgMcStQ==
X-Received: by 2002:a05:6000:2906:b0:3c7:f9a9:7b33 with SMTP id ffacd0b85a97d-3c7f9a97ecbmr13422981f8f.19.1756404825262;
        Thu, 28 Aug 2025 11:13:45 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-8200-223f-aa73-038a-bc54-ae8d.rev.sfr.net. [2a02:8440:8200:223f:aa73:38a:bc54:ae8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33adf1e2sm222976f8f.34.2025.08.28.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:13:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [PATCH v2 1/2] ptest-cargo: move run-ptest rc variable initialisation
Date: Thu, 28 Aug 2025 20:13:23 +0200
Message-Id: <20250828181324.3147715-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222589

From: Yoann Congal <yoann.congal@smile.fr>

ptest-cargo run-ptest can be generated in two fashions: generated from
scratch or appended to an exiting run-ptest file. The rc variable used
to track tests failure was only initialized in "generated from scratch"
case. Which lead to errors in the "appended" case.

Move the rc variable initialisation to the common code of both case to
fix this problem.

Only initialize rc if it was not already affected in the recipe provided
run-ptest.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
v1->v2: Only initialize rc if it was not already set in the run-ptest
provided by the recipe.
---
 meta/classes-recipe/ptest-cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index ece25ff1eb..8351644b0f 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -103,10 +103,10 @@ python do_install_ptest_cargo() {
     with open(ptest_script, "a") as f:
         if not script_exists:
             f.write("#!/bin/sh\n")
-            f.write("rc=0\n")                
         else:
             f.write(f"\necho \"\"\n")
             f.write(f"echo \"## starting to run rust tests ##\"\n")               
+        f.write("if [ -z \"$rc\" ]; then rc=0; fi\n")
         for test_path in test_paths:
             script = textwrap.dedent(f"""\
                 if ! {test_path} {rust_test_args}

