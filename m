Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411C0C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:03 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.138696.1692116698987207146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=L51uf+Ml;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso23535475ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116698; x=1692721498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMCD/v7nEeNTgkqJxRj6C8b3my/06pH8ruNGhNKiLHA=;
        b=L51uf+MlpbMAfmJUzwgtUM0cfQKzANR1YdHaEstjrxOsGiihMMYgdN+wwDUTnl6wnT
         s3umj6rAxfP/tWY9xsWR2hdeHjJHjNxllLB9fF4VAQU3dNAjTLeIsB2YRP2Losbj9sV0
         qNCbQU4Blv6HzTPNkjTzYj39Rx3VlXu+sBMjbiY8kwrw38nrCcSxp8M/lN6A26Bq6jnp
         pqxtB6UvwS+wshpodpV/jmB6+Z1W5rHqxbQrmtmnTvGoifudveoV8ucZGMW7pHPt0Yqg
         V3vsQOHL0PXG4g2PajaMuStLtGdgrkVRG90MWd9VST5pOgla0bgJRxeLalzlWmM6qBQZ
         fhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116698; x=1692721498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMCD/v7nEeNTgkqJxRj6C8b3my/06pH8ruNGhNKiLHA=;
        b=Hege2+RL8Nro21cidywMiqPkspgLCTbyPkcRQO7lvWQPZhslnaUnQ2SMMhtLVbpc9r
         PYd2DKUOTG+Pjf24/kd4UW+jQO0O/pvwg54WUn/15UrukFH+PpK3uV2Zv2Uv3ibWluZi
         uKhk3vXJcjTK8cT9D/mid0hStgHIkSPfa0CWXYupKc6DCjC3Rgjg9JXsmBVUsEKGpYuW
         Zr53FuvufsDfjtn65YxBTkdIZ4ufUKSMUhviA5x7mKnM6Xc2Dh9RLhIzdhDrAGZQlu0E
         osPTT8Y+3SXdMicsPgwf3WWt0g76yqE0nqGJ8WktwN5sLIrgfsirUal/I2wL2FjuViRq
         IceQ==
X-Gm-Message-State: AOJu0Yy6LWyqrHhq5Lp/5iW31HpZdLofE348LAVINiQSjnQ5VY70U3b6
	Sanlko77mut7DLbqrReAB5cOLRvJlxg9VBXq/3E=
X-Google-Smtp-Source: AGHT+IEU7+0aLVHBvmJ828fUKab2FnRdWkscz6IuX23ln29LdJ4cXGbsu3E+8yeIkTh6Je4t23El9w==
X-Received: by 2002:a17:902:b907:b0:1bc:239:a7e3 with SMTP id bf7-20020a170902b90700b001bc0239a7e3mr10075266plb.44.1692116698143;
        Tue, 15 Aug 2023 09:24:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/18] linux-firmware : Add firmware of RTL8822 serie
Date: Tue, 15 Aug 2023 06:24:22 -1000
Message-Id: <ca4b61fa52cded56b2fe926f8cad2aa44b601dbf.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186092

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


