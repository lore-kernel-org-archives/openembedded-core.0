Return-Path: <yannickrodriguez22@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DFC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:40:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.20395.1710344410981048821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 08:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aq4vQhSe;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: yannickrodriguez22@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413ebc5fc03so3561035e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710344409; x=1710949209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYuhrX+dH3vUD3L9dxdP3HjGsndWc16ongrA1bGp6LE=;
        b=Aq4vQhSeb+HzCzuqi95WvAUzLbTpamj8xoguUF7JrxXrNDDSh8ex5rneNpCXexPYCE
         Io39qXA1Fe8Zt/hu3GmWcxLeSyfmUoq7p+YqN2BnfQUM5SFY5D+JLwvyJnYSjtYbgmTt
         p/X8mzKc0WyXIJZsg2K/ruovpZl9DwCslpPfwg20z4El0WioNgiYKFcTo/xLQ9hBfddA
         ix/d247qMOp0+1Bx+W+DonfCzghwJhhZoaJ1erovdErW2c+JGnq1Dasc/qAF7kxEgwAk
         WMZoaDiY9P3D61R8+g5j/iRVTyxq4c5uncZ4ndcuYrEz2CmWOgyFinzffDtjiC/0V0fc
         RTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710344409; x=1710949209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYuhrX+dH3vUD3L9dxdP3HjGsndWc16ongrA1bGp6LE=;
        b=vXm1XPituRassMf6RHk5I2+AexWacrd6nyGUB72q9r+E+sHvvbgW50RDX9tp/6dNpV
         cvJM6LZ0lXliwkgUobQHF8/6jqdA9AJIaB343shQ1V/8DM6eERUdVJenh1/X5gjEb8BI
         UJGJ6zIrLXeIwXlsFkHlGJLPmspXpscFAo1XdZEJIhXkr+G+bvtNTfxLnTeJK++4e3Oi
         czu0IHQxSnTpcI+RegMF2AYAl/aV+Mjdu6/TKspq1hg+OXKuESrVNcaT99h9wtoelqdZ
         juMDNx9/PV0eoNckB6B7wC6dMf/I/29hZmWKPXyTc+z9KX5TMXwRtkpRz3uz9SFsa2Qa
         /JdA==
X-Gm-Message-State: AOJu0YwZntCMBSNeb22qtn0OQCIrWyVdTgtza8w1NCw8gjcZO9Rcn6pJ
	w60cfMOxi83bvYvhexvw8CBEcr/f/RNqHezisDlU9RpTiDXjzKccvdf0hLbvzIyb1ypX
X-Google-Smtp-Source: AGHT+IHvb/j2+fc4XrWTzY72FX46wNGk1/xtcVbAe9cxGex64kWltBU44Wj0RIg/tRf1NAqN5iJNig==
X-Received: by 2002:a05:600c:3f85:b0:413:c8e:d4d9 with SMTP id fs5-20020a05600c3f8500b004130c8ed4d9mr255380wmb.39.1710344409211;
        Wed, 13 Mar 2024 08:40:09 -0700 (PDT)
Received: from yannick-i2s.twiga.local (lputeaux-658-1-66-72.w193-253.abo.wanadoo.fr. [193.253.180.72])
        by smtp.gmail.com with ESMTPSA id fb4-20020a05600c520400b00413e6a1935dsm2599768wmb.36.2024.03.13.08.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 08:40:08 -0700 (PDT)
From: yannickrodriguez22@gmail.com
X-Google-Original-From: y.rodriguez@i2s.fr
To: openembedded-core@lists.openembedded.org
Cc: Yannick Rodriguez <y.rodriguez@i2s.fr>
Subject: [PATCH 1/1] linux-firmware : Add firmaware for Intel 9260 wifi modules.
Date: Wed, 13 Mar 2024 16:39:23 +0100
Message-Id: <20240313153922.154396-1-y.rodriguez@i2s.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 15:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197049

From: Yannick Rodriguez <y.rodriguez@i2s.fr>


Intel 9260 wifi modules  is a serie of wireless modules that need firmwares to function correctly. The linux firmware recipe does not have a package of these firmwares, and this commit add them.

Signed-off-by: Yannick Rodriguez <y.rodriguez@i2s.fr>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
index 1fd44f4d53..e7d9526b3e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
@@ -336,6 +336,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
+             ${PN}-iwlwifi-9260 \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -1190,6 +1191,7 @@ LICENSE:${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-9000      = "Firmware-iwlwifi_firmware"
+LICENSE:${PN}-iwlwifi-9260      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
@@ -1217,6 +1219,7 @@ FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.u
 FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
 FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
+FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
 FILES:${PN}-iwlwifi-misc   = " \
     ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode \
     ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm \
@@ -1244,6 +1247,7 @@ RDEPENDS:${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-9000      = "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-iwlwifi-9260      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
-- 
2.34.1


