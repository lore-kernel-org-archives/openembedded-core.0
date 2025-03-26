Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177B4C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.33377.1743021004728999215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WW818G7+;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so292224a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021004; x=1743625804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQNtIRAdhOqCGi+WNhEJNpE1O9cu3InFLLzRtSa+Vpo=;
        b=WW818G7+pdMtZyhKUT+CaexK/24LtSN215V8/sJhqq7qrcnV0H9A2HiXTmHf0nzZ8O
         3CwBtnATstqDf0DbJ3aYjwUs07xPJ3Vkq+mzo9Qta6Ajb9VClBME7oF9cCERzX6WikwE
         68AKWPuYUd5jUIPQ1+S7mFJ0YGVMEdrvnfL4l2+YIXgHZ3BNxsb84ykPDruBEAJeC9gZ
         rS/1TcOIEq8lW6ZQ/p6l5tbtuHOTUJGVyZbPJtiNliYKczgSPvfsG8pTWeIBAkSVnwCg
         u4talMIl1ScI+HIHFWckdYRikdpYWZAGcVNvXF4/c233/RkbPkVC1kH4kREgG/+lnzco
         TbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021004; x=1743625804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQNtIRAdhOqCGi+WNhEJNpE1O9cu3InFLLzRtSa+Vpo=;
        b=dvYvEBtgf1OfQgvsxQBRUJZInSMHDNybDOW+L6NcKk32X9LKIh8EjH60A7QVj70SzA
         RphrlFELIGQZmFIQdnqn4vfsj+InnZNvvkziH/cu4RNvPyeC3ZB46BTMMR1BmdoQt96B
         icn99jIQn6vf5pln/u2vFCtw3tKrZ0PGMFJCQI6KFJJ2cw4gaDw+gX2rj7gPkaPWXarI
         fv0LKgejju4B3asIDwGIics9Cnf49eN5VOQ5LwZGuFWfwrHKzlJFykuhHI5LSdgLhJp8
         nSFbHukdhX4iuJJDEhxqB156+1DKm8PEr5FRF5yjeIfgJ7g7tbgjRhy5zjO+Z59sMmAn
         7JzA==
X-Gm-Message-State: AOJu0YxqEy3WDj2iKjnXnsfCOmiDGcKh985sWH/wVYL0qoTYE8ic8ow7
	NKq8peWTy4nbdX3zR/A3kaLpYydfBB2CgG3KhXyORcmIEyLBZe+2fwNp5MR7
X-Gm-Gg: ASbGncuALfOIoVD5XgFa6AHeV1VvpuEQ0URtw3IwcnGUpmDbEPeiO09oOnN67coJdnd
	0MjlBGernnoiXl5sehUWyp0bws6UDS+VjrJTThH2qvrM8tPoAS1FmORkFGlPCPMZ5EA6wUBDpks
	6DC9X0Bd0u7W4tpCJjDov2zw+dxqAewUKwhiYpvrXZc4PxGikuxwILw6dv97GhOmlGPqOBCKb9b
	4OMJG1uKcWHD3le5wXTz6m3m1H0Dv6gxk7EW58ftjj3I006VNHhT5QKzOjitmZlNbP3gHkkpt7B
	MdeDr4vLuufTSqGSRSPiKv1qpDRtXuPkuklKUswz5SEsEXSNoSfO9mvvSeorM3ehFkM=
X-Google-Smtp-Source: AGHT+IGiDMzEqJGLQleZxET5dBQq+6D7Nvm/IKNe2JVt4IfCMYWBCdbLVWJY8AScEikvdPL9CaXB+g==
X-Received: by 2002:a17:90b:2649:b0:2ff:4bac:6fa2 with SMTP id 98e67ed59e1d1-303a7f65282mr1633334a91.16.1743021003840;
        Wed, 26 Mar 2025 13:30:03 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:03 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 23/31] linux-firmware: split the qca6390 firmware
Date: Wed, 26 Mar 2025 17:28:09 -0300
Message-Id: <20250326202817.64437-24-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213683

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

The HCI firmware for the QCA6390 BT/WiFi chips doesn't logically belong
to the USB-only linux-firmware-qca-qca61x4 package. Split it to the
separate package in order to simplify firmware management. This follows
the pending WHENCE change in the linux-firmware upstream, where the
QCA6390 firmware is split to a separate section.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a846d72e9e53dfdaf4d5dd66c94b9323c1a580e)
---
 .../linux-firmware/linux-firmware_20250109.bb            | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index 3d22b25ef090..b153901d65fa 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -399,6 +399,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-misc \
              ${PN}-qca \
              ${PN}-qca-qca61x4 \
+             ${PN}-qca-qca6390 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
@@ -591,6 +592,7 @@ LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
@@ -664,8 +666,6 @@ FILES:${PN}-qca-qca61x4 = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_00440302_eu.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_00440302_i2s_eu.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00000302_eu.bin \
-  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
-  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_00130200.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00130200_0104.bin \
@@ -688,6 +688,10 @@ FILES:${PN}-qca-qca61x4 = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_010e.bin \
   ${nonarch_base_libdir}/firmware/qca/nvm_usb_00190200_0112.bin \
 "
+FILES:${PN}-qca-qca6390 = " \
+  ${nonarch_base_libdir}/firmware/qca/htbtfw20.tlv \
+  ${nonarch_base_libdir}/firmware/qca/htnv20.bin \
+"
 FILES:${PN}-qca-wcn3988 = " \
   ${nonarch_base_libdir}/firmware/qca/apbtfw10.tlv \
   ${nonarch_base_libdir}/firmware/qca/apbtfw11.tlv \
@@ -783,6 +787,7 @@ RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qca-qca61x4 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
-- 
2.39.5


