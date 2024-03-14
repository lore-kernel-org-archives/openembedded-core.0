Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C522C5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 10:06:25 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.8999.1710410783236149424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 03:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=Hc5mgBYY;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.178, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d2fad80eacso8015541fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710410781; x=1711015581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bbwv1JbTo04FG8RqesPdPX6hs76oA6D+k1ghI84oWk=;
        b=Hc5mgBYYU8O7XedhU1v6WAZWkCjlCJjFT/jSf+8K3w8R/8BWhTeTX/1x1K21tULPEO
         2p7xz+/3KSIZO8hJUhJPW1Tm4/W4BM7ViKoWBPMqZCgtA/qUpuBD42JQCWl/bKUSDoXp
         JBYpeFao272XXEi/hKgNapRf/NlLwIfcmoWjUszTJ2R6F/wLEjnt7wovCGNCZH0+bj7U
         107DTlA44BqVQkpbn/M1WofJc4pI4o4bl0e4jdq+XSNGR3LFsHbox1SOrGVsJGxl38fk
         rXhmJmWnt4/cNNrM8Kw6Rf6EOQKrbZ/b34TdXzYEglxjby/y+4uKVWMLDpxTN5hJCpvj
         Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410781; x=1711015581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bbwv1JbTo04FG8RqesPdPX6hs76oA6D+k1ghI84oWk=;
        b=XvAUH0xEioIx2fRkMzsr2EbkoUP9M+GbtohG0iCOmoLU8dZY3/SNQ3f+B6Daf1lChh
         yIfVXyVQHcKeDIkG69Fd0oejYwfGF42kiz5cREo1dCgIWvrBi/WuYcXmw5hp+rRchEiD
         h4K8tLSjxki1yFKdKkJLmYETq422NrhRm1copBV3fUlwXFjsJR2SAffvXdNKn9ttjX0G
         dnarolWdQqOP8QdcbsSUdklEMhVq1wZdqqUgKd104SHiyon5MsV/XWIBH+Cxni8kT8YO
         9GGQC9SygtmAxOO/nYJdT3pGt6saARsNErndR75WHkZ3MGonrlgQxPKmfQXbsyx2mZpU
         ykFA==
X-Forwarded-Encrypted: i=1; AJvYcCWkpuYoEf+GaLOxfTCmahrMjnGh19sj0+U0CjlDzufWda1mVWBIhvMMSr3Ho0/F49GTaNs87n/oTzIbLqDwPYTZiMSHFDPSV0GmkKlpCHU6aHRDiEtX09QV
X-Gm-Message-State: AOJu0YwUKzjoDVuVERGh21yIMWPNnFCaVEvg+5TRj5JFSLCxNL4wZdtB
	1xRL9fR4nX4uh7+nypUvbtYkDYfTlSh/AOwqfF198LmsNfRxri6/sFBQLNaBNvs=
X-Google-Smtp-Source: AGHT+IGpLZIUITR2ZTsGPTDj8hneHgB7Nc/ioywFPnvqNtKKVMF5luY8LhGMHvUuyw7VvEII77ca+Q==
X-Received: by 2002:a2e:9c07:0:b0:2d3:8c1f:c0ff with SMTP id s7-20020a2e9c07000000b002d38c1fc0ffmr713999lji.16.1710410781270;
        Thu, 14 Mar 2024 03:06:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3988:874a:a0b:40b8])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b00413e8df267bsm1911015wmo.48.2024.03.14.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 03:06:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 2/2] linux-firmware: add a package for ath12k firmware
Date: Thu, 14 Mar 2024 11:06:10 +0100
Message-Id: <20240314100610.21815-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240314100610.21815-1-brgl@bgdev.pl>
References: <20240314100610.21815-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 10:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197102

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the firmware package for the ATH12K module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../linux-firmware/linux-firmware_20240312.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index 390d10d2f3..4961b43ad5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -320,7 +320,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
+             ${PN}-ar3k-license ${PN}-ar3k \
+             ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -488,6 +489,10 @@ FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
 "
 
+FILES:${PN}-ath12k = " \
+  ${nonarch_base_libdir}/firmware/ath12k \
+"
+
 FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
@@ -495,6 +500,7 @@ FILES:${PN}-qca = " \
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
-- 
2.40.1


