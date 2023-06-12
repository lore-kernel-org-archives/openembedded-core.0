Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2924C7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 03:28:20 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.50831.1686540494865246923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 20:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=WsbvyzZL;
 spf=pass (domain: underview.tech, ip: 209.85.210.42, mailfrom: vince@underview.tech)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6b28fc460bcso2068334a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686540494; x=1689132494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XKjD6kwztPx63C6pwLfnFRAzmet2wU34DJ3cSmD95s=;
        b=WsbvyzZLM2iFB6wOATKwZ8IDG7ijv+LE0XALL0IEPNWCTphi5ZKm2YMZlPTnlafriT
         Jabs1G0KMfDztGHCHKd0xleE63dH+kAbgRlH+rM9O7DU7BvGRxkJNFKTsf+cPWJDUpqH
         /1NBJ2zZvzhO59h7R2r7xUau/FLkhahY8/+gleuVxmcwZoKU3PYYAgkZWVhHzds2YSYq
         BXHxDkNirzZHRrRou1qGmbVRw0Vfk8sxedd6o+avStbCAUKRyDTdGXApOisTLzdQ17DX
         O09NvE0SkKkPe0kwtNu9cGhUFJOYl2vRbgI8CDa9XJS8bCVKB65UoXUeoSI06gcEPi51
         IRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686540494; x=1689132494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XKjD6kwztPx63C6pwLfnFRAzmet2wU34DJ3cSmD95s=;
        b=ShY4KM8OrEXZQJPDuS1zsevHOw6aMuRScmISbexAp+FMN0oqCXj0/LulELOn5PjdST
         HQIW6yFsBgJEkTWI+GZ5/1VyWbqj5JJokFsfFODN53CQYOJwDw766a1UujmNWH6SO0oc
         E768+peJ7xyaY+q1wtKYfPW2b0xlDeuxxhNnxkNLa0W/egaT4FPMtF/HEqx1t7lx6qxF
         rg0949LSMQcMMASHp646PUbStYAIdRgK7rbaklJvMZroYystur5kcIyiJf7cQzAwvhLq
         IeZOJY1LS9P72So2w0mTk8TUhyRAXgG2jvE2T5Us6I7Gfq31il/wkQQWyKvmjaakgcvV
         tl3w==
X-Gm-Message-State: AC+VfDy6jlxhRsYIqqfitTYNWG/RVfQN9PzcyUfh4HOIAIJOPZugfp9K
	oLnbfFwJz0w1wiKxUdoiEU3zfzaIzMpU9p+bTxM=
X-Google-Smtp-Source: ACHHUZ4Kd5R6ABmRPjvGN06TBzMaeUr0LeXYHV6kL48PMvVSzC9WEMlFgbAqDerc8hkO/IVrTfwyxA==
X-Received: by 2002:a05:6830:c5:b0:6b2:4555:c1ae with SMTP id x5-20020a05683000c500b006b24555c1aemr5701757oto.4.1686540493974;
        Sun, 11 Jun 2023 20:28:13 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:f287:be73:6bd4:6065])
        by smtp.gmail.com with ESMTPSA id n12-20020a9d6f0c000000b006b29947160csm3553805otq.30.2023.06.11.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 20:28:12 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] spirv-tools: Use baselibdir instead of base_libdir
Date: Sun, 11 Jun 2023 22:27:55 -0500
Message-Id: <20230612032754.2002108-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 03:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182650

Its only the lib name and not absolute base
libpath thats needed here.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
index 21f9dd9650..b878a2e82d 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb
@@ -32,7 +32,7 @@ do_install:append:class-target() {
     # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
     # tools can find the right library
     sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
-        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${base_libdir}":'
+        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}\${baselibdir}":'
 }
 
 # all the libraries are unversioned, so don't pack it on PN-dev
-- 
2.34.1


