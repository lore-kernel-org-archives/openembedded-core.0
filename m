Return-Path: <jason.wessel@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id DA71B6B10F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 23:04:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7MN4Vxf008699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 19:04:32 -0400 (EDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:04:31 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 18:04:27 -0500
Message-ID: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Thu, 22 Aug 2013 23:04:34 -0000
Content-Type: text/plain

This patch aims to fix the following two cases for the INITRAMFS generation.
  1) Allow an image recipe to specify a paired INITRAMFS recipe such
     as core-image-minimal-initramfs.  This allows building a base
     image which always generates the needed initramfs image in one step
  2) Allow building a single binary which contains a kernel and
     the initramfs.

A key requirement of the initramfs is to be able to add kernel
modules.  The current implementation of the INITRAMFS_IMAGE variable
has a circular dependency when using kernel modules in the initramfs
image.bb file that is caused by kernel.bbclass trying to build the
initramfs before the kernel's do_install rule.

The solution for this problem is to have the kernel's
do_bundle_initramfs_image task depend on the do_rootfs from the
INITRAMFS_IMAGE and not some intermediate point.  The image.bbclass
will also sets up dependencies to make the initramfs creation task run
last.

The code to bundle the kernel and initramfs together has been added.
At a high level, all it is doing is invoking a second compilation of
the kernel but changing the value of CONFIG_INITRAMFS_SOURCE to point
to the generated initramfs from the image recipe.

[YOCTO #4072]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

---
 meta/classes/image.bbclass  |   12 ++++++
 meta/classes/kernel.bbclass |   96 +++++++++++++++++++++++++++++++++++++------
 meta/conf/local.conf.sample |   20 +++++++++
 3 files changed, 116 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 909702a..23967ec 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -130,6 +130,10 @@ python () {
     d.setVar('MULTILIB_VENDORS', ml_vendor_list)
 
     check_image_features(d)
+    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
+    if initramfs_image != "":
+        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
+        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
 }
 
 #
@@ -629,3 +633,11 @@ do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
 addtask rootfs before do_build
+# Allow the kernel to be repacked with the initramfs and boot image file as a single file
+do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
+do_bundle_initramfs[nostamp] = "1"
+do_bundle_initramfs[noexec] = "1"
+do_bundle_initramfs () {
+	:
+}
+addtask bundle_initramfs after do_rootfs
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e039dfc..8cf66ce 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -9,6 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
+INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
@@ -19,7 +20,15 @@ python __anonymous () {
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
-        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
+        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
+
+    # NOTE: setting INITRAMFS_TASK is for backward compatibility
+    #       The preferred method is to set INITRAMFS_IMAGE, because
+    #       this INITRAMFS_TASK has circular dependency problems
+    #       if the initramfs requires kernel modules
+    image_task = d.getVar('INITRAMFS_TASK', True)
+    if image_task:
+        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
 inherit kernel-arch deploy
@@ -72,9 +81,82 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
 
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
+copy_initramfs() {
+	echo "Copying initramfs into ./usr ..."
+	# Find and use the first initramfs image archive type we find
+	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+	for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
+			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
+			case $img in
+			*gz)
+				echo "gzip decompressing image"
+				gunzip -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				break
+				;;
+			*lzo)
+				echo "lzo decompressing image"
+				lzop -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				break
+				;;
+			*lzma)
+				echo "lzma decompressing image"
+				lzmash -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				break
+				;;
+			*xz)
+				echo "xz decompressing image"
+				xz -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
+				break
+				;;
+			esac
+		fi
+	done
+	echo "Finished copy of initramfs into ./usr"
+}
+
+INITRAMFS_BASE_NAME = "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
+do_bundle_initramfs () {
+	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+		echo "Creating a kernel image with a bundled initramfs..."
+		copy_initramfs
+		if [ -e ${KERNEL_OUTPUT} ] ; then
+			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
+		fi
+		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+		kernel_do_compile
+		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
+		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
+		# Update install area
+		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
+		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
+		echo "${B}/${KERNEL_OUTPUT}.initramfs"
+		cd ${B}
+		# Update deploy directory
+		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
+			echo "Copying deploy kernel-initramfs image and setting up links..."
+			initramfs_base_name=${INITRAMFS_BASE_NAME}
+			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
+			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
+			cd ${DEPLOY_DIR_IMAGE}
+			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+		fi
+	fi
+}
+do_bundle_initramfs[nostamp] = "1"
+addtask bundle_initramfs after do_compile
+
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+	# The $use_alternate_initrd is only set from
+	# do_bundle_initramfs() This variable is specifically for the
+	# case where we are making a second pass at the kernel
+	# compilation and we want to force the kernel build to use a
+	# different initramfs image.  The way to do that in the kernel
+	# is to specify:
+	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
+	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
 		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
 	fi
@@ -219,18 +301,8 @@ kernel_do_configure() {
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
 	yes '' | oe_runmake oldconfig
-
-	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
-		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
-			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
-		fi
-		done
-	fi
 }
 
-do_configure[depends] += "${INITRAMFS_TASK}"
-
 do_savedefconfig() {
 	oe_runmake savedefconfig
 }
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 2b078d0..17733ab 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -146,6 +146,26 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 
 #
+# Kernel image features
+#
+# The INITRAMFS_IMAGE image variable will cause an additional recipe to
+# be built as a dependency to the what ever rootfs recipe you might be
+# using such as core-image-sato.  The initramfs might be needed for
+# the initial boot of of the target system such as to load kernel
+# modules prior to mounting the root file system.
+#
+# INITRAMFS_IMAGE_BUNDLE variable controls if the image recipe
+# specified by the INITRAMFS_IMAGE will be run through an extra pass
+# through the kernel compilation in order to build a single binary
+# which contains both the kernel image and the initramfs.  The
+# combined binary will be deposited into the tmp/deploy directory.
+# NOTE: You can set INITRAMFS_IMAGE in an image recipe, but
+#       INITRAMFS_IMAGE_BUNDLE can only be set in a conf file.
+#
+#INITRAMFS_IMAGE = "core-image-minimal-initramfs"
+#INITRAMFS_IMAGE_BUNDLE = "1"
+
+#
 # Runtime testing of images
 #
 # The build system can test booting virtual machine images under qemu (an emulator)
-- 
1.7.9.5


