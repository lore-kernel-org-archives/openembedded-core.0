Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2F7C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:07 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.21269.1691683500444659755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UkfycMqZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3498811fcf8so3677735ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683499; x=1692288299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVUQcX8mVDT1as2fkfZlWT99lTVTkLVeWi9IkqbvkQI=;
        b=UkfycMqZSNxyKIxgG4T52mbD2TnHBrZUQe8ef275+tY4EbcgIfko6REMIcXua/U4Od
         NqJYGhE8/wRJ+6kGe4dYXO6WD8ehwmBLsFQuk06KJ6+5FxLA9nAlsp/TF3EPf5RFMwO3
         4jEeFd7ooqY2NnT/ce/5p50RAv9U8zgiRbQ+K3sUfp1lfrpGKINqBnPx7PhL5AXfSX0d
         bFXpmOqWKaoQaM9UbuOM4Y5/p7x69ypf+zwraohPp+s+zZMt96U4Hn6JZfUt4Yrp/xS+
         skF6AyV7n8YXrsLh7A8JOcLASkTv5Q5BHmRE+agAaRWofEFtc10W595B1I/RH6PPZYEP
         Z6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683499; x=1692288299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVUQcX8mVDT1as2fkfZlWT99lTVTkLVeWi9IkqbvkQI=;
        b=drdpro4cSSqLSu5cQVis+eh/ipmEmjI2IH/FQ/WrzYy3sRqtXYyyssKIAx3AosBPD8
         v0TbwEhNlv4uz8IrTKvup3lGaz0Vk/1nfRHSVLSRGq40dpr4NymHc93AA47E8jHvbfX8
         NcGzCVpIjrhU/2MNPgb7ZtWxxWSt2UTtneNUarELE2fkyFPOOwbvUJNEkvyMiVUak40w
         kwBcosCeGtnGbSKajQjRQqghmI9n7lx2DCPpsivsyYsx1s4qRt8ShVthi7OcfnLRWYQj
         faH+FnjbJzSZ0ta9jPMW8/0BPeidnMj4Yg2A8Qyjg6TvidoqQ72UEIiBb0btWBUaiLVw
         gywg==
X-Gm-Message-State: AOJu0YxAVlrCKFvaKUzUAKJxImVHGQaufej5daZOPafo/mLNejo6Ja91
	rXyWKSUEtxtptIl9nHqndPvgvd8C/CnFScutbqQ=
X-Google-Smtp-Source: AGHT+IGjOt/Du3M13TjS5R+1xSQTl+1u74TrL/NsKibI/FYSezMBPGItMMA7AEMI7Onc9WDHQ59bEQ==
X-Received: by 2002:a05:6e02:1885:b0:347:712c:dc9 with SMTP id o5-20020a056e02188500b00347712c0dc9mr3990862ilu.22.1691683499234;
        Thu, 10 Aug 2023 09:04:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/37] linux-firmware: package firmare for Dragonboard 410c
Date: Thu, 10 Aug 2023 06:04:06 -1000
Message-Id: <ffd5eeb866254a958846c7099d1d46e553beed56.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185769

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Latest linux-firmware archive inclues firmware for the Dragonboard 410c
device (Qualcomm apq8016 SBC). Follow the rest of linux-firmware-qcom-*
packages as a template and create packages for the new firmware files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 380216e8d3b63d563ebfb10445fc6eb5e77eb9f2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 329a3e3c9a..a98a4e9b45 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -315,6 +315,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
@@ -1000,6 +1001,8 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
@@ -1027,6 +1030,8 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.* ${n
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
+FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
+FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
@@ -1053,6 +1058,8 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
-- 
2.34.1


