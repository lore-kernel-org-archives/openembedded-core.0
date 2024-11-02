Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D73E6F09B
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:05 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8383.1730506977952843781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OXE69/PP;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a007743e7so2725870e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506976; x=1731111776; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+sPeAiY4U5EW4g7nO9RQwmJfKDcL0wYjFfmXA1cmH8=;
        b=OXE69/PPLTSNtx7YlM+yusk0C+38FGtWEo+K0R8mDzxwETCVAARdW36EK9dytQK27r
         yWfsITrXjiQII0Fbs5i8O+DAxMeRGmodT6a+54h66bE8JXXd5xpadoDXQHcsS16t+yg1
         PVverhQkgTFPUzqrYSHsuPozU+rNpJ7O9EhYjDKeVlVOxH6o6llF8QNa48uqpmNmvN84
         PSAUMlqfGYxULXi+Yfo0HDwLTGRrckK5eT2+HJMiI1KlaGovDX++HzrVSV/i2UesVQLb
         nE9nVclZ7p75rBdmtCnDle2p3JOfSGZN4qgWCYEinmL7vaTitMHdD9WzgnfxqTFojjhq
         5BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506976; x=1731111776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+sPeAiY4U5EW4g7nO9RQwmJfKDcL0wYjFfmXA1cmH8=;
        b=Wjg8CwS2DzpB7dBpIY44WvoDklMIkcRh5iJ5d9MDECbY8T6Jq/o4mFnw9VjKpfiord
         A+hFCWuBBQD1jugYStgFS5RlW4W+/w2+5a8kul30eyHFaxRNWyDkPJArAXL8sAgsmi1Z
         8BydPt/9BQpiIxnM1i3sK5SJOL/YIxCcos9y+PJQoMSBCC0UCPwMYh9/wCNFDzRrxuAZ
         PxLRM/ng8vvbFtLgjAnXXP0KLwSYatRKxBO0KxRP4wNIlxMBVk0D5AK7n6AjueF+jGJ/
         iZstQq2QLkQFN7OYyYQrqnlfhqSIrK5Swdp2KNFgaFewJdbcaQ2/qm8oAfOw2NVE+meT
         1XKQ==
X-Gm-Message-State: AOJu0YxUiISqucyBpewm4ZvBRWNBO6xtgHZg9/yQ+hbzm7bMFPG0ibG4
	ckLJPEWMcflQ5FqW9WIHvDSQIcg0pYnGWZWBL2WOG4qOkpZO4mvswuEQrWRk0Ik=
X-Google-Smtp-Source: AGHT+IHXB8pRj/8wkACVdQDtUnI57AenREnlvIkj5eXjdbWG/DAUuBPqWHDYvxNxEG6UR8LTqlL/UQ==
X-Received: by 2002:a05:6512:3094:b0:539:e873:6d7 with SMTP id 2adb3069b0e04-53c79e15ecbmr4486082e87.1.1730506975958;
        Fri, 01 Nov 2024 17:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:48 +0200
Subject: [PATCH 2/6] linux-firmware: split qcm6490 ZAP shader to separate
 package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-2-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HZTsxK6tR6w6sPuberBa4DfIKQS5TJbgXE1v4Ld6prw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJXDZ9DVFhAI+F/arjKuoB+9GIIoOwBNbcscAn
 0a2q2GIBOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyVw2QAKCRCLPIo+Aiko
 1QdcB/9Gc3rmLVl8PmUBWh4SdR4sv9y8EIoymocV0qYNzxQVlw0tnb3DwJQq2++mYlJ71bBGB/k
 vtSxI+GiaMcCEDQq+ZEFeEyMyPxqrVszAAfbXCWtFu0dumDJBl7JtsBrA1u7FyYWxIwHPEyyyZl
 qr2caQWW5qEdsR7DKszg/Ru/OF+yZfnk6vsoaXiapFinky8r7d7c7A5NOs/u1g7f9HHx5+BF10E
 svJmz7phLSbQBNQXqcV4BVm3GGswlNYXfA56RxBoPyzRsjyf+DY4WyNJ2c8BGrOZ8WwL8fUZkFa
 66meFb7rK/4meBc44ftlGAprePDJ64C4tjyi7o/UWaZpMcTh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206644

Adreno zap.mbn files are platform-specific. As such they shouldn't be a
part of the generic ${PN}-qcom-adreno-aNNN packages. Move it to the
${PN}-qcom-qcm6490-adreno package.

Fixes: 6026fdda9021 ("linux-firmware: add new fw file to ${PN}-qcom-adreno-a660")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index d75a587db93186b89699e0054a3e2959496a52ca..957452947d5ebfab92c9fd64865c1ea1ed74c24d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -408,6 +408,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
+             ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
@@ -1443,6 +1444,7 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
@@ -1485,7 +1487,7 @@ FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
-FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
+FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
@@ -1498,6 +1500,7 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
@@ -1549,6 +1552,7 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"

-- 
2.39.5


