Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB21AC5B552
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 21:02:49 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.3560.1748552563807449306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 14:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fpVSF8jj;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26f01c638fso1289080a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748552563; x=1749157363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr4lI9L3z1pGhNBrLXJKJfjd86xC5ECZMp8Iacqs18k=;
        b=fpVSF8jjcqXuVTvzGXWMm4aLTHSY6Wegq2ToiNHX/cvhIafevFzMUa3ET42aEAm41N
         PDcCWuBH/Ag0etFNXV7uSm0h6nqPuPxbqCaV/p9LrzcYJtawdW89NbwpURFR3GN4PdYo
         /EQOFQhqVLL/y0DP5Z/V4RBoHzGuPFe+wvRJsYtdWZKiLaPazBHBxu1zVacul+7gMtol
         kho0kyPifL06AdH9DAv/v09ne6cm0Yx4ogE4CjEIzqSCdiv8XGnWZp27GO165wwXyREx
         qIRi3vd2ldI3XiblVWJAj7FVakatKYi7DTL4XijOGceNT4Gu9ZaNzUhBU0o30MbjLFaF
         AMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748552563; x=1749157363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr4lI9L3z1pGhNBrLXJKJfjd86xC5ECZMp8Iacqs18k=;
        b=oaVGtBiaDm2+pcRgPndZjpx6F4DL5tXpBMmySbGC+EDpjPOjNtusjeqanmYvsuDaUC
         AtmPjfuPyASM16c1Vnfg0cDI+L5paKK3+GydOp99y5e7Hn1Ke1MC4uHeCwSSetAmH1jV
         o2wL1vMtmlo2aFAWyd4zZi4RO+qT5cZolFbCO+5rp3yPmVfm5WfETgBPokCCP1xzXE/L
         2woaaKGcfzyAVKnTp0sM7ePtniZN90yNC7S2ek/zmGe6ixueyi8cawQQ7xXbr7veGHe8
         L0oue7qXpQGleYoY/ucqpz+bgOsse42ZQPoEHpAQSzjC/+UXr3M7CaZkV/yz2WTvIuC6
         GmgA==
X-Gm-Message-State: AOJu0YxXf1stepAODcb8mpK8Rhj048meRLX6n61wsQQV+2I0gjJupRdM
	4P4cfI5RvQ/7JP0dAALxHqok/dC5BrYxJ9OYnRVOPhgxAvlXfIPz3TAarl6CQWSP
X-Gm-Gg: ASbGnctEa6dvXOtfumogi9hgMNYGmUYsxxjnToNzG9wf2P9WL71dvs+xomIogzpG1my
	VGOouJDBsobYEa2Vax/7X+RD6laxtg4P/nHEQN1QhyeIzSGtEeW/nDztKdDMVWEzHRX6nNGRPfj
	6ZiHyxMHgMsCKZkMcwCtl9i6Gsff18MKjs54bD2tS8K/vsxSLohe1tXFu7qqWtvjN5fpWHZGwll
	Nz4F+SYsUDZNuW1waKRkjB3PB/rjhJCKCbXwCOYljUKqENoU3Npa8dp5ySWs7aGcZJu/y2jju7g
	YhTxIHlYyXMPbDBIhy1e2/uT7n8KXMU2U9IqG1TJVBY=
X-Google-Smtp-Source: AGHT+IHVP9tXy2Gys5Y557p9npvSwNsoan4QN9585UhbBQO9Iq3Chpv3CA7Z6quLGf9AaSRXb9pEPw==
X-Received: by 2002:a17:90b:1c0e:b0:311:e9ac:f5ce with SMTP id 98e67ed59e1d1-3124163a541mr1184475a91.21.1748552562852;
        Thu, 29 May 2025 14:02:42 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc89desm16486405ad.36.2025.05.29.14.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:02:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/3] pixmap: Add openmp to dependencies with clang compiler
Date: Thu, 29 May 2025 14:02:38 -0700
Message-ID: <20250529210239.2070257-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529210239.2070257-1-raj.khem@gmail.com>
References: <20250529210239.2070257-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217453

pixman's meson detects openmp support and if it finds it in runtime then
enables it, this happens for gcc via gcc-runtime, however for clang, it
does not. In some cases e.g. mips it enables it during configure only to
find that clang can not find the libomp during linking. Therefore, add
the dependency on openmp when using clang compiler. This ensures consistent
behaviour across architectures.

Disable internal assembler on mips since it can not handle the inline assembly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index c1c71fd4202..124ee8054e2 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -6,6 +6,7 @@ including trapezoids, triangles, and rectangles."
 HOMEPAGE = "http://www.pixman.org"
 SECTION = "x11/libs"
 DEPENDS = "zlib"
+DEPENDS:append:toolchain-clang = " openmp"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
@@ -38,6 +39,8 @@ EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","","
 
 EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
 
+CFLAGS:append:toolchain-clang:mipsarch = " -fno-integrated-as"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-37769] = "not-applicable-config: stress-test is an uninstalled test"

