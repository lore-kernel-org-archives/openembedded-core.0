Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90A7C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.98.1667835437593150708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gTfczkM6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id b29so10941360pfp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePPwi9DyD+TBUV9BhrfJzRmnAUCDXYhpsGt7bF/NLtE=;
        b=gTfczkM6gCHWGbhhjnSaNbuy0purCM7C/GLKyvNHJFoFtkR5sk/wRcdKRM+cbGY/SA
         7VQKt/zoYsGCm3ZtlMQ+ASSC4x4SX+imQB3F/EfdZsRougcl9g6L2wVpJyziQChiGcMe
         Wwwr8BCYpfqU+BtnEbEHXECL1BPPshKyNgojrNEtpRshNPAapd1XYNBrgGnTYz8U3xsJ
         Gv/frKmuWc+1uAgc8Bf+XPzwnbxw7MS29sfrasBdrI0SDAItFecIVdI5LCeoQJw/FxmF
         0wDMZbO5+2O7qAtMXY5uucgvLcnuKlWRZABD2qoQsPTarpCIMGT5vxmBLl9KBup7zodO
         nF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePPwi9DyD+TBUV9BhrfJzRmnAUCDXYhpsGt7bF/NLtE=;
        b=m9f2zkfg4aSTRUrXTuk/Dl8Yf/dWbSzbpP2PlKVq9+cNPwbM1vBsoO9O2fWI2+J41F
         FKd9r5WwixjKi/4yk8uPMTkZV7Tyy26JZqIeiv3yvXp8Ya8z7sADcPOIFWeDLvt9NTIK
         x1uOogkhLNFCDwQS1UyZqipY1rc1SvNdvWyY5NvqM9yfVKsxHh1HLwaKo+9IeV//cW68
         KUXwR4R4LLjROL4DPFOED8jAVitSudn69cD2LOEyXf8QpzlMjF0qNmVefiGnnBT8SN9O
         /wgALvRmtAVDy/CgqBrPH4gNN2PL5wL9pVDrRCom7vcgq6lNKn7waEiitPPM93f6zy7F
         yZMg==
X-Gm-Message-State: ACrzQf0wYxrVmUybENmzJ/4cl8tud4lSKOg/HKmj8gKC3etw2fL/jr0Y
	psLznAjoA6ZBBhZMl8/QePxVUkpZJFTMFcYe
X-Google-Smtp-Source: AMsMyM4ZGbmSmlDwH2qVsFE5bM7Z4zP7RZ9D4B3a6PINA8T6LIrC1lWBD6yrKzSOtmXqBybWUrmWWw==
X-Received: by 2002:a05:6a00:224c:b0:56c:40ff:7709 with SMTP id i12-20020a056a00224c00b0056c40ff7709mr50868400pfu.59.1667835438758;
        Mon, 07 Nov 2022 07:37:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/25] linux-firmware: package amdgpu firmware
Date: Mon,  7 Nov 2022 05:36:31 -1000
Message-Id: <55e74e86a8451decefbe4a9402b36ee4fbf235d8.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172911

From: Vincent Davis Jr <vince@underview.tech>

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0d7aa21f120a756d1a4fc4ae0be3527b54a58247)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index eea9251a84..8f921e2d0e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -228,6 +228,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
+             ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
@@ -429,6 +430,17 @@ FILES:${PN}-radeon = " \
 
 RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 
+# For amdgpu
+LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+
+FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
+FILES:${PN}-amdgpu = " \
+  ${nonarch_base_libdir}/firmware/amdgpu \
+"
+
+RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
-- 
2.25.1


