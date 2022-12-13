Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D622BC2D0CC
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.70629.1670929884400632099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AE9NENtm;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h10so15217855wrx.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSdkzjKYtwGXmC942Wql6BMOQjzWwEEJcewZ9kmWlfU=;
        b=AE9NENtm72sfDYz/C5wzf84VupwKsPCeU+OuTSG8mp+xijWiM+iWlgUTstkzbRLUqs
         PkAvYw5RNvKXf6kPeEnOWVsSMPn2ykRKYnWxTwy9wxTpTQJIG61kDMSwj/D0PLopgIiz
         1Aml4EtHp7NGwRXQo6QkgM+5ZP6EP7ORd8rTPBgVe58BfRasKJhw7dgl9M5654G/SRk0
         N4+VPc3VZFSPTtglIfl6FaIVK6VLUsoSG3uWb2g0cEtj7GfsbdusmvZ0IkvdCi1WIEoZ
         67BQDpoTrYeEwA6GWr044p8u65cq6XTAqBOCZmpRLgHbla7dD4Xj7cYD7BFyWulM8lEo
         6hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSdkzjKYtwGXmC942Wql6BMOQjzWwEEJcewZ9kmWlfU=;
        b=DmfkTXRTGBui7PDOew2uJpbXsV2z2+qLLaS+iJ913ItkTZh8LtYqR3GZ+lL+J1XXuR
         Z5vi3XMwlH73P4UiyF9ufUJj8yehRUEMHj2j8lqwwx3G9vkGV//3zD31stAnoKo+SyKW
         uR2OmQJWc0UZQfVWHe2z2mdGYw/4ddML+ImyebtBJLz/1GiZl5lviRFtctMJ8NXLtTzx
         1Hoih95R0S/DFUxPPqcJD7lSD8Olqymmbv7h8HALVFqeN1Ye7ez+3e0dTXfs/WRPsw9V
         /LJoHGtpZVVNKj3F0+kHBodLo+w5JqnbozZHd9nBkr+YJ07y7Ml9e/BNeSpoATm/nERw
         ORDA==
X-Gm-Message-State: ANoB5pni+M1M/LJ8LS1h2Q7sc2DqHQidHkhXYx1Nf8bLChreTClI9uqX
	6IbQhszjkhEHXIRLqWF4AK5VRdI3O0E=
X-Google-Smtp-Source: AA0mqf5A5VMoNuFYA4OFSrxMO/MpGa1B8byr+eI6cysyFs8Jq1g2lHRgPtzbcnbWa49ZIHRIRjuqKQ==
X-Received: by 2002:a5d:5c06:0:b0:248:2d6e:aa3c with SMTP id cc6-20020a5d5c06000000b002482d6eaa3cmr15052077wrb.58.1670929889674;
        Tue, 13 Dec 2022 03:11:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/24] libxdmcp: update 1.1.3 -> 1.1.4
Date: Tue, 13 Dec 2022 12:11:04 +0100
Message-Id: <20221213111118.149697-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174520

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxdmcp_1.1.3.bb => libxdmcp_1.1.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.3.bb => libxdmcp_1.1.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
index 92ec954df2..a3f9c04e68 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb
@@ -19,11 +19,11 @@ PROVIDES = "xdmcp"
 PE = "1"
 
 XORG_PN = "libXdmcp"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "115c5c12ecce0e749cd91d999a5fd160"
-SRC_URI[sha256sum] = "20523b44aaa513e17c009e873ad7bbc301507a3224c232610ce2e099011c6529"
+SRC_URI[sha256sum] = "2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.30.2


