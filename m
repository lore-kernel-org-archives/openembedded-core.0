Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0282AC4321E
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8.1668103983094790156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zo3fc/Fu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id w14so3436888wru.8
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHRmEEMZvIlhymB01MP98vtDyv8hVuafjgc7Qve14xU=;
        b=Zo3fc/Fulon0UN5ox6JGoL+nkWyBYyMSYvPG/Xy5jZ3ZSfD/xZBMyg3aeg6kxMXEwg
         RVQiHiNTmRoae3snMEQ5CAmXUIwK9BQT5nudK5LPawouvhTpT5gTO5nTc4Uy6BVq2qGH
         3iC/kW325Fhvcf/L1nlZFphOw8Dw5yui8rMN46gH8N564qCvhd9wyuFt4xenwpXc2HBx
         N4fXqFmavXVzTTZjhWlH9d1U0TH6CRfUwb1UBmeMWnHKj472OxgjM2hSLhOZZ5zDwAhu
         3dgq635x/zNKhcbVhGnYO6qHLP61LKIpUJptcUja9sd/7DitWVeGAM+sNbeyebhuuWl/
         SNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHRmEEMZvIlhymB01MP98vtDyv8hVuafjgc7Qve14xU=;
        b=zsxu7vaxLnvtfLjpSWeO62SvNfdDYjij4otbgDP/vVcbaPSUupNAVWHTiccvFRceVB
         wwr5QmOwUaZRrMDTYkoI2k8V5GyoNNkw22RO/g/fYj51vC+qrbZgsdXJISMaJFnD4KYH
         KI1BxGakHAm0cvxnPRLJwXY5JpVMi4V9J7c+eoYvR4KJd2bhXsnWg7us7hrX0Wg1gWl+
         7frNUGUEOPC28zKGJk5ICjW74FdN2WjkeeSaJcVFZqj4JXCVt/PFhhk/x1ElVSW4fx/g
         gVg0CLKQL+oSn6UsHSBwFO7qLz8QwVuC3zCG2KV3Ip6YEwWJNjWmU0FcVt2b5N74mujQ
         dSxQ==
X-Gm-Message-State: ANoB5pl7L/5Uhsko0DR/DjQ/vB3U45KLOesZ8oT7Aih+OhhXRgQnUDC9
	exsNGk9gut+w2sguaDVLsXnyMv0F0+0=
X-Google-Smtp-Source: AA0mqf4PGdamT04VJ/7W+Ubcg+mLLakDwlrLs+Uk7k6rV3aKC2OEMjfu8+TN3wt6fS2tpjaF5zQzdA==
X-Received: by 2002:a5d:588f:0:b0:23a:e75d:eb67 with SMTP id n15-20020a5d588f000000b0023ae75deb67mr20296678wrf.606.1668103981594;
        Thu, 10 Nov 2022 10:13:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/19] libpciaccess: update 0.16 -> 0.17
Date: Thu, 10 Nov 2022 19:12:32 +0100
Message-Id: <20221110181249.1240200-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173085

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libpciaccess_0.16.bb => libpciaccess_0.17.bb}         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.16.bb => libpciaccess_0.17.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
index d55315efc2..06c30384ab 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
@@ -5,11 +5,8 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
-SRC_URI += "\
-"
-
-SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
-SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
 
 LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-- 
2.30.2


