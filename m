Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD3AF6C4F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 06:08:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAL67wES022549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Nov 2018 22:07:58 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 20 Nov 2018 22:07:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2018 14:24:35 +0800
Message-ID: <bd77663c215d2ed20cb3765b95e62b9b14330896.1542781427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542781427.git.liezhi.yang@windriver.com>
References: <cover.1542781427.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: c.andersen@kostal.com
Subject: [PATCH 1/1] uboot-sign.bbclass: fix signature and deployment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 06:08:32 -0000
Content-Type: text/plain

Fixed:
MACHINE = "beaglebone-yocto"
KERNEL_CLASSES += "kernel-fitimage"
KERNEL_IMAGETYPE_beaglebone-yocto = "fitImage"
UBOOT_MACHINE_beaglebone-yocto = "am335x_boneblack_vboot_config"
UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
UBOOT_SIGN_KEYDIR = "${TOPDIR}/conf"
UBOOT_SIGN_KEYNAME = "dev"
UBOOT_SIGN_ENABLE = "1"
IMAGE_INSTALL_remove = "kernel-image-zimage"

$ cd conf
$ openssl genrsa -F4 -out dev.key 2048
$ openssl req -batch -new -x509 -key dev.key -out dev.crt
$ cd ../
$ bitbake u-boot linux-yocto
$ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto-2018.07-r0.dtb matches
Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto.dtb matches
Binary file tmp/deploy/images/beaglebone-yocto/u-boot.dtb matches

And there would be no signature info when rebuild from sstate:
$ bitbake u-boot linux-yocto -cclean
$ bitbake u-boot linux-yocto
$ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
No result

This s because kernel directly edit ${DEPLOY_DIR_IMAGE}/u-boot.dtb, (Note, it
is global ${DEPLOY_DIR_IMAGE}, not recipe's DEPLOYDIR), so that the modified
info is not in sstate, and would be lost when rebuild from sstate.

There are other problems in previouse code:
- The u-boot.dtb is provided by u-boot, but edited by kernel during signing, so
  it should be deployed by kernel rather than u-boot.

- The u-boot.do_concat_dtb directly install files to global ${DEPLOY_DIR_IMAGE},
  this is incorrect, the ${DEPLOY_DIR_IMAGE} should be installed by do_deploy.

- It seems that it assumes do_deploy depends on do_install according the comments,
  but they have no relationships:
  # do_concat_dtb is scheduled _before_ do_install as it overwrite the
  # u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.

- The do_concat_dtb should be run after do_compile, but it doesn't have this
  dependency.

Make u-boot install u-boot.dtb to ${datadir}, kernel copies u-boot.dtb from
${STAGING_DATADIR} to ${B} and deploy it can fix the problem.

[YOCTO #12112]

Reported-by: Christian Andersen <c.andersen@kostal.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/kernel-fitimage.bbclass | 17 ++++++-
 meta/classes/uboot-sign.bbclass      | 95 ++++++++++++++++++++----------------
 meta/recipes-bsp/u-boot/u-boot.inc   |  2 +-
 3 files changed, 69 insertions(+), 45 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 4c4fd99..7c5bcd0 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -35,7 +35,7 @@ python __anonymous () {
         # the fitImage:
         if d.getVar('UBOOT_SIGN_ENABLE') == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_populate_sysroot' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -456,10 +456,17 @@ fitimage_assemble() {
 	# Step 7: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
+		add_key_to_u_boot=""
+		if [ -n "${UBOOT_DTB_BINARY}" ]; then
+			# The u-boot.dtb is a symlink to UBOOT_DTB_IMAGE, so we need copy
+			# both of them, and don't dereference the symlink.
+			cp -P ${STAGING_DATADIR}/u-boot*.dtb ${B}
+			add_key_to_u_boot="-K ${B}/${UBOOT_DTB_BINARY}"
+		fi
 		uboot-mkimage \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
-			${@'-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}"' if len('${UBOOT_DTB_BINARY}') else ''} \
+			$add_key_to_u_boot \
 			-r arch/${ARCH}/boot/${2}
 	fi
 }
@@ -505,5 +512,11 @@ kernel_do_deploy_append() {
 			install -m 0644 ${B}/arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin
 			ln -snf fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.bin ${DEPLOYDIR}/fitImage-${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_LINK_NAME}
 		fi
+		if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
+			# UBOOT_DTB_IMAGE is a realfile, but we can't use
+			# ${UBOOT_DTB_IMAGE} since it contains ${PV} which is aimed
+			# for u-boot, but we are in kernel env now.
+			install -m 0644 ${B}/u-boot-${MACHINE}*.dtb ${DEPLOYDIR}/
+		fi
 	fi
 }
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8ee904e..0e5e1b1 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -19,11 +19,15 @@
 # The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common place to
 # treat the device tree blob:
 #
-#   u-boot:do_deploy_dtb
-#   u-boot:do_deploy
-#   virtual/kernel:do_assemble_fitimage
-#   u-boot:do_concat_dtb
-#   u-boot:do_install
+# * u-boot:do_install_append
+#   Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
+#   signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
+#
+# * virtual/kernel:do_assemble_fitimage
+#   Sign the image
+#
+# * u-boot:do_deploy[postfuncs]
+#   Deploy files like UBOOT_DTB_IMAGE, UBOOT_DTB_SYMLINK and others.
 #
 # For more details on signature process, please refer to U-Boot documentation.
 
@@ -38,58 +42,65 @@ UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
 UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
 
-#
-# Following is relevant only for u-boot recipes:
-#
+# Functions in this bbclass is for u-boot only
+UBOOT_PN = "${@d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'}"
 
-do_deploy_dtb () {
-	mkdir -p ${DEPLOYDIR}
-	cd ${DEPLOYDIR}
+concat_dtb() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
+		mkdir -p ${DEPLOYDIR}
+		if [ -e ${B}/${UBOOT_DTB_BINARY} ]; then
+			ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_BINARY}
+			ln -sf ${UBOOT_DTB_IMAGE} ${DEPLOYDIR}/${UBOOT_DTB_SYMLINK}
+		fi
 
-	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
-		install ${B}/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
-		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
-		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
-	fi
-	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
-		install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
-		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
-		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
-	fi
-}
+		if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
+            install ${B}/${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
+            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
+            ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
+		fi
 
-do_concat_dtb () {
-	# Concatenate U-Boot w/o DTB & DTB with public key
-	# (cf. kernel-fitimage.bbclass for more details)
-	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
+		# Concatenate U-Boot w/o DTB & DTB with public key
+		# (cf. kernel-fitimage.bbclass for more details)
+		deployed_uboot_dtb_binary='${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}'
 		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
-			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+			[ -e "$deployed_uboot_dtb_binary" ]; then
 			cd ${B}
-			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
+			oe_runmake EXT_DTB=$deployed_uboot_dtb_binary
 			install ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-			install ${B}/${UBOOT_BINARY} ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
-		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
+		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 			cd ${DEPLOYDIR}
-			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 		fi
 	fi
 }
 
+# Install UBOOT_DTB_BINARY to datadir, so that kernel can use it for
+# signing, and kernel will deploy UBOOT_DTB_BINARY after signs it.
+do_install_append() {
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${PN}" = "${UBOOT_PN}" ]; then
+		if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
+			install -d ${D}${datadir}
+			# UBOOT_DTB_BINARY is a symlink to UBOOT_DTB_IMAGE, so we
+			# need both of them.
+			install ${B}/${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
+			ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
+		else
+			bbwarn "${B}/${UBOOT_DTB_BINARY} not found"
+		fi
+	fi
+}
+
 python () {
-	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
+	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN'):
 		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
-		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
-		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
-		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+		# Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
+		d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
 
-		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
-		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
-		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
-		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+		# kernerl's do_deploy is a litle special, so we can't use
+		# do_deploy_append, otherwise it would override
+		# kernel_do_deploy.
+		d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
 }
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 48fbc57..bbdbc25 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -201,7 +201,7 @@ do_install () {
 
 }
 
-FILES_${PN} = "/boot ${sysconfdir}"
+FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
 
 do_deploy () {
     if [ -n "${UBOOT_CONFIG}" ]
-- 
2.7.4


