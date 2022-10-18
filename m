Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A143CC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 06:30:48 +0000 (UTC)
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
 by mx.groups.io with SMTP id smtpd.web09.3868.1666074614501544189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 23:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=U/A0QdN2;
 spf=pass (domain: underview.tech, ip: 209.85.160.65, mailfrom: vince@underview.tech)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-1321a1e94b3so15807113fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPAljFoT4qRZqvpPIFVN9Bv4EQ6Gx4lehwGn1cJ6/H8=;
        b=U/A0QdN2ITdxYAVxiOjOWiF/yAwiyki4K8iqyHQiGTEaMMr5v6W4BhN5MPdPBBOQvE
         754mEmG+QsRxlHaGDP3K4ivmLGr+MaqtYcRXqxpFkWtBeU4Wuh/EBJDyQtICF4kJ0Gxg
         TR2RLEIJ3qOT/tYkhl3OhQ8RF3wO/2krrmu74t7C0vTnFsgNVg7tw+9j+6Gg6KvDWvAP
         Z23G2P0rdJYWuwYVpfIfbsXvkveJquci+9hRQOrBfkv3I3YvJYIvQFDBkz3I3OwzgEOK
         7GxtRGSH0LrGYOhh3+D6GfLZ8olulh90HGq2URQXPMeop887vQDhleS3FFFKZhR3PiG4
         PldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPAljFoT4qRZqvpPIFVN9Bv4EQ6Gx4lehwGn1cJ6/H8=;
        b=FVp1VIlP3zccJL9WANDCeM65pJXljELG15DgHOSLgKQLwX/HCMWgwKdX8xr3oDTZmT
         p0WQBXv//z5vZWohSeSAUT+teZ1DEIggyl1j7cr5AE7tFt7XK4g4Pb5BAjAoorrbSYo4
         3Xqq/h1r3zziquP3BrkDo6jDlMPOhVNIveJIx7mJydtyhc5ftr534tzA9ZrCU6V3Zn8M
         MZw4OFsQSJoR2h+nh+IZ5rDDfWZJDDU9rhp+PeZe91M7zDgtD2xaEe7JQ/Krt1TXsDHD
         KwZaIvWVq89nz1YIHRA0x7UfAH08gwI5p1L5x5a3zbOVUwORH2shjwUmRcERG2iKV9y6
         ka/Q==
X-Gm-Message-State: ACrzQf1yLCb1GQ4vFvkU/CMKbPQb84ZRx/a6KjbzzUUXcu5tSgdkpBtI
	xkHg56Gjc2Gz+nkToELXsskNJngP1puUGGcrrmw=
X-Google-Smtp-Source: AMsMyM6vKjhi1oE8xZjCSTOWJm82ZZLTS5flyJTQp4HsNQRuAfkuQizC3PYMgGw0cDzypR+2RRVIHg==
X-Received: by 2002:a05:6870:344b:b0:136:6e4b:a81b with SMTP id i11-20020a056870344b00b001366e4ba81bmr734033oah.281.1666074613485;
        Mon, 17 Oct 2022 23:30:13 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id v5-20020a056870310500b00136c20b1c59sm5749469oaa.43.2022.10.17.23.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 23:30:12 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] linux-firmware: package amdgpu firmware
Date: Tue, 18 Oct 2022 01:28:54 -0500
Message-Id: <20221018062854.3237783-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 06:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171933

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e861..bf15e53472 100644
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
@@ -428,6 +429,17 @@ FILES:${PN}-radeon = " \
 
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
2.34.1


