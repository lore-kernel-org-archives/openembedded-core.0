Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F92CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 03:57:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17776.1780272668034897689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 17:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IEM2YJ7u;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: prabhudasuvatala@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36da8439078so471410a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 17:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780272667; x=1780877467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OrKXywac8SNdthX7wWSr6Lste7RoPkv7eTcagtkDiY=;
        b=IEM2YJ7u8NNjnBb5qV5Iqe/hKcyI9P97sdNX+uQ3r3GjI2ra8CFXGVr1fp17bIkLfo
         Bc+q4KaWI51sq3GkvIvcUnYy8x6+KdhuHjC8bqlqqAhLUQ8z+/ZtpYrWzgZNagEOzVV1
         TCJESxhpgpZhBBBPR96V7C+Ss2nDY2N89uDNVA16gL5k8tswiE77JFtl9TLSGMP2TinA
         i1WNoWBTb3OewZvIj9k42oZc9UQ2rLEpSrKNGP4MzP5kHKThtRKmgS146z2H5T2WwO/A
         kNJVtr0QdnDMakcTQ59HlQ6n28nwkr4NT0fZsIsO/vcw7bhL+CLcbejrcY0mUVQXAxsL
         Jgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780272667; x=1780877467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OrKXywac8SNdthX7wWSr6Lste7RoPkv7eTcagtkDiY=;
        b=CYexD8S2hjDljP0+cAAq3KQnQs+r+duTCiCa5WsC/1L135vzZmcc+OFtigrdiGGIlW
         mqWVLv4GF0qqj3OTUh5tLedUW1UWyhSIJUiDDPtR05ctD1WPwwrISR13MUP73RpX/aqf
         Ah8aaGZyE5s7XLW+mE87Ger3slAdVjq9WQPEQOlNrJZ8F19ngRrwZJHunhZZbuG9qsyy
         oRqvenaXoNC2uWAoHXIIfRFcOIC+5Hy6epW/pQHQj7yk09Qz79OqG1qN2xQcfEoWksFx
         rzjS/WfLMxCtA6DrKMt8M6dxp6ZLwnYj4MT+P5zy1kHFKsZZwZQAuO1ApY5cHojNG9pW
         R4rg==
X-Gm-Message-State: AOJu0YwuLuzkKc0Mvp88M92tIqXtHVvf33a4BKMvcW4KHk0BzZ/xuhNn
	b7Yi6Q/MYBX5U1PRpPaFnKtZvx/gBHuCMwAgSArgGFgHcrF9kZQM3I+WX/Elyw==
X-Gm-Gg: Acq92OF91FAWmQmiigpLgPKLw00bZezUa6e5Z+bMa2ZgReG0O5iJERmbXbVLuYG57bK
	JZd57E4xmwKRixn6oHNP+RIgzDDaKq+LWHF1FMBoqT546FqKjkRCcS/SkPA/CUooeVxey112JUf
	wd5KpHbdRjlVF2p1Yb9S2mQlLOt8WIniP04BdAPxVvh8kBEMu5b8UVawTQnBO50Jia5nzC21J37
	CvPcVgZ4dkMoPUp5H4VgqnQH+jiGuSfvoc2ri/LgkpoQ3vf8SaPvMePbfDdDODIb2XwCP0cAR2C
	L+wScvxV4Gip3ZcHwjgPSYBzS9yyYkNrH5cJ7GQ7KD+xeRqR9yWHBbDFGlkugOIY0xf32an0PLH
	FSbluvlzYpIuZZfemJHK7qM9vuCitzFk6GI2O2gBVw2IxW2N/lbFwfz6dxX3ZDS5z/OHNyAy/mL
	p45AIdPa4Fw5WrXmcefEhnO+XrFNFwuB3xqbyds4soNbaObJ0egWn8Q6Ik4YyB
X-Received: by 2002:a17:90b:2383:b0:36d:6315:1de5 with SMTP id 98e67ed59e1d1-36d63151e6amr5235876a91.18.1780272667363;
        Sun, 31 May 2026 17:11:07 -0700 (PDT)
Received: from workstation ([2401:fb00:ffff:fffc:0:b:ac10:f0ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe192c34sm4087221a91.11.2026.05.31.17.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 17:11:06 -0700 (PDT)
From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: prabhudasuvatala@gmail.com
Subject: [PATCH v2] [scarthgap] conf/machine: fix typos in ARM and x86 README files
Date: Mon,  1 Jun 2026 05:40:57 +0530
Message-ID: <20260601001057.18589-1-prabhudasuvatala@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 03:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237808

Correct spelling errors in the machine include README documentation
for both ARM and x86 architectures to improve clarity.

ARM changes:
- Fix TUNE_PKGACH -> TUNE_PKGARCH.
- Fix "definiton" -> "definition".
- Fix "Curently" -> "Currently".
- Fix "specificed" -> "specified".

x86 changes:
- Fix "define" -> "defined".
- Fix "to to" duplication.

Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
---
 meta/conf/machine/include/arm/README | 6 +++---
 meta/conf/machine/include/x86/README | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/include/arm/README
index c5637798e6..bccbb1bdee 100644
--- a/meta/conf/machine/include/arm/README
+++ b/meta/conf/machine/include/arm/README
@@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a given tune.
 
 A small set of ARM specific variables have been defined to allow 
 TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
-change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be 
+change the definition of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will be 
 ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
 default.  The format must be of the form:
 <armversion>[t][e][hf][b][-vfp][-neon]
@@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch component specified by each
 tuning.  This is the primary identifier of a tuning.  Usual values are:
 arm, armv4, armv5, armv6, armv7a, etc.
 
-ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is 
+ARMPKGSFX_THUMB - This is the thumb specific suffix.  Currently it is 
 defined in feature-arm-thumb.inc.
 
 ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is set 
 to 'e' when on armv5 and the dsp feature is enabled.
 
 ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currently 
-two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.  
+two defined ABIs specified, standard EABI and Hard Float (VFP) EABI.  
 When the callconvention-hard is enabled, "hf" is specified, otherwise it 
 is blank.
 
diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/include/x86/README
index 05aee533a7..f0a1882d81 100644
--- a/meta/conf/machine/include/x86/README
+++ b/meta/conf/machine/include/x86/README
@@ -4,7 +4,7 @@
 Most of the items for the X86 architectures are defined in the single
 arch-x86 file.
 
-Three ABIs are define, m32, mx32 and m64.
+Three ABIs are defined, m32, mx32 and m64.
 
 The following is the list of X86 specific variables:
 
@@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
 TUNE_PKGARCH = ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
 
 The package architecture for 32-bit targets is historical and generally
-set to to match the core compatible processor type, i.e. i386.
+set to match the core compatible processor type, i.e. i386.
 
 For 64-bit architectures, the architecture is expected to end in '_64'.
 
-- 
2.53.0


