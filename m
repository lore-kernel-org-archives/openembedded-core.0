Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B8AE748FA
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.62148.1696176039444975861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tamk54uU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c60778a3bfso111167735ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176038; x=1696780838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5TsqgiGyM+J6FK+dsG4K/iHO+b0IteM3FMGEXZ2czo=;
        b=Tamk54uUYospjITIfttRny7rVIH30JnVztTy0/VLVRwibq7t/clcOWQQBE4AqPnZHo
         pSJIb+n4DhC0OjHVS5uClIk8hSv5iK3IJHdTPWH/ExNAsNngSbcWKf3loTT5LNYO2dGX
         teIPQTKothI4qg5FdGsI0YXhP+0kVOjZcs1HnsjZ82CX54h/MYSIx2UNrpaZl7hOXFHL
         NrEFG1cO3rnerpXko7uug/1/c7s9nOSHBq0IX9m66517dcxAilGoPyYeIjY+q58Gbp4w
         bO7ovYFrMMkSyfHrWBHiilpijv+4RFtGGDHaCMdiK23lQLsXLVRATTQPsB/+u7Z0Hdwg
         y/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176038; x=1696780838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5TsqgiGyM+J6FK+dsG4K/iHO+b0IteM3FMGEXZ2czo=;
        b=WRYewOK6iJWR1J5x6pmqxkY/YIEDBV2gFUD9QpSjytyNg9tR4AItI0kFu/x7ZazTwa
         twXGjCnMAILAznSwnNHUJ3COvucD+LidWfsv7YbcE5ViW9mAND33UVq0sqSwd2OT7k3l
         i5DLKNpin948InPYi0riqDAO2UtBW8+ulVkAq698oM1P2i6VzevFxn9VcXLfToaD1mrT
         f2E6nP/nCClqWR2QH9d82goVVbOOVThcBvR3slePRSGwINYaLq5lGdnvOK4MvCXjzLqe
         HQC6nLXJe9hnuqHtXCt1FybwE4iYOLsPfSbuz0K1veq2bFDEsPKGiuMHlEpSTSPR3NDa
         xekA==
X-Gm-Message-State: AOJu0YzF8lGizw0Pj6E5NCTltjBbQGh2i7bRFfwzIuP2VlkX0ZRytFFb
	+JNWesqvquazEhLxGCwnNqp8S/ybJsftStuuJpEqYQ==
X-Google-Smtp-Source: AGHT+IFJdX7vrqvTrxaOufpoWXfI83wspjEbwufzZasUZDbQksclTUekySDw5vX4NQBWHaMCtjJbiA==
X-Received: by 2002:a17:902:be08:b0:1c7:49dd:2fe with SMTP id r8-20020a170902be0800b001c749dd02femr5668095pls.50.1696176038226;
        Sun, 01 Oct 2023 09:00:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/23] linux-firmware: package audio topology for Lenovo X13s
Date: Sun,  1 Oct 2023 05:59:58 -1000
Message-Id: <12c2dd9dc0cee2e1a09fbd149f7a2ecab16ecaef.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188500

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add audio topology description to the qcom-sc8280xp-lenovo-x13s-audio
package. The file is licensed is copyright by Linaro and licensed under
BSD 3-clause license.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 958d6a209edf059d31ff07bdd55179fc21ea7079)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230804.bb              | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 4defab434d..36939f0423 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -34,6 +34,7 @@ LICENSE = "\
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-linaro \
     & Firmware-Lontium \
     & Firmware-Marvell \
     & Firmware-moxa \
@@ -97,6 +98,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=2ce6786e0fc11ac6e36b54bb9b799f1b \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
@@ -167,6 +169,7 @@ NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
+NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
@@ -1014,7 +1017,7 @@ LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
-LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
@@ -1047,7 +1050,7 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
-- 
2.34.1


