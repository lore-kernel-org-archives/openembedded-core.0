Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5397ECCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:45 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51640.1658306692472670656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uj5MFXap;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id os14so31836743ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KauX6fAD8CZJ5Yo7FUeKPRte9iLLm4c7XFyWNx9GuBE=;
        b=Uj5MFXapg56Pa+Nu9CRMMY0iS1P/KmmQWBa4M5o9ce3a/I3rfc74XWv8oYPlzcsC8a
         VBusZAN/qWJxDx4hh3sodsjBWIDpvKByIcaGmgJTmjdxFsI7v+H0tWx9t3xSAJIu5sWL
         +U5DptsZAbWDGyZSQdJ+Lxw8ZleOCcfeLcnL9qFqev8mpi3K6k2U6nQyBif2Mq+6AtA9
         LFUoFsmI7H4kmYG+LzmGXa2v6NI3EeN+Zq7gOPtNa56vhSBJjhSl0UUgHo9pLz6mRyQ1
         H9+inR3BEP7sFFyQcSrDtpEDPXxuvLyJreh2GZ8SkpYUjKhBaFG75KRckLixbxqwBI4M
         adcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KauX6fAD8CZJ5Yo7FUeKPRte9iLLm4c7XFyWNx9GuBE=;
        b=fygQ/3ZbPui6cNRqDL9jBJG/4/LyYaadszX0ygqCgftWdOpT58DKKFiE3ctLAg8rrz
         EIp8naQM06/iFHpfhtv3ysq0KPCh85BIWX3jk6SD9TduL6I8Zh5/hk22Thdw/OvepF00
         wDDKKOD5BvdoydG1OGDukEZtAzwQHVMA7UoF0l/HBlky5oXSUuFjgZ0oEOP1UXIMX8CS
         DMMW1ZXm9HYBlmdR2vu9oYlnTIJaTXcVMU1c5BAgmkYrXfaQxEnlUNcu/tWo9BcpXsR6
         E/YHJly0RtYZTfd9N8kHVgxqTkfgAufL2/T3d4+Yi5rOiAqPDFosC5YVtOS9hNCSvTqY
         0DNA==
X-Gm-Message-State: AJIora9RZd1fOn4WmoI+BvkPLh2g9oA/hGoQJbbFxBkhV29zJ7gMDhw8
	1AM2LOL9ow3iErJf6zu1IFRYZLbcJPM=
X-Google-Smtp-Source: 
 AGRyM1tGpRlSm0Bh3YgWo2uxAtmROPl9hRH/4d65WiPIFx/JSr6ZSBtayB5nQ/dOT+y5YrAEto1JXw==
X-Received: by 2002:a17:907:16ab:b0:72c:7533:7262 with SMTP id
 hc43-20020a17090716ab00b0072c75337262mr32734017ejc.288.1658306739571;
        Wed, 20 Jul 2022 01:45:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 50/51] xwayland: upgrade 22.1.2 -> 22.1.3
Date: Wed, 20 Jul 2022 10:44:41 +0200
Message-Id: <20220720084442.2940187-50-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168344

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
index 8c52613109..da1b27525d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
+SRC_URI[sha256sum] = "a712eb7bce32cd934df36814b5dd046aa670899c16fe98f2afb003578f86a1c5"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.30.2


