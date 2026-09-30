Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7D0CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:41:54 +0000 (UTC)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18021.1790786298218843201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=PmbwhltI;
 spf=pass (domain: baylibre.com, ip: 74.125.230.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba57fso42248886d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786297; x=1791391097; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPWiXpWriIzgM/Y5uFItMkp+RgYPzuuI8OBR9yO4Mxg=;
        b=PmbwhltIm/3kxtw2c0WjGbBYRV/xAIx4mGRnx0s0x17Vv+pM7PBwp8lQiZ5rRttjTy
         BgV31mgunEe8fOWpM9oasdP5VRe6NDYvydNkHkjsbRBqQqv12DELrhu/14m9z1DaimmA
         tkIdxcc0YfUSdaGQDSKnPBkID9FUh6baI2HXJpvZV9sx5NJ24bnbdupF6R67+c58qc/u
         +bnDl01h1NOHIUqumJAt/9zq67jBlRO/bbaoRfIlrBJVO5QLz1Tu0qGpJUu9up+Gq1wg
         YwshTtlShkSLlQGK4aZLYV2j5DFLIKkgHIGOSaDE2joqWoiwIrK8oeOvtJQHTI2rCCmk
         Wzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786297; x=1791391097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPWiXpWriIzgM/Y5uFItMkp+RgYPzuuI8OBR9yO4Mxg=;
        b=xUOrmzFtog/aZD2kaRZJDpbfFkgLOS3Cf02XCu2brFLKSV6oCUcpG8Jna/xkAIcSo4
         l5UJtoKgCtMkpiv8aPvCgtDzqtt0TTH9vK3eO6g2bLct2vUOGtZ8j7piEU5SjYuL2eRn
         XiE5WFEhHecUJFx7036gDotgBE18VHyYhPQ5S4qGZWHiVMdzct4hO61+4AbRh3r5FQ5X
         uvbxAHc7lF85f5U5MPo5jQiySZ7AKGTH8WXot7ucd94zO+dId/2ZrrzB3NHxKAENnujt
         Mpzu6my1AsLMmcfOr3i7g1R6NGPCLeOR4xm+uz9qh0awXHPRX6jGEodZPmOLeieQ22lz
         z1Kw==
X-Gm-Message-State: AFuF++lnacSXU4w+a0js3EqdNSbn+x3PRUjUnauOC7Nl4xRSf3HV9bum
	CJX4HHKMVzNlP/Zw+42hY5Hf7abZ5lDJyL9BESZ3NX4kb1sS/lxCXSCuSco+019rWjw=
X-Gm-Gg: AYBFou24KHI99z2NpobltTrGOXIVEq5CpZ/yV5NPJE3XXT2SQ2pOXB27342JJvfdiyK
	gYugW/BFVAyX0KIIa+4FOqhxlyuZRb4TT5u5Yy+Uzb8ZKRdo6wCQnNFINOz8YXNL8X9BiDT5zyh
	LIyjc9Ow9scSpUFvEHjRfEDrxdBa9B6m6tXN6qYwFa551aS5C2NBd3nc5WT9Zw27czZUHYQPXan
	GmqF2JMk6n/4wNDToBiHy3P6LJvoyMzUw/CGSg/Na1MPQ/6GtOSuysgjR+dEYvrmM1tJrr7PBLn
	AQ6kXYTJDUsuKwLR/BYfvtcDfYSHXuYydmSKt5ZbtScD5fpnPdkXL0d4WONBEgUnF2eqDBaCNUR
	ir+U4/f3hemUrl8nCrb/EkMHFt1zgizto7bsvZ+RN8T14VRWtQLeFrpMYdl5iipav//jPUS8boC
	JSgqW3f02V+pKzdJYdHpBbYzcLO98hyRrtvUcSELv+PTyKVv+rJ0tzvc3EX/Cg8UyDq4q+dJywu
	R4TR5/3P0i7VGFK4DGmfmO8fMFFMVn3itEbet3eghg=
X-Received: by 2002:a05:6214:4489:b0:914:56b2:89a2 with SMTP id 6a1803df08f44-917a0bd9a52mr29857326d6.20.1790786296995;
        Wed, 30 Sep 2026 09:38:16 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:16 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:05 -0400
Subject: [OE-core][PATCH RFC v2 01/19] tune-riscv: be explicit about riscv32gc, riscv64gc defaults
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-1-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246981

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
2.55.0


