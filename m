Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8A1C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.33423.1743020999875258042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihjcMAtx;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso318488a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020999; x=1743625799; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtEM1z5zFDuUDFOLfFJc0nHX49kV9iqZVxhtiw+iVlk=;
        b=ihjcMAtxABC867lsCCyPF0FBTVbXZpRyLCeC68FlKrW3NfpE3UUYD/8RwAxs1V53I9
         uvWcOVGmdu835uKFx1r9Qf1lWLIOjingd874wnwu4zCQBlsT9ZkYJH0ndHaVh2byhZ8z
         rOCMob1nmiCdLMv2/qLx0Bi6kYeyZqOljniTEGL4P1uNyD3TfJa/kbIllv3NL6EcRc6d
         rdLeczk/tJ9zV8UCiteDjisO9RP4EhUAbfEw+tdmjo3QSYhJKo09grQElMkeXTDfU4uk
         QrGisvaESJFFk6carnUc52SuwR4a6/PrQrfMmkvposoV+ykMJcZBYIF94U+UBDEQhaH5
         MNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020999; x=1743625799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtEM1z5zFDuUDFOLfFJc0nHX49kV9iqZVxhtiw+iVlk=;
        b=C3o40pFmr1v75eGexBaMXnp9SKwCIpAKcco/RTdFJObngITp8PecBKhx8BGwE7/2fg
         Xc/YalANYWDQxD9uhgwYQnnWwd+sTiRdEUtGzYBE0mu7YpcnXkgtPqFYF04mZCUcj2Bf
         PD4NFz82HdiS9I2sFas/cJwJORdk2YMFELz0Gup0wX8hGY+NARWUzruMbF80C0nRkCGa
         qOXeDCiKQMs6w2rkinBWtyaEjiwJe4QobrZFRRX0IozBwYl16BrFFc8w+CCVZ1HFkDUr
         7aYHJVyZ2wcJMkNYtgYr3Z0lMhk804vSNB05LdtRJ0ZsdRyomyIjtYC6CNbcHcMCH6S6
         UFvQ==
X-Gm-Message-State: AOJu0YzeINBIwkBp1QrCAFFgHLMJGcLoF9nqKr8xMjgd57MGCy5Kg9Pp
	20+rf3vo0HmA35xl0g7S3pLnTIWYPpFs3hzkcNycXywiExr7rfibX8SerJEs
X-Gm-Gg: ASbGncuyG5iVMYv8Av6kCLYmAGIfkz/yVxahZVuBa/nJFs6GERIPS1N6nH8PgWAL3u2
	Uu2blwixEICkx7o6R/LK9wBZYJie7LJNIz/k6WTRDhYmA4OUCrOqDGzFb0r3jnMKFXZrF0TJjo8
	tv3iv+py6Q8yB/hHZMCoYMgFFET8jLSx4vZMO/ln95TxFc65k4ufkU8BRDIWSQr6UtFCNnxx91J
	uNwRxsB/Oi4DXl7ETbbP507U58yKqJVJz0JG2Zuuod0LO9x2VaNesu3zRDk0dLwwC46K6xvi8CA
	wvy4EubeR/xMhUI3icP8C0dlmRGvFFP5Cl7C0CzFwbtHKN2TW+pa4c+53DKRlpaVsaw=
X-Google-Smtp-Source: AGHT+IHmDlPdO+olQrUHZ/zzna/hurO3VUzEEbbXREky/KlrbUhc/jTiJmwBDFNfps3QTgIXUVAgyQ==
X-Received: by 2002:a17:90b:2d46:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-303a7b59fa7mr1417002a91.4.1743020998855;
        Wed, 26 Mar 2025 13:29:58 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:58 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marc Ferland <marc.ferland@sonatest.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 21/31] linux-firmware: split qca firmwares in separate packages
Date: Wed, 26 Mar 2025 17:28:07 -0300
Message-Id: <20250326202817.64437-22-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213681

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for firmwares under qca/:

- linux-firmware-qca-qca61x4
- linux-firmware-qca-wcn3988
- linux-firmware-qca-wcn399x
- linux-firmware-qca-wcn6750
- linux-firmware-qca-qca2066
- linux-firmware-qca-wcn7850
- linux-firmware-qca-misc: catches all firmwares that are not already
  included in the other -qca- packages (currently empty).

linux-firmware-qca is now a meta package that depends on all of the
split-out qca packages.

Note: Content of the FILES:${PN}-qca* variables taken from WHENCE.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e7a6579a49962907560b5a1bc71e1a17879415f)
---
 .../linux-firmware/linux-firmware_20250109.bb | 140 +++++++++++++++++-
 1 file changed, 135 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index d2c0c7c1fdcb..f0b710a6cc6a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -398,6 +398,13 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-wcn7850 \
              ${PN}-ath12k-misc \
              ${PN}-qca \
+             ${PN}-qca-qca61x4 \
+             ${PN}-qca-wcn3988 \
+             ${PN}-qca-wcn399x \
+             ${PN}-qca-wcn6750 \
+             ${PN}-qca-qca2066 \
+             ${PN}-qca-wcn7850 \
+             ${PN}-qca-misc \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -583,7 +590,13 @@ LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
+LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
+LICENSE:${PN}-qca-misc = "Firmware-qualcommAthos_ath10k & Firmware-qcom"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES:${PN}-ar3k = " \
@@ -631,9 +644,116 @@ ALLOW_EMPTY:${PN}-ath12k = "1"
 # firmwares that are not already included in other -ath12k- packages.
 ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
-FILES:${PN}-qca = " \
-  ${nonarch_base_libdir}/firmware/qca \
+FILES:${PN}-qca-qca61x4 = " \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000300.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00130300.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00130302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00230302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000200.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000201.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000300.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00000302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00130300.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00130302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00230302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_00440302.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0105.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0106.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0107.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0109.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0110.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010a.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_010b.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_0303.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010a.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_010b.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130201_gf_0303.bin \
+  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00190200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
 "
+FILES:${PN}-qca-wcn3988 = " \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
+  ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
+  ${nonarch_base_libdir}/firmware/qca/apnv10.bin \
+  ${nonarch_base_libdir}/firmware/qca/apnv11.bin \
+"
+FILES:${PN}-qca-wcn399x = " \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/crnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/crbtfw32.tlv \
+  ${nonarch_base_libdir}/firmware/qca/crnv32.bin \
+  ${nonarch_base_libdir}/firmware/qca/crnv32u.bin \
+"
+FILES:${PN}-qca-wcn6750 = " \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.mbn \
+  ${nonarch_base_libdir}/firmware/qca/msbtfw11.tlv \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.bin \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b0a \
+  ${nonarch_base_libdir}/firmware/qca/msnv11.b09 \
+"
+FILES:${PN}-qca-qca2066 = " \
+  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.301 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.302 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.309 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8 \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111 \
+"
+FILES:${PN}-qca-wcn7850 = " \
+  ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112 \
+  ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin \
+"
+FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
+# -qca is a virtual package that depends upon all qca packages.
+ALLOW_EMPTY:${PN}-qca = "1"
+# -qca-misc is a catch all package that includes all the qca
+# firmwares that are not already included in other -qca- packages.
+ALLOW_EMPTY:${PN}-qca-misc = "1"
+
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
@@ -661,8 +781,14 @@ RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
-RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
-
+RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
+RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
+RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
+RDEPENDS:${PN}-qca-misc += "${PN}-ath10k-license ${PN}-qcom-license"
 # For ralink
 LICENSE:${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE:${PN}-ralink-license = "Firmware-ralink-firmware"
@@ -1912,6 +2038,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 # Make linux-firmware-ath11k depend on all of the split-out ath11k packages.
 # Make linux-firmware-ath12k depend on all of the split-out ath12k packages.
+# Make linux-firmware-qca depend on all of the split-out qca packages.
 # Make linux-firmware-amdgpu depend on all of the split-out amdgpu packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
@@ -1932,6 +2059,9 @@ python populate_packages:prepend () {
     ath12k_pkgs = filter(lambda x: x.find('-ath12k-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ath12k', ' ' + ' '.join(ath12k_pkgs))
 
+    qca_pkgs = filter(lambda x: x.find('-qca-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-qca', ' ' + ' '.join(qca_pkgs))
+
     amdgpu_pkgs = filter(lambda x: x.find('-amdgpu-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-amdgpu', ' ' + ' '.join(amdgpu_pkgs))
 }
-- 
2.39.5


