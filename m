Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5C2C46CA3
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:10 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.5276.1701377889985535752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KarrnVTC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so1113336a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377889; x=1701982689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXfni2FUNNrS2M2JkKg2nGhF3caYPn+79r4nKv9VFxQ=;
        b=KarrnVTCb63Rmkc93CQQogoFmo0XRRAG94n9qTGy2Gfrevp5f1pkhmVcS+fOCna/6j
         FC3QceYFUwUO5g921W60IRovK/0t4xheTIcx+P//JfYSJ4wjqjKZQl4Y5NOb2Mv9YOto
         6c21xsHAEdirVqA48E6dZ3995DSQJe1zVgOtdYmwZc8PfQEUHFyglZjhEqX0+lnbEYLm
         cIfw9/fhFiPv3gWLM6O/z7Yl2lnDst1QTYCV/aGt4XUlTSj7WrpGYWo7zKdb5U3Y7S0S
         +Y2561EWBIJa1d+myKEiqnOoj1qdcay0GFnQkGPlgS4nKjMqbWbG2JRCZsPEvW9Q51eY
         sjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377889; x=1701982689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXfni2FUNNrS2M2JkKg2nGhF3caYPn+79r4nKv9VFxQ=;
        b=Lk4hjTQh4NxQOloyuND0WHWeTI1C2abZXkHYyX7sKKt4GcIfhC25Y75JyOGcBdaPSr
         9vvZ/O5kaHSikUSsNFav+2CrkcyQZsABHnxfOom81dw7PorVf8N73Q/UjgQwZJ4zIBHN
         WlKql2+SFlp94hxsB4Eeq/ZbqrT5RYAmqic4+hHGAdvUmMBT3UfpHHAqEBwlv/oSpNKq
         L6lXC5CjWyeY6F+iZB+t2LJcoWgPmDofXGS3n8FmcTJtJesrQFcmNfiRYIkaeuaLCupi
         C9mXaFNttG0xI6PtdE7ReaIo8OkN5MZvYS2yeBq32VIobjF8Bg8vmeorG/RkZsnNJjFB
         ozOw==
X-Gm-Message-State: AOJu0YyCNQfK3RYwOcJoeADZH/XoxEhEAgQjJ8m6YakaWYZsyowpMiKI
	8EU5+0+c488uuIZV6h72wDLlcMrqHsSoJiBVYUHBTw==
X-Google-Smtp-Source: AGHT+IFChXEh4HLAdrUirk+iFQGNUh5AeN7PGka5P8fME0mPgsGTNGgDoXR2pT+/Ye2hyVo80w/Kcg==
X-Received: by 2002:a05:6a20:a10a:b0:18b:4632:af0b with SMTP id q10-20020a056a20a10a00b0018b4632af0bmr27672102pzk.17.1701377889084;
        Thu, 30 Nov 2023 12:58:09 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/25] linux-firmware: package Qualcomm Venus 6.0 firmware
Date: Thu, 30 Nov 2023 10:57:25 -1000
Message-Id: <247d5b997b4d8a3c72f2004c1df069f7f88fed38.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191535

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Package firmware for the Qualcomm video encoder / decoder (venus) core,
version 6.0

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 51a64bd01adf3a81086e6368af01abaf4081a515)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 55e0d7f712..be8cb9b3e9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -361,7 +361,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-phanfw-license ${PN}-phanfw \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
-             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
+             ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
@@ -1307,6 +1307,7 @@ LICENSE:${PN}-qcom-venus-1.8 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
 LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
+LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
@@ -1350,6 +1351,7 @@ FILES:${PN}-qcom-venus-1.8 = "${nonarch_base_libdir}/firmware/qcom/venus-1.8/*"
 FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
 FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
 FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
+FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
 FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
 FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
 FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
@@ -1392,6 +1394,7 @@ RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
-- 
2.34.1


