Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D4EC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:32 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.33442.1743021022279890131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MKPpQAC1;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so2904760a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021021; x=1743625821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkCU0rclDMHId8F23fIurt8kEpyrZuX1Z8UtU0d73D8=;
        b=MKPpQAC1vu+5rQex6svWbIySuGtFqOers7jtgOAjyj+XzCgaqYn/LRfvSXrbVpIxw8
         oLQvxDwuEVQdAX8wjDMmaur/N3CdxCvNtwigpyvfb3mOPRsIrldT03jJ8KwqC5VHQntd
         e3fiCtvsqTGrevMEY7UQ9tbILHjPKS1QgZrsNjqaxHbZ3l4+z1lpu4Ge832zVfIPgrjV
         h9j6n59GVTbC+b/wgcwmw8KJkUOGWT9NoQNNdFlDZiLO1mTGz5xgc2TVq4OCmp7pfgIA
         fbSedla3Ll+gIN6Bw7KYEIGWwfyignb+/Tse7Vvl+9v1BwdmvQfzhwOKdo9J9nv3BDu0
         wQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021021; x=1743625821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkCU0rclDMHId8F23fIurt8kEpyrZuX1Z8UtU0d73D8=;
        b=xDn69s9raOvsxY4/PQCf/iXZrpZK8VG4JVpbzpMsBkemGsn/ePdoNF70LJR2MWp1wA
         6xxBA+nfLP7dzC3ldpI0fktTuaS6+uhil6epAhwsnltUIGz6tj/JnTxwasN2PxeAUhQr
         UlKtoCjBIIdDeGOoa1izhMY6xBecr9WMhiodWJHGBJlkpd2kWQ6mzx70tfGMC3X98Wa6
         FiL6pVTPGdDWttKFPavvv1SUg8euxQI6nsxSuMb8BX0rvGOCYk1la5i9IWh8tBm8jyYs
         xZASSTtMxN32I7Ax2Mhz8uB0SXGUGn3Cqjrd65tKoC3YqlAkWpOqL3K+w5T1tfm6+ndS
         UPCA==
X-Gm-Message-State: AOJu0Yzu9OWF8e0sIYcM1cuCGrQ0esZY9e5U5UkfTPIAdJOxOfAx7Mga
	+naps1/+nnqC7j383sZJRjZ4PUrE6715dBdyHp3bETeXA8RsK0scPkUB5dLT
X-Gm-Gg: ASbGncuH8BXHoBjctk0C5WTBN36+NZGfkRurJjXZg23+mdYPh5g6B0e+L29+bSJvAR4
	4IQCxJ0P1WQyEpfyptPA6WpcNF/nwKv9oOqNFG9eDAG6W0wkL3SF15TJk0SsCQk8y8GBqLNxWEs
	xIUxhwr6QmX0pZmTvTDud2n6Fjt2RVPpxjMnZ0Mm72Bc65u7UYPgBpWab/UmMZmzocDB5NpuWI8
	oMuE57vyp9BkykzwNkx+flyoT5lb3OR9E+80wwVTwRNziNE8uVGC8zVSvTbnK4aYzQw2OA3+2R0
	nMPbrmF3sPr//lH7XFGKLKRSHzp3KBBJn09LTGlEzC8A8SajCKLbcMO+cSYga0LFh6Y=
X-Google-Smtp-Source: AGHT+IFTXAclX9X99tAhAs8LfhfskIjzpkhDmKLtGoORBAfsMJr2RZ0w11UBKgLruy1q4Rr6ZIlvDQ==
X-Received: by 2002:a17:90b:2396:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-303a667bea8mr1388345a91.10.1743021021270;
        Wed, 26 Mar 2025 13:30:21 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:20 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vivek Puar <quic_vpuar@quicinc.com>
Subject: [styhead][PATCH v2 30/31] linux-firmware: upgrade 20250211 -> 20250311
Date: Wed, 26 Mar 2025 17:28:16 -0300
Message-Id: <20250326202817.64437-31-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213690

From: Vivek Puar <quic_vpuar@quicinc.com>

Add gpu firmwares for qcs8300 chipset to
${PN}-qcom-adreno-a623 and
${PN}-qcom-qcs8300-adreno packages

Add bluetooth firmwares for QCA2066
to ${PN}-qca-qca2066 package.

Add firmware files for Adreno A225
to ${PN}-qcom-adreno-a2xx package

License-Update: additional files

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3a36b736802a06667f88903f75cd2d52770cd79)
---
 ...20250211.bb => linux-firmware_20250311.bb} | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250211.bb => linux-firmware_20250311.bb} (98%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
similarity index 98%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 68e0a3b1e4ae..1a2a6b095e1b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
+WHENCE_CHKSUM  = "886924eb733c4efcec21dff980795771"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
+SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
 
 inherit allarch
 
@@ -472,14 +472,14 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
-             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
+             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
-             ${PN}-qcom-qcs615-adreno \
+             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs8300-adreno \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
@@ -717,6 +717,8 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.30a* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.30a* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
@@ -739,6 +741,9 @@ FILES:${PN}-qca-qca2066 = " \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
   ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
+  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \
 "
 FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
@@ -1783,6 +1788,7 @@ LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
 LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a623 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
@@ -1804,6 +1810,7 @@ LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1851,10 +1858,11 @@ FILES:${PN}-qcom-vpu = " \
     ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
     ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
 "
-FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw*"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw* ${nonarch_base_libdir}/firmware/qcom/a2*_*.fw*"
 FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw* ${nonarch_base_libdir}/firmware/a300_*.fw*"
 FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
+FILES:${PN}-qcom-adreno-a623 = "${nonarch_base_libdir}/firmware/qcom/a623*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
@@ -1876,6 +1884,7 @@ FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
+FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1921,6 +1930,7 @@ RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
 RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a623 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
@@ -1946,6 +1956,7 @@ RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
-- 
2.39.5


