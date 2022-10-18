Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6187EC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 23:03:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1704.1666134201412032589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 16:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jbm/C3nj;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id i6so15216760pli.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 16:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMhGVghUTv6kX99vNVNcVcPb6SvXBxNJtjOBGObMPQQ=;
        b=Jbm/C3njL3eu+NV76D4tDlzvMHxWz9x7XiHaezes5PP5MC8eBfrJ5AjKB6dE0kREMU
         Hb1UBa2ue5dGh/cNjlu2KrwX4AQ1p/NaxVGBNHV1DzNbJl7+6TUEb2T5qn0Cg/zXmKpQ
         lR1uqaEMhpCxePhI7NAXGADDBD0NuHRkslHykp4TpBpvLnlV5L6Uw1H9KSFO4gXLhCV1
         KOD9sTjKs+CTpUVkKre+Y00yY7wO8l2OMIGpDBca6ByPdFD2NBWEIiDxTN073w4IFFEz
         884261IWRn1RNEbvz8GS5wrKoFSAUV3Ojs2/kRMWm7t5/xc90Lqwy1AkRYX49LgnDtBn
         zD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMhGVghUTv6kX99vNVNcVcPb6SvXBxNJtjOBGObMPQQ=;
        b=YQVP08z37t3B7MBsxrq+O2WbzePb4kr6hL+jwhRGTieu0usEqFL1mtlIVHcoETuL84
         tzPsFljzymL26g0AmelE1b6a8wJ+Q3MwyudvA9H6qJtgrJaLfZA4RixH1mtpVpMySkLL
         vdkzy/NKvSbpA6opZwv4p9BNXxl7o6qgpz/sWP7HK/lb2rSWJdEaGKRanXT+2k1EYu/1
         fV/nIlWp7VTkQbCX/yvj3YcCp5vMdtNzIqtu7A3yZgSed6fbf21Waq+1kUZeOO5lc4x5
         4L9fFwoZ+hBhoGkPUqdsx/kkwRse+XsNci2ClyQvS6d6K5RCE6tA3Cbh/pV+YmEB+j3g
         N+5w==
X-Gm-Message-State: ACrzQf0JC1k+IXFdbgxwUGXl1llZNbZgnB13W70a2Io0Efsh+mlnl9US
	Y+vhrd5felcnORI25Mxzl+eRNrrgPSo=
X-Google-Smtp-Source: AMsMyM5DEqBnV3qLAk1B9Y9K3/6tPj7tsH4M4Mj6CKV+5PBtX3wkHSHqSfCTtfFvYbi64vjBXDNljQ==
X-Received: by 2002:a17:902:dac4:b0:186:2df3:c84 with SMTP id q4-20020a170902dac400b001862df30c84mr5276866plx.116.1666134200526;
        Tue, 18 Oct 2022 16:03:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id c24-20020aa79538000000b005621152c051sm9815422pfp.66.2022.10.18.16.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 16:03:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Kai Kang <kai.kang@windriver.com>
Subject: [PATCH] mesa: Add native patch via a variable
Date: Tue, 18 Oct 2022 16:03:17 -0700
Message-Id: <20221018230317.2256410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 23:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171947

This helps override the SRC_URI in entirety if needed by
and overriding recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c94e439363..910e8929f8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,11 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           ${NATIVE_PATCHES} \
            "
 
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
-SRC_URI:append:class-native = " file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
+NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
 SRC_URI[sha256sum] = "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
 
-- 
2.38.0


