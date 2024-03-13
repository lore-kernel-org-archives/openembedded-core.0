Return-Path: <yannickrodriguez22@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F640C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 15:23:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.19842.1710343406481703982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TT9oRsn4;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: yannickrodriguez22@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6c10bdd2fso470400b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710343406; x=1710948206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYuhrX+dH3vUD3L9dxdP3HjGsndWc16ongrA1bGp6LE=;
        b=TT9oRsn4GRPjjYVDBzpZaElWc3V/wVUNQxJm1EM4np+Ha9LwRBcc6nGx55iLBnqj6/
         PMrWvNYsX7bGIuw+WqJvWzXCvkuVSO9bp0v8mbfOUD0vFRxebJaVgP2b0ASqZjpg8ZLF
         /hqwKS+ItexjlsNWRrzjYMNakrvaeCQgwEnme+kSfScw5/lUlD69uU54A92kRQoz78nQ
         bAFQ+Gdl28syq9JzWO7yYZTs+LvAHFZanV0yFPRoKDUMaT75b7+eSd1hFJwjlbjBVGfh
         AhJwcOHsr2PGkI97KW75v5UYdfqI5ABAlB5LUAl06Tp7g7OTYa7Mm4OEH7ppfYK0sDoC
         cS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710343406; x=1710948206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYuhrX+dH3vUD3L9dxdP3HjGsndWc16ongrA1bGp6LE=;
        b=G8r6zDmB8dsyEdP9TS2zxQCfKxEnGbygJBdoGkoZECRXhmKYGZ1s2XLLwqCGjqn3gg
         r9PUi3Lr+N9EGKSxpval8e+ZOQQJb2cSw/q5JU2sCfawDW3/VqN1J43Q5mauA03KeQaM
         NJ/99Auo9wY5+1PAi0oF/CQQmW/jE6wY1i+tlHje6/D7xsxhH7QuLXRkrZwYLCmiPn9U
         VAkB0ggzPUuxUtYRZY1Db/tu51I0TC+oLn4tXlvx8O8E7ujv4afNM0b+AJjTVWmGQ7A6
         I0TemqZiCTZRKR4fBqI5r2SJtmlgB0ZFk1WUMfE+2Ag+ZR6DvOKlmim6Lyy0+O0JbVQY
         ldjA==
X-Gm-Message-State: AOJu0Yz/zyluXAer7nStKnLlUOZSGiWAHYjkezaoKiZNethJvffSTjap
	fUc3neFfX7Ikofrw8mCae4Z873pRIcj98W/MAlaYNzvnSlJrA/XjZmX1To+5Rwk7aFhT
X-Google-Smtp-Source: AGHT+IGnsRzbLeYfCN12ErLeb9Kya6gCwvmPki0oM6ao2RLxb1pwbtEe9MhaZCeaOdys9G0hv1E9jA==
X-Received: by 2002:a05:6a20:9148:b0:1a3:34c4:b176 with SMTP id x8-20020a056a20914800b001a334c4b176mr1900609pzc.3.1710343405734;
        Wed, 13 Mar 2024 08:23:25 -0700 (PDT)
Received: from yannick-i2s.twiga.local (lputeaux-658-1-66-72.w193-253.abo.wanadoo.fr. [193.253.180.72])
        by smtp.gmail.com with ESMTPSA id a14-20020aa78e8e000000b006e6b73eb992sm1504930pfr.118.2024.03.13.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 08:23:25 -0700 (PDT)
From: yannickrodriguez22@gmail.com
X-Google-Original-From: y.rodriguez@i2s.fr
To: openembedded-core@lists.openembedded.org
Cc: Yannick Rodriguez <y.rodriguez@i2s.fr>
Subject: [PATCH 1/1] Add firmaware for Intel 9260 wifi modules.
Date: Wed, 13 Mar 2024 16:22:51 +0100
Message-Id: <20240313152251.145539-1-y.rodriguez@i2s.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 15:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197047

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


