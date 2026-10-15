Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680EDCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:41:24 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6647.1792095033624741460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=hTLSx44m;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93ead211f14so41560085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792095032; x=1792699832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C56Nk1eldSJmbvpJ5zhM1bs3tqzBcIibQePJhIxZet0=;
        b=hTLSx44mCrV1Z++wN4xW3NXdeJQPqz6+wO94137+y7LyTh31lZfq1qfokc8u322FL7
         4NAcutdzWmquprPvg9rzhVn1WmC+1OYnR2ZcAPQ9Zh9gFVwh/ynZ/HftygjmekzBaFZY
         0iRWqnvCpHFUBy0YzjLUWLPAXd9FJJmKKodBbswdaiDqkpYOc1SzcGuPD5IRvWa4Fk8j
         hl4/pOY9wQldd9V2Sbjl1g6JOhDnjyXvKaTc848EFTaA245UFSiFT6VnWDTwGKWyKs4F
         Obobsc1LPLGioRslgWqzUZfLFqz5BT/9qvM1c5Erjdz7cZl/kSKsglF2D23Ww3mgaR4E
         hpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095032; x=1792699832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C56Nk1eldSJmbvpJ5zhM1bs3tqzBcIibQePJhIxZet0=;
        b=mjujG/Ux76cYe3Uj/MLzoAgwRixSykBc3itGjopXVsgBn/eGyKdwfI9LDbBTxuAnz/
         R5v1JmPkg63S9TTslQBofM3PuKEz7QvkICCxwb+aA3B0ztdBW4KnIUlUz5r70BjCFhCA
         v5maRXmYwFflu3qO2/nlTvvgrl8YtuaDIjC8BYqyIpxyjkci2H5LGWTdeydh2qtO+Xl8
         jwNEtCFKdfFglb2Gs1mQL8UCS56oNiuCgzFAm5A7vhcr4fUhxb3rLEVOfPk/7dEyNkMA
         cF6ePyiHqnReClqw61I8XzVf5aa0GvUUQMWO5bSF4KthhCSZ4ODTISYS062ssRsrHpvO
         iV8Q==
X-Gm-Message-State: AFq9FYKcEnwzOwZ4S3vZIFrZ5GNIFe7znd80DyMeb2YLtyS/R4Q0ICp2
	+2SbeCkBFOXAFM4ZzjPwPy5neBNFg7Qxhg3oI2q1lFhGmzc4OyAgGEyTtBGKaZlG0M85C6sBhWg
	kK6bU
X-Gm-Gg: AYBFou1VIgmJBpBhgRGCq9lUWw0EYmFHUbwmwsyspiCB5+TZbBy+74hM8szHmjp/QVs
	8IP3iz68W/9ygh32d3JLb7L8ZVuJIXJpFvG2Pl8I/srLp2j4WQ/L/ii1IRq62bZFw9aevuZIIL/
	PKCJln9fVr4opWECXdkjniWBjSliax+nbVFCZ6NMqwj7so9LdXS4wtwryd7zL1faRvlUc+y63Jh
	YRHR+EhMjZMr9tleb0EDkqqVcCgvPDl2W7XWxx0HCO7uYqFsHzYGPO7ApxhtQnVP0k1GUFwnaTE
	N6L4izAeZPo6yPQccFEX+hKFyZqAp2mU/mBmar6gFgcVaUY64zqfIzhYm6VYBt0GvlHC36FaSpW
	akWpVWjF3vzXoNHJpwUvK03HHEjXhhF9pe8Q/2VnecOm6Xu2B3GT6u0z463QfqgmNxwm9mJoAEt
	pej6cDsQJ+qaDX0cj3YxG09LwBLmLQJWcyLZcQPZwIRcW3f2VKzhf0FEIy0sgqWfpX0R+KJ2Qv6
	V9G0/zS3a+mksnqUwrbPnKHaxvpTw7VgjkLl8m/N3oY9908wU1z/U8=
X-Received: by 2002:a05:620a:4385:b0:93e:5e2c:8bea with SMTP id af79cd13be357-93f17e3ae56mr206186085a.26.1792095032527;
        Thu, 15 Oct 2026 13:10:32 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a16c21esm21092085a.16.2026.10.15.13.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:10:25 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][PATCH 1/2] tune-riscv: be explicit about riscv32gc, riscv64gc defaults
Date: Thu, 15 Oct 2026 16:10:17 -0400
Message-ID: <20261015201018.2103620-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247910

The string 'riscv64' is a generic descriptor for the 64-bit RISC-V ISA,
and can mean different things under different contexts. In the case of
tune-riscv.inc, it has served as an alias for the 'riscv64gc' profile
which packages are typically built against, resulting in the following
output (from a typical bitbake preamble):

|TUNE_FEATURES        = "rv 64 i m a f d c zicsr zifencei"

Modify tune-riscv.inc to avoid overloading the 'riscv64' string in this
way, instead setting DEFAULTTUNE to 'riscv64gc', and changing other
occurrences to match. TUNE_FEATURES remains the same under this
adjustment, but the .inc file is clearer which profile is being
targeted.

Do the same for riscv32 -> riscv32gc. In this case, we also need to
update qemuriscv32.conf, since it sets DEFAULTTUNE to override the
default.

Also add TUNE_FEATURE aliases for the old riscv32 and riscv64 names so
that other layers using them don't break.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 18 ++++++++++++------
 meta/conf/machine/qemuriscv32.conf             |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 12c1125c8b..8a14971d5f 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -1,15 +1,21 @@
 require conf/machine/include/riscv/arch-riscv.inc
 
-DEFAULTTUNE ?= "riscv64"
+DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # Default
-TUNE_FEATURES:tune-riscv64 := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${TUNE_RISCV_PKGARCH}"
+TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
-TUNE_FEATURES:tune-riscv32 := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${TUNE_RISCV_PKGARCH}"
+TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
+
+# Compatibility aliases so that layers using old tunes don't break
+TUNE_FEATURES:tune-riscv64 := "${TUNE_FEATURES:tune-riscv64gc}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gc}"
+TUNE_FEATURES:tune-riscv32 := "${TUNE_FEATURES:tune-riscv32gc}"
+PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${PACKAGE_EXTRA_ARCHS:tune-riscv32gc}"
 
 # No float
 TUNE_FEATURES:tune-riscv64nf := "${@oe.tune.riscv_isa_to_tune("rv64imac_zicsr_zifencei")}"
diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
index aff36c28a5..5cb9ba5aa9 100644
--- a/meta/conf/machine/qemuriscv32.conf
+++ b/meta/conf/machine/qemuriscv32.conf
@@ -2,7 +2,7 @@
 #@NAME: generic riscv32 machine
 #@DESCRIPTION: Machine configuration for running a generic riscv32
 
-DEFAULTTUNE ?= "riscv32"
+DEFAULTTUNE ?= "riscv32gc"
 
 require conf/machine/include/riscv/qemuriscv.inc
 
-- 
2.56.0


