Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4D4C3601B
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 07:51:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.5933.1743753109211949429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 00:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KNq4w1Xi;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30effbfaf61so18146381fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743753107; x=1744357907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPiDiFklnFKW0xj1ITYoVn73oSHHoaEDbEsjdsrllvo=;
        b=KNq4w1XilEZln7DtB0ONTRcWn8x3x1XYwpxXt1Y7WJ2kkRfr/oNP6FpSrWRTnS9pkb
         rFmNsZBYO37GhleGzZ/DAA2fftQBY/Ld8gfNbHHo1Auv3SsuK/keFE9XlUIy03k5zzur
         E/agnMBf4YJg7qxa3Hft7P6Qc8ZT2fWnVoHUFdCm3FZlE3j8O39c7/j7HRCbRQN38cGi
         OrvYMN5+VO4LvakRBtWZnG3s40OU+gh7bPHxZ9MktUa5HEvex/V+4B8i4bhXx8TczOE4
         ZOlXWeFGMdjORHX3RvKlnGDT1CHiOoAh4KoDyL+a6WYNcLY10Y63FT2egcuoypPKLvaw
         6gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753107; x=1744357907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPiDiFklnFKW0xj1ITYoVn73oSHHoaEDbEsjdsrllvo=;
        b=bwAynfKfrBgH1AwhR2Bdmj6SeQfOU6z3rtwpHoRxwiYbKSg61M3ybej7J7NPLIDzen
         7GVWyxMGInUxZwuwXw7HpJOtymzv6woKFYiRlTMdVZfFCGPzscugnliwFPafBroXqQ8d
         0jpPAreW8j02i/A4LPnfcCN56UAz3tZ6dGooWK/Ikuez9Nc2viV3+rbL709Kt6uib8Ig
         FuventNcK4B3J0EhnsRDWc6d5qYWji1dgNLCX3h8ZyUmQ9OAA1SroaJpPcI3uOx2ePx3
         PtcJPt8jwgUyHCLIxtjr24FveGsaCfvUSJJR938BPCg42qv4VyjQhXQdfKuJkYx0B/kj
         FgJg==
X-Gm-Message-State: AOJu0Yw0VejZ8GR0u3J+lXYLDOsXirvwYe37p0X3W6JgBXBKP1D9Q1RH
	0OaircSMwriPPLWMK4WbLoeXfY41tlLnGjUj/SqPkHUaolNUkPAkc7a1hWNkfKNcS1iJzzRhxGA
	9t4Y=
X-Gm-Gg: ASbGncuOGJeag2vwp36kbHquDTf+RSd7rALc4VV1ZOt61nNMy200SabOYZWt1ILL15e
	Z334+PYTiNss5RG+dkCIrnFhvywLdYmB/HHnMIz2Lcwv20dw/S2ujvz6Q2+DW1V7JdZo6b5a8Pg
	iWqWZnkipwacAknRnb8s24PvbSuwHap9gbpxpSDNDeSX2PzJvHTDHmcaPvw7FjGAH6EyeAYJQSc
	qfl6O55AkZTO2KJwjbQe53L35IPk30CpKjuZjcl/K77QQ95enh081vpAPEL4zzey8XTfzHkFMcg
	O2O9BpmaAAatXyWQZPO1gDX0sPKOsjjVRLIG/o9P0OY2aCq7uVWTQoj1ID4ksWnMYkR8qtMLZ0D
	HDj9uJ9BNLlLMs5D6PR4sCQ==
X-Google-Smtp-Source: AGHT+IEWeV8kpkWXa24hSNiMaOF9UQLZrK136V2i8qgV5ZjNBNcfZKbiqCTHRLpIvy2vmGSD0+732g==
X-Received: by 2002:a2e:9295:0:b0:30b:f92c:16f3 with SMTP id 38308e7fff4ca-30f00689a7cmr18270121fa.11.1743753107135;
        Fri, 04 Apr 2025 00:51:47 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b343sm4726261fa.49.2025.04.04.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:51:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] u-boot: set git repo branch with SRCBRANCH
Date: Fri,  4 Apr 2025 10:51:36 +0300
Message-ID: <20250404075136.385270-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 07:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214336

Enables changing branch from "master" to "next"
when building bleeding edge upstream versions for
testing purposes. Now local.conf setup to
build latest "next" version becomes:

INHERIT += "poky-bleeding"
POKY_AUTOREV_RECIPES += "u-boot"
SRCBRANCH:pn-u-boot = "next"

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fc860248ed..9e96c46b74 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -13,8 +13,8 @@ PE = "1"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
-
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRCBRANCH ?= "master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.43.0


