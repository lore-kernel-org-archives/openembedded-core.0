Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB6C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.98.1667835437593150708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SJhcs8MU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id b29so10941269pfp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvtmN6fxOZUDaYHDGR0+DtL6hoZp+Bk8hEZ9RbisaVk=;
        b=SJhcs8MUoDOkQ/APKy5wZCub/D+gG8Y98xATGmf4FdV39B1hd+40HTCYONYSRqh9HK
         6NKC1Yh+e765iNhnOfAMyWFonjNvjj6LpkXe+EoY2QU/boof9sVXeA+b8lU81foCbO1T
         5a3PnFEPgnxnTHUOApw58oocNhNkqF7P6Mpyl+TeNRwV0fWYid+nIWhHMOS6JH+dYmpn
         meY8FGgMRSrQSoED2NULEws78UDYHriolLRn2sgXXGFE2jTgALzU0+b9SR9uR9Z+yC7U
         YnT01x8Gvtc69gt1DqvI6Yz4xSSseAsV0e54FulGXizGYvEjgFJp6LWc4RnZz438JOx+
         qiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvtmN6fxOZUDaYHDGR0+DtL6hoZp+Bk8hEZ9RbisaVk=;
        b=8JwcKKgmS51xbYjYA1Zmb1mQuV4Pc/K1bDF1HX3+AvkmRqeCHiKTiZti/xkxEyPGWy
         ieYFTD6rTKZ9yt5M1uDXdBpG/GxKpF2Zi4SmDAt4w5qPP9V7gLgwqyAxVDoFlpPO7oKG
         F5V3GduXSCvIdczZcxjy9mIJlSnv4vajDP7rTFAqQLstjrdPTgSkOmNbLzXIjG2bV+qQ
         TxIxWTJJx6OzPmmPUqQBvwKXJJEwIJZJ2CbZCc5/UNew3JFjh24hRiyZizpNGYcWAaZU
         MGQiAdxORTwcv22Q8tn6iTXLMcVk7YLtgx5t2arFh23OAHY+85X4Kie+MIK718CFQBJe
         6sHg==
X-Gm-Message-State: ACrzQf07H+7ePYVgmbwWy/rE9Teep3Geia/VbWXd7YXdinDAGqeFGGXo
	BMOac7evEBiNR7aiE8cNT9Zppg0UIlAFBlJ7
X-Google-Smtp-Source: AMsMyM7cJYnRutM6k3trCn3FMpswLWQF1ucOWAMTyBmtFRHsAcfEiN6yfY55y+x0/ZzWimV+cXdfmA==
X-Received: by 2002:a05:6a00:999:b0:56c:3d0d:96fe with SMTP id u25-20020a056a00099900b0056c3d0d96femr51357778pfg.12.1667835436729;
        Mon, 07 Nov 2022 07:37:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/25] linux-firmware: split rtl8761 firmware
Date: Mon,  7 Nov 2022 05:36:30 -1000
Message-Id: <8d6bb62e03d2c2d63d0d8659028bd8f745a36677.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172910

From: Christian Eggers <ceggers@arri.de>

Realtek Bluetooth devices require binary firmware files. Package them
separately in order to avoid installing the full linux-firmware package
on embedded devices.

Affected (end user) products (incomplete list):
- TP-Link UB500
- Logilink BT0054

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fb44eb4feef54f2343c8186809a65dcb9b58a9b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220913.bb               | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e861..eea9251a84 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -235,6 +235,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
+             ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
@@ -563,6 +564,7 @@ LICENSE:${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8761 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8168 = "WHENCE"
@@ -588,6 +590,9 @@ FILES:${PN}-rtl8723 = " \
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
 "
+FILES:${PN}-rtl8761 = " \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
+"
 FILES:${PN}-rtl8168 = " \
   ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
 "
@@ -598,6 +603,7 @@ RDEPENDS:${PN}-rtl8192cu += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
-- 
2.25.1


