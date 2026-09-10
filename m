Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E052C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:21:46 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16670.1789052935920809314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=fjOIkhUZ;
 spf=pass (domain: baylibre.com, ip: 74.125.224.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1916537d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789052935; x=1789657735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7yZNM0r5GQysGHVD2VvfRITvhYx+QTngeSnW/YxZU8=;
        b=fjOIkhUZX4GrwngLGu+PnGw2ct43N4E96wmCkwdISWkZ2GvPektKfXdRp7w3cxpSDP
         uIauMoYrveKem4lnM7bBW4ocb4ZOFiG8BAzyQrtRT7HijkgiSclTy6/e3vgE4vUwgXv5
         muhyb3SIkgM4fqfJbLUBIwurMrIC4sSm2P8/6AU7f7zBesLtr/15JwLUAv1Nbrg2zfUq
         nzmqybbEOA9QlGyVJAFAhN6DcLEZpnVHz48QGMhyoEzb1ZWYbvEtMDxJG02Fp2HD58nW
         AtVXQ9mEvlyy+LrG8tqM27zVv1eHecevjFqEDqzJTPsSO78vBnijjREyUZD9oTklqkMK
         O7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052935; x=1789657735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7yZNM0r5GQysGHVD2VvfRITvhYx+QTngeSnW/YxZU8=;
        b=DlVVWphHKLoRfI+Xi4GtKtPbyRkD0gx5FcI15Ix4EnYNQHmV5pDtDwWYPzk5Qzi8yg
         mefOX8nxqnm5x6sJgmvg7QeC25lj29AK6mcVdHaRZ8r8bNU+NRzs56KRt/mygUksFORZ
         xNLdA9Kxuu85lGfaLGzTpWqXsSptNJDrbEiW0em3emhjluNrpooB7D1OHCNzuSEKXgsK
         p4EN79VXhDX09glsgr1pPAj+Xjbc/RTQ8Vs78+kHsZpIYgCHinNGbSYzDqp5KjK/F9Gi
         YQG5SB1LKBHO+ZiNMZ54uHEHiv7jspiqPmdi4DDqclFKW1FY9GGEJ34NWGk1LrsROoci
         8+mQ==
X-Gm-Message-State: AFuF++niS3Unemx/GZzPdpVOzvq2GX+cw/1uA/Rxagy0UqAtwMmNGsJw
	qq2sjfeou9EXHrsTimxpP7O01+edvef04VQSr3b/DbfaCfDXRap1Xq0R3r89gcyRczpZA9MsHS3
	NkhaV
X-Gm-Gg: AYBFou14CnHnJJd+YG7v27aUyu4PpKeaeMnv7fJIR1xC/Q1u2s9t9yeRLXtKTsGGy3A
	1tqaRXPFnYYfp1M5+sjeENKNrPlaaSLlmuMJ6WGLJxTgbk27/5eXf88ZKT9tN1FZm0h9FdxDTFl
	dhEwlMnN2rYVvuOWR+rEsGVN6X82IwtAjiOWE2VMwNXw4PeYWydqpBvmrdTB1GS55bryRRYWtzD
	rYOtTMhUzbiuGo6h3KhkkhP7k2om1/FD98giWgY7vbeCKSfgeBKhcFGwKDVMZYCZkLpS2MPdjpP
	K1Zbexa5/8M3INzZn7ffqRQv4vV90ktN/4LGzyKvoLc1+NNx00kWPulBlbcUYLyMuifHZDZ6WwH
	ZjTvneTe2cDO5CpjcypGupqkOG4zIvO0vt/FJH1cQ09OHkBDblrEN48Bs6twHOruN9SF3XplJpM
	/8TZoQ53dtj9qODXF7UE223gibfNJS1x8UUWzTd1nYLwwIXXHF7dAPpsupL186Odvy0wKcdpchW
	5z2exITyUspG0QeBXiGUnuVigG0zVDnbRA=
X-Received: by 2002:a53:a648:0:b0:66f:c1bc:87fc with SMTP id 956f58d0204a3-67110086cbbmr2789509d50.85.1789052929654;
        Thu, 10 Sep 2026 08:08:49 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120c764832sm4728306d6.20.2026.09.10.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:08:48 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@kernel.crashing.org
Subject: [OE-core][PATCH 2/2] arch-riscv.inc: allow zicsr, zifencei in TUNE_RISCV_PKGARCH
Date: Thu, 10 Sep 2026 11:08:43 -0400
Message-ID: <20260910150843.1531415-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910150843.1531415-1-tgamblin@baylibre.com>
References: <20260910150843.1531415-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245588

With the OpenSBI Makefile fix backported in 7bd2a8ce2618, we can safely
enable this.

[YOCTO #15897]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 99bed8fde5..6f9b74974d 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -88,20 +88,11 @@ TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zic
 
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
-# If zicsr (or zifencei) is in the path, OpenSBI fails to use the extensions, do to (Makefile):
-#   # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
-#   CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep -e "zicsr" -e "zifencei" > /dev/null && echo n || echo y)
-# this will match on the path containing zicsr or zifencei when an error is reported, which
-# will always happens in this check.
-#
-# Yocto Project Bugzilla 15897
-#
-#TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 
 TUNEVALID[zifencei] = "Instruction-fetch fence extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
-# See above Bug 15897
-#TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
-- 
2.55.0


