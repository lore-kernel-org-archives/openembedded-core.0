Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE645E6F09A
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 00:23:05 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.8269.1730506980578965779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 17:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tfNX4hzH;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so39395241fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 17:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730506979; x=1731111779; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpLREsUEFNHVL7ByFK+Grzzw0kg0WAvZJQYCA9Sd9hY=;
        b=tfNX4hzHRjk00YJlylYaUB7t/RlrOZmIsJUyl+HTOrL87e0cLpJM1vOlJpWEoAR/JA
         ZUIvgIz/YVkiy/k3+k7y2zmnBxpciSQIZFw9PMb606jCk+tXvUTH0gwCEVIn7w+qRxgy
         isfKkJ8lMJN6lr+eB+GNu545nepWy3YN2CoaGvabdqAwWayjE3imFXVADlqmJTmgZCxd
         vXKMU6pkeSh8c6/mHwTBozbNLflJZMv09Vz+Mbg3kCc0h4yRH9jofGI8LqjBZMQwvASi
         dpmmnXIISrY0oa67GXJZNi27AIbxm54QoHDpMiRjqIEEeYXeInR1SyErpUmbchXygb0Z
         n+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506979; x=1731111779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpLREsUEFNHVL7ByFK+Grzzw0kg0WAvZJQYCA9Sd9hY=;
        b=e7hCXDHLeOV/lmktnIpav99iULZH1TCS9EA7lW8TBmRoIsdzmXuHQKzSZVYsmIu1NP
         PALqW4mN+q/KDuL3p7V/+bKN2RhP8AxlCnkXV+M7XkLevSpZgQxqdxkmqkTvNWfGIhVI
         2HHEU4fzOtvbuPEXZcBJla8NUiayj29Qb2wXMjt8XwCy6iW4epcJjTmGTJgfS9Ei/eI4
         HNxeiC9npQGTk7PEzs+HHphEsZbRowN5iSqmGYaK4U2tRZSritFHD8kb2PoKKQ9G+6cd
         Hz7YL8rbHYRmplpaK8cqz4ecGZlHwbZ09+Y9Hsm3jfm1X5rvIu5pteE4m6qutkwZw1UP
         azkA==
X-Gm-Message-State: AOJu0Yxft6oLAUBUQ8nKNHqFjUDfyJgRmrsX1wvyf3F3z6bJEFYKSf/t
	ZJ6Up9WaW/4ZNaFi+iNSkLhaCtiPkdti0zJu71AGXu42qnvnNG4yPvN0+gXW8ZM=
X-Google-Smtp-Source: AGHT+IEhZoWTVKIFXbyt3Z82wTohfZ/jk3Iqe4pbl8L+HUGSUIyq7vg7Uw3XGwNxTR6vagAl8Xsb3g==
X-Received: by 2002:a05:6512:1295:b0:538:9e36:7b6a with SMTP id 2adb3069b0e04-53d65df25a3mr4981958e87.32.1730506978545;
        Fri, 01 Nov 2024 17:22:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc3b9sm720385e87.223.2024.11.01.17.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:22:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 02 Nov 2024 02:22:49 +0200
Subject: [PATCH 3/6] linux-firmware: split sa8775p ZAP shader to separate
 package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241102-fix-qcm6490-firmware-v1-3-3465b5c9136d@linaro.org>
References: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
In-Reply-To: <20241102-fix-qcm6490-firmware-v1-0-3465b5c9136d@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <quic_vpuar@quicinc.com>, rsalveti@quicinc.com, 
 ndechesn@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4524;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lzhk+Mg0i9uH/BzjuvrrsyO/OZBSIWuYBnbKrgDI3Xc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJXDZM1i/Nc5AAyQI7q/nqBDxsVI8xfe3Yy2Xu
 COnlm4w+8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyVw2QAKCRCLPIo+Aiko
 1ZGfB/9agsxFKpnoWwmSP47Da/msGLurh8I2a3AAeiwPv/l6eGQqlzT2lFru/Kfuqm1XBve8wlf
 iX6Bcer8aa6qn2F4ERc5bHHXhdlMjmIuebwq/fFi1YbSBZy45eSWrnRrgHJ5zyL/RwYLfnhzuns
 WaG8B2kYUvMNS/CVuuYJ+588x+GwLldlkkNQEAROIUuXmGfwKJ/OaCtcT8pfyZHv188xiK7hQ3v
 j7b23V8RGyWDZkQEM8CBiPIdYMRToBOvGse7YV3lRhbAj8Izfo6oDxCVnwLzAQQaWoRuOLJenNb
 N4jI78Uz1Sg6fjJPWGwnhNVEtnZIsia+8c9OZS5tWFEk3sa2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 00:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206645

Adreno zap.mbn files are platform-specific. As such they shouldn't be a
part of the generic ${PN}-qcom-adreno-aNNN packages. Move it to the
${PN}-qcom-sa8775p-adreno package.

Fixes: 02dec6af254c ("linux-firmware: Add qcom-adreno-a663 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 957452947d5ebfab92c9fd64865c1ea1ed74c24d..b40c33d5ada81856965519a195a774b828177aa9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -411,6 +411,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
+             ${PN}-qcom-sa8775p-adreno \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -1452,6 +1453,7 @@ LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
+LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1488,7 +1490,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
-FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
+FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
@@ -1508,6 +1510,7 @@ FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
 FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
+FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
@@ -1562,6 +1565,7 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
 # Only symlinks in qcom-qrb4210-wifi, firmware is in qcom-qcm2290-wifi
 # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
 RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
+RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"

-- 
2.39.5


