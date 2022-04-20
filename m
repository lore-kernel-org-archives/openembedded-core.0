Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF9FC47091
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.5941.1650449492516792671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KKMomsq9;
 spf=pass (domain: linaro.org, ip: 209.85.167.51,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id x33so2060527lfu.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8oGPKr1m3z3o98UBx9m5Sd98EKSVSuKAA2rPsNQdTxI=;
        b=KKMomsq9Zm3k4Oc+evvl6kAGjsmK4CyBSQ69N9PyNkz1ITKU4GC/fz/7NchjDm63yi
         uiXIsGrOSBdoZPFwc/uoUkqa6ghACijRIn3thk4KZCvewOXDpKUzuy6O6nNPzO9RPAc9
         7Qmd0NMnfil6HlRJTxmYRQFYA6smz3HNEl9IG5kEqkPtpWmxsq5Xl823WNOg4odeDtwO
         wIN522aa6vl5d41jwIe2Rzg0BzeNa+xmBoFkdNjfUj783dvuIT/w72tuYasvRzlbvRn8
         WHxg/ePSHM+Q7PXSfnGvziiJU1GDZL6mdaP671r5dPsXPvf9NrSrSSTlUTWl1e60LpHC
         QFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8oGPKr1m3z3o98UBx9m5Sd98EKSVSuKAA2rPsNQdTxI=;
        b=HaiTuEcd3SgQ36KcxvjTO8641UFUnX/PJRav9dGNBKX9oh2Qfvf+VhZv3NUAkTZwex
         CENig19CLfEYGe62rtOMClTasDSeEQbG0llz16x2Qef9Urj/WBFwRwo235k3sL+pxCH7
         /Hhr9S9O9VVhErKbQA/YF1sk5aKk/pCrmOQ6ZcR1r0NKn8UYnLnMCJbru2JYP1HAbK6T
         wlAJ2U1c6rvMqb6H1PajhtkJaM5xzTosYqs49khaI2wVFI7Jr8Y68Ytmcvgrk0QUulyf
         FfrEb8moYOSGJkVRvDqVGRKVpdDcznWvElEmFGhy46LR5ouGZW9BCAfl4CNjDOi/a4oi
         Ks6g==
X-Gm-Message-State: AOAM532kub+uAY69X+gvc6NaM4z4ZOCbGyroh1/BAbyJb7e1pWSrCUzK
	qNRUwSVeflGH6D9drI1RuHTkFzlIuyzJwQ==
X-Google-Smtp-Source: 
 ABdhPJzmpmgpBmKiEuEM3Z1lwSG90V3h8YHfIOu6rGStFE1wpNlfbiAndUlTs0HVyzp+mHLr5VHCtQ==
X-Received: by 2002:a2e:1616:0:b0:24d:a631:d594 with SMTP id
 w22-20020a2e1616000000b0024da631d594mr12488152ljd.106.1650449490403;
        Wed, 20 Apr 2022 03:11:30 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a2ea90a000000b0024d9ee09661sm1660499ljq.27.2022.04.20.03.11.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:11:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: split ath3k firmware
Date: Wed, 20 Apr 2022 13:11:29 +0300
Message-Id: <20220420101129.2960823-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420101129.2960823-1-dmitry.baryshkov@linaro.org>
References: <20220420101129.2960823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164661

Atheros AR3011 Bluetooth devices require special ath3k-1.fw firmware
file. Package it separately from the main linux-firmware package to
allow deploying this firmware on embedded devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20220411.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index 4a443d14d177..89e1b8cbaf2e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -267,7 +267,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm4373 \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
@@ -316,6 +316,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
 
 # For atheros
 LICENSE:${PN}-ar9170 = "Firmware-atheros_firmware"
+LICENSE:${PN}-ath3k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE:${PN}-ath9k = "Firmware-atheros_firmware"
 LICENSE:${PN}-atheros-license = "Firmware-atheros_firmware"
@@ -324,6 +325,9 @@ FILES:${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_f
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


