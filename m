Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89315C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:18:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.38911.1656685117402914494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V05/JWaW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 g39-20020a05600c4ca700b003a03ac7d540so3807011wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRzewsG/6QNlwoiOSUAoZ0slS3SmfaKi7m3akMxu0oU=;
        b=V05/JWaWepGC5Ur6tXIf3xTE4fRgj5MuIMnJuyt3TYlsFFsA0VdFxgcKMmYemhzaOH
         d/QyF580XEcySEB2YlWpF5bGLxaGAVktx1B3nFbNpIlv6KAl86jghf0UsNvEZbWlPvUF
         JnD+ZxtEs4cJeQroRbaCnqTPr0TBke4qdGxnY1qErSJRtLzqrY73LO4zNKop4A2nMDFa
         gjAUBBKz0fLcCoAhPagxLVyIwSyIit9pMnNOCD3Hm5/cc9OszZegwzzivjs54lV4CwEM
         AYz7Y7W1MjnKLWf3veyv0I0Py5FGXrd4sVvDCBJVGFi++43g7QKHfTmm6nkC4bUQI+IH
         k0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRzewsG/6QNlwoiOSUAoZ0slS3SmfaKi7m3akMxu0oU=;
        b=4PVQ/WkR3PrNgQXoXWvHYC9Q8U0+8Ivhh3GJCI/nz102D9jh9ZLWW3VeNuz2K53ixM
         vOX+A0Lqs1lD2hKYHIT1SokDPCNPCJvTdXbzUUBvFSxRphPw6g12gQv1Hn0tD5rck+9Z
         pXe/G77eqIKRP5y7EbPvJcdI1jqhaecohF9aLJ78Mq0LyU+urvK6rJgNSgI5eM+2wWrl
         b5u1/NW9BFh+gUhSCrTxGiCspPo30BaEYxljHrppzTE7KOMbWMk/e/X4QYq27XXxqbbs
         DkIbJm8SANgTmxDc/ioRttdhr6MvGu5Aj46FVTiJ6+Bip4faruLAJg0EJVQQJW53c04J
         yXXA==
X-Gm-Message-State: AJIora9dAsQx2CY0Xdyo17I0eCZ+q44cZlGil+XmCzbRBXikNrECqIW2
	iO+OUBMpNy9zFBEbAbyS7r1uwk+J/dM=
X-Google-Smtp-Source: 
 AGRyM1vGEyAQtFhl0WenRyHi21s+DzqtAJthpxKHSYuslKsUiRp3CZvoo1hcjFboPH5JVimUCjmnGQ==
X-Received: by 2002:a7b:c8c4:0:b0:3a0:374c:a3b4 with SMTP id
 f4-20020a7bc8c4000000b003a0374ca3b4mr18590461wml.112.1656685115393;
        Fri, 01 Jul 2022 07:18:35 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i206-20020a1c3bd7000000b003a03ae64f57sm11085340wma.8.2022.07.01.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:18:34 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2] curl: Update to 7.84.0
Date: Fri,  1 Jul 2022 15:18:31 +0100
Message-Id: <20220701141831.101998-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:18:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167474

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.84.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.83.1.bb
rename to meta/recipes-support/curl/curl_7.84.0.bb
index 1d9de29a65..ade2846a64 100644
--- a/meta/recipes-support/curl/curl_7.83.1.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
+SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.37.0


