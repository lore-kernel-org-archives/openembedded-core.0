Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D1BC35296
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.1087.1649350849874665066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nvwCPHsB;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l7so6758237ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TSPu7pxAT1V17tLtiPVnyWH5mMWddJw9N+sNbAY0kM=;
        b=nvwCPHsBbUB9LtGDnNB6ehEgJfoFEC/z4PO7qaLoqKCJp860MzlWqESZNief4+YS9B
         LWIfCuBiN/oX9XuFl5+OlJI9qdc8M/2T0kMfhgtUxafwl/HiKClCoQ4CI0D4KatMwsdk
         jNO/OYc921tzx2wG8RTGAJ21UEEeWpe3z+l15QsWAuLpnlzxwtMFnEQzM1ujckmE+RyC
         lC/ZAgWIkmFMbv1h28JKxekN2BsDQV86YlstFoZnYz24k5EXKqg+7qms3OeKGb9xZgjd
         5lsyOZTIKcBx3UPmyADIwncQWbQH3hNChCRBLKEa2GWWmIiLjEQLetXYKyQMKIFZO3qo
         zPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TSPu7pxAT1V17tLtiPVnyWH5mMWddJw9N+sNbAY0kM=;
        b=jX2GemqtiQzvPPi/ZPhW9Bahly2IoMfbEIFioi6cXBrmB1hdi14dndRI4duE7euUxY
         cW0fTEyTUZ97U4/fKZDFw9LjYfgZgykvNjHLc2OYKr44E+0BSt5ZzOL8Dv8cjzdgbmCL
         KVp/tqaEt+8xAQyhjRtKwoCRChjjR0/w4eHD+Gkbko8h26OBUOQOEUm5trDQYv4mZmgu
         xM/ALzbr2RXtBgNQwqQ1lbBB3x6SZiZf6ggc301HMCz4WMvlzJIDhmgeMdww3Pu4Yl0o
         J6zI14aMAGjOKgAeTU7DTlDsTIYHDLKDL/FxUZk7jcbN8rECks0/HGRcMJlNgSzIrFpG
         6t8Q==
X-Gm-Message-State: AOAM531U0CCHgnO5IAghoX9LtPsQrWKYWPNHBhQMhUNv38wnMIXaxqhr
	+byIllqBsoNcCvtDy2igRXz+KQYwVSk=
X-Google-Smtp-Source: 
 ABdhPJwR/t6ejsmWBE4GlfuIbzgblf37eQ+8yivS4XRJlJjNmT5hIDTPzneZvyXeFp6Vkuu3n2P6UA==
X-Received: by 2002:a17:907:7f18:b0:6e4:c15e:772d with SMTP id
 qf24-20020a1709077f1800b006e4c15e772dmr14082748ejc.511.1649350848431;
        Thu, 07 Apr 2022 10:00:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/17] libxvmc: update 1.0.12 -> 1.0.13
Date: Thu,  7 Apr 2022 19:00:20 +0200
Message-Id: <20220407170029.3500874-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164124

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxvmc_1.0.12.bb => libxvmc_1.0.13.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.12.bb => libxvmc_1.0.13.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
index 29ed0c43d1..d6d009831a 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "XvMC extends the X Video extension (Xv) and enables \
 hardware rendered motion compensation support."
 
 require xorg-lib-common.inc
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0a207f08d4961489c55046c9a5e500da \
@@ -15,5 +16,4 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "3569ff7f3e26864d986d6a21147eaa58"
-SRC_URI[sha256sum] = "6b3da7977b3f7eaf4f0ac6470ab1e562298d82c4e79077765787963ab7966dcd"
+SRC_URI[sha256sum] = "0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c"
-- 
2.30.2


