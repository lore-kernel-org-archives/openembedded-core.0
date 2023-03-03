Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301DAC7EE39
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27598.1677860256132335378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IuO9N7NH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id n6so3190559plf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBxssKUUCtNR98jAIHYefdIW3aaDb2b3Byhsu4003NY=;
        b=IuO9N7NHyMpI6nN2zTDY8+69S84A8wVuXo7iaq84vV4mtLaE7FY8S167ZSr2HIalSM
         MmvSrm+RAeQZonV3bJrPsNaYVWgFAnL+o856919cBbr0CijkRQ1Xrl+kkV4wy4xwKwjH
         wBoixcNlZW/JvknLidGvGUSaQyBLGtso5J6RsWif6b851HxmjwIlx0LLf6GJDiDEQ5BJ
         Ppna6B+09NAIoPZefyWoptlOZzfUpjk1GxST7iY3Z7gVF8K8iQJlZA1mn0nftspRqRMN
         phx+udD/p7SCTI6Kp5sCfJ/9bqTi/ZeE1tBYt8CP/Ypar/5RnOs9c77NQL0IWvl+oCRj
         8d5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBxssKUUCtNR98jAIHYefdIW3aaDb2b3Byhsu4003NY=;
        b=g4wKA+la4FxxrUYUS/ahVFOhVm9rU+rf3NMqNfpH7K+RriWq1yo24WhCDI4CpJqeE2
         pN8GVH/8CoRE/HaDl+S4qbI1Do2MsSW4gyr7VsDVZr/SFpeHjOT+Xe3JcuOWr0w4ro1I
         0pdQAuOiTUp3wJBoThhPicVHbGsM/uP17velSvO3QpV8WH8ZaQgGVjNw+ylur5iou9rv
         AgcDyeSE9dUq/oJK7uhNwT3k13GtMunqia9oCUoF8ylbvU4GaxvNninaIYC1Psjyhtdu
         9QmM0tmF1qA+iqTmLEXwfrPOsmkhc+UPGkk7gA39vG1Cuctf5EsW7vODvHVtv8j0zcUy
         x6rQ==
X-Gm-Message-State: AO0yUKUf+BLGOLAuAXpp7SYgrmjlSxxjFgaoWqzc8LhJzRFp/+nVvLC7
	+PvLIvBTCFsjW4O/7UjnE2Rk1vwb1V9WEMksGY4=
X-Google-Smtp-Source: AK7set/d0HVErPDqn0rCZylJlwwL1KQl060TegkixMWZ0xOV7fpV01F1t9BCG2h4f4MM5yyfwrS7aw==
X-Received: by 2002:a17:903:2290:b0:19e:25b4:7740 with SMTP id b16-20020a170903229000b0019e25b47740mr2938107plh.28.1677860273228;
        Fri, 03 Mar 2023 08:17:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/29] linux-firmware: properly set license for all Qualcomm firmware
Date: Fri,  3 Mar 2023 06:17:10 -1000
Message-Id: <4e4cc519c26ac8799e786171d4366f683c734c08.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178001

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

It is not enough to depend on the ${PN}-qcom-license package. Set
LICENSE variable for all the qcom packages to point to the proper
license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9dc41e18dc138a7cce920f8e4c85eb3130c0d553)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230117.bb | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index 1dce06c8f5..9ae0b2be13 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -983,6 +983,31 @@ RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
+
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
-- 
2.34.1


