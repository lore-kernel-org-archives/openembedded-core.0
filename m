Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE40D5AE7A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2917.1765620125316500041
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BI6QDLgh;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f0f875bc5so24828515ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620124; x=1766224924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ36SqFVXwG39sD3MuHHPJ31oEnShJLpRSsOQsdM5Ro=;
        b=BI6QDLghtKjW1jIS/HD/Q19PRaHGS+GuihBNQljtUFffFLZt1Z1dpBnhOtIhd3EIf3
         17tnPgWHP7wvqCuhksBtJMlSEUkAAJrX5/jI+W9aN8s7uzHvRShfKtZfSgrs/PSuPDja
         yH+AMU1giqdg6VRs8Y4ot8onU5PNMnltKsJ3X2lD3UsxldsN9X/u2PG41Bm0/XIQbUm7
         MBqAEkDrxYCtAsbfvyMV9WC4O3AxoWANgvmexJIsa+I3eX44V/YectTuPT1m4quk2x6W
         6c3ysHLvzAzUCZOU2K5VSGozpFsc+YQkzVhllmv7/XAI7N6zDrPUFMycUntP+18oBRd0
         posg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620124; x=1766224924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQ36SqFVXwG39sD3MuHHPJ31oEnShJLpRSsOQsdM5Ro=;
        b=U85dp3XOnDUEWLSRF3+WSp/eB2d6uvzer7V9FcB687aUkLArHs4mlocsWtjP5wGG+e
         pQ2NBWUvIjlKEHY1znDEMGOmk4RTNkeyf1xo29q2zvLzENpR/z7WnYJIe51E408KPFPn
         fhU+ANVVOXybgXvAQa10n+caYVLLx1wwzV1ko8Gbg0sc8R6i5aavVysM0SUeDorDtFVp
         wmkB4KOPC+Xe2E+0X3qacwoqWASxEB/H0XpnFIHImp7oKfmco5bMdweECwmzGS5jhC2S
         wlNpMf6PWOWI954yCj8FZm77lOrSyODIP03t7F5z3rE6prUcLquK0O3MIS3cxvqQcq9/
         NcsA==
X-Gm-Message-State: AOJu0YyI66kSBapyNw7sc1Vnj7AchbX5YNwCzOFWF4skxUXOM+MInhCD
	nkWyzXd674Ol9yZYfcYoxLAaY1WexOHsCesdZVuBU1TMDhDD5PQ1KHnDCIAsEjGT
X-Gm-Gg: AY/fxX5xH/1+SMRM6dPKMFoeWjonAiByvd+Kv4DlfFTnzzAKHAqYV5B9/H6ADQKhIh4
	ki9lWo5j1LIuG+jAe9IKap9+lsd5sBboIsIk63X+2T1hNrh82Uc0sSneFH9AAKxP5mfyns8eph0
	mjJdZdGmsF2o7tEtoFUmedzEIgH1+T9ZYbxtj87zN9mWlNrFAtv0u3sBh/i9lzanNXZxGMgcik8
	wyh5JKGdGbENQkTbAJMysA0pVmwpxiDjyoIjEoXUco+g5czQ+rZuoOM0YrozWVUmUzbA45N7ILu
	RMiop1BDbekf/LVSzhcGujIqR+qXLWyHa4DGIpl4PjMyUeygCjeT8uQopaRPepBIr1TdTRGW328
	7iUn2qPwvcnb4qVN3dZ9rz8hpSMFitrPdtU0ea3I49aptPBKOG4rTt7pA2SbGCeKoyZRW5B0kNR
	J9h1Qe3CC0MiJVRa2+LZeTOESv
X-Google-Smtp-Source: AGHT+IFUwbMadUFr12TCSNd8Da/ZgnDZHWIzz8De65+PCEMi9T4EED2l4b0p8UvR2PAEK6WlP6ZJ3A==
X-Received: by 2002:a17:902:f70a:b0:2a0:9d01:c3c1 with SMTP id d9443c01a7336-2a09d01d4a9mr6734045ad.1.1765620124487;
        Sat, 13 Dec 2025 02:02:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Puar <vpuar@qti.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 52/67] linux-firmware: upgrade 20251111 -> 20251125
Date: Sat, 13 Dec 2025 15:29:16 +0530
Message-ID: <20251213095931.2571498-52-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227670

From: Vivek Puar <vpuar@qti.qualcomm.com>

Upgrade the firmware package to latest release. Add CS42L45 SDCA
codec firmware for dell laptops, and some several Qualcomm packages.
Update license for Qualcomm kaanapali packages, update order of
${PN}-qcom-sm8350-adreno alphabetically.

License-Update: new and updated firmware

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2a9b0bcaf04a5a10898fead41fa666a280fa474)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...20251111.bb => linux-firmware_20251125.bb} | 55 ++++++++++++++-----
 1 file changed, 40 insertions(+), 15 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251111.bb => linux-firmware_20251125.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
index eda42cf855..ff84a3c464 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251111.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
@@ -312,7 +312,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "4a2863b38b43abbc3a09b24ece7d1196"
+WHENCE_CHKSUM  = "fc952a29d75c7b9a0c620bf1e7232d35"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -449,7 +449,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "ab57a1526595090bb4874c35335e2252288dcbea546eff491654b2313438a47d"
+SRC_URI[sha256sum] = "eb807a01c52882ac97ef5b678d4a246b209e6165ac1287d62a5f93a09ee93cd2"
 
 inherit allarch
 
@@ -603,7 +603,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-bcm43xx \
              ${PN}-bcm43xx-hdr \
              ${PN}-bcm54591 \
-             ${PN}-cirrus-license ${PN}-cirrus \
+             ${PN}-cirrus-license ${PN}-cirrus ${PN}-cirrus-cs42l45 \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
@@ -641,6 +641,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
+             ${PN}-qca-wcn685x \
              ${PN}-qca-qca2066 \
              ${PN}-qca-wcn7850 \
              \
@@ -715,6 +716,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
              ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
              ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio \
+             ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
              ${PN}-qcom-qrb4210-adreno \
@@ -729,12 +731,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
-             ${PN}-qcom-sdx61-foxconn-firehose \
+             ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
+             ${PN}-qcom-sm8350-adreno \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-sm8350-adreno \
+             ${PN}-qcom-sm8750-audio ${PN}-qcom-sm8750-compute \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
@@ -931,6 +934,7 @@ LICENSE:${PN}-qca-wcn3950 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn685x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
 
@@ -1018,6 +1022,11 @@ FILES:${PN}-qca-wcn6750 = " \
   ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
   ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
 "
+FILES:${PN}-qca-wcn685x = " \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b* \
+  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b* \
+"
 FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
@@ -1094,6 +1103,7 @@ RDEPENDS:${PN}-qca-wcn3950 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn685x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
 # For ralink
@@ -2019,15 +2029,18 @@ RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
 
 # For cirrus
 LICENSE:${PN}-cirrus = "Firmware-cirrus"
+LICENSE:${PN}-cirrus-cs42l45 = "Firmware-cirrus"
 LICENSE:${PN}-cirrus-license = "Firmware-cirrus"
 
 FILES:${PN}-cirrus = " \
     ${nonarch_base_libdir}/firmware/cs42l43.bin* \
     ${nonarch_base_libdir}/firmware/cirrus/* \
 "
+FILES:${PN}-cirrus-cs42l45 = "${nonarch_base_libdir}/firmware/sdca/1fa/1028/*"
 FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
 
 RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
+RDEPENDS:${PN}-cirrus-cs42l45 += "${PN}-cirrus-license"
 
 # For cnm
 LICENSE:${PN}-cnm = "Firmware-cnm"
@@ -2275,9 +2288,9 @@ LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom"
-LICENSE:${PN}-qcom-kaanapali-soccp = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-kaanapali-soccp = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
@@ -2292,6 +2305,7 @@ LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
+LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
@@ -2317,14 +2331,17 @@ LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
-LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
-LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8750-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sm8750-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
@@ -2395,6 +2412,7 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
     "
+FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
@@ -2426,14 +2444,17 @@ FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/c
 FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp* \
                                  ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
+FILES:${PN}-qcom-sdx35-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
+FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
-FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
+FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*"
+FILES:${PN}-qcom-sm8750-compute = "${nonarch_base_libdir}/firmware/qcom/sm8750/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
@@ -2480,9 +2501,9 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-kaanapali-soccp = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2501,6 +2522,7 @@ RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2528,14 +2550,17 @@ RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8750-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sm8750-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"

