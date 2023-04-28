Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4607CC7EE22
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.14764.1682671713596072645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Iq3cS8dv;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so47206625e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671712; x=1685263712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwtd56FmyDMg0/VoBrXJRtJbmxAJNoHagbPHATeicyY=;
        b=Iq3cS8dvRmYvUWEBzrgGqn4dxx0QXtQCdbBe8oecMZ5aE1lvbDsPkbmEegV8+k1bUa
         e9bK09xKPbKtisA1tqpxZsze/8XOrndeBxWh4nkoVis8vEt20wqPJ8eesbX3Bvf497eC
         1z8lzS/fKQ+CUyhGWu6tUyuafq1Lta+wsxlXMCaMO3OiiSZ77jWrYKBrzZ3XAzK0Cpl8
         3c6vBGjVJyBbA5fK1XHho5QgPBRAbkQ53qa961WHO2Gi3T71KzhKUo8EdOYfKkE4fE02
         KiQHCJDnf+gzdWpkg4lKymfDSt8tFc9AZHUi4bwlyy22SqC9RMVLwMkgAJ/pimcohthe
         I2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671712; x=1685263712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lwtd56FmyDMg0/VoBrXJRtJbmxAJNoHagbPHATeicyY=;
        b=d2fVRLFoHZGpHjGirYMCVj8iOJFLEg5a4MjOa2qEbnANfO580eT6VkMIRTLFiVILU3
         +kLSfQMuEGAkMdKkOv8ejWDJc7LHV1X38COUKPV25AD9TdM3QViSXPzRNSrUlLM4/Rwz
         0UI7ko79vO33+30O9U7WrIlsuxE9kVWWaslJ/cF9VlihPzL1Ul5AOEz756lcLb5ZbuTS
         bRjVA4yRvDLGUqghJ1igXnxTOoagmLGlcTC9Ov3eM8GjE7Us4+xM1tD6fAiaBrA5WojS
         6V01gwgbEMS8ijUS+BuS9niYKRR4xv3EhQWDYGxzdBLA7I83LqRaPB1TbHmox72LnJfI
         oPjg==
X-Gm-Message-State: AC+VfDy7L53xqIys9RZe524l+uee7wsOS0qGthiZdOLJSTWGnIMRgMgK
	UoseUi6IAByBHqcqIA00lQaDmJE6pxE=
X-Google-Smtp-Source: ACHHUZ6V3HqGNZtxTfAShEsMO0Q5LXCBdz4yWOjrYsENH3iK6KJtkR9/KMjTdHSLTwL6gKA3aKZozA==
X-Received: by 2002:adf:e0ce:0:b0:2f5:4b0b:a323 with SMTP id m14-20020adfe0ce000000b002f54b0ba323mr2955233wri.7.1682671711883;
        Fri, 28 Apr 2023 01:48:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 09/11] defaultsetup: Enable largefile and 64bit time_t support systemwide
Date: Fri, 28 Apr 2023 10:43:50 +0200
Message-Id: <20230428084352.836515-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180520

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index f6894f3ab56..1abb5096293 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/maintainers.inc
-
+include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
-- 
2.30.2


