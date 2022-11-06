Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF83C4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:11 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.16492.1667744273544611822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mGBJzOde;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k7so8921891pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvtmN6fxOZUDaYHDGR0+DtL6hoZp+Bk8hEZ9RbisaVk=;
        b=mGBJzOde5zwP7Hcsy766zJIJ8RrxintlJceyk8DhXDNxMonSbECl0kb4I/c/Eh9Oe8
         6TZ27CMkvNCtIgxEWCjuKra7kb3XY5i2czFFiwrSSlejnSXqDJpG/v21A7zcodIEGYBV
         0CtTNdL5sVhARkDtHx3TiATV8sOSHfKzogsipCHNwsGz/VKEFzZr/Y2OXO652xdRdrc4
         zM4v1LJaIAazUkZT+2+xHT02E6Jh0EcLN3HNq6fxLwgv5zKKPqLPv102cR2h/eP1A/X7
         wc+2MjqyRenvH5yXzwXVJESqFjkxPYe16OC6eJ/mmeGRTWVTs+9w28kvo8dVJM7Z4rQ/
         o8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvtmN6fxOZUDaYHDGR0+DtL6hoZp+Bk8hEZ9RbisaVk=;
        b=dDNUo11oOYFKSWmb0Ev1LwJ6hLza9OHo/0VrhY//bWPoRqkeibOVUSx6bACCnRb0CH
         7ZKGSXs+6rnAwId9Y5co/5D0lxkbcffkxw/YpUmWDlSIM7pSd4C7ZZsLjL308hWXDR/b
         ZG8RjrnqkRouyOwA8K4eA9rbXWOM4nweNg63D6lknSjzVmmYUYdGb+Sw6PNddLesVtDL
         5gc+a/1Uf0rlz+3YMdLslQklg59rn5KrcZSdpqxPrMjUMjV5GTXsEiIeusXVNxUUTXO9
         4j0EoeD71WJc26/hefsVmNNvPaoKK/VedrP7veAufvaOHtIckpgRC9jMdEp1tz1K8H1i
         9qCg==
X-Gm-Message-State: ACrzQf230A58/M1Iuh02DKqnyOpy7JC/Dg6TVmix3eWKhrCj4Ap9/dgx
	vrKa65DjSsSD6gLxF2RIooUeg64tu7eElg+u
X-Google-Smtp-Source: AMsMyM7KCk8l/Wv/u582G4UopRVwAzHqYukQteHhxd5RDB5J+spAo6LDoQmn3y1EfmCbglX+QoQNNQ==
X-Received: by 2002:a17:902:d58f:b0:186:fd58:c6fc with SMTP id k15-20020a170902d58f00b00186fd58c6fcmr45394281plh.125.1667744284466;
        Sun, 06 Nov 2022 06:18:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/34] linux-firmware: split rtl8761 firmware
Date: Sun,  6 Nov 2022 04:17:00 -1000
Message-Id: <2772f356d4a8b8f31c34a3951814d04fb4f3decb.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172785

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


