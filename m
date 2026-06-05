Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7288ECD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6124.1780698855852560764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r9Hi8VG4;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b915ded5so19810945e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698854; x=1781303654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyyGxuwdJ4dilDZ2ieho2TzhrR6a0xQSZi6yPGKnXmQ=;
        b=r9Hi8VG4XL7/Hka+WuSWchiRweslARPKbI8B5MoPQQq4/DiVXpj/wJh3lfbrKiJxiy
         8hFRL6WDD/32LnjoN9FJ+jpOpPuys2Dta2EqAP3nYEkjda4aHfGLeAFhxGqW49BMJoNG
         zZuy2IyJZA3z/f+ia4Yod2dfrvSck/LuPS1PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698854; x=1781303654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iyyGxuwdJ4dilDZ2ieho2TzhrR6a0xQSZi6yPGKnXmQ=;
        b=nn4ks+IJX401Uj4WHHZEWtOa5scPoooLBTzHVAZ0dINTBj8Lt9FKQn/EIG9nJC9yV+
         RfgY2FYletrNoHUWOw55kPeYkxztJIu4ZH/eVbXdfHxK/UWsVOO7F7LRx99yCwij8pFN
         ZOWkwMqDA8L5r1nKIdv1+4pangAP3sbb6HLYfCUDbHNm2EyNFxizeq05bb1ZRD7R5Qc9
         hhgNh7fgpeVmN9au4i7Q8pBq6igT7rk4gexVDp4jkAck9Mb9xzW114EvWHE2x567CgTo
         +jYERAw4Qx96eTozfCdOwDXDICeSVWCBMlfJve7beBMeS4KAQ6/bMZmMHuV3ZcaKYpa5
         fQHg==
X-Gm-Message-State: AOJu0YySjk2F20RW+05i6KXPBma4AHwSeTxkAqDk+E2Y0jEyOMcpWcUA
	VfJnyVEq2LO+qzPJ+El6qt1WSP0o0PmO6vgHClL3OYOTDc3+SpH9nNIp+CNj1v6NN9Oc/AiZd8S
	lTb3y
X-Gm-Gg: Acq92OEI2lv42jIPXo/8pTn/pVevWB/8Dnd/cyL+raNb3U+LpjgyNYSBGTYwlZIprSD
	+qbyzq3xiZt51YIkpQJZJFqIbUMgEqVYH4VbHFtvjwSd9fLkBsdx6UXXuT/xPznEVuoT1romaPc
	VVmzF0RPuJm49HOZ+ceyKsxfQ3ujNL3Y4+sUgUwU/vuXO90XrL+gFnAXBS8wttCn1rJX97UOHDf
	54ephboUzmXiv6BD7DMfPwdbr/DbNUSxkzPu9GRn+/LR4Z5gMEj2wlcozNbMOHt3JZV5IRm5JLf
	29MkYS0CDcvWV06r0txFqSDXX+pbDh85HVg2CwMGH6RNwoqTG6cDQ7rnmmZW+93+LMSfARTiFFK
	NK0aOPG/wqtbe8F7ooCB855zQ8dhTba/caqyanBbdzc3QnX1dyJtgHrrSnbmNFHkXOic0VlS/J6
	LnwH+xIT2TCo6AkEwey9dj85jV2LuHFdof3i5fr6PlEgajQIeKw2CatvxVXmSFlujna80aSbZkB
	Dakij9xSR8YumWbnbkiDLeg9zRJrP8lzkEPefg=
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr104447755e9.2.1780698854104;
        Fri, 05 Jun 2026 15:34:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/25] cargo: set CVE_PRODUCT
Date: Sat,  6 Jun 2026 00:33:46 +0200
Message-ID: <98088c90b6e37ab27e7b4b2546abe9ecd863c02e.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238188

From: Peter Marko <peter.marko@siemens.com>

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5cb71e7df95925a5c342c341e699e244b1b84f6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/cargo_1.75.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index a6d3f1754bc..573430ef4e7 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"

