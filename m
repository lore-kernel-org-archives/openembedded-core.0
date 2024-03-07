Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07BFC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 18:38:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1085.1709836699499655203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 10:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mGPRFzFZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dd01ea35b5so7935175ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709836699; x=1710441499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P73LzNU7WvMRjX7grGYzi+j5mP5PLiAqr8yFgdyqwEQ=;
        b=mGPRFzFZEsx7zdwAHNtVKZphNvQyqiIQwA952NueesgA6h+D6WojFpdsBvaNf+a29N
         Xz8BbEfgG8fc9z1LPW3Vw9JYgRNwJsQpdQf5BC3HX80Uaj2FCJD7aDLZrJq4VsM3Ag7H
         5UHpQgx3umK0nOLNBsHs1S0eOLo5lzJqIzMGguuol/zGxQemnTfHh276GkW32RG3tRE+
         0H+PbZmyvJXW0Dsf6sbMV5X6f+zmcUKvW0TBXPTv3QQ38GuV49o7tBRZvXQ7Bx6uFybG
         JjSgnE0iZ4azeceJGFSINmdseEvmdSdeL501JHu/QIXYukWVuP9uQEfXxba9bI3uQlOC
         gYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709836699; x=1710441499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P73LzNU7WvMRjX7grGYzi+j5mP5PLiAqr8yFgdyqwEQ=;
        b=ozQij7nV3+PyYXnmy2hlIILgWSFw3Wmpc4kRABwNxA+XSBnRQzvRVN6CJtXDeHGN7c
         C7MP0ff+E5PWB+kusfSWEhpA6ihHC84dKKbbY2thoQJoD7zBJyWrI65TmZI2okThHq8B
         hTqckbrHZj8Xh2v3rYCLJuECDM1U1TVQs+u8ixkTp0hcyKgeU4Xj9GT7l7ozCsVmWPG5
         xX5WqGRPhVOoxzB8m0dajH2NUFF/2yidapf4G3q7hMuDN5hjcmGPUfR5h9pxZRBk1gHB
         EyPB2mRC0+OTbO/mTC4ipr2UEBWWVWpknOLBYqgz8xC3C2OWh2AkiOs7rN47L/b/gLC2
         LHoA==
X-Gm-Message-State: AOJu0Yz3t5dOdkEgk+jCxEtuK9uj/wHu56LJY+it+iQRBXK+j1Uctd7w
	N0CX104jVLReF0IQx7qoJIpQMxTyBrm3jyALHcgxM6eguvews2lB3sJp689OFxKWlqFfbCNw9rQ
	st8Q=
X-Google-Smtp-Source: AGHT+IHmxKsLBSiV2j5KdWPamDpDqq7WecTFqxVi6ggM7fjBzZNG2gtJxs7/73rYodlJw0r0Krm2sA==
X-Received: by 2002:a17:902:a50e:b0:1dc:66da:d21a with SMTP id s14-20020a170902a50e00b001dc66dad21amr8373966plq.28.1709836698616;
        Thu, 07 Mar 2024 10:38:18 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b001d7057c2fbasm14959026plg.100.2024.03.07.10.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:38:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] u-boot: Move UBOOT_INITIAL_ENV back to u-boot.inc
Date: Thu,  7 Mar 2024 08:38:08 -1000
Message-Id: <18b76259d27dc045f621cd512582c37e8bbab45c.1709836581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709836581.git.steve@sakoman.com>
References: <cover.1709836581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 18:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196812

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-config.bbclass  | 4 ----
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index b9ad35821a..fe85521877 100644
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
index b2f33e3826..54ea2e9e50 100644
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


