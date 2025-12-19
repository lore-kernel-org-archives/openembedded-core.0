Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0977DD711DE
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:22:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9464.1766114550316392093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKFcefcX;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1374846b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114549; x=1766719349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ADkl07pfHrtI+NwUxkWr1NwZTANlOzXnmOvcnEKbHM=;
        b=PKFcefcXsUlMB7T9qp647VyCzSk18K2gCK80X6h6Wr+vuI2wvUZ06qBBg0yNRkGmpC
         uPHLwmZ3SMCco5KS/b4nERhFVecrs4pSZi24PYRYYCrHNOh33+XOBSyPRPJ0r6ExBapp
         3rGReOoce3um13r9NnZzNGFRQbgQrIiDHbTstUZ5YFnZ3mocdIZIYZln3s7ygPcbTQnb
         jFYwQailm8whjv6xKLD8oPUO0gW8Yvzh/jQeOGnFwJmSomL2hLv9Th26jazPaooTz/nL
         AsfJWc77QoPeeKhm/LYtkCJ6n5Z5HwnW+KLgRSWIVBNRMenGP4zoGyVKH+Hmc2K5oTtx
         HTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114549; x=1766719349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ADkl07pfHrtI+NwUxkWr1NwZTANlOzXnmOvcnEKbHM=;
        b=f8L146kIMz2NREqecFCXSJZ1fT0PrZH2GSJQ5oI63QwJ3AYIqXeX/JZv03ogn65LQr
         AXqjlg7d8wiaSNphEPpswbEsfiGQxZ1aNXpir966c/0J2U3osKnRSh7j/EizICAMHzF3
         H1cDV4BfxhoOtwtLCDRRLCVuENe2hwvef6MsW5a8NoXmeE8hrQw+6Oq9toLu+fB0NkTX
         R+rpqEllBP634myPF62g8Tp56iHQNOubot1aY4CnjCzuiq+Ac95C2wrvQJb9YtVGXvnk
         5qtDF851ZoxaUMbVM9qE59fRJK/FiEOIxiOP7pWU5TZrCiHteNT/8unl3nvi+xFiGIyh
         c4dA==
X-Gm-Message-State: AOJu0YxoyrKHtR2RPGRQFY229aB+5WDuwx11rvSDy+4/XNiC4gIJ/8go
	H9+6Pch32Ni9AFwcxwYhZhg11QPazWVI8W/hzc6FoCqlGfRCUCTdQbdwQr2fgw==
X-Gm-Gg: AY/fxX7fnNN0fqftruuRHtZdf7WEu7IVG0FtRl7Zo5RWf1LC9/k/UPl100GQ34O6Nqv
	/Be5DAJ1IMPVZN8s7hl8X4gI52mcKhL1HjFGH/FlnPWoIpxsjfEYS4mhvuBaD+I4GsapxeJIXOp
	smSsJw1A1Of2M6RagDSFpN+jI28Xlr1XC/i0HDQajprotENag4gxlienVsXmFYBRDSc1aHh1TX1
	tnnJlrNsroNE2TDP2hr6SKHsaoou3/7hOh+kjQxacoljz6QRcsy892MfoeAGSGjaPNu9/ZKJRZz
	TKS50AMPY1FfjLk/BzI308gLNoa2JQ/NY4iynD5XaGQ2EoeTkSScvpLxeWHGF8n3vd0KLajdDyN
	latWi9trPADR70fboJISH1VNiPdn7KJ2nllZaBBQQgHsiV3GuPhLuNyRqfz2FfGNAsqZG0ZHsL2
	+Y5zegL5+NUAFh/wfm4i5HBVzM
X-Google-Smtp-Source: AGHT+IFc3lN3VGIqdkTUJhjI+yjrUwAI/nkTxfsIpyuwY9/IuyQe10f0nxD4ItgCBOEnjzGVk41ruA==
X-Received: by 2002:a05:6a00:4405:b0:7aa:d434:69d6 with SMTP id d2e1a72fcca58-7ff6440126fmr1306632b3a.10.1766114549510;
        Thu, 18 Dec 2025 19:22:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:22:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 05/29] spirv-llvm-translator: Upgrade to 21.1.2
Date: Fri, 19 Dec 2025 08:51:44 +0530
Message-ID: <20251219032209.960840-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228173

From: Khem Raj <raj.khem@gmail.com>

[Backport to 21] Implement SPV_INTEL_predicated_io extension (#3370) (#3386)
[Backport to 21] Fix incorrect translation for AtomicCmpExchangeWeak builtin ptr arg type. (#3390) (#3392)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a824c087bd3f3af36374efd45ce6fb8838f813b7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...lvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.1.bb => spirv-llvm-translator_21.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
index 503e7df644..763afbd608 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "29758b55816c14abb3e4142d42aca7a95bf46710"
+SRCREV = "a37544fc0bb90b4e8b8d755580119c018891dfa4"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "

