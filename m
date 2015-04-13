Return-Path: <jin@dev.digitalstrom.org>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Apr 2015 14:20:32 UTC
Received: from static.88-198-224-151.clients.your-server.de
	(static.88-198-224-151.clients.your-server.de [88.198.224.151])
	by mail.openembedded.org (Postfix) with ESMTP id 986A273D40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 14:20:32 +0000 (UTC)
Received: by static.88-198-224-151.clients.your-server.de (Postfix,
	from userid 500)
	id 2BBE41A016F; Mon, 13 Apr 2015 16:13:45 +0200 (CEST)
Date: Mon, 13 Apr 2015 16:13:45 +0200
From: Sergey 'Jin' Bostandzhyan <jin@dev.digitalstrom.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150413141345.GF17921@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-12-10)
Subject: [RFC] allow installation of multiple kernels in the rootfs
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
X-List-Received-Date: Mon, 13 Apr 2015 14:20:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

below is a suggestion of an implementation of a feature that we need on our 
system. Basically we would like to be able to install multiple kernel packages
in the rootfs, ideally they should be handled by the package manager. We then
plan to use the kexec mechanism to implement "safe" kernel upgrades and a rescue
system. The kernel that was flashed at production time would stay the same
forever, making it impossible to brick the device.

I studied the kernel classes and I was able to identify two points that needed
some hacking:

 * the kernel package names are currently hardcoded, any kernel recipe will be
   packaged as "kernel-*.ipk"

 * I have the impression that there can be only one virtual/kernel provider

I tried to address these two points in the patches below.

I'd be happy to hear some feedback on this and I'm willing to tune anything
that might be necessary in order to get this feature merged into core.

Kind regards,
Sergey

P.S. I'm Jin^eLD on IRC



From eec42c5ffe018fd0ab591099c9d0869b5f87ee08 Mon Sep 17 00:00:00 2001
From: Sergey 'Jin' Bostandzhyan <jin at mediatomb dot cc>
Date: Mon, 13 Apr 2015 15:52:22 +0200
Subject: [PATCH 1/2] allow to specify custom kernel package names

Introduce a KERNEL_PACKAGE_EXTRA_NAME variable which will append itself
to the names of the appropriate packages and deployed files. It will
also influence the kernels local version, because we need unique module
directories for each additional kernel.

The idea is to create a separation of kernel files so that multiple
kernel packages with different names can co-exist on the same roofs and
can be handled by the package manager.

Signed-off-by: Sergey Bostandzhyan <jin@dev.digitalstrom.org>
---
 meta/classes/kernel-module-split.bbclass |  9 ++--
 meta/classes/kernel.bbclass              | 91 ++++++++++++++++++++++----------
 meta/classes/linux-kernel-base.bbclass   |  4 +-
 meta/classes/multilib.bbclass            |  5 +-
 meta/classes/package.bbclass             |  3 +-
 5 files changed, 76 insertions(+), 36 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 9a95b72..dbfad01 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -28,7 +28,7 @@ do_install_append() {
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
 
-KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
+KERNEL_MODULES_META_PACKAGE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 python split_kernel_module_packages () {
     import re
@@ -178,12 +178,15 @@ python split_kernel_module_packages () {
 
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
-    module_pattern = 'kernel-module-%s'
+
+    kernel_package_name = d.getVar('KERNEL_PACKAGE_NAME')
+
+    module_pattern = kernel_package_name + '-module-%s'
 
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, d.getVar("KERNEL_VERSION", True)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 70ed95b..c7c6c3e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -6,11 +6,43 @@ DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-na
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
 
+
+KERNEL_PACKAGE_NAME = ""
+
+# adds a suffix to the kernel name, allowing to change the naming scheme of
+# the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_NAME}"
+KERNEL_PACKAGE_EXTRA_NAME ?= ""
+
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
+python kernel_processvars_handler () {
+    extra_name = e.data.getVar('KERNEL_PACKAGE_EXTRA_NAME', True) or ""
+    default_name = e.data.getVar('KERNEL_PACKAGE_NAME', True) or "kernel"
+    if extra_name != "":
+        new_kernel_package_name = '%s-%s' % (default_name, extra_name)
+        e.data.setVar('KERNEL_PACKAGE_NAME', new_kernel_package_name)
+        localversion = e.data.getVar('KERNEL_LOCALVERSION', True) or ""
+        if (localversion == ""):
+            localversion = "-%s" % extra_name
+        else:
+            localversion = "%s+%s" % (localversion, extra_name)
+
+        e.data.setVar('KERNEL_LOCALVERSION', localversion)
+        # if name has been tuned, add localversion to the kernel src path
+        # in order to avoid conflicts with virtual/kernel
+        e.data.setVar('KERNEL_SRC_PATH', '/usr/src/%s%s' % (new_kernel_package_name, localversion))
+    else:
+        e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)
+
+}
+
+addhandler kernel_processvars_handler
+kernel_processvars_handler[eventmask] = "bb.event.RecipePreFinalise"
+
+
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'uImage':
@@ -33,9 +65,9 @@ python __anonymous () {
 
 inherit kernel-arch deploy
 
-PACKAGES_DYNAMIC += "^kernel-module-.*"
-PACKAGES_DYNAMIC += "^kernel-image-.*"
-PACKAGES_DYNAMIC += "^kernel-firmware-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
+PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -344,27 +376,27 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
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
@@ -375,18 +407,19 @@ pkg_postinst_kernel-base () {
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
+    kernel_package_name = d.getVar('KERNEL_PACKAGE_NAME', True)
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern=kernel_package_name + '-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 do_strip() {
@@ -436,15 +469,15 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAME}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
-MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAME}-${MACHINE}"
+MODULE_IMAGE_BASE_NAME ?= "${KERNEL_PACKAGE_NAME}-modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 # Don't include the DATETIME variable in the sstate package signatures
-MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_SYMLINK_NAME ?= "${KERNEL_PACKAGE_NAME}-modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
 do_uboot_mkimage() {
@@ -481,7 +514,7 @@ kernel_do_deploy() {
 	fi
 
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}-${KERNEL_PACKAGE_NAME}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 4f2b0a4..91656c0 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -25,8 +25,10 @@ def get_kernelversion(p):
     return None
 
 def linux_module_packages(s, d):
+	kernel_package_name = d.getVar('KERNEL_PACKAGE_NAME')
+
 	suffix = ""
-	return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
+	return " ".join(map(lambda s: "%s-module-%s%s" % (kernel_package_name, s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
 # that's all
 
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index eea2fd5..550d47e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -117,14 +117,15 @@ PACKAGEFUNCS_append = " do_package_qa_multilib"
 python do_package_qa_multilib() {
 
     def check_mlprefix(pkg, var, mlprefix):
+        kernel_package_name = d.getVar('KERNEL_PACKAGE_NAME')
         values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var, True) or "")
         candidates = []
         for i in values:
             if i.startswith('virtual/'):
                 i = i[len('virtual/'):]
-            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
+            if (not i.startswith('%s-module' % kernel_package_name)) and (not i.startswith(mlprefix)) and \
                 (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
-                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')):
+                (not i.startswith("rtld")) and (not i.startswith('%s-vmlinux' % kernel_package_name)):
                 candidates.append(i)
         if len(candidates) > 0:
             bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 96d7fd9..b1e0543 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1301,11 +1301,12 @@ python package_do_filedeps() {
     def chunks(files, n):
         return [files[i:i+n] for i in range(0, len(files), n)]
 
+    kernel_package_name = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
     pkglist = []
     for pkg in packages.split():
         if d.getVar('SKIP_FILEDEPS_' + pkg, True) == '1':
             continue
-        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
+        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('%s-module-' % kernel_package_name):
             continue
         for files in chunks(pkgfiles[pkg], 100):
             pkglist.append((pkg, files, rpmdeps, pkgdest))
-- 
2.3.0





From d2620d154047e1b8db4fa93d1911c2d690a3f1e2 Mon Sep 17 00:00:00 2001
From: Sergey 'Jin' Bostandzhyan <jin at mediatomb dot cc>
Date: Mon, 13 Apr 2015 15:52:44 +0200
Subject: [PATCH 2/2] allow to mark a kernel package as "additional"

Introduce a KERNEL_PACKAGE_ADDITIONAL variable with allowed values of 0
or 1 which will remove the virtual/kernel PROVIDES from the package.
This allows to generate kernel packages that are treated as regular
packages by the package manager, making it possible to install multiple
kernels in the rootfs as long as their names do not clash.
---
 meta/classes/kernel.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c7c6c3e..27eadf2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,6 +1,5 @@
 inherit linux-kernel-base kernel-module-split
 
-PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
 # we include gcc above, we dont need virtual/libc
@@ -12,6 +11,9 @@ KERNEL_PACKAGE_NAME = ""
 # adds a suffix to the kernel name, allowing to change the naming scheme of
 # the kernel packages, result will be "kernel-${KERNEL_PACKAGE_EXTRA_NAME}"
 KERNEL_PACKAGE_EXTRA_NAME ?= ""
+# indicates that this is an additional kernel package which can be installed
+# and uninstalled without a dependency to the image itself
+KERNEL_PACKAGE_ADDITIONAL ?= "0"
 
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
@@ -37,6 +39,10 @@ python kernel_processvars_handler () {
     else:
         e.data.setVar('KERNEL_PACKAGE_NAME', '%s' % default_name)
 
+    if e.data.getVar('KERNEL_PACKAGE_ADDITIONAL', True) != '1':
+        provides = e.data.getVar("PROVIDES", True)
+        provides = "%s virtual/kernel" % provides
+        e.data.setVar('PROVIDES', provides)
 }
 
 addhandler kernel_processvars_handler
-- 
2.3.0


