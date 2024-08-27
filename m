Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47CC54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 14:18:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.79594.1724768326201965706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 07:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zLl05REM;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533463f6b16so6414498e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724768324; x=1725373124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xdhzKxnVqWQoj1Jxmx3GocLzBP1E21xBTGwOqltCMk=;
        b=zLl05REMG9PqySVYwhow/5EV95j37K3qwUIPGMzBQWsnq+pL5oXJjX9OE0nb9aWu6e
         lddAx7QK3XabwTLnxreIqeJC47MU2zJRXXKBIsfa8hGrCkqs2X9IDl6TN2DYO2UzxvQ7
         V4jg5+2glKtajRVG3+Xbi59pbt85pXWoCW3l4ouHfpVCKbvhIwk9rmRmQJxsRSmRyz/Z
         M011hF53FAEnduDCMUVbYsMztuVz3y8tymAQO83yfqUXoX5iHAJNYVPvwCeCPJnFI3Oc
         31Si5PnghshMp5OauBl1u2QpKnvMsnc+vT+mCPadq95A6X1le9l8mSUh2dyBD6UAGx25
         e4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768324; x=1725373124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xdhzKxnVqWQoj1Jxmx3GocLzBP1E21xBTGwOqltCMk=;
        b=p4rnifgbhBI2ST8+z2pQGFuxIZqP0wuaPe3HoE2GPoNM0w6hwxSf2J8jwgLMx21Wom
         zSmowCYq7qy/ANw+zdL7zMRQ4FMjPzjxKUo5gXtKs+KdOpjvCp5feS8VPK15+7I9WWpB
         HqkL8nYbLZEHxnM3aKB+QnboycN1usTTs74btpxWx05fMhLF9UUwMMvLFAUTICYSa3eC
         /RW6Bf/hPbgWPvz+IUMBjBW5EFZ1xyFOJbj6XMCXlC3QijuftrA+RFtdbj5ysquLTlHI
         /edSxgeQAiRhWnaM/yrH9tf1vqRQgyUohWvigjoZ59f97vLbZ12NhwBSXcAXUVMbvd3K
         eyGA==
X-Gm-Message-State: AOJu0YyZZKMsuClIwx1e8Df/lPJgVb5zoC2YZ1TwOwIwXnSIe3ZSBY00
	JuWXV686xFqCQ0CxYwpj0OmzrnS8QlTXqflJk+lWfnrbQVarZeOJJcQ81q3sGxUSlO6x5MLxl2y
	g
X-Google-Smtp-Source: AGHT+IG4wYlWYsjLWTXV0q5BdbDTjI3sUmYs92QiSgdCTW2ezqTTbonuQ/uKEAB55gywuRKF8LuM9g==
X-Received: by 2002:a05:6512:31c4:b0:533:32b4:ca6f with SMTP id 2adb3069b0e04-53438785cabmr8975927e87.34.1724768323343;
        Tue, 27 Aug 2024 07:18:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea36c03sm1800987e87.105.2024.08.27.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:18:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH 1/2] linux-firmware: move -qcom-qcm2290-wifi before -ath10k
Date: Tue, 27 Aug 2024 17:18:41 +0300
Message-Id: <20240827141842.339122-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203846

The linux-firmware-qcom-qcm2290-wifi package needs to steal some files
from the linux-firmware-ath10k (like qcom-qrb4210-wifi and
qcom-sdm845-modem packages do). Move the package name before the ath10k
in the list so that thieft is successful.

Fixes: f65e01a0c7eb ("linux-firmware: update to 20240513")
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
index 7696118edb98..c66fdf071d94 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
@@ -325,7 +325,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
-             ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -388,7 +388,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
-             ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem ${PN}-qcom-qcm2290-wifi  \
+             ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
              ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
-- 
2.39.2


