Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id BE0D37199B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 18:44:22 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u9BIhn7T014898; Tue, 11 Oct 2016 13:43:51 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016101113364219-829161 ;
	Tue, 11 Oct 2016 13:36:42 -0500 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:36:24 -0500
Message-Id: <1476210984-21556-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
References: <1450119998-2912-1-git-send-email-haris.okanovic@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/11/2016 01:36:42 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/11/2016 01:43:52 PM,
	Serialize complete at 10/11/2016 01:43:52 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-11_10:, , signatures=0
Cc: haris.okanovic@ni.com, josh.hernstrom@ni.com
Subject: [PATCH v3] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Tue, 11 Oct 2016 18:44:23 -0000

This change allows distributions to provide multiple builds of kernel
and module packages. For example, a distro may want provide an alternate
debug kernel in a package feed for debug/testing.

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

Testing: Built linux-yocto-4.8 for qemux86 and verified it produces
kernel image and modules IPKs from source under the "work-shared"
directory. Built a kernel recipe with non-default KERNEL_PACKAGE_NAME
and verified it produces kernel image and modules IPKs with the
alternate package name from source under the normal "work" directory.

Discussion thread: http://lists.openembedded.org/pipermail/openembedded-core/2015-December/thread.html#114122

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Coauthored-by: Gratian Crisan <gratian.crisan@ni.com>
Coauthored-by: Haris Okanovic <haris.okanovic@ni.com>
Coauthored-by: Josh Hernstrom <josh.hernstrom@ni.com>
Natinst-ReviewBoard-ID: 120348
---
[PATCH v2] Change STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR to the
"work" directory in alternate kernel builds, instead of "work-shared", so
that the two builds don't clobber each other.

[PATCH v3] An updated version of this change rebased onto the current
OE-core master. Changes:
 * Remove PREFERRED_PROVIDER check in linux-yocto.inc in alternate
   kernel builds, since alternate kernels aren't the
   PREFERRED_PROVIDER for virtual/kernel by definition.
 * Remove "virtual/kernel" from PROVIDES in alternate kernel builds.
---
 meta/classes/kernel-module-split.bbclass  |  9 ++--
 meta/classes/kernel.bbclass               | 87 ++++++++++++++++++-------------
 meta/conf/documentation.conf              |  1 +
 meta/recipes-kernel/linux/linux-dtb.inc   |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc |  2 +-
 5 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 08d2262..9f463f1 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -28,7 +28,7 @@ do_install_append() {
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
-KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
+KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 KERNEL_MODULE_PACKAGE_PREFIX ?= ""
 
@@ -119,15 +119,18 @@ python split_kernel_module_packages () {
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
+    kernel_package_name = d.getVar("KERNEL_PACKAGE_NAME", True)
+    kernel_version = d.getVar("KERNEL_VERSION", True)
+
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX', True)
-    module_pattern = module_pattern_prefix + 'kernel-module-%s'
+    module_pattern = '%s%s-module-%%s' % (module_pattern_prefix, kernel_package_name)
 
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 25a153c..7c0cffe 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,6 +1,8 @@
 inherit linux-kernel-base kernel-module-split
 
-PROVIDES += "virtual/kernel"
+KERNEL_PACKAGE_NAME ??= "kernel"
+
+PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel") else "" }"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native lzop-native"
 
 S = "${STAGING_KERNEL_DIR}"
@@ -30,10 +32,23 @@ KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
 python __anonymous () {
     import re
 
+    # The default kernel recipe builds in a shared location defined by
+    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
+    # Set these variables to directories under ${WORKDIR} in alternate
+    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
+    # may build in parallel with the default kernel without clobbering.
+    if d.getVar("KERNEL_PACKAGE_NAME", True) != "kernel":
+        workdir = d.getVar("WORKDIR", True)
+        sourceDir = os.path.join(workdir, 'kernel-source')
+        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
+        d.setVar("STAGING_KERNEL_DIR", sourceDir)
+        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
+
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE', True) or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE', True) or ""
     types = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    kname = d.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
     if type not in types.split():
         types = (type + ' ' + types).strip()
     if alttype not in types.split():
@@ -46,23 +61,23 @@ python __anonymous () {
     for type in typeformake.split():
         typelower = type.lower()
 
-        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
+        d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
 
-        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type + '*')
+        d.setVar('FILES_%s-image-%s' % (kname, typelower), '/boot/' + type + '*')
 
-        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
+        d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
 
-        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
+        d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
 
-        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
+        d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
 
         imagedest = d.getVar('KERNEL_IMAGEDEST', True)
         priority = d.getVar('KERNEL_PRIORITY', True)
         postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
-        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
+        d.setVar('pkg_postinst_%s-image-%s' % (kname, typelower), postinst)
 
         postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
-        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
+        d.setVar('pkg_postrm_%s-image-%s' % (kname, typelower), postrm)
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
@@ -120,9 +135,9 @@ base_do_unpack_append () {
 
 inherit kernel-arch deploy
 
-PACKAGES_DYNAMIC += "^kernel-module-.*"
-PACKAGES_DYNAMIC += "^kernel-image-.*"
-PACKAGES_DYNAMIC += "^kernel-firmware-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -366,9 +381,9 @@ do_shared_workdir_setscene () {
 
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
@@ -383,7 +398,7 @@ do_shared_workdir () {
 	# Store the kernel version in sysroots for module-base.bbclass
 	#
 
-	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
+	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
@@ -481,28 +496,28 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
+PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
-FILES_kernel-image = ""
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
-FILES_kernel-vmlinux = "/boot/vmlinux*"
-FILES_kernel-modules = ""
-RDEPENDS_kernel = "kernel-base"
-# Allow machines to override this dependency if kernel image files are
+FILES_${KERNEL_PACKAGE_NAME}-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_${KERNEL_PACKAGE_NAME}-image = ""
+FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
+FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux*"
+FILES_${KERNEL_PACKAGE_NAME}-modules = ""
+RDEPENDS_${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
+# Allow machines to override this dependency if kernel image files are 
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
@@ -516,7 +531,7 @@ pkg_postinst_kernel-base () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='${KERNEL_PACKAGE_NAME}-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 51c4116..8682e72 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -248,6 +248,7 @@ KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set b
 KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
+KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 8528d64..af5bfca 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -2,7 +2,7 @@
 FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
 
 python __anonymous () {
-    d.appendVar("PACKAGES", " kernel-devicetree")
+    d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
 }
 
 normalize_dtb () {
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index d8d4387..3f4dab9 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -12,7 +12,7 @@ INC_PR = "r4"
 # PREFERRED_PROVIDER for virtual/kernel. This avoids network access required
 # by the use of AUTOREV SRCREVs, which are the default for this recipe.
 python () {
-    if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
+    if d.getVar("KERNEL_PACKAGE_NAME", True) == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != d.getVar("PN", True):
         d.delVar("BB_DONT_CACHE")
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to %s to enable it" % (d.getVar("PN", True)))
 }
-- 
2.8.2


