Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE22EE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.13064.1692801400531280209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rSKty4B5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso2492732b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801399; x=1693406199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMCD/v7nEeNTgkqJxRj6C8b3my/06pH8ruNGhNKiLHA=;
        b=rSKty4B50jIB5kG0dLKSpkyup0Ri2ZkRz8mCRg8OzsP7XXl+AyY3QGfkH1b/j92wNB
         ptdaTOCedeZ3h7IUhymokCqU53fnG5WyjbbZh3HvA/dEzMzlv4Wln7xght2u3hLvX2Ix
         zNdGDRj+UxRjvFK1NQX32bhOFquwj2T2htDG/vO4gGSKRwsPdIchEUPGof8kBZdhYF6g
         oQFwaGmFSpWtGbbTP3HGPWV2S8wmAwl4gsaQWsH9EDwgkFF2dejuCX9AhZHe5m1N4XH4
         cvN6SdA6fq30/HiygZRq7iXynYTOBkS8SyvvsDMlERXT3QAmizkmfrlIq3WUgQHdxGOX
         mwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801399; x=1693406199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMCD/v7nEeNTgkqJxRj6C8b3my/06pH8ruNGhNKiLHA=;
        b=GQJZw/rKHz0AWQ33xcwuXX4mcGaCbldtulH/Ov/mTwZJLxxQwYwd1/1S58ogG/75wT
         9WLylmeBQclHQAMraqwcaYTYkC8GTZURMvoJysuD2uZAaVAEL3QR/R9DLi0a3Oeeoe1M
         NlAt7yf3KQlp1LyyUKOZ/Igvc5e/vPc1qBK2VNli/Qk/XJDSh2W2ndej+PlpRXxOQE4x
         wkdOEP/OedIxOJHJ7ehk80qiPKTpC0lQT2QLTlHpm00TlRYvmqe2G97GyU6cpHY+JL2X
         QwkLtbXj6ogGxVErOOycji+jSJE8QClpzEItWxuru5mpQVH2uEuOxAhfX4nt3eECSclD
         mhhg==
X-Gm-Message-State: AOJu0Yylo8No4YVxngneBcxdTFoADj5ywPjeZjQFpZIrGunkXSoOr9Z7
	6POjAngyVo7mUx2595ZbfZjW3rENk9F9aTpBvBs=
X-Google-Smtp-Source: AGHT+IF9y+NAhAstZA4ww6lNR6AUynzRGjLW2o5vFpI4FmwW8bMPjB+i/5F4zGj0u5bMjhAHkZ+m7A==
X-Received: by 2002:a05:6a20:1607:b0:13f:5a05:6038 with SMTP id l7-20020a056a20160700b0013f5a056038mr12126462pzj.58.1692801399357;
        Wed, 23 Aug 2023 07:36:39 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/36] linux-firmware : Add firmware of RTL8822 serie
Date: Wed, 23 Aug 2023 04:35:40 -1000
Message-Id: <38b468be11bfb15cca68694ed35dc9b2874da11f.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186591

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

RTL8822 is a serie of wireless modules that need firmwares to function correctly.
The linux firmware recipe does not have a package of these firmwares, and this commit add them.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6459959beeb91c0b694f5f17b6587a12c6dcb087)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20230625.bb             | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 7d0a794e8e..e3670c63b2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -241,6 +241,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8761 \
              ${PN}-rtl8168 \
+             ${PN}-rtl8822 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
              ${PN}-bcm-0bb4-0306 \
@@ -582,6 +583,7 @@ LICENSE:${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8761 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8822 = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8168 = "WHENCE"
 
@@ -612,6 +614,11 @@ FILES:${PN}-rtl8761 = " \
 FILES:${PN}-rtl8168 = " \
   ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
 "
+FILES:${PN}-rtl8822 = " \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin \
+"
 
 RDEPENDS:${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192ce += "${PN}-rtl-license"
@@ -620,6 +627,7 @@ RDEPENDS:${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8761 += "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8822 += "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
-- 
2.34.1


