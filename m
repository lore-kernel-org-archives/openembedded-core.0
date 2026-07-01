Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA659C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:58:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43270.1782907117355857824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ckP38LlW;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4745492ed3aso332916f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907115; x=1783511915; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xi59yU2SD11/K7leMDXhuashplqtw/UHNq7fzaxoEQ4=;
        b=ckP38LlWTqR1orGW+TROaPmLlUkGnQT0qCFwq9HKa4RNHB8Y643qPcGxYQscMw1WjB
         kfB/IZX/Wbxn/YYIlVETmC/illjZDIWH11einr9ZYFnIqQFNwqmqT0bkQg4Z0gmsVzlO
         uPrhZVvSJpwxh2a+/Za116RXbFLu0qy02zWz3eLLAWWcszaBfJ72l1rEKkBfTawAtbee
         wVL6cmgWWTqr92ymTGk2rPcLFsbnN1HvutWJVtIaYCOwhjvc1kKXqP/Qg4WwVrwSv42l
         5D3IMxT7CmvI9KsijCOy+DbuAFDDhaPf6gJcfN8zQSSm/XA5faN74V0Q6B2DoqzAzAXL
         FLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907115; x=1783511915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xi59yU2SD11/K7leMDXhuashplqtw/UHNq7fzaxoEQ4=;
        b=gUuEV32i7InfRlJt7buCBHoz0/tJDs78k9Yk6yApLFLvqGWYwtYt/08Pth8LCj5DJp
         4OCgvmq23EKjCF/1nVQBqOH5IohPSG0WhW+ak6s64yDjEPyztoyDGZLlLyOyBuhRrkw4
         7YUIZ76KDwofVtk5CmmtBYwBi+yFefOuS68LGKYOobnrGBtY5AsO1cU+hLssaBEIWLur
         OUpnTvL4Ge8hDR8Q7/hiIsA51HBs4Pyo3wGsu8T9sRAqN52Re+xIf+dg6xxLmbdUEFnQ
         CUps89Pbhp94+g/xQeHuc5/zCLLJoR1coUNqCR90CuWKqxHjyYcQkdDDtlIStg6BZ2po
         MxKQ==
X-Gm-Message-State: AOJu0YxWbmY/G2E90SoujsTLW76swrnuX+dDlkHD4qDowLld2jKA4LN4
	fnx79vS1AgXo7CeWp2g6MfazBz9JO+uSOeQjlrASoLlg2q6X5VwXsE0C+4h1sw==
X-Gm-Gg: AfdE7cncSHf6kPVUh9XHOhUooOZx3w1DBc2Qjs6coCD2iy3zYyu22jX4f1ajchitXms
	mmll77Mokb/9KLQrTmlWezGfkvfP5aFQxLYlaAEYGNj+nIcVs/MbGaYXW1evtzdLGKk+51fZB1m
	YZ5Utd6tWN0njHxHOeEfIjaYiYDVO+Z1CT3y2mU8a4yZpq/Lw1tYICix7ZsQV/JBJ1lFxjAJvs6
	RbexzgRt35xK39QP3D7aIkHdMsQ8u8OnsbCnXotqAJ7Gw1xKFjKMeO/JN4h5KOTblog8sOPUOnU
	gd+Aw5osx99bTgn/4wIzb6Klv3hc6M8I6WEd0NLtC1QlgawqjZSgAFWmVBlWwPJWymiMhwah7cr
	a0CzlkDLo4C2wxyUw3yJsNRsu1MdiIwSyKuZRAakpG578E5n+rC0vyDkUUkXn5z2maruMRRz3du
	Wx05+IdZhPbD75Lred+v2379CKds7dnNjY5GJp8rNyXp5HzTSU4V0J68kVuLGlP9Y=
X-Received: by 2002:a05:6000:604:b0:460:70ae:f1af with SMTP id ffacd0b85a97d-47757e57d4emr2284899f8f.27.1782907115368;
        Wed, 01 Jul 2026 04:58:35 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf98sm12680161f8f.22.2026.07.01.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:58:35 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 01 Jul 2026 12:58:12 +0100
Subject: [PATCH 2/3] tune-cortexa32: enable Thumb-2 and fix AArch32 crypto
 FPU selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tune-a32-v1-2-a43f28b1d7a4@gmail.com>
References: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
In-Reply-To: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 11:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239979

Cortex-A32 is an AArch32-only ARMv8-A core, but its tune was configured
as if it were a plain 64-bit-style tune: TUNE_FEATURES lacked both 'arm'
and 'thumb', so userspace and the kernel were built as fixed-width ARM
rather than Thumb-2, and the package architecture names did not match a
Thumb-2 build.

Add 'thumb' so the core is built as Thumb-2, and 'arm' so that
feature-arm-thumb.inc honours a recipe's explicit ARM_INSTRUCTION_SET =
"arm" instead of silently forcing it to thumb. Without 'arm', ARM_M_OPT
is pinned to "thumb" and recipes that request ARM warn, e.g.:

  Recipe 'libmad' selects ARM_INSTRUCTION_SET to be 'arm', but tune
  configuration overrides it to 'thumb'

On AArch32 the ARMv8 crypto extensions (AES/SHA) are part of the FPU,
not just the -march ISA. The 'crypto' feature only appends '+crypto' to
-march and leaves -mfpu at plain 'neon', so building the AES intrinsics
(e.g. mbedtls aesce.c) fails:

  error: inlining failed in call to 'always_inline' 'vaesdq_u8':
  target specific option mismatch

Select the crypto FPU by appending crypto-neon-fp-armv8 as the last word
of TUNE_CCARGS_MFPU when both 'crypto' and 'neon' are active, mirroring
the vfpv4+neon -> neon-vfpv4 idiom in feature-arm-neon.inc.

Update PACKAGE_EXTRA_ARCHS to match the resulting package arches:
cortexa32hf-neon becomes cortexa32t2hf-neon, and the crypto variant
becomes cortexa32t2hf-neon plus cortexa32t2hf-crypto-neon-fp-armv8.

AI-Generated: Claude Code (Claude Opus 4.8)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index 0eb938a2403a..f8f876813302 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -5,14 +5,22 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=corte
 
 require conf/machine/include/arm/arch-armv8a.inc
 
+# On AArch32 the ARMv8 crypto extensions (AES/SHA) live in the FPU, not just
+# -march. OE-Core's 'crypto' feature only adds '+crypto' to -march, leaving the
+# FPU at plain 'neon', so GCC refuses to inline the AES intrinsics used by e.g.
+# mbedtls' aesce.c ("target specific option mismatch"). Select the crypto FPU by
+# making it the last word of TUNE_CCARGS_MFPU - the same idiom OE-Core uses for
+# the vfpv4+neon -> neon-vfpv4 combination in feature-arm-neon.inc.
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'crypto', 'neon' ], ' crypto-neon-fp-armv8', '', d)}"
+
 # Little Endian base configs
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH:tune-cortexa32             = "cortexa32"
 ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
 # We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
+TUNE_FEATURES:tune-cortexa32          = "arm armv8a cortexa32 crc callconvention-hard neon thumb"
 TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
-PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
-PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32t2hf-neon"
+PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32t2hf-neon cortexa32t2hf-crypto-neon-fp-armv8"
 BASE_LIB:tune-cortexa32               = "lib"
 BASE_LIB:tune-cortexa32-crypto        = "lib"

-- 
2.43.0


