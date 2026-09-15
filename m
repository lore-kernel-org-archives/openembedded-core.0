Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF76FC982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:45 +0000 (UTC)
Received: from mail-qv2-f37.google.com (mail-qv2-f37.google.com [74.125.230.165])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4700.1789499024137954780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=kA5cYwAL;
 spf=pass (domain: baylibre.com, ip: 74.125.230.165, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f37.google.com with SMTP id 6a1803df08f44-91235f46716so1279536d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499023; x=1790103823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYolLxubgV8rmu77vNIUxdTJd2JY5wDDYhbGjNObmuY=;
        b=kA5cYwALPN4ItNeJQBYQbBAZmu82Tg3391njDbrIKTuUPWSKRkbeJ2elQOPH/CkW7h
         Z7ckkcjztysFcvGc4WJhAlpqkiORpwbXpgQnfv+dcX0i3m4y+WyX2KiY8ZJTGh0lkZP8
         36+mUCkMSl6cGTWx4le8YgfltItO4K2FCKyFrbBs/IGAgE1pk/a+5TvtyWYKl0nDW89+
         +m7GfzAaxneu1X/309u1GP+Uh8uHTa3xtUulROtlVKmPMSf1CRlldkwNXX/Hf/8oeAJX
         3Qk3hZe+CRe5U5oYx7c0ebMLTPT9TzbjztYuHuWAjA173smz5NdjyRvviQKERkhjSvPX
         rRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499023; x=1790103823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYolLxubgV8rmu77vNIUxdTJd2JY5wDDYhbGjNObmuY=;
        b=IXWNtK74xNFQHBkMa4VLSVRuhHU9uL4l9m5lusHpMUnLFkmNFWZB3eAvPG7imLR/2S
         LvX6WPS0j85a8dEclzf8CW/rjrdDAjcbdLvwJRfcLY7Om1rVwxMq0DcP40qleyxL3GbI
         xGzlSBo9IL7wId2Yz7FFRDGypMU2WcGugpv1gYWYMcSfNTc5UmEzLE42FLaJYbbW0rfm
         LZafrWO0UlYvvwNplTMG2QBPYK9X5suDitPAPkVJIHRN/M7gdkEA67o1389DQ/lq73g5
         Nv1CVRB1kI8M/7rY3KZaIFaOSt2G4xdA/jjHf6jUfUueH2yyHRaCAvLW2NJTACVYvNEn
         FGcQ==
X-Gm-Message-State: AFuF++nDskWTFrl2LvB4RZj1qK9Zwv77m9m7R5DIlkZ5WfCx/QMPqE8U
	r0eoQYH3v91qzQcbWG51FywMa8WrPzli6xc2jaSnXsC+EbRQQvrDtQRrO1XtscSDnjHX6cYTS+s
	Q3y55
X-Gm-Gg: AYBFou1T0ZsjFh3/h6S9hZ3bLDWibL25RJ83GBdNlWY1sysEsO/KTvMVR0Az/mVyA0q
	M1JL52C9L8nomRzUJCAu2pCZbxXQGNIk0doauT2L/YbUxDCKIuaJ5VPNp0E0h2xSjk9O09tzO7M
	t1NSliia3nWpUkHG7S4vrxDFTmn5ST0jyFpUfYwBOOoy4ZGhKVybKlT1VdSNSElLRu1K6spQz/x
	MuRHdkjoCsomLn1YFepumbgXpWEThZLHcXbDZf0pyL5x0nRoSx9YnyPU6usaayaeGnssDPzEoK6
	pCvXZD6t1gIFez0nJVSJ3DvtGNhkwie5RO0GlfOcxfmDgE0dITpoY1omb87gJJfIXfxJvrlNOq1
	67zc0MgxgEwJQPnoyEFlQXGNU4MEODJgC/MVT84KYSzAUz4wNnvaPJV6bl6vE9c/6oRuyu0dxBU
	eFcmqSjFxFic+oPBmm+fjMmIdbwa6uKOh2AeRNk1TJaTplAq8MGtm8nuFZwJtnb6M6MxBlWPeb8
	7y7AnCrYptOxJtAmt8xHCKLUKUNGWzzdRQ=
X-Received: by 2002:a05:6214:cc8:b0:910:705a:2c5e with SMTP id 6a1803df08f44-9122e55d547mr154529376d6.18.1789499022747;
        Tue, 15 Sep 2026 12:03:42 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm5671696d6.35.2026.09.15.12.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:42 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 09/14] arch-riscv.inc: add rva23u64 extensions
Date: Tue, 15 Sep 2026 15:02:39 -0400
Message-ID: <20260915190244.2983746-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245884

gcc reports the following extension string for '-march=rva32u64':

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

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index c05cdf8c21..e60b88fe44 100644
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
@@ -150,6 +166,14 @@ TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
 
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


