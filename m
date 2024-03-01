Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41437C54798
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 00:37:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.11513.1709253455717799507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 16:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSqeJaKX;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cfb8126375so357792a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 16:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709253454; x=1709858254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7ToS2jnn+6NnwXaBKWwXauaTPetSxRmJFHunioExjs=;
        b=LSqeJaKXDG2HXKvF0+/qhJUzjmKljHEBgMPgHAxmOvgU7Wa5yJykzZsGCmZVSPF0Tu
         jadIf5Qf2kXIFuTS6oCe/4VaRjN8h+VO8RCbdvda01Sypuv/AJ62F+1sRs9XUVLfddrZ
         fxL5GJeW/vJLG5/Cb5/gDLmPJaWpFYCUQ3q992clOAJNG7lEMp8dew68oWJUlUH9+t60
         hT3hvvf6LwOxeel+uQQbxTej9rr+8Qkzrn7w1i5U4fxAa2/0CXD7jcaSwoRCK2rdTTgD
         4qnLyv4Atoq2NQRbLAhM1Oyqq+pOYejAHZl+T48beE1DL3XMC2Qn/8BhtQJKwYZ0I3R0
         LYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709253455; x=1709858255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7ToS2jnn+6NnwXaBKWwXauaTPetSxRmJFHunioExjs=;
        b=eoN/X7j9DN9K9WiDkmpAZXlK8IqFqT2v6nedpoPqzXoSifqRkNwYp52x2Llt0lGS1R
         nLuKeY4/PQ+wBiaN1LUo0rz0BcME90UDIiLiU9mhOc0WLWuOJ0DI/KRVAYyrQvKACYUP
         AwrQjnPZSG4YPtKwPLT1OEq1N9VZ1w3LXTSXy4IglySjzXCxa6cHkYDRankulozlc5aG
         EDxVI2EztNs1QPoeVVVELThIfDoyBWm3zk3kwlpA1Uh1yepgAA53QN1o8fsmVAfSbTKi
         nr2qMG1eY43mLJUlMHtG7Esv+uDYi9imGgHVSKQilU2+79oI2Lc4Tf4BBo+JYDgupP7q
         D6Ew==
X-Gm-Message-State: AOJu0Yy2Z8NhCNSHQ1P8nJddALZSLhWJcqF5oidohqSFhqz9P6hJLHgb
	WozxOi2i8N/j2CzYTWJH2/XLQxY7uGT+KNjyHKI4hctfZ/O0y/x+OFr8fBTy
X-Google-Smtp-Source: AGHT+IG6LBIcNgcgdBTzSbQnnheoWjqZJX1As6zqFJy2DeHgRX9k2JJHz7cJH73Ue2sMm8nzxyRJMA==
X-Received: by 2002:a05:6a21:6daa:b0:1a1:2138:23a3 with SMTP id wl42-20020a056a216daa00b001a1213823a3mr72778pzb.2.1709253454469;
        Thu, 29 Feb 2024 16:37:34 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f400:5f2:32a7:5448])
        by smtp.gmail.com with ESMTPSA id mn14-20020a1709030a4e00b001dcada71593sm2124503plb.273.2024.02.29.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 16:37:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Move UBOOT_INITIAL_ENV back to u-boot.inc
Date: Thu, 29 Feb 2024 21:37:29 -0300
Message-Id: <20240301003729.47225-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 00:37:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196452

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
---
 meta/classes-recipe/uboot-config.bbclass | 4 ----
 meta/recipes-bsp/u-boot/u-boot.inc       | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index 0c579e8861..e55fc38b7c 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -65,10 +65,6 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
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
index 79f84b0672..f5b43f6e36 100644
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
 
 do_savedefconfig() {
-- 
2.34.1


