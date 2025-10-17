Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C503CCD1A2
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 09:12:49 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.11359.1760692363224058556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Csz5D4n2;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so300239466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760692361; x=1761297161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWUEZl61Hf3Ht7qRDzYI6rlZOJ9JU9+oGChP1o2Ls9U=;
        b=Csz5D4n2zkDyDXAnGUwhEHk/3G3FuQp9wtr4ZdrmmTcy0Wjq08NO7N+uCT3/S0+bLw
         B9Ttj7Vwp2ZKZNEKCOGRsJQJtDtrSRUbToJiSq1R44PWPUmjxVfbaX4MrR50tu6ThxW/
         QeZTWc/+/Gy6DivmBOMxLxLKd5xvkGtlp2sj5bzdv8NfMNCtyC9LwzspIq1hBJ4QPEu7
         wjzx1+tZetCdlQdyfAVxh/gwa2Moc0ZAQ19MZ7rHJHD3Ek+jrnUF+IWq/+QL8z5j1k0W
         h0yj230ujmxrYbXQnKZN/1GjienrJnVDxMP4qldbmi6ElXpJ9QrIxZ4P8RJEU8nQ8gqj
         1+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692361; x=1761297161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWUEZl61Hf3Ht7qRDzYI6rlZOJ9JU9+oGChP1o2Ls9U=;
        b=D9behy8RiLECHhG+S/y9yO9nj/1o2kslFvsmdy4uFy8Z5LvHcJ7KpZf2sjkObaoqHM
         dUewfkV+RuaYVYQ5fxmfkHWaVAsEDRPQau/GUQfXr8OinwpL+4xs9Hp6X0dD1kC4Aa1w
         hr+LtxwvlgaOTAkCX7XiVqT50MPkQcEBXFQSAELUchxZa3CjsKRvlKMiny4UAv4+C/2l
         PNY9ag+/bMim+bFZET9iBd45KN+xzK6Fq0osehoTaW8f/AmnDssMbS0rcpiPGXdo4MdU
         q0ja3o1+XIBnEfc0HoaEXp7uuExM8X8rZoTzkXEP7MMz/1/pB4b/FsGytZjFxUyRLO2G
         spCA==
X-Gm-Message-State: AOJu0YxYwAezfj9KOXhbzEuTf6CFaxgnutKMW44ujxdqXQtprcCsVAw7
	yAl294vJlq59Knt7FMIcusLMIheL2e9tDxyi4WAgASKrFwhBFgL40VHrgNN39Rmp
X-Gm-Gg: ASbGnctf9ttD+XFZ/McsY2qHikaP5lkNGUuROTqWZcsfpyubBZq4r7Gbkjmrjb1aRCK
	2Vv3RoyERkeuADBXmjyfRKa8XAWKtZVkBExNrEXirjAWDwbiL2L+w4GVVzfNrrD8qGYrZbC71GM
	w4Cq3FysqrzHRFNYR3shxYQi5XjQd8IebDhUdGf8uokF6H5CyDxNNfOBLRiQ0kJ8qr+gkEcy2M3
	zoFWysD07rxAYK/QBjn0h1jcxZY250rCHpRzFcK2sP24Lts2QFWeXMVNPatWf/9c9B+lGM48SEX
	+CNixDZJgbXCkg+Pdv9PA1t8CxDbcHZI2A0uOccg+iHzzF34pSyc4CKeYOnUnhIHiejHzULMIPA
	jHG6gvCtGZ7CwPDISbUpiSVmrWatmyIhcdUfJflnnne1yfQXY0kv3FfmDN/AyqS39O8rqDC6w7h
	Q7JUGyc+nlhPt7Ne9oNXSL0Q==
X-Google-Smtp-Source: AGHT+IFOGo7oY5RPGsQs0FnNxJiWrP6Yo5umosNS95M77+Jc0iokX3/Ed/yQwbDdtbNcJn/jUJ1yqA==
X-Received: by 2002:a17:906:f58b:b0:b49:2021:793f with SMTP id a640c23a62f3a-b64764e4b0amr310633266b.53.1760692361233;
        Fri, 17 Oct 2025 02:12:41 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06c187sm746466466b.31.2025.10.17.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:12:41 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 2/2] linux-firmware: Add globbing to FILES where missing
Date: Fri, 17 Oct 2025 11:12:38 +0200
Message-ID: <20251017091238.1459237-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017091238.1459237-1-zboszor@gmail.com>
References: <20251017091238.1459237-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 09:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225003

If compression is used, a lot of compressed firmware files are
not packaged otherwise.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../linux-firmware/linux-firmware_20251011.bb | 156 +++++++++---------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
index bb40c68670..c33f4b3376 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
@@ -1495,7 +1495,7 @@ ALLOW_EMPTY:${PN}-nxp9098-pcie = "1"
 ALLOW_EMPTY:${PN}-nxp9098-sdio = "1"
 FILES:${PN}-nxpiw416-sdio = "${nonarch_base_libdir}/firmware/nxp/*iw416*"
 FILES:${PN}-nxpiw612-sdio = "${nonarch_base_libdir}/firmware/nxp/uartspi_n61x_v1.bin.se*"
-FILES:${PN}-nxp-sr1xx = "${nonarch_base_libdir}/firmware/nxp/sr150_fw.bin"
+FILES:${PN}-nxp-sr1xx = "${nonarch_base_libdir}/firmware/nxp/sr150_fw.bin*"
 FILES:${PN}-nxp-license = "${nonarch_base_libdir}/firmware/LICENSE.nxp"
 
 RDEPENDS:${PN}-nxp8987-sdio += "${PN}-nxp-license"
@@ -1588,7 +1588,7 @@ LICENSE:${PN}-rsi-91x = "WHENCE"
 
 FILES:${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps* "
 FILES:${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps* "
-FILES:${PN}-rsi-91x = " ${nonarch_base_libdir}/firmware/rsi_91x.fw "
+FILES:${PN}-rsi-91x = " ${nonarch_base_libdir}/firmware/rsi_91x.fw* "
 
 RDEPENDS:${PN}-rs9113 += "${PN}-whence-license"
 RDEPENDS:${PN}-rs9116 += "${PN}-whence-license"
@@ -1637,9 +1637,9 @@ FILES:${PN}-rtl8723 = " \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
-  ${nonarch_base_libdir}/firmware/rtw88/README \
+  ${nonarch_base_libdir}/firmware/rtw88/README* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin* \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
@@ -1775,8 +1775,8 @@ FILES:${PN}-ti-tspa-license = "${nonarch_base_libdir}/firmware/LICENCE.ti-tspa"
 # For ti-tas2563 - tas2563 firmware
 LICENSE:${PN}-ti-tas2563 = "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2563 = "\
-    ${nonarch_base_libdir}/firmware/INT8866RCA2.bin \
-    ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin \
+    ${nonarch_base_libdir}/firmware/INT8866RCA2.bin* \
+    ${nonarch_base_libdir}/firmware/TAS2XXX3870.bin* \
     ${nonarch_base_libdir}/firmware/ti/tas2563/* \
 "
 RDEPENDS:${PN}-ti-tas2563 = "${PN}-ti-tspa-license"
@@ -1784,23 +1784,23 @@ RDEPENDS:${PN}-ti-tas2563 = "${PN}-ti-tspa-license"
 # For ti-tas2781 - tas2781 firmware
 LICENSE:${PN}-ti-tas2781 = "Firmware-ti-tspa"
 FILES:${PN}-ti-tas2781 = "\
-    ${nonarch_base_libdir}/firmware/TAS2XXX*.bin \
-    ${nonarch_base_libdir}/firmware/TIAS2781*.bin \
-    ${nonarch_base_libdir}/firmware/TXNW2781*.bin \
+    ${nonarch_base_libdir}/firmware/TAS2XXX*.bin* \
+    ${nonarch_base_libdir}/firmware/TIAS2781*.bin* \
+    ${nonarch_base_libdir}/firmware/TXNW2781*.bin* \
     ${nonarch_base_libdir}/firmware/ti/tas2781/* \
 "
 RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
 
 # For ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
 LICENSE:${PN}-ti-vpe = "Firmware-ti-tspa"
-FILES:${PN}-ti-vpe = "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin"
+FILES:${PN}-ti-vpe = "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin*"
 RDEPENDS:${PN}-ti-vpe = "${PN}-ti-tspa-license"
 
 # For ti_usb_3410_5052 - USB TI 3410/5052 serial device
 LICENSE:${PN}-ti-usb-3410-5052 = "GPL-2.0-or-later"
 FILES:${PN}-ti-usb-3410-5052 = "\
-    ${nonarch_base_libdir}/firmware/ti_3410.fw \
-    ${nonarch_base_libdir}/firmware/ti_5052.fw \
+    ${nonarch_base_libdir}/firmware/ti_3410.fw* \
+    ${nonarch_base_libdir}/firmware/ti_5052.fw* \
 "
 
 # For vt6656
@@ -2029,7 +2029,7 @@ LICENSE:${PN}-cirrus = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
 
 FILES:${PN}-cirrus = " \
-    ${nonarch_base_libdir}/firmware/cs42l43.bin \
+    ${nonarch_base_libdir}/firmware/cs42l43.bin* \
     ${nonarch_base_libdir}/firmware/cirrus/* \
 "
 FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
@@ -2388,7 +2388,7 @@ FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wl
 FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/a660_zap.mbn*"
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin*"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
-FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
+FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn*"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
@@ -2411,8 +2411,8 @@ FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wl
 FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
 FILES:${PN}-qcom-sa8775p-audio = "\
     ${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* \
-    ${nonarch_base_libdir}/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin \
-    ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin \
+    ${nonarch_base_libdir}/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin* \
 "
 FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
 FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
@@ -2581,7 +2581,7 @@ RDEPENDS:${PN}-amlogic-vdec = "${PN}-amlogic-vdec-license"
 LICENSE:${PN}-typhoon-license = "Firmware-typhoon"
 LICENSE:${PN}-typhoon = "Firmware-typhoon"
 FILES:${PN}-typhoon-license = "${nonarch_base_libdir}/firmware/LICENCE.typhoon"
-FILES:${PN}-typhoon = "${nonarch_base_libdir}/firmware/3com/typhoon.bin"
+FILES:${PN}-typhoon = "${nonarch_base_libdir}/firmware/3com/typhoon.bin*"
 RDEPENDS:${PN}-typhoon = "${PN}-typhoon-license"
 
 # For ish - Intel Integrated Sensor Hub
@@ -2589,7 +2589,7 @@ LICENSE:${PN}-intel-license = "Firmware-intel"
 FILES:${PN}-intel-license = "${nonarch_base_libdir}/firmware/LICENSE.intel"
 
 LICENSE:${PN}-ish-lnlm = "Firmware-intel"
-FILES:${PN}-ish-lnlm = "${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm.bin"
+FILES:${PN}-ish-lnlm = "${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm.bin*"
 RDEPENDS:${PN}-ish-lnlm = "${PN}-intel-license"
 
 # For Dell ish - Intel Integrated Sensor Hub
@@ -2598,8 +2598,8 @@ FILES:${PN}-dell-license = "${nonarch_base_libdir}/firmware/LICENSE.dell"
 
 LICENSE:${PN}-ish-lnlm-39ceeaf8 = "Firmware-dell"
 FILES:${PN}-ish-lnlm-39ceeaf8 =  "\
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_39ceeaf8.bin \
-    ${nonarch_base_libdir}/firmware/dell/ish/ish_lnlm_39ceeaf8_*.bin \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_39ceeaf8.bin* \
+    ${nonarch_base_libdir}/firmware/dell/ish/ish_lnlm_39ceeaf8_*.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-39ceeaf8 = "${PN}-dell-license"
 
@@ -2609,8 +2609,8 @@ FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
 
 LICENSE:${PN}-ish-lnlm-dba6b120-152c3222 = "Firmware-HP"
 FILES:${PN}-ish-lnlm-dba6b120-152c3222 = " \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_dba6b120_152c3222.bin \
-    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_dba6b120_152c3222.bin \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_dba6b120_152c3222.bin* \
+    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_dba6b120_152c3222.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-dba6b120-152c3222 = "${PN}-hp-license"
 
@@ -2620,8 +2620,8 @@ FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
 
 LICENSE:${PN}-ish-lnlm-53c4ffad-2a17559f = "Firmware-lenovo"
 FILES:${PN}-ish-lnlm-53c4ffad-2a17559f = "\
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_2a17559f.bin \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_2a17559f.bin \
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_2a17559f.bin* \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_2a17559f.bin* \
 "
 RDEPENDS:${PN}-ish-lnlm-53c4ffad-2a17559f = "${PN}-lenovo-license"
 
@@ -2711,7 +2711,7 @@ LICENSE:${PN}-abilis-license = "Firmware-Abilis"
 FILES:${PN}-abilis-license = "${nonarch_base_libdir}/firmware/LICENCE.Abilis"
 
 LICENSE:${PN}-as102 = "Firmware-Abilis"
-FILES:${PN}-as102 = "${nonarch_base_libdir}/firmware/as102_data*_st.hex"
+FILES:${PN}-as102 = "${nonarch_base_libdir}/firmware/as102_data*_st.hex*"
 RDEPENDS:${PN}-as102 = "${PN}-abilis-license"
 
 # For wilc1000 - Atmel 802.11n WLAN driver for WILC1000 & WILC3000
@@ -2739,7 +2739,7 @@ LICENSE:${PN}-bmi260-license = "Firmware-bmi260"
 FILES:${PN}-bmi260-license = "${nonarch_base_libdir}/firmware/LICENSE.bmi260"
 
 LICENSE:${PN}-bmi260 = "Firmware-bmi260"
-FILES:${PN}-bmi260 = "${nonarch_base_libdir}/firmware/bmi260-init-data.fw"
+FILES:${PN}-bmi260 = "${nonarch_base_libdir}/firmware/bmi260-init-data.fw*"
 RDEPENDS:${PN}-bmi260 = "${PN}-bmi260-license"
 
 # For cdns-mhdp - Cadence MHDP8546 DP bridge
@@ -2747,7 +2747,7 @@ LICENSE:${PN}-cadence-license = "Firmware-cadence"
 FILES:${PN}-cadence-license = "${nonarch_base_libdir}/firmware/LICENCE.cadence"
 
 LICENSE:${PN}-mhdp8546 = "Firmware-cadence"
-FILES:${PN}-mhdp8546 = "${nonarch_base_libdir}/firmware/cadence/mhdp8546.bin"
+FILES:${PN}-mhdp8546 = "${nonarch_base_libdir}/firmware/cadence/mhdp8546.bin*"
 RDEPENDS:${PN}-mhdp8546 = "${PN}-cadence-license"
 
 # For nitrox - Cavium CNN55XX crypto driver
@@ -2763,51 +2763,51 @@ LICENSE:${PN}-bfa-license = "Firmware-bfa"
 FILES:${PN}-bfa-license = "${nonarch_base_libdir}/firmware/LICENSE.bfa"
 
 LICENSE:${PN}-cbfw = "Firmware-bfa"
-FILES:${PN}-cbfw = "${nonarch_base_libdir}/firmware/cbfw-3.2.5.1.bin"
+FILES:${PN}-cbfw = "${nonarch_base_libdir}/firmware/cbfw-3.2.5.1.bin*"
 RDEPENDS:${PN}-cbfw = "${PN}-bfa-license"
 
 LICENSE:${PN}-ctfw = "Firmware-bfa"
-FILES:${PN}-ctfw = "${nonarch_base_libdir}/firmware/ctfw-3.2.5.1.bin"
+FILES:${PN}-ctfw = "${nonarch_base_libdir}/firmware/ctfw-3.2.5.1.bin*"
 RDEPENDS:${PN}-ctfw = "${PN}-bfa-license"
 
 LICENSE:${PN}-ct2fw = "Firmware-bfa"
-FILES:${PN}-ct2fw = "${nonarch_base_libdir}/firmware/ct2fw-3.2.5.1.bin"
+FILES:${PN}-ct2fw = "${nonarch_base_libdir}/firmware/ct2fw-3.2.5.1.bin*"
 RDEPENDS:${PN}-ct2fw = "${PN}-bfa-license"
 
 # For pcnet_cs - NE2000 compatible PCMCIA adapter
 FILES:${PN}-pcnet-cs = " \
-    ${nonarch_base_libdir}/firmware/cis/LA-PCM.cis \
-    ${nonarch_base_libdir}/firmware/cis/PCMLM28.cis \
-    ${nonarch_base_libdir}/firmware/cis/DP83903.cis \
-    ${nonarch_base_libdir}/firmware/cis/NE2K.cis \
-    ${nonarch_base_libdir}/firmware/cis/tamarack.cis \
-    ${nonarch_base_libdir}/firmware/cis/PE-200.cis \
-    ${nonarch_base_libdir}/firmware/cis/PE520.cis \
+    ${nonarch_base_libdir}/firmware/cis/LA-PCM.cis* \
+    ${nonarch_base_libdir}/firmware/cis/PCMLM28.cis* \
+    ${nonarch_base_libdir}/firmware/cis/DP83903.cis* \
+    ${nonarch_base_libdir}/firmware/cis/NE2K.cis* \
+    ${nonarch_base_libdir}/firmware/cis/tamarack.cis* \
+    ${nonarch_base_libdir}/firmware/cis/PE-200.cis* \
+    ${nonarch_base_libdir}/firmware/cis/PE520.cis* \
 "
 LICENSE:${PN}-pcnet-cs = "GPL-2.0-only & MPL-1.1"
 
 # For 3c589_cs - 3Com PCMCIA adapter
-FILES:${PN}-3c589-cs = "${nonarch_base_libdir}/firmware/cis/3CXEM556.cis"
+FILES:${PN}-3c589-cs = "${nonarch_base_libdir}/firmware/cis/3CXEM556.cis*"
 LICENSE:${PN}-3c589-cs = "GPL-2.0-only & MPL-1.1"
 
 # For 3c574-cs - 3Com PCMCIA adapter
-FILES:${PN}-3c574-cs = "${nonarch_base_libdir}/firmware/cis/3CCFEM556.cis"
+FILES:${PN}-3c574-cs = "${nonarch_base_libdir}/firmware/cis/3CCFEM556.cis*"
 LICENSE:${PN}-3c574-cs = "GPL-2.0-only & MPL-1.1"
 
 # For serial_cs - Serial PCMCIA adapter (pcmcia-cs project)
 FILES:${PN}-serial-cs = " \
-    ${nonarch_base_libdir}/firmware/cis/MT5634ZLX.cis \
-    ${nonarch_base_libdir}/firmware/cis/RS-COM-2P.cis \
-    ${nonarch_base_libdir}/firmware/cis/COMpad2.cis \
-    ${nonarch_base_libdir}/firmware/cis/COMpad4.cis \
+    ${nonarch_base_libdir}/firmware/cis/MT5634ZLX.cis* \
+    ${nonarch_base_libdir}/firmware/cis/RS-COM-2P.cis* \
+    ${nonarch_base_libdir}/firmware/cis/COMpad2.cis* \
+    ${nonarch_base_libdir}/firmware/cis/COMpad4.cis* \
 "
 LICENSE:${PN}-serial-cs = "GPL-2.0-only & MPL-1.1"
 
 # For Sierra Wireless serial_cs - Serial PCMCIA adapter
 FILES:${PN}-sw-serial = " \
-    ${nonarch_base_libdir}/firmware/cis/SW_555_SER.cis \
-    ${nonarch_base_libdir}/firmware/cis/SW_7xx_SER.cis \
-    ${nonarch_base_libdir}/firmware/cis/SW_8xx_SER.cis \
+    ${nonarch_base_libdir}/firmware/cis/SW_555_SER.cis* \
+    ${nonarch_base_libdir}/firmware/cis/SW_7xx_SER.cis* \
+    ${nonarch_base_libdir}/firmware/cis/SW_8xx_SER.cis* \
 "
 LICENSE:${PN}-sw-serial = "GPL-3.0-only"
 
@@ -2817,19 +2817,19 @@ FILES:${PN}-siano-license = "${nonarch_base_libdir}/firmware/LICENCE.siano"
 
 LICENSE:${PN}-smsmdtv = "Firmware-siano"
 FILES:${PN}-smsmdtv = " \
-    ${nonarch_base_libdir}/firmware/cmmb_vega_12mhz.inp \
-    ${nonarch_base_libdir}/firmware/cmmb_venice_12mhz.inp \
-    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz.inp \
-    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz_b0.inp \
-    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz.inp \
-    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz_b0.inp \
-    ${nonarch_base_libdir}/firmware/isdbt_rio.inp \
-    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-dvbt-02.fw \
-    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-isdbt-02.fw \
-    ${nonarch_base_libdir}/firmware/sms1xxx-nova-a-dvbt-01.fw \
-    ${nonarch_base_libdir}/firmware/sms1xxx-nova-b-dvbt-01.fw \
-    ${nonarch_base_libdir}/firmware/sms1xxx-stellar-dvbt-01.fw \
-    ${nonarch_base_libdir}/firmware/tdmb_nova_12mhz.inp \
+    ${nonarch_base_libdir}/firmware/cmmb_vega_12mhz.inp* \
+    ${nonarch_base_libdir}/firmware/cmmb_venice_12mhz.inp* \
+    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz.inp* \
+    ${nonarch_base_libdir}/firmware/dvb_nova_12mhz_b0.inp* \
+    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz.inp* \
+    ${nonarch_base_libdir}/firmware/isdbt_nova_12mhz_b0.inp* \
+    ${nonarch_base_libdir}/firmware/isdbt_rio.inp* \
+    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-dvbt-02.fw* \
+    ${nonarch_base_libdir}/firmware/sms1xxx-hcw-55xxx-isdbt-02.fw* \
+    ${nonarch_base_libdir}/firmware/sms1xxx-nova-a-dvbt-01.fw* \
+    ${nonarch_base_libdir}/firmware/sms1xxx-nova-b-dvbt-01.fw* \
+    ${nonarch_base_libdir}/firmware/sms1xxx-stellar-dvbt-01.fw* \
+    ${nonarch_base_libdir}/firmware/tdmb_nova_12mhz.inp* \
 "
 RDEPENDS:${PN}-smsmdtv = "${PN}-siano-license"
 
@@ -2843,8 +2843,8 @@ FILES:${PN}-ca0132-license = "${nonarch_base_libdir}/firmware/LICENCE.ca0132"
 
 LICENSE:${PN}-ca0132 = "Firmware-ca0132"
 FILES:${PN}-ca0132 = " \
-    ${nonarch_base_libdir}/firmware/ctefx.bin \
-    ${nonarch_base_libdir}/firmware/ctspeq.bin \
+    ${nonarch_base_libdir}/firmware/ctefx.bin* \
+    ${nonarch_base_libdir}/firmware/ctspeq.bin* \
 "
 RDEPENDS:${PN}-ca0132 = "${PN}-ca0132-license"
 
@@ -2881,7 +2881,7 @@ LICENSE:${PN}-dib0700-license = "Firmware-dib0700"
 FILES:${PN}-dib0700-license = "${nonarch_base_libdir}/firmware/LICENSE.dib0700"
 
 LICENSE:${PN}-dib0700 = "Firmware-dib0700"
-FILES:${PN}-dib0700 = "${nonarch_base_libdir}/firmware/dvb-usb-dib0700-1.20.fw"
+FILES:${PN}-dib0700 = "${nonarch_base_libdir}/firmware/dvb-usb-dib0700-1.20.fw*"
 RDEPENDS:${PN}-dib0700 = "${PN}-dib0700-license"
 
 # For it9135 - ITEtech IT913x DVB-T USB driver
@@ -2897,7 +2897,7 @@ LICENSE:${PN}-drxk-license = "Firmware-drxk"
 FILES:${PN}-drxk-license = "${nonarch_base_libdir}/firmware/LICENSE.drxk"
 
 LICENSE:${PN}-drxk = "Firmware-drxk"
-FILES:${PN}-drxk = "${nonarch_base_libdir}/firmware/dvb-usb-terratec-h5-drxk.fw"
+FILES:${PN}-drxk = "${nonarch_base_libdir}/firmware/dvb-usb-terratec-h5-drxk.fw*"
 RDEPENDS:${PN}-drxk = "${PN}-drxk-license"
 
 # For e100 - Intel PRO/100 Ethernet NIC
@@ -2973,8 +2973,8 @@ FILES:${PN}-intcsst2-license = "${nonarch_base_libdir}/firmware/LICENCE.IntcSST2
 
 LICENSE:${PN}-snd-soc-catpt = "Firmware-IntcSST2"
 FILES:${PN}-snd-soc-catpt = " \
-    ${nonarch_base_libdir}/firmware/intel/catpt/bdw/dsp_basefw.bin \
-    ${nonarch_base_libdir}/firmware/intel/IntcSST2.bin \
+    ${nonarch_base_libdir}/firmware/intel/catpt/bdw/dsp_basefw.bin* \
+    ${nonarch_base_libdir}/firmware/intel/IntcSST2.bin* \
 "
 RDEPENDS:${PN}-snd-soc-catpt = "${PN}-intcsst2-license"
 
@@ -3010,9 +3010,9 @@ FILES:${PN}-ipu3-firmware-license = "${nonarch_base_libdir}/firmware/LICENSE.ipu
 
 LICENSE:${PN}-ipu3-imgu = "Firmware-ipu3_firmware"
 FILES:${PN}-ipu3-imgu = " \
-    ${nonarch_base_libdir}/firmware/intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin \
-    ${nonarch_base_libdir}/firmware/intel/ipu3-fw.bin \
-    ${nonarch_base_libdir}/firmware/intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin \
+    ${nonarch_base_libdir}/firmware/intel/ipu/irci_irci_ecr-master_20161208_0213_20170112_1500.bin* \
+    ${nonarch_base_libdir}/firmware/intel/ipu3-fw.bin* \
+    ${nonarch_base_libdir}/firmware/intel/irci_irci_ecr-master_20161208_0213_20170112_1500.bin* \
 "
 RDEPENDS:${PN}-ipu3-imgu = "${PN}-ipu3-firmware-license"
 
@@ -3079,7 +3079,7 @@ RDEPENDS:${PN}-myri10ge = "${PN}-myri10ge-firmware-license"
 
 # For smc91c92_cs - SMC 91Cxx PCMCIA
 LICENSE:${PN}-smc91c92-cs = "GPL-1.0-only"
-FILES:${PN}-smc91c92-cs = "${nonarch_base_libdir}/firmware/ositech/Xilinx7OD.bin"
+FILES:${PN}-smc91c92-cs = "${nonarch_base_libdir}/firmware/ositech/Xilinx7OD.bin*"
 
 # For qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
 LICENSE:${PN}-qla1280-license = "Firmware-qla1280"
@@ -3087,9 +3087,9 @@ FILES:${PN}-qla1280-license = "${nonarch_base_libdir}/firmware/LICENCE.qla1280"
 
 LICENSE:${PN}-qla1280 = "Firmware-qla1280"
 FILES:${PN}-qla1280 = " \
-    ${nonarch_base_libdir}/firmware/qlogic/1040.bin \
-    ${nonarch_base_libdir}/firmware/qlogic/1280.bin \
-    ${nonarch_base_libdir}/firmware/qlogic/12160.bin \
+    ${nonarch_base_libdir}/firmware/qlogic/1040.bin* \
+    ${nonarch_base_libdir}/firmware/qlogic/1280.bin* \
+    ${nonarch_base_libdir}/firmware/qlogic/12160.bin* \
 "
 RDEPENDS:${PN}-qla1280 = "${PN}-qla1280-license"
 
@@ -3098,7 +3098,7 @@ LICENSE:${PN}-ib-qib-license = "Firmware-ib_qib"
 FILES:${PN}-ib-qib-license = "${nonarch_base_libdir}/firmware/LICENSE.ib_qib"
 
 LICENSE:${PN}-ib-qib = "Firmware-ib_qib"
-FILES:${PN}-ib-qib = "${nonarch_base_libdir}/firmware/qlogic/sd7220.fw"
+FILES:${PN}-ib-qib = "${nonarch_base_libdir}/firmware/qlogic/sd7220.fw*"
 RDEPENDS:${PN}-ib-qib = "${PN}-ib-qib-license"
 
 # For xhci-rcar - Renesas R-Car Gen2/3 USB 3.0 host controller driver
@@ -3126,7 +3126,7 @@ LICENSE:${PN}-rp2-license = "Firmware-rp2"
 FILES:${PN}-rp2-license = "${nonarch_base_libdir}/firmware/LICENSE.rp2"
 
 LICENSE:${PN}-rp2 = "Firmware-rp2"
-FILES:${PN}-rp2 = "${nonarch_base_libdir}/firmware/rp2.fw"
+FILES:${PN}-rp2 = "${nonarch_base_libdir}/firmware/rp2.fw*"
 RDEPENDS:${PN}-rp2 = "${PN}-rp2-license"
 
 # For s5p-mfc - Samsung MFC video encoder/decoder driver
@@ -3182,7 +3182,7 @@ LICENSE:${PN}-montage-license = "Firmware-montage"
 FILES:${PN}-montage-license = "${nonarch_base_libdir}/firmware/LICENSE.montage"
 
 LICENSE:${PN}-mont-tsse = "Firmware-montage"
-FILES:${PN}-mont-tsse = "${nonarch_base_libdir}/firmware/tsse_firmware.bin"
+FILES:${PN}-mont-tsse = "${nonarch_base_libdir}/firmware/tsse_firmware.bin*"
 RDEPENDS:${PN}-mont-tsse = "${PN}-montage-license"
 
 # For ueagle-atm - Driver for USB ADSL Modems based on Eagle IV Chipset
@@ -3191,9 +3191,9 @@ FILES:${PN}-ueagle-atm4-firmware-license = "${nonarch_base_libdir}/firmware/LICE
 
 LICENSE:${PN}-ueagle-atm = "Firmware-ueagle-atm4-firmware"
 FILES:${PN}-ueagle-atm = " \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/CMV4p.bin.v2 \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/DSP4p.bin \
-    ${nonarch_base_libdir}/firmware/ueagle-atm/eagleIV.fw \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/CMV4p.bin.v2* \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/DSP4p.bin* \
+    ${nonarch_base_libdir}/firmware/ueagle-atm/eagleIV.fw* \
 "
 RDEPENDS:${PN}-ueagle-atm = "${PN}-ueagle-atm4-firmware-license"
 
-- 
2.51.0


