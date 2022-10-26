Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57ED7C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 18:57:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11662.1666810665785386554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 11:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nDb5k6lc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 56D3C20005;
	Wed, 26 Oct 2022 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666810663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vEGHQzvX70heLaEAqIcJyxxcDzZxdEOy9B1EBEU0sNk=;
	b=nDb5k6lcnB6m4Nz1dR7tlsV0YRz4f01H0XyLvR20d6+pdaNICXb+uuZcdEjJwkWEAq0mZ2
	NpcJrLjyxwlDm6iF1H6Vna07/xBAbhden3Jp9uwzvOI/siDv8h1iGYvxWfJsXEWRw9UTyE
	sCitt7kSLhMXiY9K0KgrjKWDWhxZa3eGmRGXkXK19nLrc9eHTPRTquJtt85uVUVMylR9k7
	p5ph6OivzebsaotJoRbZ4bEs2duPx9brH6w0KZsBGL01xH9tZ2T6bp20wCY95cB+uWmDll
	6ZVvQOqNSTU3QTSN/fUeye3ANqRuiKtT2YIDcIZ1xOlxvwoOpKiO1y4ntY+BXw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] deploy.bbclass: rename DEPLOYDIR to DEPLOY_TMP_DIR
Date: Wed, 26 Oct 2022 20:57:34 +0200
Message-Id: <20221026185734.2076455-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 18:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172170

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To avoid name confusion with the completely different DEPLOY_DIR variable

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

That struck me while reading the manual!

Will be happy to use a different name and/or
split the patch into several patches.
---
 meta/classes-recipe/deploy.bbclass            |  6 +-
 meta/classes-recipe/devicetree.bbclass        |  2 +-
 meta/classes-recipe/kernel.bbclass            |  4 +-
 meta/classes-recipe/uboot-sign.bbclass        | 54 +++++++--------
 meta/conf/documentation.conf                  |  2 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  2 +-
 meta/recipes-bsp/grub/grub-efi_2.06.bb        |  2 +-
 meta/recipes-bsp/opensbi/opensbi_1.1.bb       |  6 +-
 meta/recipes-bsp/u-boot/u-boot.inc            | 68 +++++++++----------
 meta/recipes-core/meta/meta-ide-support.bb    |  2 +-
 meta/recipes-core/meta/signing-keys.bb        |  6 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |  8 +--
 .../systemd/systemd-boot_251.4.bb             |  4 +-
 13 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index f56fe98d6d..dc5653ef32 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -4,9 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
-DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
+DEPLOY_TMP_DIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
-do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
+do_deploy[sstate-inputdirs] = "${DEPLOY_TMP_DIR}"
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 
 python do_deploy_setscene () {
@@ -14,5 +14,5 @@ python do_deploy_setscene () {
 }
 addtask do_deploy_setscene
 do_deploy[dirs] = "${B}"
-do_deploy[cleandirs] = "${DEPLOYDIR}"
+do_deploy[cleandirs] = "${DEPLOY_TMP_DIR}"
 do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ac1d284ccd..5257214241 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -145,7 +145,7 @@ devicetree_do_install() {
 
 devicetree_do_deploy() {
     for DTB_FILE in `ls *.dtb *.dtbo`; do
-        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOYDIR}/devicetree/${DTB_FILE}
+        install -Dm 0644 ${B}/${DTB_FILE} ${DEPLOY_TMP_DIR}/devicetree/${DTB_FILE}
     done
 }
 addtask deploy before do_build after do_install
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 7bb3449223..ce2fec82e1 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -758,9 +758,9 @@ addtask sizecheck before do_install after do_strip
 inherit kernel-artifact-names
 
 kernel_do_deploy() {
-	deployDir="${DEPLOYDIR}"
+	deployDir="${DEPLOY_TMP_DIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
-		deployDir="${DEPLOYDIR}/${KERNEL_DEPLOYSUBDIR}"
+		deployDir="${DEPLOY_TMP_DIR}/${KERNEL_DEPLOYSUBDIR}"
 		mkdir "$deployDir"
 	fi
 
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3dc029c429..c7f370db31 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -142,16 +142,16 @@ deploy_dtb() {
 	fi
 
 	if [ -e "${UBOOT_DTB_SIGNED}" ]; then
-		install -Dm644 ${UBOOT_DTB_SIGNED} ${DEPLOYDIR}/${uboot_dtb_binary}
+		install -Dm644 ${UBOOT_DTB_SIGNED} ${DEPLOY_TMP_DIR}/${uboot_dtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${uboot_dtb_binary} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+			ln -sf ${uboot_dtb_binary} ${DEPLOY_TMP_DIR}/${UBOOT_DTB_IMAGE}
 		fi
 	fi
 
 	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
-		install -Dm644 ${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${uboot_nodtb_binary}
+		install -Dm644 ${UBOOT_DTB_BINARY} ${DEPLOY_TMP_DIR}/${uboot_nodtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${uboot_nodtb_binary} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+			ln -sf ${uboot_nodtb_binary} ${DEPLOY_TMP_DIR}/${UBOOT_NODTB_IMAGE}
 		fi
 	fi
 }
@@ -176,21 +176,21 @@ deploy_spl_dtb() {
 	fi
 
 	if [ -e "${SPL_DIR}/${SPL_DTB_SIGNED}" ] ; then
-		install -Dm644 ${SPL_DIR}/${SPL_DTB_SIGNED} ${DEPLOYDIR}/${spl_dtb_binary}
+		install -Dm644 ${SPL_DIR}/${SPL_DTB_SIGNED} ${DEPLOY_TMP_DIR}/${spl_dtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${spl_dtb_binary} ${DEPLOYDIR}/${SPL_DTB_IMAGE}
+			ln -sf ${spl_dtb_binary} ${DEPLOY_TMP_DIR}/${SPL_DTB_IMAGE}
 		fi
 	fi
 
 	if [ -f "${SPL_DIR}/${SPL_NODTB_BINARY}" ] ; then
-		install -Dm644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOYDIR}/${spl_nodtb_binary}
+		install -Dm644 ${SPL_DIR}/${SPL_NODTB_BINARY} ${DEPLOY_TMP_DIR}/${spl_nodtb_binary}
 		if [ -n "${type}" ]; then
-			ln -sf ${spl_nodtb_binary} ${DEPLOYDIR}/${SPL_NODTB_IMAGE}
+			ln -sf ${spl_nodtb_binary} ${DEPLOY_TMP_DIR}/${SPL_NODTB_IMAGE}
 		fi
 	fi
 
 	# For backwards compatibility...
-	install -Dm644 ${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+	install -Dm644 ${SPL_BINARY} ${DEPLOY_TMP_DIR}/${SPL_IMAGE}
 }
 
 do_uboot_generate_rsa_keys() {
@@ -381,12 +381,12 @@ deploy_helper() {
 			uboot_fitimage_image="${UBOOT_FITIMAGE_IMAGE}"
 		fi
 
-		install -Dm644 ${UBOOT_FITIMAGE_BINARY} ${DEPLOYDIR}/$uboot_fitimage_image
-		install -Dm644 ${UBOOT_ITS} ${DEPLOYDIR}/$uboot_its_image
+		install -Dm644 ${UBOOT_FITIMAGE_BINARY} ${DEPLOY_TMP_DIR}/$uboot_fitimage_image
+		install -Dm644 ${UBOOT_ITS} ${DEPLOY_TMP_DIR}/$uboot_its_image
 
 		if [ -n "${type}" ]; then
-			ln -sf $uboot_its_image ${DEPLOYDIR}/${UBOOT_ITS_IMAGE}
-			ln -sf $uboot_fitimage_image ${DEPLOYDIR}/${UBOOT_FITIMAGE_IMAGE}
+			ln -sf $uboot_its_image ${DEPLOY_TMP_DIR}/${UBOOT_ITS_IMAGE}
+			ln -sf $uboot_fitimage_image ${DEPLOY_TMP_DIR}/${UBOOT_FITIMAGE_IMAGE}
 		fi
 	fi
 
@@ -414,24 +414,24 @@ do_deploy:prepend() {
 	fi
 
 	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
-		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOYDIR}/${UBOOT_NODTB_BINARY}
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_DTB_BINARY}
+		ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_DTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_NODTB_SYMLINK}
+		ln -sf ${UBOOT_NODTB_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_NODTB_BINARY}
 	fi
 
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
-		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS}
-		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOYDIR}/${UBOOT_ITS_SYMLINK}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_BINARY}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
+		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ITS}
+		ln -sf ${UBOOT_ITS_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ITS_SYMLINK}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_FITIMAGE_BINARY}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_FITIMAGE_SYMLINK}
 	fi
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ] ; then
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
-		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
-		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_BINARY}
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_DTB_SYMLINK}
+		ln -sf ${SPL_DTB_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_DTB_BINARY}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_NODTB_SYMLINK}
+		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_NODTB_BINARY}
 	fi
 }
 
@@ -439,7 +439,7 @@ do_deploy:append() {
 	# If we're creating a u-boot fitImage, point u-boot.bin
 	# symlink since it might get used by image recipes
 	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" ] ; then
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_BINARY}
+		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_SYMLINK}
 	fi
 }
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index ab2addb321..090bf18e2c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -136,7 +136,7 @@ DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
 DEPLOY_DIR_IMAGE[doc] = "Points to the area that the OpenEmbedded build system uses to place images and other associated output files that are ready to be deployed onto the target machine."
-DEPLOYDIR[doc] = "For recipes that inherit the deploy class, the DEPLOYDIR points to a temporary work area for deployed files."
+DEPLOY_TMP_DIR[doc] = "For recipes that inherit the deploy class, the DEPLOY_TMP_DIR points to a temporary work area for deployed files."
 DESCRIPTION[doc] = "The package description used by package managers. If not set, DESCRIPTION takes the value of the SUMMARY variable."
 DISTRO[doc] = "The short name of the distribution. If the variable is blank, meta/conf/distro/defaultsetup.conf will be used."
 DISTRO_EXTRA_RDEPENDS[doc] = "Specifies a list of distro-specific packages to add to all images. The variable only applies to the images that include packagegroup-base."
diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 74c1c48117..5a2674a487 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -36,7 +36,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         super(oeGoToolchainSelfTest, cls).setUpClass()
         cls.tmpdir_SDKQA = tempfile.mkdtemp(prefix='SDKQA')
         cls.go_path = os.path.join(cls.tmpdir_SDKQA, "go")
-        # Build the SDK and locate it in DEPLOYDIR
+        # Build the SDK and locate it in DEPLOY_TMP_DIR
         bitbake("meta-go-toolchain")
         cls.sdk_path = oeGoToolchainSelfTest.get_sdk_toolchain()
         # Install the SDK into the tmpdir
diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/grub/grub-efi_2.06.bb
index 9857e8e036..9630858b08 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.06.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
@@ -88,7 +88,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
 GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen_boot', '', d)}"
 
 do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOY_TMP_DIR}
 }
 
 addtask deploy after do_install before do_build
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.1.bb
index d3a6296533..a70f8bb46b 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.1.bb
@@ -30,9 +30,9 @@ do_install:append() {
 }
 
 do_deploy () {
-	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOYDIR}/
-	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOYDIR}/
-	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOYDIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOY_TMP_DIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOY_TMP_DIR}/
+	install -m 755 ${D}/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOY_TMP_DIR}/
 }
 
 addtask deploy before do_build after do_install
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 15e949b8b4..fd73dd853f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -218,8 +218,8 @@ do_deploy () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    cd ${DEPLOYDIR}
+                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ${DEPLOY_TMP_DIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    cd ${DEPLOY_TMP_DIR}
                     ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
                     ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
@@ -227,8 +227,8 @@ do_deploy () {
 
                     # Deploy the uboot-initial-env
                     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
-                        cd ${DEPLOYDIR}
+                        install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOY_TMP_DIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR}
+                        cd ${DEPLOY_TMP_DIR}
                         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}
                         ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${type}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${type}
                     fi
@@ -238,25 +238,25 @@ do_deploy () {
         done
         unset i
     else
-        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOY_TMP_DIR}/${UBOOT_IMAGE}
 
-        cd ${DEPLOYDIR}
+        cd ${DEPLOY_TMP_DIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
 
         # Deploy the uboot-initial-env
         if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
-            cd ${DEPLOYDIR}
+            install -D -m 644 ${B}/u-boot-initial-env ${DEPLOY_TMP_DIR}/${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR}
+            cd ${DEPLOY_TMP_DIR}
             ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}-${MACHINE}
             ln -sf ${UBOOT_INITIAL_ENV}-${MACHINE}-${PV}-${PR} ${UBOOT_INITIAL_ENV}
         fi
     fi
 
     if [ -e ${WORKDIR}/fw_env.config ] ; then
-        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
-        cd ${DEPLOYDIR}
+        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOY_TMP_DIR}/fw_env.config-${MACHINE}-${PV}-${PR}
+        cd ${DEPLOY_TMP_DIR}
         ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
         ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
     fi
@@ -271,20 +271,20 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}-${type}
-                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+                        install -m 644 ${B}/${config}/${UBOOT_ELF} ${DEPLOY_TMP_DIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_BINARY}-${type}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_BINARY}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_SYMLINK}-${type}
+                        ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_ELF_SUFFIX} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_SYMLINK}
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
-            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
+            install -m 644 ${B}/${UBOOT_ELF} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_IMAGE}
+            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_BINARY}
+            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ELF_SYMLINK}
         fi
     fi
 
@@ -299,41 +299,41 @@ do_deploy () {
                     j=$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
-                        rm -f ${DEPLOYDIR}/${SPL_BINARYFILE} ${DEPLOYDIR}/${SPL_SYMLINK}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_BINARYFILE}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOYDIR}/${SPL_SYMLINK}
+                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOY_TMP_DIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX}
+                        rm -f ${DEPLOY_TMP_DIR}/${SPL_BINARYFILE} ${DEPLOY_TMP_DIR}/${SPL_SYMLINK}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOY_TMP_DIR}/${SPL_BINARYFILE}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOY_TMP_DIR}/${SPL_BINARYFILE}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOY_TMP_DIR}/${SPL_SYMLINK}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR}${SPL_DELIMITER}${SPL_SUFFIX} ${DEPLOY_TMP_DIR}/${SPL_SYMLINK}
                     fi
                 done
                 unset j
             done
             unset i
         else
-            install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
-            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
+            install -m 644 ${B}/${SPL_BINARY} ${DEPLOY_TMP_DIR}/${SPL_IMAGE}
+            ln -sf ${SPL_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_BINARYNAME}
+            ln -sf ${SPL_IMAGE} ${DEPLOY_TMP_DIR}/${SPL_SYMLINK}
         fi
     fi
 
     if [ -n "${UBOOT_ENV}" ]
     then
-        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
-        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
-        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
+        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOY_TMP_DIR}/${UBOOT_ENV_IMAGE}
+        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ENV_BINARY}
+        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOY_TMP_DIR}/${UBOOT_ENV_SYMLINK}
     fi
 
     if [ "${UBOOT_EXTLINUX}" = "1" ]
     then
-        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOYDIR}/${UBOOT_EXTLINUX_SYMLINK}
-        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
-        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
+        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOY_TMP_DIR}/${UBOOT_EXTLINUX_SYMLINK}
+        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOY_TMP_DIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
+        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOY_TMP_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
 
     if [ -n "${UBOOT_DTB}" ]
     then
-        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOY_TMP_DIR}/
     fi
 }
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 7f349f673d..bd0f055741 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -33,7 +33,7 @@ python do_write_test_data() {
 addtask write_test_data before do_deploy after do_install
 
 do_deploy () {
-        install ${B}/* ${DEPLOYDIR}
+        install ${B}/* ${DEPLOY_TMP_DIR}
 }
 
 addtask deploy before do_build
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 107a39d658..09d6a30b9a 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -59,13 +59,13 @@ do_install () {
 
 do_deploy () {
     if [ -f "${B}/rpm-key" ]; then
-        install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
+        install -D -m 0644 "${B}/rpm-key" "${DEPLOY_TMP_DIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/ipk-key" ]; then
-        install -D -m 0644 "${B}/ipk-key" "${DEPLOYDIR}/IPK-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
+        install -D -m 0644 "${B}/ipk-key" "${DEPLOY_TMP_DIR}/IPK-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
     if [ -f "${B}/pf-key" ]; then
-        install -D -m 0644 "${B}/pf-key" "${DEPLOYDIR}/PACKAGEFEED-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
+        install -D -m 0644 "${B}/pf-key" "${DEPLOY_TMP_DIR}/PACKAGEFEED-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
 }
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 40542239e2..3bbcc94b5b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -249,14 +249,14 @@ do_deploy:class-target() {
         ovmf.vars \
         ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'ovmf.secboot ovmf.secboot.code', '', d)} \
         ; do
-        qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/$i.qcow2
+        qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOY_TMP_DIR}/$i.qcow2
     done
 
     if ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'true', 'false', d)}; then
         # Create a test Platform Key and first Key Exchange Key to use with EnrollDefaultKeys
-        openssl req -new -x509 -newkey rsa:2048 -keyout ${DEPLOYDIR}/OvmfPkKek1.key \
-                -out ${DEPLOYDIR}/OvmfPkKek1.crt -nodes -days 20 -subj "/CN=OVMFSecBootTest"
-        openssl x509 -in ${DEPLOYDIR}/OvmfPkKek1.crt -out ${DEPLOYDIR}/OvmfPkKek1.pem -outform PEM
+        openssl req -new -x509 -newkey rsa:2048 -keyout ${DEPLOY_TMP_DIR}/OvmfPkKek1.key \
+                -out ${DEPLOY_TMP_DIR}/OvmfPkKek1.crt -nodes -days 20 -subj "/CN=OVMFSecBootTest"
+        openssl x509 -in ${DEPLOY_TMP_DIR}/OvmfPkKek1.crt -out ${DEPLOY_TMP_DIR}/OvmfPkKek1.pem -outform PEM
     fi
 }
 addtask do_deploy after do_compile before do_build
diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_251.4.bb
index b67706b731..5172f9e1fe 100644
--- a/meta/recipes-core/systemd/systemd-boot_251.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_251.4.bb
@@ -65,8 +65,8 @@ do_install() {
 }
 
 do_deploy () {
-	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
-	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
+	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOY_TMP_DIR}
+	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOY_TMP_DIR}
 }
 
 addtask deploy before do_build after do_compile
-- 
2.34.1


