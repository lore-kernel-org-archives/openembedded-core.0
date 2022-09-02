Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0432EECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 16:30:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.777.1662136247413952555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HEq+1nJL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id s23so1534475wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MkeGmxQzo4MwUlQfXJg4k2iG8wGlrwMYmA7VwLGLLks=;
        b=HEq+1nJL2U0LUbRXPHwwjlepQsCuBKKQissvGv6sLmlesl7ZCZi7+ElTldUp83+D+1
         Y3h5q38uXKjVihSF0WSk02YNP14TQnvZzOy9miWP/8Gbb7Jzq0PCm0C3inMWBWULd7ix
         UwD/BcS7H6MJnmqw3+3BkW3nBqWh8mW4Sm9c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MkeGmxQzo4MwUlQfXJg4k2iG8wGlrwMYmA7VwLGLLks=;
        b=K+yO2dt1QtQsJK9JsFecxSqiemftYN/SLv4Q2Wypw6O6oeUebTgy9Q7Af/jcy2Rj4g
         +F4/AsV+RTFL6/aw5Fc2pqu6Kgq4Jp8aim6PeNpAri6nkz4IeUhq8XSh3UXRQllwl5KS
         Opyx7Kdoil/Lv44alFUWBtfpSgLpmceSx9FaukQmET4Siht6x0PvGSnXVDO6GPsk9y60
         PNDFchvNnUFQoR5TnzmDjb6E2JX8zzilaA5bHJ62JP/oVVaXgI5Sbb97lVsfA1zv6B49
         dZDP4AuzSzuSwMTMBxAphRBUCEL+jspw0zKQMURXBsp4gHhRzkV2Mc6XopfdKYr26fMt
         xUyw==
X-Gm-Message-State: ACgBeo3q+Q7JhzUxRHMjr1M14/W/cweUTKbHLVeBdRrICU8tsrZsvy5o
	5YTfZ7X6SfD2JyeGW4RCJy99Ir2l4s4wUA==
X-Google-Smtp-Source: 
 AA6agR64Pl71TL6mKKwPi7IvH3fh0uOriZd5EcoSQQbnpt9c1JW7NhCTZ9ilOl0HDwfQSYCvKyB7Ew==
X-Received: by 2002:a05:600c:3b0c:b0:3a6:aa0:5966 with SMTP id
 m12-20020a05600c3b0c00b003a60aa05966mr3370491wms.183.1662136245412;
        Fri, 02 Sep 2022 09:30:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d62c8000000b00226a5187528sm1933679wrv.48.2022.09.02.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 09:30:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] kernel: Use consistent make flags for menuconfig
Date: Fri,  2 Sep 2022 17:30:43 +0100
Message-Id: <20220902163043.323903-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 16:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170258

We're currently only passing in a subset of the kernel make flags to
menuconfig. Fix this to be consistent with all the other kernel
operations since these are becomming increasingly reliant on host
compilers and flags and target toolchains as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e752874177e..fca673dd48d 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -650,7 +650,8 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
-KCONFIG_CONFIG_COMMAND:append = " PAHOLE=false LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+# Need LD, HOSTLDFLAGS and more for config operations
+KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
 
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
-- 
2.34.1


