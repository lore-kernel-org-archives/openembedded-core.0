Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66128CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:25 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18103.1790786316181332856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Qe9Koymb;
 spf=pass (domain: baylibre.com, ip: 74.125.230.205, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939922847efso497804985a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786315; x=1791391115; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFFgzi0AulGNt3j1MUfO43VWhmjMmqGsUndrO75qvcE=;
        b=Qe9KoymbUBsxwcmBlf/r7BhWjIDa9ev8qn6YZzVTfxQ+m6WoGvSGvFZctH0VbMdvXo
         15jGgXj9oMlI3EylXaOohfGjn6pkjmorO+MxRNGGw6jK0DCoTB3HKYVLAts75gW+EuBI
         PietYEIvSj/nR6WPLdZKyuyJaI/B1/KM0kYgrDNGaJbdKr8edM6x7w52V1307PnM+r59
         So+ZRv3tM3++9dExHV9E6V1K+YYV9ydYjjzzKNLdAP2HPgAXk9G769CPk2+igtNi6L0z
         BQumAkm1S7kTIYuCSFTFdE7eADrBOJD7ZLIKOosD0F9JjoFVVSfepvADRBXmfi5WQuVh
         TXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786315; x=1791391115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFFgzi0AulGNt3j1MUfO43VWhmjMmqGsUndrO75qvcE=;
        b=s9Y75W1QSwe49K4Rd8S5f512u401cL1t2GZ0kP1jDPW5Ow82zsyvtHpeG6q8z76jpT
         8xdNWK9J6Usg+zB0eXqUl0V3tikeRoTMdNGGrzSErqjMidwCYXvKyq8Mt4Ws37xrfkX2
         600AI2kvDvxA6yEGStN6twalSeLxicAB0ZrYgk7wnilTqgjfdhDuZ7Y8OAaYRNDliAUr
         N1t60ktmLN0hhUUH2zmQbMxiRSjtBn8aBsaVhT3nljdXRpT3hc91Hw4LBKUnsoEI9tAJ
         I5cWn1Ss2pYcSz/tRuhYg4UYWpK4qz/m/QTcIcMMqy+O27gDKAEebRNIROH09SI1FRz5
         7DYg==
X-Gm-Message-State: AFuF++nnznk5zYlnMxx5+FNS+76QJfIkcXCXImoOuNSJbKx4VJsuli9p
	YZzz9EpB2F9Zb40IYRiYDr7WbcBGJXU2lluzITm/JJ6RC2v/GVogloVVM/EQfa6X73AtTfOw3Uc
	N8BpR
X-Gm-Gg: AYBFou0k+pbL4J5CA5RWsoM4pkQqBS4JN+Ebgy4+vK7CCZawQqJDkQCpxYcMAwkUz9B
	LBz9aMWD6wJ+dwrVfb9PRo6dq/GUPCCk1LPBZYJzCF352sph7jRuKt70d33ga/4OstJkak2IHkQ
	n8BX8+hNBLjp2f34T4wrr3epA929T+wcP7WrTvWHnpnAmlFeAfn6R2gsy6nachpVDeq0Raclo08
	7y5yfbsaMS3Y8KKe24cpqm1Lj63/2izI0jb8DBSFrBIbtUxCQfaTPTkYX6cG6KAMUCyL7coZtMb
	KLcf1fpk3K+izw5SgTAiIULhNW5dFLAU4ZRhLaS9u8dsIkbpcrwhEc13zLbs2XczSKoR368qEuH
	d8FRqtQTjK2ajyHA40LWBRx9oeybovTF0Q4K8n0HynwLiEXayhEiNQUUlr8B9mw9FslanjcwiAa
	Pfpw6Q2srmzXeEhXsr9qKV1OPChyN9YDU3qMdimW2ZUGQ0+EpcF2pnH1sxNCja8u1AdTstJkSJz
	4IPyZ8anvO+cE7vvRBgKiu7KVNXz9yMWyRJV+YT61dF
X-Received: by 2002:a05:620a:84c2:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93ca98a4a65mr329525385a.66.1790786314764;
        Wed, 30 Sep 2026 09:38:34 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:34 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:17 -0400
Subject: [OE-core][PATCH RFC v2 13/19] arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT in assignments
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-13-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246993

Change the naming convention we use when determining TUNE_RISCV_PKGARCH,
so that we have the option of relying on a known RISC-V profile name
(e.g. 'rva22u64') as a baseline, rather than always specifying the full
ISA extension set. An example from 'bitbake -e opensbi' with
'DEFAULTTUNE = "rva22u64" in conf/local.conf:

|TUNE_RISCV_PKGARCH="rva22u64"
|# $TUNE_RISCV_PKGARCH_EXACT [48 operations]
|TUNE_RISCV_PKGARCH_EXACT="riscv64imafdc_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt"

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 118 +++++++++++++------------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index aa5c430eba..c1ccf6bda3 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -32,7 +32,7 @@ TUNE_RISCV_ABI .= "${@bb.utils.contains("TUNE_FEATURES", "64", "lp64", "", d)}"
 
 # The package arch starts with the canonical arch, but adds some extensions to make
 # package compatibility clear
-TUNE_RISCV_PKGARCH = "${TUNE_RISCV_ARCH}"
+TUNE_RISCV_PKGARCH_EXACT = "${TUNE_RISCV_ARCH}"
 
 # i, e, or g are defined by gcc, but 'g' refers to 'i' + extensions 'MAFD Zicsr Zifencei'
 # So 'g' will not be defined here as it is an abbreviation of the expanded version
@@ -40,231 +40,237 @@ TUNEVALID[e] = "Reduced register base integer extension"
 TUNECONFLICTS[e] = "i"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "", d)}"
 TUNE_RISCV_ABI .= "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "e", "e", "", d)}"
 
 TUNEVALID[i] = "Base integer extension"
 TUNECONFLICTS[i] = "e"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "i", "i", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "i", "i", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "i", "i", "", d)}"
 
 # Extensions
 TUNEVALID[m] = "Integer multiplication and division extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m", "m", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m", "m", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "m", "m", "", d)}"
 
 TUNEVALID[a] = "Atomic extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a", "a", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a", "a", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "a", "a", "", d)}"
 
 TUNEVALID[f] = "Single-precision floating-point extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "f d", "f", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "f d", "f", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "f d", "f", "", d)}"
 
 TUNEVALID[d] = "Double-precision floating-point extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "d", "d", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "d", "d", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "d", "d", "", d)}"
 
 # Only f OR d, but just one
 TUNE_RISCV_ABI .= "${@bb.utils.contains("TUNE_FEATURES", "d", "d", bb.utils.contains("TUNE_FEATURES", "f", "f", "", d), d)}"
 
 TUNEVALID[c] = "Compressed extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c", "c", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c", "c", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "c", "c", "", d)}"
 
 TUNEVALID[b] = "Bit Manipulation extension"
 # Handled below via zba, zbb, zbs
 # This matches current Linux kernel behavior
 #TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "b", "b", "", d)}"
-#TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "b", "b", "", d)}"
+#TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "b", "b", "", d)}"
 
 TUNEVALID[v] = "Vector operations extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 
 # Now the special Z extensions
 TUNEVALID[zic64b] = "Cache block size is 64 bytes extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
 
 TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
 TUNEVALID[zicbop] = "Cache-block prefetching extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
 
 TUNEVALID[zicboz] = "Cache-block zeroing extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
 
 TUNEVALID[ziccamoa] = "PMA guarantees for A-extension atomics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
 
 TUNEVALID[ziccif] = "Patching instructions at run time extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
 
 TUNEVALID[zicclsm] = "Software that assumes misaligned access works extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
 
 TUNEVALID[ziccrse] = "Guarantees LR/SC forward progress extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
 
 TUNEVALID[zicntr] = "Cycle and instruction counting for profiling extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
 
 TUNEVALID[zicond] = "Conditional zeroing operations extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
 
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 
 TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
 TUNEVALID[zihintntl] = "Non-temporal locality hints extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
 
 TUNEVALID[zihintpause] = "Pause hint extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
 
 TUNEVALID[zihpm] = "Hardware performance counters extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
 
 TUNEVALID[zimop] = "Hardware performance counters extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
 
 TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 
 TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 
 TUNEVALID[za64rs] = "Reservation set size of at most 64 bytes extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
 
 TUNEVALID[zaamo] = "Atomic read-modify-write memory operations extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
 
 TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 
 TUNEVALID[zawrs] = "Wait-on-reservation-set instructions extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
 
 TUNEVALID[zfa] = "Additional floating point instructions extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
 
 TUNEVALID[zfhmin] = "Minimal half-precision floating point extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
 
 TUNEVALID[zca] = "Compressed base integer ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "c zca", "_zca", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
 
 TUNEVALID[zcb] = "Extra compressed integer ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
 
 TUNEVALID[zcd] = "16-bit encodings for 64-bit FP extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
 
 TUNEVALID[zcmop] = "Compressed may-be-ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
 
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 
 TUNEVALID[zbb] = "Basic bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbb", "_zbb", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbb", "_zbb", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbb", "_zbb", "", d)}"
 
 TUNEVALID[zbc] = "Carry-less multiplication extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zbc", "_zbc", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zbc", "_zbc", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zbc", "_zbc", "", d)}"
 
 TUNEVALID[zbs] = "Single-bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 
 TUNEVALID[zkt] = "Data-independent execution latency extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
 
 TUNEVALID[zvbb] = "Vector basic bit-manipulation extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
 
 TUNEVALID[zve32f] = "Embedded vector computation (32-bit integer, 32-bit FP) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
 
 TUNEVALID[zve32x] = "Embedded vector computation (32-bit integer) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
 
 TUNEVALID[zve64d] = "Embedded vector computation (64-bit integer, 64-bit FP) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
 
 TUNEVALID[zve64f] = "Embedded vector computation (64-bit integer, 32-bit FP) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
 
 TUNEVALID[zve64x] = "Embedded vector computation (64-bit integer) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
 
 TUNEVALID[zvfhmin] = "Vector half-precision minimal extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
 
 TUNEVALID[zvkb] = "Vector cryptography bit-manipulation extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
 
 TUNEVALID[zvkt] = "Vector data independent execution latency extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
 
 TUNEVALID[zvl128b] = "Minimum vector length standard extensions (128-bit)."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
 
 TUNEVALID[zvl32b] = "Minimum vector length standard extensions (32-bit)."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
 
 TUNEVALID[zvl64b] = "Minimum vector length standard extensions (64-bit)."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
 
 TUNEVALID[supm] = "User-mode pointer masking extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "supm", "_supm", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "supm", "_supm", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "supm", "_supm", "", d)}"
+
+# Prefer a known RVA profile name (e.g. "rva22u64"), plus any extensions on
+# top of the profile (e.g. "rva22u64_zvbb"), over the fully expanded exact
+# extension list, when TUNE_FEATURES clearly matches a profile. Falls back
+# to TUNE_RISCV_PKGARCH_EXACT for combinations that don't match a profile.
+TUNE_RISCV_PKGARCH = "${@oe.tune.riscv_pkgarch(d.getVar('TUNE_FEATURES'), d.getVar('TUNE_RISCV_PKGARCH_EXACT'))}"
 
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:

-- 
2.55.0


