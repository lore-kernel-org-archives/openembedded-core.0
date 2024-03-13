Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B12C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:15:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.19754.1710342911726553538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 08:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=xEbSbAH0;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-413ebcf13a5so3257655e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710342910; x=1710947710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4kqlQBvJSCZVnR7EndcIjSCTiKu3FbaYMLWGVEaARM=;
        b=xEbSbAH0gvgiBF2N58dSpekNFzofzxvK9E4UtfZClZ23K84gON3UTBnMT7zkXU+pjg
         /gQt+EgO7J+0rN0+yIdRjoPGFDCc95VjSjyUbg9hH5T9xcw+tWPG85wQE0ohgXFuWbyT
         tydJQC/08k+mVQDHX/QKdklLaZHutzBBpNyOdAy+1Wl9tAEyGA4Y6jei6twOU18DLs+G
         eVhsKKjx72TWyUoEUTfU4PXOtT7C9uhagFbIB3Ux0kQBsv9ZvzgLW3NwWFU0I+ijYZ6m
         vJYieF6cLur8OOWb5JMuyI3w9TCTXbPc5310eVl6pQHWnl+oIVGxBG627/mdQmC5l/2p
         t37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342910; x=1710947710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4kqlQBvJSCZVnR7EndcIjSCTiKu3FbaYMLWGVEaARM=;
        b=P8Lb1QJuQcMsq7153Jlv+KiCB0wGVbxcPna7qzPbe3ou+M5F04z0e4zuAOpPINndf5
         twi8mk4VTBh7YoIEs1Q+QZyBJiGlFu1eHZ/ez7yg3liZ0Jllcmzbh9rdXGnB0F7oABpu
         lFQVPKW5M87wtFHR/HCVIPuiD//UHGd3tTflvbzxSaerVFTl7+qcl+as3W7qUqX0zZUf
         aJx3ypfps9eJDq2ZE0wxLDayxuY+Qx8zp7kixcFtCc+qXddpB8++PSjWl64TCwQnSGTt
         M5sq4qTiT/1HOTL5hs0HFkBz/Gi7SLn8zugqLWAPLhoB6SoUMFnHOLeeFCAQBAyUrMwS
         hPaA==
X-Gm-Message-State: AOJu0Yzw4Fn0XjczvKyDo+z6HQukAT3RXJ5Rbj0gQWAPwZAun18ld7Lg
	9fjZtpkgp0QhgFJzpMRBXvf7sGbMGQ9dFvHJOHWSmJHpmGjzgUVYsYe+bne8CnVtJ9QcL8YAbei
	6MbU=
X-Google-Smtp-Source: AGHT+IHC978zUT6yW9WC6xBWoEA2EDd+xMVXF9ngaPo1q4UPMrYXzvluR6g6eQDfngkqttBd57zlZw==
X-Received: by 2002:a05:600c:3b90:b0:413:e551:2920 with SMTP id n16-20020a05600c3b9000b00413e5512920mr210015wms.3.1710342909709;
        Wed, 13 Mar 2024 08:15:09 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b004132f3ace5csm2555875wmq.37.2024.03.13.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 08:15:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] cve-update-nvd2-native: Fix typo in comment
Date: Wed, 13 Mar 2024 16:13:26 +0100
Message-Id: <20240313151327.2123368-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 15:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197045

attmepts -> attempts

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index bfe48b27e7..f21c139aa5 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,7 +26,7 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Number of attmepts for each http query to nvd server before giving up
+# Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
-- 
2.39.2


