Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A39C83F0A
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.25259.1751466341882553090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PrNgEV9X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so5952762a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466341; x=1752071141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTq/OW/UmvI3of8JZ2ZsqQ4ZVzJuttmJ2kOWq/bNpEM=;
        b=PrNgEV9XHIr0twZksQcekJgQ7yc0ZbfJZobXN1y/VeYwrUtS4ArgF9g2TuGyvfUjNa
         tUBAEF6OITZHEhuCd5ZKyx0JniTarWors+wC6xJ193fRp/+Un6kBOzi4z244pgzkrPrl
         1cKJWkvYt3wX6/rkJAmtffa2V3wOBAYocW9R2uG/7gvEGlXE12VoeaI4/UldwA7NMbCO
         OZCTaNkdCJAM2REdhiZ9FRvw1Ew23WoU0qX7C19sLRSI4miaftx/dKvRcttOgreX4iHC
         CTh4gdMrwnnypbxyRthduAK1On7/YxiLkHxjMTlUsDb0o+olYH4eGbP0sYIOcWHvPLly
         ehdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466341; x=1752071141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTq/OW/UmvI3of8JZ2ZsqQ4ZVzJuttmJ2kOWq/bNpEM=;
        b=rG80y33/Yzivzg27cWvPv1Jvnix+6vrYQgW8U0dy+KCR9Vl62MB0fRWo3QmY7DyMJg
         wT1//EuC2Bt+Pid239HK5JmqESzU8jcNkFOLW2t6mUdx1qgvyGXL/LiAMCqaXTJWzERc
         9lLuWZN77GqfS4EzvFvqYbzQItF+71NN8aa7yGdidSHtdNegwt0HyK4XE4tIL7r2Q3FY
         h0I2wmsY/yeHrKczb2xz7IfjWxCcf+VvqvrDTKUhp86UgOc35HG+Hx4WwtVY9DbYlDpr
         opUvxh67oFkT8rN7aAPMvmGfniQsrzMTZCMqDV9gh3MVzzA/gnEVzht756tWF0aD+8dk
         Q24Q==
X-Gm-Message-State: AOJu0YxsFovHY6z3coj4uWma03HIXFpptUi7fdHMpe3WhUm47zztJYMC
	EcUOGx4rlys9VZtJx6JPo16bt5rJL9d3Tif0i74LWX3XVUAnpOK4ma0dDw/Lw9Dgs3Ew3RbzN0r
	PcvcE
X-Gm-Gg: ASbGncuvl/raXs8doIS/hXung/8hAWiBj+BPETG1VHH7zam36s5NFB6PGsG5j1prh10
	6GQUb0VIXkeJQr/eEGcaoxsLuNOpqaUqJza6bA7YmuZn9c0gHfKCmzHI8x7mfRnX032odRwagX1
	cePL78tX2qyFZLhf0iCRbaoaMSzsM4dg4XWQSI9yuu8FCZAAgFT4hA+SVGHdmwV+8DzuarUG7In
	iXoIlk7i+Hb6buquhtWlxb+LBoskqm6GjAH0yQ8K2q2EbKGU3DwoDsJL5ltKnRpI0fbzG/oRF0t
	s9s0C/JFqxu62WJ7KncwPbV5vGPGAlLJFn0O4qbeEDNEZDL+4DGptw==
X-Google-Smtp-Source: AGHT+IGw3bDPCrpOCgJBG+2YfPgHdE/BO3x7BLa1XhJE1Sl5JMZzx0E9KJ72sxU7bxm/k9FIPB/OUA==
X-Received: by 2002:a17:90b:1b03:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-31a90c5ede7mr4451120a91.29.1751466340683;
        Wed, 02 Jul 2025 07:25:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/9] uboot: Allow for customizing installed/deployed file names
Date: Wed,  2 Jul 2025 07:25:22 -0700
Message-ID: <4293150af48d9eea7da8a25deaf88b3146195d8a.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219841

From: Ryan Eatmon <reatmon@ti.com>

Backport from master:
https://git.openembedded.org/openembedded-core/commit/?id=debc691853e2954bd325bad395b8829939afaa08

When assembling all of the various filenames that are installed/deployed
from u-boot, we have been including the PV and PR in the filenames.  This
change introduces a single variable to replace these two in the
filenames.

This change should not be disruptive since the default value for the new
UBOOT_VERSION variable is "${PV}-${PR}".

In one case (UBOOT_EXTLINUX_SYMLINK [1]), PR was used without PV, this
patch assumes this was a mistake and corrects it as PR would not be of
much use alone.

[1] https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=33df3a65f3e8e136811da715d0cc247ce66ae0ea

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/uboot-config.bbclass | 15 +++--
 meta/recipes-bsp/u-boot/u-boot.inc       | 80 ++++++++++++------------
 2 files changed, 50 insertions(+), 45 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index bf21961977..f360050042 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -22,12 +22,17 @@ def removesuffix(s, suffix):
 UBOOT_ENTRYPOINT ?= "20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
+# When naming the files we install/deploy, the package version and revision
+# are part of the filename.  Create a single variable to represent this and
+# allow it to be customized if desired.
+UBOOT_VERSION ?= "${PV}-${PR}"
+
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
 # but enable individual recipes to change this value.
 UBOOT_SUFFIX ??= "bin"
 UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 UBOOT_BINARYNAME ?= "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
-UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_IMAGE ?= "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_VERSION}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK ?= "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?= "all"
 
@@ -36,7 +41,7 @@ UBOOT_MAKE_TARGET ?= "all"
 # purposes.
 UBOOT_ELF ?= ""
 UBOOT_ELF_SUFFIX ?= "elf"
-UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}"
+UBOOT_ELF_IMAGE ?= "u-boot-${MACHINE}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}"
 UBOOT_ELF_BINARY ?= "u-boot.${UBOOT_ELF_SUFFIX}"
 UBOOT_ELF_SYMLINK ?= "u-boot-${MACHINE}.${UBOOT_ELF_SUFFIX}"
 
@@ -49,7 +54,7 @@ SPL_BINARY ?= ""
 SPL_DELIMITER  ?= "${@'.' if d.getVar("SPL_SUFFIX") else ''}"
 SPL_BINARYFILE ?= "${@os.path.basename(d.getVar("SPL_BINARY"))}"
 SPL_BINARYNAME ?= "${@removesuffix(d.getVar("SPL_BINARYFILE"), "." + d.getVar("SPL_SUFFIX"))}"
-SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}"
+SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}"
 SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}${SPL_DELIMITER}${SPL_SUFFIX}"
 
 # Additional environment variables or a script can be installed alongside
@@ -62,14 +67,14 @@ UBOOT_ENV ?= ""
 UBOOT_ENV_SRC_SUFFIX ?= "cmd"
 UBOOT_ENV_SRC ?= "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
 UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
-UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
+UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${UBOOT_VERSION}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
 # U-Boot EXTLINUX variables. U-Boot searches for /boot/extlinux/extlinux.conf
 # to find EXTLINUX conf file.
 UBOOT_EXTLINUX_INSTALL_DIR ?= "/boot/extlinux"
 UBOOT_EXTLINUX_CONF_NAME ?= "extlinux.conf"
-UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
+UBOOT_EXTLINUX_SYMLINK ?= "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${UBOOT_VERSION}"
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3c01720192..7935f2b4aa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -199,16 +199,16 @@ uboot_install_config () {
     config=$1
     type=$2
 
-    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 
     # Install the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${type}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
+        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
     fi
 }
 
@@ -218,9 +218,9 @@ uboot_install () {
 
     # Install the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
     fi
 }
 
@@ -228,9 +228,9 @@ uboot_install_elf_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+    install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 }
 
 uboot_install_elf () {
@@ -242,9 +242,9 @@ uboot_install_spl_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
+    install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
 }
 
 uboot_install_spl () {
@@ -288,10 +288,10 @@ do_deploy () {
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
-        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
+        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${UBOOT_VERSION}
         cd ${DEPLOYDIR}
-        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
-        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
+        ln -sf fw_env.config-${MACHINE}-${UBOOT_VERSION} fw_env.config-${MACHINE}
+        ln -sf fw_env.config-${MACHINE}-${UBOOT_VERSION} fw_env.config
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -361,19 +361,19 @@ uboot_deploy_config () {
     config=$1
     type=$2
 
-    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
     cd ${DEPLOYDIR}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
-    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
+    ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
 
     # Deploy the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
+        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
         cd ${DEPLOYDIR}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${type}
     fi
 }
 
@@ -387,10 +387,10 @@ uboot_deploy () {
 
     # Deploy the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION}
         cd ${DEPLOYDIR}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}
-        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${MACHINE}
+        ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}
     fi
 }
 
@@ -398,11 +398,11 @@ uboot_deploy_elf_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
-    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+    install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
+    ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
 }
 
 uboot_deploy_elf () {
@@ -415,12 +415,12 @@ uboot_deploy_spl_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+    install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
     rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-    ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
+    ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
 }
 
 uboot_deploy_spl () {
-- 
2.43.0


