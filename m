Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14ACC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:25 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4496.1789499018438101016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ZgbWFLFu;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb769ca02so767001cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499017; x=1790103817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pu8WSdxUuaBYUDhO5RJ3jj+TSz9/TxS1ly1Y8dGX7S8=;
        b=ZgbWFLFuR4J7t4YdHAxEJacjN52YAYsbWEaHOZNXjuw8uTJ/4VSbaHvFrmtZ84JdoI
         K2fZvZmO67s0R8/MrTjeAtbHQcvwBVveCyApKw4OYjI+kgGOMw6pi7tkJJZ4+2luit79
         kLR7a0X9MQUqTMstYEP+uo2kVXYGueQMHD//WAp5jx+0hXo+AJRxU36JchwnBxVEoJph
         2iMdBXI2caA7rlPw/HCs8kcYFURr0wgMmj+WAshDBqFkqUnwd7/8sd7hzSyZjAzr9EEu
         EQi64QIjwqEzVr8bEf/9yRtbxyXxkLGkdV/3cQGvGWNq+RUDX30B6qyPWKtPAhEDP1XN
         3q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499017; x=1790103817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pu8WSdxUuaBYUDhO5RJ3jj+TSz9/TxS1ly1Y8dGX7S8=;
        b=EhNdcRdsGD+tJaJyG6/N0CNsdWSDvZSz4PGTNYp1uluLVUbu127QdJGYKeCOAUPZJ4
         qC0zNzYJevnR+OYwGVK0NlRDnx3W2gshxjPSR+QRSLzeMplGzDJZhLoZ5hc/UDIxB/Gy
         uBlfRjUWTZycTANo9c2IEmZTHIYPHBbe4PSbxfHoh7XPIHushxkdxpwoibT6VtQ43OGt
         l+TOUsZrjNyJ7ZpORbSRK46nE7nX76R28/rDPGY2e3Nv1IVe06kIxYaVCjt7+i0cjqEZ
         hpDvsuFHx5OOLMB9wd0DxMKKkHbXT9/2Jd0vwGcEbOxr+eZ9CRBHWOngYhZakawtXBkN
         rYJA==
X-Gm-Message-State: AFuF++lE+3FvQ3Ejr4Zwb7967prmkv+b2eMuig33rie5yiU2sX5bq2He
	hOseDryRiZk1GMDULKGSvODOONlsnpx2+/zU6msNtRbvo7slDhKNUSl41bbkwcmK8n7tjH0NY+E
	ig321
X-Gm-Gg: AYBFou1SsJE754YAghHWuSX8FR+rLSC6L+5qAYhAy979zwLxHTaoC46d8qHewr5H+HG
	MPqrZs4BvtbiHnassgSIP7GTEV3G77kbk4ofFyY6nCDY4bhHqrx7t/CH5jLeLyce2G4ODkUxaoC
	FmaWJ3r2u3WT9QpROz3/0jZdsxg0aRYSWlLxFEvb3yUDu3JOa7bHIcQNiO0WJ77YikGHCgMaLu0
	ec6JeNWw+7Nso2ZSacv4F/lQ0T5KEOQNecCFyCw7/EY50DCC8tuPryKBkxxA1eaZs54iRzKMwUb
	F+ZlN67EXhrjm8+ie1u5Upg82DJraY8m12utUYqFaPQeS1yZUbUTR/D5EMVkhMnZfJU4Eiuk394
	cErwwD7DMMdmoa3tshLtCdLIHmrgOW15WrggKws40X7X3YrtoF311Q1j/d/HT2uGaQSMBdMb8ym
	UAIftO+C/3DRjxL3g+fXoelBxl3jXtvop/XRbJHMlMWoxwEN6gkcfljbm52MZfGcPgwRlf4rTOy
	rqnzZWb8tH/bj9CHBEcSte+nijjpiqQUQ==
X-Received: by 2002:ac8:5a09:0:b0:52f:acf2:110c with SMTP id d75a77b69052e-5310cf1b729mr145436511cf.3.1789499017067;
        Tue, 15 Sep 2026 12:03:37 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204cc73sm1612651cf.19.2026.09.15.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:34 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 06/14] arch-riscv.inc: add rva22u64 extensions
Date: Tue, 15 Sep 2026 15:02:36 -0400
Message-ID: <20260915190244.2983746-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245881

gcc reports the following extension string for '-march=rva22u64':

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rva22u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt

Add the following extensions needed to complete the profile:

- za64rs
- zfhmin
- zic64b
- zicbop
- zicboz
- zihintpause
- zkt

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 7db400694c..c05cdf8c21 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -82,10 +82,22 @@ TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 
 # Now the special Z extensions
+TUNEVALID[zic64b] = "Cache block size is 64 bytes extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+
 TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+TUNEVALID[zicbop] = "Cache-block prefetching extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+
+TUNEVALID[zicboz] = "Cache-block zeroing extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+
 TUNEVALID[ziccamoa] = "PMA guarantees for A-extension atomics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
@@ -114,10 +126,18 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zihintpause] = "Pause hint extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+
 TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 
+TUNEVALID[za64rs] = "Reservation set size of at most 64 bytes extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+
 TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
@@ -130,6 +150,10 @@ TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 
+TUNEVALID[zfhmin] = "Minimal half-precision floating point extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+
 TUNEVALID[zca] = "Compressed base integer ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
@@ -154,6 +178,10 @@ TUNEVALID[zbs] = "Single-bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 
+TUNEVALID[zkt] = "Data-independent execution latency extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
+
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32
-- 
2.55.0


