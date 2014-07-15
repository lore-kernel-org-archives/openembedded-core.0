Return-Path: <Yang.Shi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85BB2705C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:08:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FF8IpF013326
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:08:18 -0700 (PDT)
Received: from yshi-Precision-T5600.corp.ad.wrs.com (147.11.216.166) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 08:08:18 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 08:03:58 -0700
Message-ID: <1405436638-25131-2-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1405436638-25131-1-git-send-email-yang.shi@windriver.com>
References: <1405436638-25131-1-git-send-email-yang.shi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel: Deploy KERNEL_ALT_IMAGETYPE and check it for uImage
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
X-List-Received-Date: Tue, 15 Jul 2014 15:08:19 -0000
Content-Type: text/plain

Install, deploy and package KERNEL_ALT_IMAGETYPE and create kernel-alt-image
package.

Check if KERNEL_ALT_IMAGETYPE is uImage in do_uboot_mkimage and adding
u-boot-mkimage-native depend if it is uImage.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 meta/classes/kernel.bbclass | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ed1cb7..2edc2bb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -13,7 +13,8 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
-    if kerneltype == 'uImage':
+    kernelalttype = d.getVar('KERNEL_ALT_IMAGETYPE', True) or ''
+    if kerneltype == 'uImage' or kernelalttype == 'uImage':
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
@@ -74,6 +75,7 @@ KERNEL_EXTRA_ARGS ?= ""
 EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
+KERNEL_ALT_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_ALT_IMAGETYPE}"
 
 # Define where the kernel headers are installed on the target as well as where
 # they are staged.
@@ -200,6 +202,7 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	install -m 0644 ${KERNEL_ALT_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_ALT_IMAGETYPE}-${KERNEL_VERSION}
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
@@ -225,6 +228,7 @@ kernel_do_install() {
 	#
 
 	echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
+	echo "${KERNEL_ALT_IMAGE_BASE_NAME}" >$kerneldir/kernel-alt-image-name
 
 	#
 	# Copy the entire source tree. In case an external build directory is
@@ -245,6 +249,7 @@ kernel_do_install() {
 	# the same file. If hardlinking is used, they will be the same, and there's
 	# no need to install.
 	! [ ${KERNEL_OUTPUT} -ef $kerneldir/${KERNEL_IMAGETYPE} ] && install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
+	! [ ${KERNEL_ALT_OUTPUT} -ef $kerneldir/${KERNEL_ALT_IMAGETYPE} ] && install -m 0644 ${KERNEL_ALT_OUTPUT} $kerneldir/${KERNEL_ALT_IMAGETYPE}
 	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
 
 	# Dummy Makefile so the clean below works
@@ -342,10 +347,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-alt-image kernel-dev kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_kernel-alt-image = "/boot/${KERNEL_ALT_IMAGETYPE}*"
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
@@ -354,11 +360,13 @@ RDEPENDS_kernel = "kernel-base"
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+PKG_kernel-alt-image = "kernel-alt-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
 RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
+ALLOW_EMPTY_kernel-alt-image = "1"
 ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
@@ -381,6 +389,14 @@ pkg_postrm_kernel-image () {
 	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
+pkg_postinst_kernel-alt-image () {
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_ALT_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_ALT_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+}
+
+pkg_postrm_kernel-alt-image () {
+	update-alternatives --remove ${KERNEL_ALT_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE}-${KERNEL_VERSION} || true
+}
+
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
@@ -437,6 +453,10 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+KERNEL_ALT_IMAGE_BASE_NAME ?= "${KERNEL_ALT_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+# Don't include the DATETIME variable in the sstate package signatures
+KERNEL_ALT_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_ALT_IMAGE_SYMLINK_NAME ?= "${KERNEL_ALT_IMAGETYPE}-${MACHINE}"
 MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
@@ -445,7 +465,7 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
 do_uboot_mkimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
+	if test "x${KERNEL_IMAGETYPE}" = "xuImage" or "x${KERNEL_ALT_IMAGETYPE}" = "xuImage"; then 
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
@@ -471,6 +491,7 @@ addtask uboot_mkimage before do_install after do_compile
 
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	install -m 0644 ${KERNEL_ALT_OUTPUT} ${DEPLOYDIR}/${KERNEL_ALT_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
@@ -480,6 +501,9 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
+	ln -sf ${KERNEL_ALT_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_ALT_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_ALT_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_ALT_IMAGETYPE}
+
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
 	cd ${B}
-- 
1.9.2


