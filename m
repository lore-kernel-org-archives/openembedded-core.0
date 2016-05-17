Return-Path: <afenkart@gmx.ch>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 1897B6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:21:39 +0000 (UTC)
Received: from localhost ([89.176.167.254]) by mail.gmx.com (mrgmx101) with
	ESMTPSA (Nemesis) id 0LwF9u-1beKx324jO-0181TN; Tue, 17 May 2016 11:16:35
	+0200
From: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 11:16:20 +0200
Message-Id: <1463476580-17779-4-git-send-email-andreas.fenkart@dev.digitalstrom.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
References: <1463476580-17779-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
Sender: afenkart@gmx.ch
X-Provags-ID: V03:K0:LGoVf/o6KQHuHBkLXAB8Esk+3YlNxdeBTjZbZ286Hwts7EghGri
	YHdpGHtQT7YogqiJoUWgvT/5L0WAdLRJEe2pKLIP806D+KWLxOlz8q5BvEInb9BUj719py/
	T1nyygvKRITjX3zI5IzsaW87NIR5QoQdJ6U0IOi043u2VXSL9dih+aC1el1vw/zUwAQy/Ry
	BIqUJ7Y1weV6RIogqMe2Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:u8RYnD6rtZs=:r/85SlMAD6EJnNZs8kxsbi
	Bt4419tj0wuudoO8W/RrARN21Ck8no6zX3lnVW6SgjvUU2v8kdFrhit8B0tSHg9Iou+ldW3cR
	Kz6ZPx78cAO2Dz+rMfek1JjgSB7aatk2jtnnUYYEF2pfuqkQxdmVG6OxcdeUw/pMbFrwyACT7
	kZzJuu7tSWtweufQZMdHo8BP5/4TNbIsebZ0NsFw0Kpze7cctpEkZvSh65AhnFcPXPnsDBrOB
	JFqKC0F8a2/5MbIhJ9g1Vp4gO//9qn7ntmiQHeB9yK5O2atfNIL3kzalrkRyK9mippBO2rA6j
	GhnIxLdECsCV8VKRcPWU1sfBT+PmIodGDcOpwp0+RjOBRfflH4wLY9fR5w2t225szPJ/x1aeB
	Ui7C9YoOf3A68Ty0e9OSgBhzGpSgcx3xpJuEuVZzUq/ZXnGBERyLzaLokweMiQfPg51lnMt1K
	tc1HkFmz7HgQH1B/mW8jexy62oiSTzN/QFX5JaWyiG0ycocSxT+V3DOgaL0PZx+EiGJtMSAnH
	bAoJsGagH7DfLyBt/LCRVmP9xVCWlD9oVWNGv62+YfJj5yH7ZkkeUEqxnmJ4P9NV+COggQbPe
	Se+IWN+NVYLftzcMYRKASqOaQEb3vZhtrbebBQ2dW9/67LkBRMGaGXZPAbwAcQHYjTI9G9gph
	B40QSbjGs1c8MN1eiHgHyyw8xRAOyfF4C9QUdC9Tv0nWVTrJ649Z8btka4kOrCGHnVBTdqnuP
	jfjdAZ0/UjxclL7A/ykQEiGPjsez3Im1ljllb9pMsp7w15gF1p/Pl1KhdGE=
Subject: [PATCH 3/3] kernel-multi: class to stage and package multiple kernels
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
X-List-Received-Date: Tue, 17 May 2016 09:21:40 -0000

multi kernel class, allows to stage and package multiple kernels
in addition to the prioritized virtual/kernel provider

The intended use case is for kernel upgrades, where you want to
install the new kernel before removing the old kernel.

Usage:
  LINUX_VERSION = "4.1.19"
  KERNEL_CLASS = "kernel-multi"
  require linux-yocto.inc

Ouput:
  kernel-4.1.19
  kernel-4.1.19-image
  kernel-4.1.19-modules
  kernel-4.1.19-module-<pattern>
  kernel-4.1.19-firmware-<pattern>

Recipes based on this class can be selected as virtual/kernel.
The limitation is that external modules or tools such as perf
will break, since they expect the kernel-source to be located in
the default STAGING_KERNEL_DIR. We can not use the same folder
when building multiple kernels since that produces conflicts

Also running depmod on the built rootfs fails for the same
reason. The meta data are not placed in their default location,
since that would conflict too.  The default path is hardcoded in
kernel-depmod script. The workaround is to USE_DEPMOD = "0", and
delay depmod calculation upon first boot of the rootfs on the
target. Workaround will fail on read-only filesystems.

Signed-off-by: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
---
 meta/classes/kernel-multi.bbclass         | 165 ++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc |   3 +-
 2 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/kernel-multi.bbclass

diff --git a/meta/classes/kernel-multi.bbclass b/meta/classes/kernel-multi.bbclass
new file mode 100644
index 0000000..fc1dccf
--- /dev/null
+++ b/meta/classes/kernel-multi.bbclass
@@ -0,0 +1,165 @@
+# multi kernel class, allows to stage and package multiple
+# kernels in addition to the prioritized virtual/kernel provider
+#
+# The intended use case is for kernel upgrades, where you want to install the
+# new kernel before removing the old kernel.
+#
+# Usage:
+#   LINUX_VERSION = "4.1.19"
+#   KERNEL_CLASS = "kernel-multi"
+#   require linux-yocto.inc
+#
+# Ouput:
+#   kernel-4.1.19
+#   kernel-4.1.19-image
+#   kernel-4.1.19-modules
+#   kernel-4.1.19-module-<pattern>
+#   kernel-4.1.19-firmware-<pattern>
+#
+# Recipes based on this class can be selected as virtual/kernel. The limitation
+# is that external modules or tools such as perf will break, since they expect
+# the kernel-source to be located in the default STAGING_KERNEL_DIR. We can not
+# use the same folder when building multiple kernels since that produces
+# conflicts
+#
+# Also running depmod on the built rootfs fails for the same reason. The meta
+# data are not placed in their default location, since that would conflict too.
+# The default path is hardcoded in kernel-depmod script. The workaround is to
+# USE_DEPMOD = "0", and delay depmod calculation upon first boot of the rootfs
+# on the target. Workaround will fail on read-only filesystems.
+#
+
+# prepend before split_kernel_module_packages is added
+# must run before populate_packages
+PACKAGESPLITFUNCS_prepend = " add_versionless_rprovides"
+
+# replace kernel class defaults
+
+# PKGV usually equals LINUX_VERSION + git revision, no need to override
+#KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${LINUX_VERSION}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+#MODULE_IMAGE_BASE_NAME ?= "modules-${LINUX_VERSION}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+#MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
+#INITRAMFS_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${LINUX_VERSION}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+
+KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${LINUX_VERSION}-${MACHINE}"
+MODULE_TARBALL_SYMLINK_NAME ?= "modules-${LINUX_VERSION}-${MACHINE}.tgz"
+
+inherit kernel
+
+python __anonymous () {
+    d.setVar('STAGING_KERNEL_DIR', "${TMPDIR}/work-shared/${MACHINE}/kernel-${LINUX_VERSION}-source")
+    d.setVar('STAGING_KERNEL_BUILDDIR', "${TMPDIR}/work-shared/${MACHINE}/kernel-${LINUX_VERSION}-build-artifacts")
+}
+
+PACKAGES_DYNAMIC += "^kernel-${LINUX_VERSION}-module-.*"
+PACKAGES_DYNAMIC += "^kernel-${LINUX_VERSION}-image-.*"
+PACKAGES_DYNAMIC += "^kernel-${LINUX_VERSION}-firmware-.*"
+
+# overrides function in kernel.bbclass
+emit_depmod_pkgdata() {
+	# Stash data for depmod
+	install -d ${PKGDESTWORK}/kernel-${LINUX_VERSION}-depmod/
+	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-${LINUX_VERSION}-depmod/kernel-abiversion
+	cp ${B}/System.map ${PKGDESTWORK}/kernel-${LINUX_VERSION}-depmod/System.map-${KERNEL_VERSION}
+}
+
+PACKAGEFUNCS += "emit_depmod_pkgdata"
+
+# kernel-${LINUX_VERSION}-base RPROVIDES kernel-${LINUX_VERSION}
+PACKAGES = "kernel-${LINUX_VERSION} kernel-${LINUX_VERSION}-base kernel-${LINUX_VERSION}-vmlinux kernel-${LINUX_VERSION}-image kernel-${LINUX_VERSION}-dev kernel-${LINUX_VERSION}-modules"
+FILES_${PN} = ""
+FILES_kernel-${LINUX_VERSION}-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_kernel-${LINUX_VERSION}-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_kernel-${LINUX_VERSION}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
+FILES_kernel-${LINUX_VERSION}-vmlinux = "/boot/vmlinux*"
+FILES_kernel-${LINUX_VERSION}-modules = ""
+RDEPENDS_kernel-${LINUX_VERSION} = "kernel-${LINUX_VERSION}-base"
+# Allow machines to override this dependency if kernel image files are
+# not wanted in images as standard
+RDEPENDS_kernel-${LINUX_VERSION}-base ?= "kernel-${LINUX_VERSION}-image"
+PKG_kernel-${LINUX_VERSION}-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RDEPENDS_kernel-${LINUX_VERSION}-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-${LINUX_VERSION}-vmlinux', '', d)}"
+PKG_kernel-${LINUX_VERSION}-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+
+# the generated module packages depend on kernel-${KERNEL_VERSION}
+RPROVIDES_kernel-${LINUX_VERSION}-base += "kernel-${KERNEL_VERSION}"
+RPROVIDES_kernel-${LINUX_VERSION}-modules += "kernel-modules"
+
+ALLOW_EMPTY_kernel-${LINUX_VERSION} = "1"
+ALLOW_EMPTY_kernel-${LINUX_VERSION}-base = "1"
+ALLOW_EMPTY_kernel-${LINUX_VERSION}-image = "1"
+ALLOW_EMPTY_kernel-${LINUX_VERSION}-modules = "1"
+DESCRIPTION_kernel-${LINUX_VERSION}-modules = "Kernel modules meta package"
+
+pkg_postinst_kernel-${LINUX_VERSION}-base () {
+	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
+		mkdir -p $D/lib/modules/${KERNEL_VERSION}
+	fi
+	if [ -n "$D" ]; then
+		depmodwrapper -a -b $D ${KERNEL_VERSION}
+	else
+		depmod -a ${KERNEL_VERSION}
+	fi
+}
+
+
+pkg_postinst_kernel-${LINUX_VERSION}-image () {
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+}
+
+pkg_postrm_kernel-${LINUX_VERSION}-image () {
+	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
+}
+
+kernel_do_deploy() {
+	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+		mkdir -p ${D}/lib
+		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
+	fi
+
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}-${LINUX_VERSION}
+
+	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+	cd ${B}
+	# Update deploy directory
+	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
+		echo "Copying deploy kernel-initramfs image and setting up links..."
+		initramfs_base_name=${INITRAMFS_BASE_NAME}
+		initramfs_symlink_name=${KERNEL_IMAGETYPE}-${LINUX_VERSION}-initramfs-${MACHINE}
+		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
+		cd ${DEPLOYDIR}
+		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+	fi
+}
+
+KERNEL_MODULES_META_PACKAGE = "kernel-${LINUX_VERSION}-modules"
+KERNEL_MODULE_PATTERN = "kernel-${LINUX_VERSION}-module-%s"
+KERNEL_FIRMWARE_PATTERN = 'kernel-${LINUX_VERSION}-firmware-%s'
+
+# e.g. iptables depends on kernel-module-ip-track
+# the module package must not contain a version
+python add_versionless_rprovides() {
+    import re
+
+    linux_version = d.getVar('LINUX_VERSION', True)
+
+    modulepat = re.compile("^kernel-" + linux_version + "-module-(.+)$")
+    firmwarepat = re.compile("^kernel-" + linux_version + "-firmware-(.+)$")
+
+    packages = d.getVar('PACKAGES', True).split()
+    for pkg in packages:
+        m = modulepat.match(pkg)
+        if m:
+            module_name = m.group(1)
+            d.setVar('RPROVIDES_%s' % pkg, "kernel-module-%s" % module_name)
+            continue
+
+        m = modulepat.match(pkg)
+        if m:
+            firmware_name = m.group(1)
+            d.setVar('RPROVIDES_%s' % pkg, "kernel-firmware-%s" % firmware_name)
+            continue
+}
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index bd91570..fb2c5cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -40,7 +40,8 @@ KMETA_AUDIT ?= "yes"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 # Pick up shared functions
-inherit kernel
+KERNEL_CLASS ?= "kernel"
+inherit ${KERNEL_CLASS}
 inherit kernel-yocto
 require linux-dtb.inc
 
-- 
2.8.1


