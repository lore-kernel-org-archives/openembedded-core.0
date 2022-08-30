Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47535C0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 19:25:16 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.16140.1661887507849848549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DAJgDnCj;
 spf=pass (domain: linaro.org, ip: 209.85.167.41,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id z29so8323457lfb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OGR3fYTZ4E9C/kKGae4vYD6X67s3WH7lXjH5hkDnHj4=;
        b=DAJgDnCjVFaLcZqXI95pEcKjBvfYLIDNFv7zNPY/fYCpFSmtlvF/tDgZ7EiAOSqPXg
         I/rjdb/6+9OYA3r57xxp8vLYC4X/veGSxEWXdlzvlYlmuW9T8NaocwFsc1TtyOdIYTHe
         xlfbFgsO6rZUpILkFHAPOfPCs9mV7ldaSYoxAamwSHtIth6trBW4zWw8LLgepjODmVZg
         pHa1fdprwY0wOrXOuV/0vhkls6M2k1rnCDr+PoZE/xHBSLtM7zwhRHjOorGP73WVW/qs
         uA4uzqikqg7uK2Zve1a6baWO0rsnmyMgF8Vh7BO+gfe+hfeqT05LtWnxbFQ2w26lfPUT
         WQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OGR3fYTZ4E9C/kKGae4vYD6X67s3WH7lXjH5hkDnHj4=;
        b=IXDARd3kevNoKcBC+/CY28QhviO7ZUWCitJppVzFymE1N1i/vOtLqASa1DLSAc65hZ
         lFduLURSOafswd8+OxZbrVE0lSf+ytoW+BwhRWGofKQSkHUW13F8aK7vEZ8QyhI8Qey5
         lDg65PRJHZsudguzE/li19dbAxwdhcx71oQItvNBPFUcgLXsiBDWq8X1kx5KZ03UBN9n
         Q4+5WfyQOMJwRV4uF8ORZdosHKWpu6TzQHZ5F3ZF0NIQd+OIhDrM2N5XDn2nkOguemj3
         48BiIEnc8laqasQlu0KlqBVq3Z5E1EuTmeAP4iRFmbB2qFB7vOtTQG3mgl4nsPdsGyy4
         HiTg==
X-Gm-Message-State: ACgBeo0EksylX8d+oZtxmhH874q9D5ISPn1ojhEqLTxi0kUM/nBzx78c
	0Jmph907O+4HE0SHheqIdR3X9LZTGuutgA==
X-Google-Smtp-Source: 
 AA6agR7p7rmw6PuPLuFwedPCtn7VWUtsCKRzWXArSEqE8qDrXH/jY5nYOtDHG0U1XqMqabN2szXx+w==
X-Received: by 2002:a05:6512:3996:b0:48c:fa00:e33f with SMTP id
 j22-20020a056512399600b0048cfa00e33fmr7766008lfu.343.1661887506180;
        Tue, 30 Aug 2022 12:25:06 -0700 (PDT)
Received: from localhost.localdomain (78-107-207-230.broadband.corbina.ru.
 [78.107.207.230])
        by smtp.googlemail.com with ESMTPSA id
 o17-20020ac24e91000000b00492ef074fc1sm1702118lfr.183.2022.08.30.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 12:25:05 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 1/2] mesa: add pipe-loader's libraries to libopencl-mesa
 package
Date: Tue, 30 Aug 2022 22:25:01 +0300
Message-Id: <20220830192502.296267-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 19:25:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170085

clover needs those.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c4efc13438..eb7296e834 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -296,7 +296,7 @@ FILES:libgbm = "${libdir}/libgbm.so.*"
 FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES:libgl-mesa = "${libdir}/libGL.so.*"
-FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${sysconfdir}/OpenCL/vendors/mesa.icd"
+FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
 FILES:libglapi = "${libdir}/libglapi.so.*"
 FILES:libosmesa = "${libdir}/libOSMesa.so.*"
 FILES:libxatracker = "${libdir}/libxatracker.so.*"
-- 
2.25.1


