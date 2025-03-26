Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239EBC36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:22 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.33435.1743021012342802827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CK3HKqpK;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30332dfc821so305795a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021011; x=1743625811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjRFR5rFqaTKmkyhzRmM3yl5W2vcGR0Z+GsrhWRPSEk=;
        b=CK3HKqpKl/UxV/Sh7FA1yojznQLzYhVov1g/Q16qJIFu5q03ALbD2oBKKBlIaPvGfe
         3QA36ugZW4L4lvtuqbXKbvPHDnHe9M8y0gb1N/1+9wWHcg9Zeq9LeUeidfBFoItYN6S3
         /O0ziZt7VOi1LsK7yKwX+rGhLLoApj/NTStB408QfLZhDsKyQYaWEMszvHqUhmUsL0Yg
         /x2yX8Od4xBik4hWI2M1X7I4OjIWDwcPAowlE4MBjK+Dxp8PIp/I4A/VcFr8TonC6YS5
         V7S/u8HmSSyzWDfaS9wb6IMiqWmzDyiJPpokNhK1PIDJJRn/eWuFum0eDg2Pf0xOequM
         YW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021011; x=1743625811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjRFR5rFqaTKmkyhzRmM3yl5W2vcGR0Z+GsrhWRPSEk=;
        b=E/5/0r5RuSrW7s4fRE7fUrCyzAsSlcMDYIDDNhVMbuttZAiDQLTZJs5ACAy3fdtonH
         2Ynh3z/PwKz51CSU9gF7JdvK894uyEysIkLcDYF6FGbeq0WKLjEj/15nyaNK3m5sH9hZ
         BPjhDUfi5R4Zqtpsv2LtXiQQ5fD3juh49mpfZJeUFW3a3Zvw3JY0CLAg4n12UASVUtMX
         kryyKLimr6jBm0z4p3h6dL2UzcggOaNQ+mg3hgJugaznXF3jJB0upXv/z9W1wT05OPFn
         B/nakY/5L4wpwEZ3L8bATGg/3xdbVgV8rv5xJMntgRdBWGuZ1ZcQzeC3zJ3aBuj7ZzU0
         qyOg==
X-Gm-Message-State: AOJu0Yz5mPwfNoiGh8HVb09dz/EAXa1FJeV33cxVtuA/RCWsUZG+s4Dl
	ipDHk1lsGY6XJqLobrJQbpg3AZ7Oq0kIBzn/YDZOa1U4WsM1VYHqaLOKG+2M
X-Gm-Gg: ASbGncunGGAFBpWYCZ0jr2Ha+bCAZ2WtStgx9VCxNEAx0uryZnhqb0E2jPEcPJELY6q
	VCunoCCZF2mK3hTo8sYtpcd60DWo68ITvPIZpJdqn4Wu+9QAdskMZd1+TuV9KXV0dijKUIZwUHN
	JDtXa+ROemkeDyBnkq2QJgo1xI97mL3G1/d4lh2/LdiUYAZ2I++Vz3XnfwPTdf/MAncNK8frwI5
	dPba35/x9hfovjPsSELbV7kgimJv4sbMR9qKXZA13Hu69/XogzBhm+6NQVG2+5aKnZ5vW1TR3hB
	Qm/sEh03HICTeqkIjvhziViwSZh71diU339m3J6d1wVhyKRWnhcg44WwNb/Gthf3Y4U=
X-Google-Smtp-Source: AGHT+IHaXpRhNj0LAVQacZbFhLLUppBjlQXrQMuMsMw9js1yqPl1DO7BL/uDtarMR1pcljDd0evJqw==
X-Received: by 2002:a17:90a:c888:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-303a7d5b683mr1519125a91.3.1743021011223;
        Wed, 26 Mar 2025 13:30:11 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:10 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 26/31] linux-firmware: upgrade 20250109 -> 20250211
Date: Wed, 26 Mar 2025 17:28:12 -0300
Message-Id: <20250326202817.64437-27-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213686

From: Vivek Puar <quic_vpuar@quicinc.com>

Add DSP firmware for Qualcomm SA8775P / QCS9100
platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
packages, and updating it with correct license information.

Add QCA6698AQ package ${PN}-ath11k-qca6698aq
to ath11k firmware.

Add bluetooth WCN3950 package ${PN}-qca-wcn3950,
bluetooth QCA6698 package ${PN}-qca-qca6698
to qca firmware.

Add two more WCN3950 1.3 NVM files to
${PN}-qca-wcn3950 package.

Add device specific ath11k firmware to QCM6490
boards in ${PN}-qcom-qcm6490-wifi package.

Add Firmware files for Lenovo T14s G6 Qualcomm platform
to ${PN}-qcom-x1e80100-lenovo-t14s-g6-{adreno, audio, compute}
packages.

License-Update: additional files

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6148a282509106879388138fe682721d07968452)
---
 ...20250109.bb => linux-firmware_20250211.bb} | 63 +++++++++++++++++--
 1 file changed, 58 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (96%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
similarity index 96%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index b9323007420c..695788e31d05 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -55,6 +55,7 @@ LICENSE = "\
     & Firmware-powervr \
     & Firmware-qat \
     & Firmware-qcom \
+    & Firmware-qcom-2 \
     & Firmware-qcom-yamato \
     & Firmware-qla1280 \
     & Firmware-qla2xxx \
@@ -132,6 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \
                     file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
+                    file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
                     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
                     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
@@ -158,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
+WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,6 +214,7 @@ NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
+NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
 NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
 NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
@@ -247,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
+SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
 
 inherit allarch
 
@@ -389,6 +392,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath11k-ipq8074 \
              ${PN}-ath11k-qca2066 \
              ${PN}-ath11k-qca6390 \
+             ${PN}-ath11k-qca6698aq \
              ${PN}-ath11k-qcn9074 \
              ${PN}-ath11k-wcn6750 \
              ${PN}-ath11k-wcn6855 \
@@ -401,6 +405,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-qca61x4-serial \
              ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
+             ${PN}-qca-qca6698 \
+             ${PN}-qca-wcn3950 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
@@ -461,7 +467,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-prestera \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qed \
-             ${PN}-qcom-license ${PN}-qcom-yamato-license \
+             ${PN}-qcom-license ${PN}-qcom-2-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-aic100 ${PN}-qcom-qdu100 \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
@@ -472,11 +478,12 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
-             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa \
+             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
              ${PN}-qcom-qcs615-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
-             ${PN}-qcom-sa8775p-adreno \
+             ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
+             ${PN}-qcom-sa8775p-generalpurpose \
              ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
              ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
              ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
@@ -489,6 +496,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -584,6 +593,7 @@ LICENSE:${PN}-ath11k-ipq6018 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-ipq8074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qca6390 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath11k-qca6698aq = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
@@ -595,6 +605,8 @@ LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca6698 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn3950 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
@@ -629,6 +641,7 @@ FILES:${PN}-ath11k-ipq6018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ6018"
 FILES:${PN}-ath11k-ipq8074 = "${nonarch_base_libdir}/firmware/ath11k/IPQ8074"
 FILES:${PN}-ath11k-qca2066 = "${nonarch_base_libdir}/firmware/ath11k/QCA2066"
 FILES:${PN}-ath11k-qca6390 = "${nonarch_base_libdir}/firmware/ath11k/QCA6390"
+FILES:${PN}-ath11k-qca6698aq = "${nonarch_base_libdir}/firmware/ath11k/QCA6698AQ"
 FILES:${PN}-ath11k-qcn9074 = "${nonarch_base_libdir}/firmware/ath11k/QCN9074"
 FILES:${PN}-ath11k-wcn6750 = "${nonarch_base_libdir}/firmware/ath11k/WCN6750"
 FILES:${PN}-ath11k-wcn6855 = "${nonarch_base_libdir}/firmware/ath11k/WCN6855"
@@ -660,6 +673,20 @@ FILES:${PN}-qca-qca6390 = " \
   ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
   ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
 "
+FILES:${PN}-qca-qca6698 = " \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b206 \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207 \
+  ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin \
+"
+FILES:${PN}-qca-wcn3950 = " \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv \
+  ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv \
+  ${nonarch_base_libdir}/firmware/qca/cmnv12.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13s.bin \
+  ${nonarch_base_libdir}/firmware/qca/cmnv13t.bin \
+"
 FILES:${PN}-qca-wcn3988 = " \
   ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
   ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
@@ -745,6 +772,7 @@ RDEPENDS:${PN}-ath11k-ipq6018 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-ipq8074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qca6390 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath11k-qca6698aq += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qcn9074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
@@ -757,6 +785,8 @@ RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca6698 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn3950 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
@@ -1739,6 +1769,7 @@ FILES:${PN}-linaro-license   = "${nonarch_base_libdir}/firmware/LICENCE.linaro"
 
 # For QCOM VPU/GPU and SDM845
 LICENSE:${PN}-qcom-license = "Firmware-qcom"
+LICENSE:${PN}-qcom-2-license = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-yamato-license = "Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-aic100 = "Firmware-qcom"
 LICENSE:${PN}-qcom-qdu100 = "Firmware-qcom"
@@ -1771,6 +1802,7 @@ LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
@@ -1778,6 +1810,9 @@ LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-compute = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sa8775p-generalpurpose = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
@@ -1795,8 +1830,12 @@ LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
+FILES:${PN}-qcom-2-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom-2"
 FILES:${PN}-qcom-yamato-license = "${nonarch_base_libdir}/firmware/LICENSE.qcom_yamato"
 
 FILES:${PN}-qcom-aic100 = "${nonarch_base_libdir}/firmware/qcom/aic100/*"
@@ -1835,6 +1874,7 @@ FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]64
 FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
+FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
@@ -1842,6 +1882,9 @@ FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
 FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
 FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
+FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
+FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
+FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
@@ -1861,6 +1904,9 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
 
 RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
@@ -1897,6 +1943,7 @@ RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
 RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
@@ -1906,6 +1953,9 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
 # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
 RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
 RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sa8775p-generalpurpose = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
@@ -1923,6 +1973,9 @@ RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.5


