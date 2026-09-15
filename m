Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BE3C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:39:15 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4502.1789499032771389945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=NKqEm4kq;
 spf=pass (domain: baylibre.com, ip: 74.125.230.204, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939eb3249c1so12195485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499032; x=1790103832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEDWsKmpOciytvrmuo5IvSz9VsvPNnag+KZi31GDj/k=;
        b=NKqEm4kqvsZkAmrfzZX7rHuEIOzmh5U5lgfjhD/MxP89Pb1REujCwwX6mt4qATFjAU
         nzJiF1PWEq+1aEYu8SCVlV4OYxa6WF3s0ki9G75MX35GH3U8l6dA8aPgTXPCU/k1sosv
         UuJOK6vIIg/NQJqmxRDgn5GrQ+hRxaYscRIh7vJh/6ZGqxL3zJFckm4UZsIY7sBf6OTG
         F/QjoEmI81H2xJCFAypPTSa0iL/SkO2FIcT/TQ8sBvgz0t6sCrYlRoqOFqD9WedXsYND
         OXK28SAAFzMLom7QJksHalJzkx/gnSKqCHBtix4QY3ZY9jjU2AP98EbPDDaWBm/Qmi0L
         PPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499032; x=1790103832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEDWsKmpOciytvrmuo5IvSz9VsvPNnag+KZi31GDj/k=;
        b=09m7E2T0LQUaWopxfRn4LbjILlQWaISwOLA8/ANKa7d8aGd9Hqqcw+vOCWYcsBBDvw
         pl7J6gRbw+Vh9epah0ykJq1+rBirvrRsi2vI8DdlEi55C2nRhLiVasNFNI9MTVC0MaF+
         Z0IEd5gL7HV7tkrJJfOUDy/17wqea/W32FMp2ogyEVidVpu07uWzGuXToEhlzIUxT1RW
         A1bTjVXHq/kGDljqyo1kaTH7amq2veLr0ffPTh7rJUdYgfm4LYAoHVI+xOZOJ0TeHQUL
         a/aBT5EevHwUWXY+M6uH4OB2Aa63kqIxbMUgerEOlQladlRUdrjp9vrdNGrgW17BXWF/
         t+YQ==
X-Gm-Message-State: AFuF++mTCC9qFFCDh9Tp+wgdIMub7jEZagK++iiXphgtS/BYRdcB1B4r
	0fqj3PXvQYqtJlmYRwupcn41iPBfBvP3pqaxTpDthWU/IjMZAkxt1OMPysKdZWc1Kll69AswqqJ
	VpR7X
X-Gm-Gg: AYBFou1GQFUD92tfAuPHl/RjgPLoM7rGMreJG9rnEF8mAtSB7D+RBOkRNGK5uQgWjvI
	Ih0wKBY+85dADsx+fhzJN4ReNd4RF23JOFV5+eKWIKfFzFw3ci7gssb0w6F+LFWRQ5e3mbxerv7
	DUjKWu8VqqyLN/EnMbXJ7pARIYBKE9SuUBb6ew0xDFAEVScvi7OZkCUBdfg9CLys8KgHNSkC+8g
	Kw4T2062q0NwtCegcV7Ga6ZtVyhJQWq2ojTMxN3uSYmPfe33wK3pnUhNoe9Mz4W3fKlXrszNWQ1
	ib9iV2Yko4UVLeH66SEnS7CAtvNKoxI6UTqIYUs+kzABjnx9Kau7xzlZteg10ejxoERetDiHTb9
	xRAcjt4KYn6SjVEAfwl1RN5zZ1Vmr08EgCFWKRqpxL810NxgGCIrgRXXIG4hezySbCykpN32gfh
	f9zS74kgSagKteOjK7nzO2+U//lmIOKi8JNeqK3+Fh6ndG1dHsPAp2mPLbAVNdr5o/3Ls+d7Wnc
	wqSNGcdTalt62zm+cJ8j0EGjzmgaCGPGOqzSthok+Aw
X-Received: by 2002:a05:620a:1a06:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93a297666a4mr1426188885a.5.1789499031296;
        Tue, 15 Sep 2026 12:03:51 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780ca630sm27449485a.4.2026.09.15.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:50 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 13/14] arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EXACT in assignments
Date: Tue, 15 Sep 2026 15:02:43 -0400
Message-ID: <20260915190244.2983746-14-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245887

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
 .../conf/machine/include/riscv/arch-riscv.inc | 118 +++++++++---------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index e60b88fe44..b0c2460f26 100644
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 
 TUNEVALID[za64rs] = "Reservation set size of at most 64 bytes extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
 
 TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 
 TUNEVALID[zaamo] = "Atomic read-modify-write memory operations extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
 
 TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
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
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
-TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
+TUNE_RISCV_PKGARCH_EXACT .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt", "_zkt", "", d)}"
 
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


