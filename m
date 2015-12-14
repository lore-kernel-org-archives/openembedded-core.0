Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A54AB73170
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 19:06:47 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBEJ6l1s011031 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 13:06:47 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121413064749-1120126 ;
	Mon, 14 Dec 2015 13:06:47 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 13:06:38 -0600
Message-Id: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/14/2015 01:06:47 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/14/2015 01:06:47 PM,
	Serialize complete at 12/14/2015 01:06:47 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-14_12:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	Gratian Crisan <gratian.crisan@ni.com>
Subject: [PATCH] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Mon, 14 Dec 2015 19:06:48 -0000

From: Gratian Crisan <gratian.crisan@ni.com>

Templetize kernel package name:

Add a "weak" variable KERNEL_PACKAGE_NAME used as the base name for kernel
packages. It defaults to the old hard-coded name 'kernel' but it can be
redefined by recipes that provide additional kernel packages in order
to avoid build conflicts.

Change hard-coded 'kernel' references to KERNEL_PACKAGE_NAME in
kernel bbclass-es.

Build alternate kernels from WORKDIR instead of STAGING_KERNEL_DIR:

Prior to this change, kernel recipes would all fetch source to
STAGING_KERNEL_DIR as defined by bitbake/distro confs. This broke
parallel builds when more than one kernel recipes are defined in
the distribution, since they all attempted to fetch() and patch()
in a shared source dir.

With this change, alternate kernel recipes fetch source into their
${WORKDIR} so that they may build in parallel to each other and the
default kernel recipe, which still fetches to STAGING_KERNEL_DIR.

Testing:

Built linux-yocto-4.1.13 for qemux86 and verified it produced kernel
image and modules packages. Added kernel recipe with non-default
KERNEL_PACKAGE_NAME and verified it produces kernel image and modules
packages with alternate name next to default kernel.

Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
Natinst-ReviewBoard-ID: 120348
Natinst-ReviewBoard-ID: 120447
---
 meta/classes/kernel-module-split.bbclass |  9 ++--
 meta/classes/kernel.bbclass              | 71 ++++++++++++++++++--------------
 meta/conf/documentation.conf             |  1 +
 meta/recipes-kernel/linux/linux-dtb.inc  |  2 +-
 4 files changed, 49 insertions(+), 34 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e1a70e6..7415ec8 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -28,7 +28,7 @@ do_install_append() {
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
-KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
+KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 python split_kernel_module_packages () {
     import re
@@ -179,14 +179,17 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
+    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
+    kernel_version = d.getVar("KERNEL_VERSION", True)
+
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
-    module_pattern = 'kernel-module-%s'
+    module_pattern = '%s-module-%%s' % kernel_package_name
 
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b75a462..cc27364 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -3,7 +3,6 @@ inherit linux-kernel-base kernel-module-split
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
-S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
 KBUILD_OUTPUT = "${B}"
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
@@ -11,6 +10,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
 
+KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
@@ -34,6 +34,17 @@ python __anonymous () {
     image_task = d.getVar('INITRAMFS_TASK', True)
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
+
+    # The default kernel recipe fetches it's source to
+    # STAGING_KERNEL_DIR as defined by bitbake/distro confs.
+    # Alternate kernel recipes (E.g. debug kernels) fetch source into
+    # their work dir so that they may build in parallel.
+    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel":
+        d.setVar("S", d.getVar("STAGING_KERNEL_DIR", True))
+    else:
+        workdir = d.getVar("WORKDIR", True)
+        kernelSourceDir = os.path.join(workdir, 'kernel-source')
+        d.setVar("S", kernelSourceDir)
 }
 
 # Here we pull in all various kernel image types which we support.
@@ -79,9 +90,9 @@ base_do_unpack_append () {
 
 inherit kernel-arch deploy
 
-PACKAGES_DYNAMIC += "^kernel-module-.*"
-PACKAGES_DYNAMIC += "^kernel-image-.*"
-PACKAGES_DYNAMIC += "^kernel-firmware-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -270,9 +281,9 @@ do_shared_workdir_setscene () {
 
 emit_depmod_pkgdata() {
 	# Stash data for depmod
-	install -d ${PKGDESTWORK}/kernel-depmod/
-	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
-	cp ${B}/System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
+	install -d ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/
+	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/${KERNEL_PACKAGE_NAME}-abiversion
+	cp ${B}/System.map ${PKGDESTWORK}/${KERNEL_PACKAGE_NAME}-depmod/System.map-${KERNEL_VERSION}
 }
 
 PACKAGEFUNCS += "emit_depmod_pkgdata"
@@ -287,7 +298,7 @@ do_shared_workdir () {
 	# Store the kernel version in sysroots for module-base.bbclass
 	#
 
-	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
@@ -361,28 +372,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
+PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
-FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
-FILES_kernel-vmlinux = "/boot/vmlinux*"
-FILES_kernel-modules = ""
-RDEPENDS_kernel = "kernel-base"
+FILES_${KERNEL_PACKAGE_NAME}-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
+FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
+FILES_${KERNEL_PACKAGE_NAME}-modules = ""
+RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
-RDEPENDS_kernel-base ?= "kernel-image"
-PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
-PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
-ALLOW_EMPTY_kernel = "1"
-ALLOW_EMPTY_kernel-base = "1"
-ALLOW_EMPTY_kernel-image = "1"
-ALLOW_EMPTY_kernel-modules = "1"
-DESCRIPTION_kernel-modules = "Kernel modules meta package"
-
-pkg_postinst_kernel-base () {
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
+PKG_${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
+PKG_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME} = "1"
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-base = "1"
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-image = "1"
+ALLOW_EMPTY_${KERNEL_PACKAGE_NAME}-modules = "1"
+DESCRIPTION_${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
+
+pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
 	fi
@@ -393,18 +404,18 @@ pkg_postinst_kernel-base () {
 	fi
 }
 
-pkg_postinst_kernel-image () {
+pkg_postinst_${KERNEL_PACKAGE_NAME}-image () {
 	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
 
-pkg_postrm_kernel-image () {
+pkg_postrm_${KERNEL_PACKAGE_NAME}-image () {
 	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 do_strip() {
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1b5c071..fb5e03f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -250,6 +250,7 @@ KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kern
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
+KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 772adcb..c27a3cb 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -2,7 +2,7 @@
 FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
 
 python __anonymous () {
-    d.appendVar("PACKAGES", " kernel-devicetree")
+    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
 }
 
 normalize_dtb () {
-- 
2.6.2


