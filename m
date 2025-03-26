Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C41BC36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.33416.1743020989776294261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PLmHZleR;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso318372a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020988; x=1743625788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAEvl9cJnaSMrr3TSlAUimaHvkEQC2nbtsgosl9FUnI=;
        b=PLmHZleR/aR2lCdErIP3Cyfp6NDVIWYQE3g05tF/w7S1assqdf+8ytNhU0XKdyTWz+
         RWVFf6ytqCLgp4TWP93rOTrNSjtoKTUDioBJ0YDm7cxzHMoj2ULdTjhbM8ETVxHIE97r
         CQe1j1APBS40/i5nnaGuWqfVfvzpOzk1lkZ8gg4OD9NXgNc6wa5nd7Gp1ROnegGhB03b
         amu3etM1WDzgDqqhDDbA5k7IYYyoyg7uARme0q5KnAB7hfiipQmqQpLavxbbysqLtrIk
         gs85viwHYTVwcmWhFEdcw3ZlrwE945qbR55dYUG8S812A3WeS7ifwc/1+IyDeNo2EBiJ
         SPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020988; x=1743625788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAEvl9cJnaSMrr3TSlAUimaHvkEQC2nbtsgosl9FUnI=;
        b=MA+bgE6/Wi+p8YWz6CHASvnpOpBWqCN4XjbknrOp9d/AK/WWj05lI1YbAvNkjCNIUx
         l37qOD8uIh0Jw6CrnNTGT0SOjtVP/SfdGnqv1AvDsHT9GDoeJ7gvwDMz3UfrwWiqe/uZ
         Sxu4wpG/eBZri2FWBx/wHJZPFTIbtRfBdtYvpLPNh6T+wTnhn4ciso3mx6ZHpYA35Na7
         IfIGTcF0V5AlqsIqm5Eyasl6M9QrS9vAFJDSdwZFWyzRFCN/sHEH+h+278p0lE54kcJi
         R3Dj70Gr3kOQJixy3lkk2lyXsWMpcPlguNOn1Ytijc652OG20+q0ZFZwa63j0tvIfnqM
         1ERw==
X-Gm-Message-State: AOJu0YxndyX96j6wfPrZrzD8HZH1C5PNuCyCdk2/btBTPO3C8sQuGRm0
	6ni2LpCVHflOHuCC/6qZ4HUt9Wg33Gyy8Cfg43YuWYlxYB9itaDJFFb+hcRS
X-Gm-Gg: ASbGnctqQbhXEpewb2vLQQCnse//O1nFkDTZKgcCoBCW2XX9K3nWqE/QKEW/tQE8qN2
	kpZMnf+nrPvJTUKH2A8rALtq2MTxH8yici9SKWNc/oNUo0Bjfxv2IpxzPVQl8rvaPX1Snjpc7Sg
	ZaFrlLQPewkn0Vn0E/oAGvGa6dLlyRL3Beso7u/oUvlRHtakioU0hUVg8PVB6W7S8SbrjOtzKx/
	tzhk+o8mnNvrDa8lV3XaZmMjv9i1nr9rcrQMAiydy74qFPXePzEzETRW7xPT7SgrdISXt4vg/Av
	GimA7ZybxgCyxAwZABnyngT3mMDnx/OxpuieivraoOpOTHx678pnTm/KadkNnSS8q2Y=
X-Google-Smtp-Source: AGHT+IFyd2ydWOS9RuD2190kl5VjRbheXDlodNxbGwZk1+aV4QObaZFHF7HJ2Ts/MzFMkeytfRqdcQ==
X-Received: by 2002:a17:90b:2d46:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-303a7b59fa7mr1416536a91.4.1743020988368;
        Wed, 26 Mar 2025 13:29:48 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:47 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Marc Ferland <marc.ferland@sonatest.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [styhead][PATCH v2 17/31] linux-firmware: split ath10k firmwares in separate packages
Date: Wed, 26 Mar 2025 17:28:03 -0300
Message-Id: <20250326202817.64437-18-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213677

From: Marc Ferland <marc.ferland@sonatest.com>

This patch introduces the following packages for ath10k based chips:

- linux-firmware-ath10k-qca4019
- linux-firmware-ath10k-qca6174
- linux-firmware-ath10k-qca9377
- linux-firmware-ath10k-qca9887
- linux-firmware-ath10k-qca9888
- linux-firmware-ath10k-qca988x
- linux-firmware-ath10k-qca9984
- linux-firmware-ath10k-qca99x0
- linux-firmware-ath10k-misc: catches all firmwares that are not
  already included in the other -ath10k- packages (currently empty).

linux-firmware-ath10k is now a meta package that depends on all of the
split-out ath10k packages.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
(cherry picked from commit 18b0b076e749bf8684958acf1a97504a69f73edd)
---
 .../linux-firmware/linux-firmware_20250109.bb | 56 ++++++++++++++++---
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index ba66ea407dec..da253219c0c5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -346,7 +346,17 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-carl9170 \
              ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
              ${PN}-ar3k-license ${PN}-ar3k \
-             ${PN}-ath10k-license ${PN}-ath10k-wcn3990 ${PN}-ath10k \
+             ${PN}-ath10k-license ${PN}-ath10k \
+             ${PN}-ath10k-qca4019 \
+             ${PN}-ath10k-qca6174 \
+             ${PN}-ath10k-qca9377 \
+             ${PN}-ath10k-qca9887 \
+             ${PN}-ath10k-qca9888 \
+             ${PN}-ath10k-qca988x \
+             ${PN}-ath10k-qca9984 \
+             ${PN}-ath10k-qca99x0 \
+             ${PN}-ath10k-wcn3990 \
+             ${PN}-ath10k-misc \
              ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -508,7 +518,16 @@ LICENSE:${PN}-carl9170 = "GPL-2.0-or-later"
 LICENSE:${PN}-ar3k = "Firmware-qualcommAthos_ar3k & Firmware-atheros_firmware"
 LICENSE:${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE:${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca4019 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca6174 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9377 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9887 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9888 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca988x = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca9984 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-qca99x0 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-ath10k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca = "Firmware-qualcommAthos_ath10k"
 
@@ -518,12 +537,21 @@ FILES:${PN}-ar3k = " \
 "
 
 FILES:${PN}-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
-FILES:${PN}-ath10k = " \
-  ${nonarch_base_libdir}/firmware/ath10k \
-"
-FILES:${PN}-ath10k-wcn3990 = " \
-  ${nonarch_base_libdir}/firmware/ath10k/WCN3990 \
-"
+FILES:${PN}-ath10k-qca4019 = "${nonarch_base_libdir}/firmware/ath10k/QCA4019"
+FILES:${PN}-ath10k-qca6174 = "${nonarch_base_libdir}/firmware/ath10k/QCA6174"
+FILES:${PN}-ath10k-qca9377 = "${nonarch_base_libdir}/firmware/ath10k/QCA9377"
+FILES:${PN}-ath10k-qca9887 = "${nonarch_base_libdir}/firmware/ath10k/QCA9887"
+FILES:${PN}-ath10k-qca9888 = "${nonarch_base_libdir}/firmware/ath10k/QCA9888"
+FILES:${PN}-ath10k-qca988x = "${nonarch_base_libdir}/firmware/ath10k/QCA988X"
+FILES:${PN}-ath10k-qca9984 = "${nonarch_base_libdir}/firmware/ath10k/QCA9984"
+FILES:${PN}-ath10k-qca99x0 = "${nonarch_base_libdir}/firmware/ath10k/QCA99X0"
+FILES:${PN}-ath10k-wcn3990 = "${nonarch_base_libdir}/firmware/ath10k/WCN3990"
+FILES:${PN}-ath10k-misc = "${nonarch_base_libdir}/firmware/ath10k/*"
+# -ath10k is a virtual package that depends upon all ath10k packages.
+ALLOW_EMPTY:${PN}-ath10k = "1"
+# -ath10k-misc is a catch all package that includes all the ath10k
+# firmwares that are not already included in other -ath10k- packages.
+ALLOW_EMPTY:${PN}-ath10k-misc = "1"
 
 FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
@@ -539,8 +567,16 @@ FILES:${PN}-qca = " \
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath10k += "${PN}-ath10k-wcn3990"
+RDEPENDS:${PN}-ath10k-qca4019 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca6174 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9377 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9887 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9888 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca988x += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca9984 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-qca99x0 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath10k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
@@ -1697,6 +1733,7 @@ RDEPENDS:${PN} += "${PN}-whence-license"
 # Make linux-firmware depend on all of the split-out packages.
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
+# Make linux-firmware-ath10k depend on all of the split-out ath10k packages.
 python populate_packages:prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RRECOMMENDS:linux-firmware', ' ' + ' '.join(firmware_pkgs))
@@ -1706,6 +1743,9 @@ python populate_packages:prepend () {
 
     ibt_pkgs = filter(lambda x: x.find('-ibt-') != -1, firmware_pkgs)
     d.appendVar('RRECOMMENDS:linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
+
+    ath10k_pkgs = filter(lambda x: x.find('-ath10k-') != -1, firmware_pkgs)
+    d.appendVar('RRECOMMENDS:linux-firmware-ath10k', ' ' + ' '.join(ath10k_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.39.5


