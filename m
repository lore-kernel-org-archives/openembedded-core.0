Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8556DC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 17:02:31 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.39432.1653930140991566994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XTAkBW19;
 spf=pass (domain: linaro.org, ip: 209.85.208.178,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id w23so1408008ljd.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9w2C7fXvA1h0Z4IgnPRfb9jcTRa70mjPENdCFVzi1aY=;
        b=XTAkBW191O73Md6zB0L6BCLLCfURZugUsYUZei7S2YHIrPeqtKXKbnorhMgzM98kaO
         wVF+VYfjv0N1TdsC15v8TVTvcnSDDS4JydIxou+QzvL35vtbJEuNLES+XceBwqdE57Ws
         i3dAAvKVnzCQegllQAJaff6RNlUeo5FexUSdHXBG9XnnPVgWcCVvS038j8NqmhhUKLTL
         34YImapDC6jlwLii5zHZPArazANcGrynPxmTetCleYyNQXv62NowxXgfoHiy8Dkzrlv2
         E81cBYOSMYKxlLzpYXJePGrnUi65xzilq9cEy5M+g1eV101Jdj7F8ZcboXxCfOuDEupV
         3EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9w2C7fXvA1h0Z4IgnPRfb9jcTRa70mjPENdCFVzi1aY=;
        b=7WBkFmsMoxaJ/ky8Jhpqa5nIbys76cvi8+xLpNCWx2Eb95/KXHItqYus1/r0ERtEVu
         yTdwwdaueM7sHgKbLn/m/Pu2Jn/Kf0HnFGCseE6sl1s0Xpd/prAAsBCKg3sVUyeWtSmu
         Am5GwKPcSqDVkSegXnkdJVZyTOkSt/oZaMAmaCkpBBWpl8AaD9cuDZv3vyYWce1GfqIS
         9qcPgV/bCeynsTKR09spb2ivGqrzxAFLbfLPxW+MNp4+6i0m6ofHyI/EKNBv0P7Aae7r
         8+qOPTugZuG2K+jWIyVwRH8mcZtHECWzu3nqOUhr0hJkaFtVpFABC/G3y1n3r+WTwAEs
         XleA==
X-Gm-Message-State: AOAM531rR+1bR+5du1cGn+/WjTJJf3UuPBdXrVXwaiJsYVudwdMqUZOF
	Gk/u8JEIj9Iqh2H+Jbimqg+oIAA16y7BIQ==
X-Google-Smtp-Source: 
 ABdhPJyOKHvuGpXE1M9t6IXaGQ2gM6vXDrg20XrUE2G0lPnRkfSDZZAYmcnh9h+DqgO+DhK/HtcNjg==
X-Received: by 2002:a2e:2e0a:0:b0:253:d95c:ddee with SMTP id
 u10-20020a2e2e0a000000b00253d95cddeemr31370666lju.0.1653930139075;
        Mon, 30 May 2022 10:02:19 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 t2-20020ac24c02000000b0047255d210e6sm2410752lfq.21.2022.05.30.10.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 10:02:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [kirkstone][PATCH 2/2] linux-firmware: split ath3k firmware
Date: Mon, 30 May 2022 20:02:13 +0300
Message-Id: <20220530170213.1562720-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
References: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 17:02:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166296

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Atheros AR3011 Bluetooth devices require special ath3k-1.fw firmware
file. Package it separately from the main linux-firmware package to
allow deploying this firmware on embedded devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit a12a5606f4c7003d9a90c493380c656ee557dea5)
---
 .../linux-firmware/linux-firmware_20220509.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 7da5eca89358..6e328e57260a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -270,7 +270,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
@@ -320,6 +320,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
 
 # For atheros
 LICENSE:${PN}-ar9170 = "Firmware-atheros_firmware"
+LICENSE:${PN}-ath3k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE:${PN}-atheros-license = "Firmware-atheros_firmware"
@@ -328,6 +329,9 @@ FILES:${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_f
 FILES:${PN}-ar9170 = " \
   ${nonarch_base_libdir}/firmware/ar9170*.fw \
 "
+FILES:${PN}-ath3k = " \
+  ${nonarch_base_libdir}/firmware/ath3k*fw \
+"
 FILES:${PN}-ath6k = " \
   ${nonarch_base_libdir}/firmware/ath6k \
 "
-- 
2.30.2


