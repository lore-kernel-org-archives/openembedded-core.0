Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AC7CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 22:44:00 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3219.1759877031150243788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 15:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ebaS1s2C;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597MhoNc3854240
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 17:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759877030;
	bh=XMN4VwqzbOxz3HUqZDJkCvA80sOJD7LEWvgkDR8arDs=;
	h=From:To:Subject:Date;
	b=ebaS1s2CPanIsnOJOQpVbXcytg9WVYaTk7bCwoWutPfj+5gQ8A82Py7Zq/izgxUHc
	 LNA56GUTqc8panck+Y6JvMq7hXeTbxoicF61rFoSrsfCxxGypDXiWQACkIge2lBf+g
	 3ldxZzUEPeBVtf8xa2SEXgNOFhgkJCoznAWX3WO4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597Mhoai199680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 17:43:50 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 17:43:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 17:43:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597MhosQ1828149
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Oct 2025 17:43:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v6GPN-00064e-OE
	for openembedded-core@lists.openembedded.org; Tue, 07 Oct 2025 17:43:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] u-boot: Make sure the build dir is unique for each UBOOT_CONFIG
Date: Tue, 7 Oct 2025 17:43:49 -0500
Message-ID: <20251007224349.23308-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 22:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224574

Each UBOOT_CONFIG entry is run in a different directory under ${B} so
that the files can be generated, compiled, and installed differently
from each other.  Currently that unique directory name was just the
defconfig used for each UBOOT_CONFIG.

One potential conflict arises when you want build the same defconfig
twice, but pass in different make options.  Then we get directory
collision.  Simple fix is to include both the defconfig name and the
UBOOT_CONFIG type in the directory name.

This change has the potential to be backwards breaking if a layer is
using the UBOOT_CONFIG flow and overriding/appending any of the do_*
shell functions.  Each of those will either need to change to using:

${B}/${config}  ->  ${B}/${config}-${type}

or for append functions they can use the new variable in the parent
function:

${B}/${config}  ->  ${B}/${builddir}

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-sign.bbclass       |  7 +++-
 meta/recipes-bsp/u-boot/u-boot-configure.inc |  8 ++--
 meta/recipes-bsp/u-boot/u-boot.inc           | 40 ++++++++++++++------
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 0f387a3a3e..66b9698c1d 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -528,6 +528,8 @@ do_uboot_assemble_fitimage() {
 				fi
 			done
 
+			builddir="${config}-${type}"
+
 			for binary in ${UBOOT_BINARIES}; do
 				k=$(expr $k + 1);
 				if [ $k -eq $i ]; then
@@ -535,7 +537,7 @@ do_uboot_assemble_fitimage() {
 				fi
 			done
 
-			cd ${B}/${config}
+			cd ${B}/${builddir}
 			uboot_assemble_fitimage_helper ${type} ${binary}
 		done
 	else
@@ -584,7 +586,8 @@ do_deploy:prepend() {
 			for type in ${UBOOT_CONFIG}; do
 				j=$(expr $j + 1);
 				if [ $j -eq $i ]; then
-					cd ${B}/${config}
+					builddir="${config}-${type}"
+					cd ${B}/${builddir}
 					deploy_helper ${type}
 				fi
 			done
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bsp/u-boot/u-boot-configure.inc
index bada506b66..f3d9e55105 100644
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
@@ -33,6 +33,8 @@ uboot_configure_config () {
     config=$1
     type=$2
 
+    builddir="${config}-${type}"
+
     unset k
     IFS="?"
     uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
@@ -45,10 +47,10 @@ uboot_configure_config () {
     unset IFS
     unset k
 
-    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${config}
+    oe_runmake -C ${S} O=${B}/${builddir} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${config}
     if [ -n "${@' '.join(find_cfgs(d))}" ]; then
-        merge_config.sh -m -O ${B}/${config} ${B}/${config}/.config ${@" ".join(find_cfgs(d))}
-        oe_runmake -C ${S} O=${B}/${config} oldconfig
+        merge_config.sh -m -O ${B}/${builddir} ${B}/${builddir}/.config ${@" ".join(find_cfgs(d))}
+        oe_runmake -C ${S} O=${B}/${builddir} oldconfig
     fi
 }
 
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e0a69e740e..16c9836508 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -75,6 +75,8 @@ uboot_compile_config () {
     config=$2
     type=$3
 
+    builddir="${config}-${type}"
+
     unset k
     IFS="?"
     uboot_config_make_opts="${UBOOT_CONFIG_MAKE_OPTS}"
@@ -87,7 +89,7 @@ uboot_compile_config () {
     unset IFS
     unset k
 
-    oe_runmake -C ${S} O=${B}/${config} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
+    oe_runmake -C ${S} O=${B}/${builddir} ${config_make_opts} ${UBOOT_MAKE_OPTS} ${UBOOT_MAKE_TARGET}
 
     unset k
     for binary in ${UBOOT_BINARIES}; do
@@ -100,8 +102,8 @@ uboot_compile_config () {
 
     # Generate the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
-        cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
+        oe_runmake -C ${S} O=${B}/${builddir} u-boot-initial-env
+        cp ${B}/${builddir}/u-boot-initial-env ${B}/${builddir}/u-boot-initial-env-${type}
     fi
 }
 
@@ -110,7 +112,9 @@ uboot_compile_config_copy_binary () {
     type=$2
     binary=$3
 
-    cp ${B}/${config}/${binary} ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+    builddir="${config}-${type}"
+
+    cp ${B}/${builddir}/${binary} ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
 }
 
 uboot_compile () {
@@ -204,13 +208,15 @@ uboot_install_config () {
     config=$1
     type=$2
 
-    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -D -m 644 ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
     ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
     ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 
     # Install the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
+        install -D -m 644 ${B}/${builddir}/u-boot-initial-env-${type} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}-${type}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${D}/${sysconfdir}/${UBOOT_INITIAL_ENV}
@@ -233,7 +239,9 @@ uboot_install_elf_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${UBOOT_ELF} ${D}/boot/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
     ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
     ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${D}/boot/${UBOOT_BINARY}
 }
@@ -247,7 +255,9 @@ uboot_install_spl_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${SPL_BINARY} ${D}/boot/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
     ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}-${type}
     ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${D}/boot/${SPL_BINARYFILE}
 }
@@ -366,7 +376,9 @@ uboot_deploy_config () {
     config=$1
     type=$2
 
-    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -D -m 644 ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX}
     cd ${DEPLOYDIR}
     ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
     ln -sf ${UBOOT_BINARYNAME}-${type}-${UBOOT_VERSION}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
@@ -375,7 +387,7 @@ uboot_deploy_config () {
 
     # Deploy the uboot-initial-env
     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
+        install -D -m 644 ${B}/${builddir}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION}
         cd ${DEPLOYDIR}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${UBOOT_VERSION} ${UBOOT_INITIAL_ENV}-${type}
@@ -403,7 +415,9 @@ uboot_deploy_elf_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX}
     ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
     ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
     ln -sf u-boot-${type}-${UBOOT_VERSION}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
@@ -420,7 +434,9 @@ uboot_deploy_spl_config () {
     config=$1
     type=$2
 
-    install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
+    builddir="${config}-${type}"
+
+    install -m 644 ${B}/${builddir}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX}
     rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
     ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
     ln -sf ${SPL_BINARYNAME}-${type}-${UBOOT_VERSION}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
-- 
2.17.1


