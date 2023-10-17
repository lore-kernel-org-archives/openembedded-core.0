Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BAEC46CA1
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:19:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.202789.1697534362841209228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 02:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1Ge4igi;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32da9ef390fso2071096f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697534361; x=1698139161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiqiWl1nFNoYZOxenKVD3VF5Q2T5Xau4G9sHx2P4G3w=;
        b=d1Ge4igiuNdgO34KCRj37w28bhGYrLYICNYOPrQEIG3uB+sYklkgJtf2fSMBElw2Ws
         f338xNlBMxSJ3EOStNudopTwHd7OVm+Etx/cP6LW5gNjP6Y0e9dSgDTzBrx6Ji6YfXxU
         c+G3Vhq5VOO4+3PnLryyZ7Q/nNI49AQHb6An7KyEgPd6BL9ffm6ZBJYLFT3FTQRsAfE/
         SmuXOErHAtEAaIVVET4IiR4qagHcrdsRwfHdCmRAIqYTbiGJqyew9SXioDXTDIV7VEOG
         FJhLD/9KgHx/c0ZK0R7a5acHpniWGUeKIU3tLo+eicMFurKRIuiX7t7pMqgU6MHjEipe
         wTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534361; x=1698139161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiqiWl1nFNoYZOxenKVD3VF5Q2T5Xau4G9sHx2P4G3w=;
        b=gZIgI0vX3Q1RzUJpBKZWOvlvXq7716KR9PdM4RKXD1Tw7lhgpaaPIB0EzW1W4i+2uH
         Cu8coNhJrnOqWdKkvdieM7lGwH9KEmWavdm8PeRmY3NtNIEGGrfWn9SHMNOifcov3AGX
         PLnuPl27YcAintxC8TGD9+lBNpPeaIu0CcWh+irQfBN3+xhM1QynJe5QyJkpkkjz9Klo
         IJ/Hc7MvCB2xbb2XFTmxgRMC+Cdnj++n+j+or/pTINcn1L5coFxuynGhwevnfpSzfshv
         +61ZY7IvwAUviPQeTQV8+v5j/ayv9IMVrOvmUYjJpXtMQHgGVd2mkvN0UbCD/7T/7sae
         t5Iw==
X-Gm-Message-State: AOJu0YxcegVZgWbOzATY+7c0jU7iGfaiwlCkkZ9KxlCZWHGQGl7JBS88
	tTpSLulfbA6f6jAiOxnPxrMZKHWZZo8=
X-Google-Smtp-Source: AGHT+IGscZOswldu7LoTiXStevwXCktcz6FmovvqpRBQlU3D0Q1Eq/VGg6J86MMoY1bUpnuCb3r+Gw==
X-Received: by 2002:a5d:5347:0:b0:329:6b3e:d87d with SMTP id t7-20020a5d5347000000b003296b3ed87dmr1292352wrv.42.1697534360804;
        Tue, 17 Oct 2023 02:19:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa75:9e00:42c2:7a32:9a48:d1d3])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d510f000000b0032008f99216sm1210422wrt.96.2023.10.17.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:19:20 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 1/4] systemd: sort packages before pn
Date: Tue, 17 Oct 2023 10:18:57 +0100
Message-ID: <20231017091900.114311-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 09:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189318

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 77724eb822..d24bf0cb06 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -384,20 +384,20 @@ python populate_packages:prepend (){
 PACKAGES_DYNAMIC += "^lib(udev|systemd|nss).*"
 
 PACKAGE_BEFORE_PN = "\
-    ${PN}-gui \
-    ${PN}-vconsole-setup \
-    ${PN}-initramfs \
     ${PN}-analyze \
-    ${PN}-kernel-install \
-    ${PN}-rpm-macros \
     ${PN}-binfmt \
-    ${PN}-zsh-completion \
     ${PN}-container \
+    ${PN}-extra-utils \
+    ${PN}-gui \
+    ${PN}-initramfs \
     ${PN}-journal-gatewayd \
     ${PN}-journal-upload \
     ${PN}-journal-remote \
-    ${PN}-extra-utils \
+    ${PN}-kernel-install \
+    ${PN}-rpm-macros \
     ${PN}-udev-rules \
+    ${PN}-vconsole-setup \
+    ${PN}-zsh-completion \
     libsystemd-shared \
     udev \
     udev-hwdb \
-- 
2.42.0


