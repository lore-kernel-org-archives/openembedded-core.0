Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF81DC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:05 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4691.1789499010371048911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=cG/GrKGx;
 spf=pass (domain: baylibre.com, ip: 74.125.230.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so868986d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499009; x=1790103809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgSYNys2l6cSEVNBFMqZerZ7l+FIbz3isjTR91P38NE=;
        b=cG/GrKGxEcCCe3uzc1RUlkP9aQAcCzyXV4gUMf/HN6AdEx6OwtESnGJzsjUsNd5woi
         QelUOXObd/tYNkxsMX+uu+J3+C+4M10glk9HNRNchLGiQVdV6uTspf+q2urh8aeqmjsD
         PV+CxGqOGd16lEl9CZXWawpyFdI5+IV3TwJh1occ6QVW8tQcMYStaWcf1cTe+pN3Plfc
         L5LqOiOjXTH4HOfbrFZbwNoCsivOtLEAuRTZDvyEymR+oJIKNHnkYAJmcQVItgwltNSv
         Z6qNVJHHymwmZo8Z5jon3Y+rZ2XiHdYVERLPMs8j0Fpl0LR1SDadFngxBHAiOr2UDbHm
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499009; x=1790103809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BgSYNys2l6cSEVNBFMqZerZ7l+FIbz3isjTR91P38NE=;
        b=o0DsLZ7iMiCRcIgDLkDYfdi7YH88rD6okgWoIn1HaMVREZ6MH/c1eXpqkTvxdYC4dJ
         GIp/2lfnc9zwYm/dyjYMaV18pLM6K2ShvdaJyMZQkctW25sXF9GZ7hv38vNNWGSuXPuI
         gGzESiwx4oaxbwUQSZpxidahzSrN1OzVaemjWWWX/NQymEmyg2M5BCZ90ifGOJUUqlhO
         fJcLK+iHwN/JWzOyiqYSBpYNzHelNXGcm8PJryY3qYqj2Ep01tLqLqWT89v3dluNRJeF
         cWO8TNRc/3Q67AQBtSlYkXo7tdYBV7Ee3eu9n+nqWcqr5BsE8CDrMVNkvXbuK51eUN61
         v0Kw==
X-Gm-Message-State: AFuF++ljk9meAN53dYqtDUPSwdFGZmP64mnDnO8hfns+xtcJWVkrlgIh
	aPFlafhwTicjXhIhoW5v3AowjkSBKM6oDiDCa05uLjXQJ6j2g2xvD/FKN4/qBVE0q8HqvvMm/li
	WgHL/
X-Gm-Gg: AYBFou27EiZxyyJc+HatKTbG87ley4ewRx2wfuyoC5h/TN/ZkR3Yfd+s/tLtxB9/Meg
	VLXATmuVVQ9lEuiE0GkQnIbsa3Tjx73KYDDeew8ISYSMVSfTvGTA7BqJqRAXPw4LSwcmoBUtt25
	S8ULIQl5vqpQqaE7AWSKKY02v9pVkwKPIfUYtShwiRhNBrS9goiPMwXANx7SA1cIEMGqrYakg31
	oHoeKDYmLyPni1meOIQeJSaY47KMdRCzd0ubL8v8wCApEELrS2Y5Zqj26H4HdFNqW1X9j0UYbm1
	GMcGE2uzbunB+lMpIaZICL6ZNENhsSuig4iJspVL9zQF38xwqsc4DrPCPXo2y5qrKA6wGHNP+Xc
	jxZJiML+dTmUxoarwV71WqbB+J2ar7UzoaHfRb7oOPtD8xUKw+p3gAsYG8L+/h7Zdw6MRl5VBvh
	Ny3BKSFLuMRMcWiQwB0O8i9mDnEEZWWNbuoX0vx/g/9eKPL+WAE+NkDK7Spq5XKvDX4L3t5Qs+O
	6QsFYylmMTV+MmCUMWw4M3DqwXacZ2n0w==
X-Received: by 2002:a05:620a:8085:b0:93a:48a:167 with SMTP id af79cd13be357-93a40860dc2mr360534485a.39.1789499008848;
        Tue, 15 Sep 2026 12:03:28 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7822324bsm26433085a.22.2026.09.15.12.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:27 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 03/14] arch-riscv.inc: add missing RVA20 extensions
Date: Tue, 15 Sep 2026 15:02:33 -0400
Message-ID: <20260915190244.2983746-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245878

There are currently many RISC-V ISA extensions missing from the
arch-riscv.inc file, even some which are required by core 'riscv64gc'
extensions. For example:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rv64imafdc_zicsr_zifencei -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdc_zicsr_zifencei_zmmul_zaamo_zalrsc_zca_zcd

versus:

|TUNE_FEATURES        = "rv 64 i m a f d c zicsr zifencei"

which is missing zmmul, zaamo, zalrsc, zca, and zcd. There are even more
absent when comparing against the official RVA20 spec - passing
'-march=rva20u64' to gcc and checking the ISA extension string shows:

|tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=rva20u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                     		rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd

Add the following extensions to arch-riscv.inc, along with their
conditional inclusions required:

- za128rs
- zaamo (required by 'a')
- zalrsc (required by 'a')
- zca (required by 'c')
- zcd
- ziccamoa
- ziccif
- zicclsm
- ziccrse
- zicntr
- zmmul (required by 'm')

We also need to change the extension ordering in the file, so that they
appear in the same order as the compiler expects.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 46 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6f9b74974d..7db400694c 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -86,14 +86,58 @@ TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+TUNEVALID[ziccamoa] = "PMA guarantees for A-extension atomics extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+
+TUNEVALID[ziccif] = "Patching instructions at run time extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+
+TUNEVALID[zicclsm] = "Software that assumes misaligned access works extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+
+TUNEVALID[ziccrse] = "Guarantees LR/SC forward progress extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+
+TUNEVALID[zicntr] = "Cycle and instruction counting for profiling extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 
-TUNEVALID[zifencei] = "Instruction-fetch fence extension"
+TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+
+TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+
+TUNEVALID[zaamo] = "Atomic read-modify-write memory operations extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+
+TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
+
+TUNEVALID[zca] = "Compressed base integer ops extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
+
+TUNEVALID[zcd] = "16-bit encodings for 64-bit FP extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
-- 
2.55.0


