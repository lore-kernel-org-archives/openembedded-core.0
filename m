Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDFCCA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:44 +0000 (UTC)
Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18028.1790786309899128734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=hsREMr8j;
 spf=pass (domain: baylibre.com, ip: 74.125.230.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-9144f89ce90so45644796d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786309; x=1791391109; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REqauehXOpbEDsULZacsZSsjPEJgeaIPua1+vgOrbtg=;
        b=hsREMr8jy5bfCCWrxCu8vS2tLZkXJOG+tc8jFtXOv9hZkYjrqyfgq5ZkJTtSXETeXN
         1ke1FeoPrfQekryWbNv8Pl4SIj6ny5pqA2LrmaD+XOf2isnu/MPrnXXLVM++ZjJ14Ui7
         iXEiMF2PNeWmVKtEQQhIZS2aMsydJVUmoP7wyZEhUsn7uChZQOLTwvon86RYTsxwPLGp
         +8zM6eejUHsK7+2THoZpnkoIykxgC/o78FkeBvssjd578FBeHbaBVUdXT8WtPq0VEcFp
         6n6Q/b+AJhqGG+s32rD6sT+s3j1lJpfEmq9fAORmIfJnz/9VdqdNTjbV7W6LKXmu9x7H
         v27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786309; x=1791391109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REqauehXOpbEDsULZacsZSsjPEJgeaIPua1+vgOrbtg=;
        b=EBS/tA+IDjNQkeCjz+mfWHQ5+V2B4pP7Xcx3w9i0xnvTPTEVUR4eGcioohLLcG5aaR
         oEdUN7rKvqCYYScJKF22ist/QeTOXz2YoZ1ELV7hEsY2lpBTTnfYNZb/kKZi1+vtki5v
         8DjzHwj7MWAw4YETelh+u5W4tYaFWoIvGlr5vJjSQ0HGLfjGVuTHM35828k1013LyzjZ
         srM+C4wuXvCfp12NVKQthj1RoJ3e3LLDD5pXbhUIBe2MMlWYJugK3UhkuyrtAz9J6Jkd
         v7B89OpG3IZr1tT/GqIyP0g/Nx11kbArg5RVwYZ7VUrMFUAqr0v9fNyoszDpvp3T9M35
         emAw==
X-Gm-Message-State: AFuF++kzz6iC0jmCbCw0HTZWoWFTDuLZNsog7xi6o8anyqgX63e3QphL
	/v5yCgZur2QT7OIhvC/do22iLqe8fOI83o9Zp6zlZ5L4AwDWW9zAupSTGHe+haQus+k=
X-Gm-Gg: AYBFou1hRRyFfX/pxkOHhd+Gx/o2WJwWccpu5Iv4fvNNHc/DxurDO3Qj694BxUpi77f
	jDf3sqCtY0hjxMGlydLwyN7kHfbrjmWPkSthf0karVSy2/5GbwzXG5GJAmwVZEcyIfUqQkopDO3
	KBKwLk3rTpo6DfA+9KOH1sxZp7HiZjYAg7EeAcdWbFZnbGdJs2X254QzYAqesOaHImktMJA7daH
	ez+AMFOs+sl9rQ8Nt+BGd8WRPxIZ7iIiZfcRlUQGwlaCzazsSq8a9iYGE9W/hpYkrJq5iG79Z7V
	YzSGNLHir5B/3J/2tpj0xgiwAS/pqhtfFWTI959JMHR8izOs19BvHwQ8dG8dlrpOJV7ktzj2Q4d
	W58uFe4oPllh+AinTnuC5BQQDj0Lqrl/20R9ZVHjnUvatIJli53LHyfqTX0sBzt72THaJG5wrDA
	B6lzKD7mg4aBY3WtQEM/38tWJQrVfD0DfFIFKIGnMoo0nUadYlspy2WndorDTtKSrAxjh+W75dw
	6gqY8fLvgoB+JOFhvxCtbii53tcHz2rYd9mQN81gLY=
X-Received: by 2002:a05:6214:2a49:b0:914:4c57:510e with SMTP id 6a1803df08f44-917a0bc0e66mr34491296d6.19.1790786308534;
        Wed, 30 Sep 2026 09:38:28 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:27 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:13 -0400
Subject: [OE-core][PATCH RFC v2 09/19] arch-riscv.inc: add rva23u64 extensions
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-9-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246989

gcc reports the following extension string for '-march=rva23u64':

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rva23u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_z

Add the following extensions to complete the profile:

- zawrs
- zcb
- zcmop
- zfa
- zicond
- zihintntl
- zihpm
- zimop
- zvbb
- zve32f
- zve32x
- zve64d
- zve64f
- zve64x
- zvfhmin
- zvkb
- zvkt
- zvl32b
- zvl64b
- zvl128b
- supm

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 352d6bd878..aa5c430eba 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -118,6 +118,10 @@ TUNEVALID[zicntr] = "Cycle and instruction counting for profiling extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
 
+TUNEVALID[zicond] = "Conditional zeroing operations extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
+
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
@@ -126,10 +130,22 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zihintntl] = "Non-temporal locality hints extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
+
 TUNEVALID[zihintpause] = "Pause hint extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
 
+TUNEVALID[zihpm] = "Hardware performance counters extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
+
+TUNEVALID[zimop] = "Hardware performance counters extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
+
 TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
@@ -150,6 +166,14 @@ TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 
+TUNEVALID[zawrs] = "Wait-on-reservation-set instructions extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
+
+TUNEVALID[zfa] = "Additional floating point instructions extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
+
 TUNEVALID[zfhmin] = "Minimal half-precision floating point extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
@@ -158,10 +182,18 @@ TUNEVALID[zca] = "Compressed base integer ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "c zca", "_zca", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
 
+TUNEVALID[zcb] = "Extra compressed integer ops extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
+
 TUNEVALID[zcd] = "16-bit encodings for 64-bit FP extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
 
+TUNEVALID[zcmop] = "Compressed may-be-ops extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
+
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
@@ -182,6 +214,58 @@ TUNEVALID[zkt] = "Data-independent execution latency extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
 
+TUNEVALID[zvbb] = "Vector basic bit-manipulation extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
+
+TUNEVALID[zve32f] = "Embedded vector computation (32-bit integer, 32-bit FP) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
+
+TUNEVALID[zve32x] = "Embedded vector computation (32-bit integer) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
+
+TUNEVALID[zve64d] = "Embedded vector computation (64-bit integer, 64-bit FP) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
+
+TUNEVALID[zve64f] = "Embedded vector computation (64-bit integer, 32-bit FP) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
+
+TUNEVALID[zve64x] = "Embedded vector computation (64-bit integer) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
+
+TUNEVALID[zvfhmin] = "Vector half-precision minimal extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
+
+TUNEVALID[zvkb] = "Vector cryptography bit-manipulation extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
+
+TUNEVALID[zvkt] = "Vector data independent execution latency extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
+
+TUNEVALID[zvl128b] = "Minimum vector length standard extensions (128-bit)."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
+
+TUNEVALID[zvl32b] = "Minimum vector length standard extensions (32-bit)."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
+
+TUNEVALID[zvl64b] = "Minimum vector length standard extensions (64-bit)."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
+
+TUNEVALID[supm] = "User-mode pointer masking extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "supm", "_supm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "supm", "_supm", "", d)}"
+
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32

-- 
2.55.0


