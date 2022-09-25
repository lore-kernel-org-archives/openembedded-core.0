Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B1AC04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.20499.1664133491918643867
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sMM57fOF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id fv3so4524926pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=M2359e/ykFbORI2Fsfopmu7vsvQKZPAg0+mzbd+nq/w=;
        b=sMM57fOFk4FwIAl4rPBEP2hKJLCxauDZ6Z3xdVf2Z9bIkym9841kXY7IWDBnerJ/H5
         XdxbXW4oM/K3aFLYYLirSBAy8+mUEd9TKuZ+Uj80VadR6nzvYyzr7g0fMhpAj7eE40CM
         ipDdvwrO4SB11hMBD+h+yfLq8xxpyiwCiYGx/cAfKXZqhb1lReAu1xJagpepPZxP5RgV
         r7MtWVQfeV8CZz1wkn+lG3Py4G2YPvDw+Z6Yl4dmCFWu3DErksD8B6duJV5iRQAoBNyx
         zM+vj+Y1ID8UXV0xBNb5vCrN14Vpj0nLbhT8I07aIbBz8NQrmcg41pV4d0meLgK6WHAa
         +G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=M2359e/ykFbORI2Fsfopmu7vsvQKZPAg0+mzbd+nq/w=;
        b=hyk3O37OA5EO/oojRVgeTl3Nv1AQWuXNhfjT5DRhq0Pr9MvYEQhrBtZY5yTZu3M4fX
         mTB1hr+eEytdsG2CT6/J2Uxgf0c5gjmhdRwBXypsT2DJeOMatnSzVupF+nUqgsJ7LSUW
         7RHqhtq4Qws6Qrth7n64Mhe6WWN1SyVJXzTvP3/5cL+gQIfRMb3GbIzDIWBy6tVEeAYV
         wPveXNyvPCP21U40GBe89Y9IYb+IJ6gpzHv7NWJJ8kN3wlTTdSQPXxbtxxOwTmrIkV2N
         uE6G4rgjiuZhzBgtXFkCLsNjyESWJqt1yw8MaXHl/hveZmqg8nGw1nTAar3kKVbSbgNT
         gxCA==
X-Gm-Message-State: ACrzQf0HyZHfbUinvPAAA7278GvlSxBwfe8ZsRQexvfO1CE2inF/J1J4
	1l93TpVRsEZ23BBR+YkjQPWiULcZfTElaw4R
X-Google-Smtp-Source: 
 AMsMyM7jHBS/Ao8DzRDsRR+y+P1Z4AHoKbSQEwQaOUlF3qiVg8vtzi0lJw6q74wszBbiYFOTzHNxdA==
X-Received: by 2002:a17:902:e294:b0:178:8a69:5b25 with SMTP id
 o20-20020a170902e29400b001788a695b25mr18680123plc.163.1664133517507;
        Sun, 25 Sep 2022 12:18:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/33] linux-firmware: package new Qualcomm
 firmware
Date: Sun, 25 Sep 2022 09:17:31 -1000
Message-Id: 
 <178441fcbb54bb70374fa231a6b5870ef52266fa.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171034

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Add packages for the new Qualcomm firmware released for Lenovo X13s
laptop.

The INSANE_SKIP:${PN} has to be provided to silent following warnings:

WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!
WARNING: File '/lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn' from linux-firmware was already stripped, this will prevent future debugging!

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af9924a3da0569e90c2d3abe030584456e66229b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 5a953fd0e2..45c9d0e861 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -311,6 +311,11 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
              ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
+             ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -976,6 +981,11 @@ FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${n
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
@@ -996,12 +1006,21 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
+
 FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
 
 # For Amlogic VDEC
@@ -1081,3 +1100,6 @@ python populate_packages:prepend () {
 # Firmware files are generally not ran on the CPU, so they can be
 # allarch despite being architecture specific
 INSANE_SKIP = "arch"
+
+# Don't warn about already stripped files
+INSANE_SKIP:${PN} = "already-stripped"
-- 
2.25.1


