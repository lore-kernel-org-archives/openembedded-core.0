Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87044C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 19:39:44 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.80512.1709494777163135021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 11:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gsw3DT57;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-58962bf3f89so1225205a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709494776; x=1710099576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAOLVzJDUjoZ0uVVI7RHIsABke17OXYus2ggY2UA8no=;
        b=Gsw3DT578sPoGwWYSyPMhbWWqreUeTSvzXoFyXOmTsJUSYp3mNyhS6RdALfw5seU4P
         DnpfQsQw2KTq0CrbjtfT0fv37vKje6i2QXfxsbnSJTfKH3gT60slaw33iRoJT16qMKV0
         myQvLR8hmwSRrHBQBCyF7plBn6I2/fGEtSHo+C2giY0OvS82Wwrqs/ZD8+ToFo+87rp0
         zVCBqXJcsJhvr5mI+WdGBgN5eULFSt1SFWNNXy0V0lh37Jb2m6ENaELWx77IeCtdf3eR
         w1tVUQcEEuFqxroH5Bg1RP9fBHK+k1Zh3vpol05mM/7Fy5h3AyeMJdO6QXNgPlha2XBm
         s27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709494776; x=1710099576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAOLVzJDUjoZ0uVVI7RHIsABke17OXYus2ggY2UA8no=;
        b=kLqdSVl3yoeXDDb0BmQz6aSDjAR2mc/4oiTaSyNrgbTUOdA8MQG7lhyHg9jb7eUjLK
         vXJu5EizyyYrpize50JKVaPm5JOXXC9Ue+XSi5yCBGZ00EJN/xrsHwbkdsVYu7vcaw0W
         QZ/i2xmX//aAUdLRWVhm39ZJX9dQ/rh1zNNiXeb06T3pEsFHC4OExFHJnzJrWkd2qOZ1
         +pTyxvUoyxuVY9tZ4RjBnOUdPfYbTZPFifx6nWZwX4W2q+gaBGYOb5uuQfXHany70JYn
         Ja3MJqWQNqCAU4OHW4Q/RSNVBGKhFWoY2FpMKeUbcuNeZfSp3CaMwA1YxC1/LHi0xm3K
         3tdA==
X-Gm-Message-State: AOJu0YwMyu5nfi++pKLh7cLiv3QzqWxu563VEOCJGdZUQ8y53F+SCtrc
	+1wuNSQ17E2BwNGmr2ITuaPaR4ZO+q3BS4Dcg2CXzpdh3SNSNm7A
X-Google-Smtp-Source: AGHT+IEk4dT24uoDGKztDrgbTD1lNLIZkq/8+0l8SOTSD56YTO7ZfLh7J9dgTrpY2wTuFZAPAgGP3A==
X-Received: by 2002:a17:902:eb4d:b0:1dc:6941:cde5 with SMTP id i13-20020a170902eb4d00b001dc6941cde5mr7634544pli.4.1709494776604;
        Sun, 03 Mar 2024 11:39:36 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d611:b634:911c:4aa8])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc96cb0358sm6947064plx.206.2024.03.03.11.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 11:39:36 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	Fabio Estevam <festevam@denx.de>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH] [kirkstone] u-boot: Move UBOOT_INITIAL_ENV back to u-boot.inc
Date: Sun,  3 Mar 2024 16:39:27 -0300
Message-Id: <20240303193927.633105-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 19:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196576

From: Fabio Estevam <festevam@denx.de>

Commit cc6c3e31526d ("u-boot: Move definitions to common locations") moved
UBOOT_INITIAL_ENV to uboot-config.bbclass, but it should be kept at u-boot.inc
because it encodes ${PN} in it, which should be set by the U-Boot recipe.

Currently, whatever inherits uboot-config bbclass will fill-in its own PN,
which would change the content of UBOOT_INITIAL_ENV per-package.

Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Cc: Marek Vasut <marex@denx.de>
Fixes: cc6c3e31526d ("u-boot: Move definitions to common locations")
Signed-off-by: Fabio Estevam <festevam@denx.de>

Backported from master: 0b0c4b37d318b86f100512476ffd861e0ce1f47e
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/classes/uboot-config.bbclass  | 4 ----
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index b9ad35821ac9..fe8552187747 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -59,10 +59,6 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
-# Default name of u-boot initial env, but enable individual recipes to change
-# this value.
-UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
-
 # U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
 # to find EXTLINUX conf file.
 UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b2f33e382664..54ea2e9e50f0 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -24,6 +24,10 @@ PACKAGECONFIG[openssl] = ",,openssl-native"
 # file already exists it will not be overwritten.
 UBOOT_LOCALVERSION ?= ""
 
+# Default name of u-boot initial env, but enable individual recipes to change
+# this value.
+UBOOT_INITIAL_ENV ?= "${PN}-initial-env"
+
 require u-boot-configure.inc
 
 do_compile () {
-- 
2.34.1


