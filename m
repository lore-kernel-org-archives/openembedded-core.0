Return-Path: <yannickrodriguez22@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB1FC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:35:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6821.1710362150656010733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJmWZFYE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: yannickrodriguez22@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e76d653b5so170712f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710362149; x=1710966949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3qzRarBZGKqq3r3u8Nz4SDHJS0yL82UKpxQKi3/JeU=;
        b=MJmWZFYENA7WQyQlpOWMrVLe4LdJnCEoU3KeT1YO2GtGudH4S6BgWL6Ffl4q2WziwS
         TZYOtIw2AYTJ4eLDMbFBLHVMAV938lbH0A1GgzY0Ent/YfI+xN/hfDc6Zx2kmcobIj4t
         pgrMsvjP0cTNvXd2+Ow/gfYtFkqvoQbOHTmUflbNl9uSVYHSh+zdO8+p2Yj/KEXaRqUc
         EvR/r25q1eudLNUqXdlr3okr+mA2ef5Js2ZWaGuQCAlCp3PjuikBFnP1sGighg5h5ZMT
         KlIry6EUGUGx8xOr9odwlLe2IUHg1tusU+6RtoqHiYzQGfQdI5tuDx1AKRJKcIHXCuEd
         jAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710362149; x=1710966949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3qzRarBZGKqq3r3u8Nz4SDHJS0yL82UKpxQKi3/JeU=;
        b=WQ480PjeAWxANT7QzDCRDAN/Z6vNXS2Hjl35TGNFSxvQMzEQ8WTdvNvilrKxCJe7Fc
         fGuCUvI9tswdAUiENHwpVA1fG+Grgp42ECbPCFxOp+Mv1PLsbMHhk861pm3B/QuwG0Ec
         gjQnYPy/keHmuflTIx2Ydo8IWRgMFq9qfA3ExaT7xRe9ObpH/8Lz7fpKLcyplN98k1PO
         uk1CSJ8Sd3pAJGrAK0nlydQCLLdniVu2txAAL2KEy9Vz49LaCYhx01ctiBqZOOcHR6j7
         4vbNTrDzkQTgmitL2sgg6B7vTj/STE5Tp+8JMXFzgvEooN+PQS9aAkMln/N1e/XavxkJ
         tUzg==
X-Gm-Message-State: AOJu0Yx0cU1py3DQEKllWtA8HVdh2RpN+rY5WYuwXHQ0pbtw4QSkzuzf
	BiKkmYBxyDOBk7yWZ7ufs8o2vwJ81MmKqqB2YAZ+L/le+dp0xPAYoyjgHtQsXbk=
X-Google-Smtp-Source: AGHT+IFdbkIGBW5xTjgDjNJ4M34tKoH6nMuPeHYdCXR9irH5TyVwZqtcZm2g15cc9bJZLEpdCPZmnQ==
X-Received: by 2002:a5d:670f:0:b0:33e:c3ca:e9ff with SMTP id o15-20020a5d670f000000b0033ec3cae9ffmr311961wru.61.1710362148796;
        Wed, 13 Mar 2024 13:35:48 -0700 (PDT)
Received: from yannick-i2s.. ([2a02:8429:bd73:4401:30e5:f181:9886:1ed6])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d4ec9000000b0033d56aa4f45sm12441995wrv.112.2024.03.13.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 13:35:48 -0700 (PDT)
From: yannickrodriguez22@gmail.com
X-Google-Original-From: y.rodriguez@i2s.fr
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@theobroma-systems.com,
	Yannick Rodriguez <y.rodriguez@i2s.fr>
Subject: [PATCH v2] linux-firmware: Move Intel 9260 modules firmware.
Date: Wed, 13 Mar 2024 21:29:01 +0100
Message-Id: <20240313202900.6408-1-y.rodriguez@i2s.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 20:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197082

From: Yannick Rodriguez <y.rodriguez@i2s.fr>

Moving intel 9260 firmware because it's common wifi chip and otherwise
to include this firmware whe have to include iwlwifi-misc which included
a lot of firmwares.

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


