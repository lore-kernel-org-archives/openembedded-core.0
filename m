Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A10EC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 16:47:16 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7002.1665161229777958614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=liDZYqpW;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id 13so12579069ejn.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=liDZYqpWM6L4HEt83nlsSl7xbZAHo1hdtWe2uClPylVOuVSjOuoPCqfqinG2d6g+tg
         uath50LeeNHLo6CMoLycUhZaBsZFleh4cUHJzUqutZo/QE1pqueAOKsMJOMkzVriveFl
         jzflMlpDOC8wvPztU9jrlBfTU9fy+SdTGAZQzkcPtdstwl84fMKlBtir2prGrdTvI0UP
         +7AyyVXjMhXCOuIjSqLFeqUoafBn1sHEQe+XbdB4qn8yApV89gVO8OspGQM/7qxiJOVg
         gFdj5+Z2LWCtGdxbX24JG3hRkWZHbIAG1KYhkS6KAJ+90Q4ssiG9ybrcIZLVM+qQ0kqn
         OsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sW29xfLFg/4vghfRXGZLMMkDJITI65v6X3rDVwqlnM0=;
        b=TG6rEOZ8xTMQ9qGocsth5640mF7UCsG7Xo8czD36LlsUg1XIoXNiuZSmtn7aYzIa4I
         YtPOuihg5gNdqo3vyQbSc3QRzhwyBfSdAr4OO2GegeR0UnXR9UpcYMI10PNifaiLcBPm
         DbB2+2QTVPkFjI6MAKcNRRntujgb0osoVMMCXV4XnMouVcui9LrxWzimlfd904L5WiF0
         ZBBUMZp4nsY3t7Tbzx5PA8ipuU6fht2QDROc19Tx2zsjthrCQApZx3NyY/cPQ9mXfZbW
         GAYhw/3X8ml65sv7xNJ3Chno7jZKWsRxI1cVUu7VWa5IXUhNwMNgrG5WwVGK4BWuZjbE
         AfzA==
X-Gm-Message-State: ACrzQf38ewu4u0A/V7TaR7FSlFAxHmAfZcNr1MoBuMNYU18miTb12Mym
	baFMv3ofFjeNirjrZcP3oZsTpGGseCM=
X-Google-Smtp-Source: 
 AMsMyM7SdZvPJFyMPaaUDx3L7qzsGbbUdJLduY/WAiE/CiOv5R3Zfe1ChYZOgTtzhyOVsYWJ4T2oDw==
X-Received: by 2002:a17:907:6d84:b0:78d:36d8:b797 with SMTP id
 sb4-20020a1709076d8400b0078d36d8b797mr5014360ejc.704.1665161227683;
        Fri, 07 Oct 2022 09:47:07 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 ch8-20020a0564021bc800b00459ad800bbcsm1802171edb.33.2022.10.07.09.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 09:47:07 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] u-boot: Remove duplicate inherit of cml1
Date: Fri,  7 Oct 2022 17:46:41 +0100
Message-Id: <20221007164640.17471-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 16:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171530

Splitting u-boot-configure.inc out of the base left duplicate
cml1.bbclass in the base include.

Fixes: fc9a17ad386c ("u-boot: Split do_configure logic into separate file")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f022aed732ce..b2f33e382664 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
 DEPENDS += "swig-native"
 
-- 
2.35.1


