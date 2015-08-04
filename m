Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 428EC760E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 09:18:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t749IFJ2007298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Aug 2015 02:18:15 -0700 (PDT)
Received: from PEK-ZHE-D1.corp.ad.wrs.com (128.224.162.235) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 02:18:15 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Aug 2015 17:17:51 +0800
Message-ID: <64a413dc9fa38ee9d50b0837071775a3fe2fd48e.1438679154.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438679154.git.zhe.he@windriver.com>
References: <cover.1438679154.git.zhe.he@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH v3 1/1] kernel: Add KERNEL_IMAGETYPES to build multi types of kernel at one time
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
X-List-Received-Date: Tue, 04 Aug 2015 09:18:17 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Add KERNEL_IMAGETYPES to support building packaging and installing
multi types of kernel images, such as zImage uImage, at one time.
KERNEL_IMAGETYPE works as it did.

Fixes [YOCTO #6945].

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel-fitimage.bbclass    |  21 +++---
 meta/classes/kernel-grub.bbclass        |  46 ++++++++----
 meta/classes/kernel-uimage.bbclass      |  22 +++---
 meta/classes/kernel.bbclass             | 128 +++++++++++++++++++++++---------
 meta/conf/documentation.conf            |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc |  15 ++--
 6 files changed, 159 insertions(+), 74 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2a56a54..1b65c0d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,8 +1,8 @@
 inherit kernel-uboot
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'fitImage':
+    kerneltype = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    if 'fitImage' in kerneltype.split():
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
@@ -10,7 +10,10 @@ python __anonymous () {
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
 	# (at least for now) into the fitImage .
-        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
+        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        if 'fitImage' in typeformake.split():
+            typeformake.replace('fitImage', 'zImage')
+        d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
@@ -154,7 +157,7 @@ EOF
 }
 
 do_assemble_fitimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+	if test "x${KERNEL_IMAGETYPES}" != "x${KERNEL_IMAGETYPES//fitImage/}" ; then
 		kernelcount=1
 		dtbcount=""
 		rm -f fit-image.its
@@ -217,14 +220,14 @@ addtask assemble_fitimage before do_install after do_compile
 
 kernel_do_deploy_append() {
 	# Update deploy directory
-	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+	if test "x${KERNEL_IMAGETYPES}" != "x${KERNEL_IMAGETYPES//fitImage/}" ; then
 		cd ${B}
 		echo "Copying fit-image.its source file..."
-		its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
-		its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
+		its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		its_symlink_name=fitImage-its-${MACHINE}
 		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
-		linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
-		linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
+		linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
 		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
 
 		cd ${DEPLOYDIR}
diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index a63f482..5ffaeb7 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -10,41 +10,44 @@
 #   updates the new kernel as the boot priority.
 #
 
-pkg_preinst_kernel-image_append () {
+python __anonymous () {
+    import re
+
+    preinst = '''
 	# Parsing confliction
 	[ -f "$D/boot/grub/menu.list" ] && grubcfg="$D/boot/grub/menu.list"
 	[ -f "$D/boot/grub/grub.cfg" ] && grubcfg="$D/boot/grub/grub.cfg"
 	if [ -n "$grubcfg" ]; then
 		# Dereference symlink to avoid confliction with new kernel name.
-		if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg; then
-			if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
-				kimage=`realpath $D/boot/${KERNEL_IMAGETYPE} 2>/dev/null`
+		if grep -q "/KERNEL_IMAGETYPE \+root=" $grubcfg; then
+			if [ -L "$D/boot/KERNEL_IMAGETYPE" ]; then
+				kimage=`realpath $D/boot/KERNEL_IMAGETYPE 2>/dev/null`
 				if [ -f "$D$kimage" ]; then
-					sed -i "s:${KERNEL_IMAGETYPE} \+root=:${kimage##*/} root=:" $grubcfg
+					sed -i "s:KERNEL_IMAGETYPE \+root=:${kimage##*/} root=:" $grubcfg
 				fi
 			fi
 		fi
 
 		# Rename old kernel if it conflicts with new kernel name.
-		if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=" $grubcfg; then
-			if [ -f "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
+		if grep -q "/KERNEL_IMAGETYPE-KERNEL_VERSION \+root=" $grubcfg; then
+			if [ -f "$D/boot/KERNEL_IMAGETYPE-KERNEL_VERSION" ]; then
 				timestamp=`date +%s`
-				kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
-				sed -i "s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
-				mv "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
+				kimage="$D/boot/KERNEL_IMAGETYPE-KERNEL_VERSION-$timestamp-back"
+				sed -i "s:KERNEL_IMAGETYPE-KERNEL_VERSION \+root=:${kimage##*/} root=:" $grubcfg
+				mv "$D/boot/KERNEL_IMAGETYPE-KERNEL_VERSION" "$kimage"
 			fi
 		fi
 	fi
-}
+'''
 
-pkg_postinst_kernel-image_prepend () {
+    postinst = '''
 	get_new_grub_cfg() {
 		grubcfg="$1"
 		old_image="$2"
-		title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
+		title="Update KERNEL_IMAGETYPE-KERNEL_VERSION-${PV}"
 		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
 			rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg -m 1 | \
-				 sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
+				 sed "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-KERNEL_VERSION#"`
 
 			echo "menuentry \"$title\" {"
 			echo "    set root=(hd0,1)"
@@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {
 			echo "}"
 		elif [ "${grubcfg##*/}" = "menu.list" ]; then
 			rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m 1 | \
-				 sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
+				 sed "s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-KERNEL_VERSION#"`
 
 			echo "default 0"
 			echo "timeout 30"
@@ -87,5 +90,18 @@ pkg_postinst_kernel-image_prepend () {
 		mv $grubcfgtmp $grubcfg
 		echo "Caution! Update kernel may affect kernel-module!"
 	fi
+'''
+
+    version = d.getVar('KERNEL_VERSION', True)
+    imagetype = d.getVar('KERNEL_IMAGETYPES', True)
+    imagetype = re.sub(r'\.gz$', '', imagetype)
+
+    for type in imagetype.split():
+        preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
+        preinst_append = preinst_append.replace('KERNEL_VERSION', version)
+        postinst_prepend = postinst.replace('KERNEL_IMAGETYPE', type)
+        postinst_prepend = postinst_prepend.replace('KERNEL_VERSION', version)
+        d.setVar('pkg_preinst_kernel-image-' + type + '_append', preinst_append)
+        d.setVar('pkg_postinst_kernel-image-' + type + '_prepend', postinst_prepend)
 }
 
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index f73965b..c60fe5c 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,23 +1,25 @@
 inherit kernel-uboot
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'uImage':
+    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or "").split():
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
-	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-	# to kernel.bbclass . We override the variable here, since we need
-	# to build uImage using the kernel build system if and only if
-	# KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
-	# the uImage .
-	if d.getVar("KEEPUIMAGE", True) != 'yes':
-            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
+        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+        # to kernel.bbclass . We override the variable here, since we need
+        # to build uImage using the kernel build system if and only if
+        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
+        # the uImage .
+        if d.getVar("KEEPUIMAGE", True) != 'yes':
+            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+            if "uImage" in typeformake.split():
+                typeformake.replace('uImage', 'zImage')
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 }
 
 do_uboot_mkimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
+	if test "x${KERNEL_IMAGETYPES}" != "x${KERNEL_IMAGETYPES//uImage/}" ; then
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
 			uboot_prep_kimage
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index d06f6cf..68ae998 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -19,9 +19,44 @@ INITRAMFS_IMAGE_BUNDLE ?= ""
 python __anonymous () {
     import re
 
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
+    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
+    types = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    if type not in types.split():
+        types = (type + ' ' + types).strip()
+        d.setVar('KERNEL_IMAGETYPES', types)
+    typeformake = re.sub(r'\.gz', '', types)
+    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 
-    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
+    for type in typeformake.split():
+        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + type)
+
+        d.setVar('FILES_kernel-image-' + type, '/boot/' + type + '*')
+
+        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + type)
+
+        d.setVar('PKG_kernel-image-' + type, 'kernel-image-' + type + '-' + legitimize_package_name(d.getVar('KERNEL_VERSION', True)))
+
+        d.setVar('ALLOW_EMPTY_kernel-image-' + type, '1')
+
+        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
+        version = d.getVar('KERNEL_VERSION', True)
+        priority = d.getVar('KERNEL_PRIORITY', True)
+        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type + '-' + version + ' ' + priority + ' || true' + '\n'
+        d.setVar('pkg_postinst_kernel-image-' + type, postinst)
+
+        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-' + version + ' || true' + '\n'
+        d.setVar('pkg_postrm_kernel-image-' + type, postrm)
+
+        pkge = d.getVar('PKGE', True)
+        pkgv = d.getVar('PKGV', True)
+        pkgr = d.getVar('PKGR', True)
+        machine = d.getVar('MACHINE', True)
+        datetime = d.getVar('DATETIME', True)
+        d.appendVar('KERNEL_IMAGE_BASE_NAME', ' ' + type + '-' + pkge + '-' + pkgv + '-' + pkgr + '-' + machine + '-' + datetime)
+
+        d.setVarFlag('KERNEL_IMAGE_BASE_NAME', 'vardepsexclude', 'DATETIME')
+
+        d.appendVar('KERNEL_IMAGE_SYMLINK_NAME', ' ' + type + '-' + machine)
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
@@ -89,7 +124,7 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
 # Where built kernel lies in the kernel tree
-KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
+KERNEL_OUTPUT ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST = "boot"
 
 #
@@ -115,8 +150,6 @@ KERNEL_EXTRA_ARGS ?= ""
 # We don't want to override kernel Makefile variables from the environment
 EXTRA_OEMAKE = ""
 
-KERNEL_ALT_IMAGETYPE ??= ""
-
 # Define where the kernel headers are installed on the target as well as where
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
@@ -168,17 +201,37 @@ do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
 		copy_initramfs
-		if [ -e ${KERNEL_OUTPUT} ] ; then
-			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
-		fi
+		# Backuping kernel image relies on its type(regular file or symbolic link)
+		declare -A linkpath realpath
+		for type in ${KERNEL_IMAGETYPES} ; do
+			if [ -h ${KERNEL_OUTPUT}/${type} ] ; then
+				linkpath[type]=`readlink -n ${KERNEL_OUTPUT}/${type}`
+				realpath[type]=`readlink -fn ${KERNEL_OUTPUT}/${type}`
+				mv -f ${realpath[type]} ${realpath[type]}.bak
+			elif [ -f ${KERNEL_OUTPUT}/${type} ]; then
+				mv -f ${KERNEL_OUTPUT}/${type} ${KERNEL_OUTPUT}/${type}.bak
+			fi
+		done
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
 		kernel_do_compile
-		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
-		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
+		# Restoring kernel image
+		for type in ${KERNEL_IMAGETYPES} ; do
+			if [ -n "${realpath[type]}" ]; then
+				mv -f ${realpath[type]} ${realpath[type]}.initramfs
+				mv -f ${realpath[type]}.bak ${realpath[type]}
+				cd ${B}/$(dirname ${KERNEL_OUTPUT}/${type})
+				ln -sf ${linkpath[type]}.initramfs
+			else
+				mv -f ${KERNEL_OUTPUT}/${type} ${KERNEL_OUTPUT}/${type}.initramfs
+				mv -f ${KERNEL_OUTPUT}/${type}.bak ${KERNEL_OUTPUT}/${type}
+			fi
+		done
 		# Update install area
-		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
+		for type in ${KERNEL_IMAGETYPES} ; do
+			echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}/${type}.initramfs"
+			install -m 0644 ${B}/${KERNEL_OUTPUT}/${type}.initramfs ${D}/boot/${type}-initramfs-${MACHINE}.bin
+			echo "${B}/${KERNEL_OUTPUT}/${type}.initramfs"
+		done
 	fi
 }
 
@@ -203,10 +256,15 @@ kernel_do_compile() {
 		copy_initramfs
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
 	fi
-	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
-	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
-		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
-	fi
+	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+		for type in ${KERNEL_IMAGETYPES} ; do
+			if test "${typeformake}.gz" = "${type}"; then
+				gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT}/${type}"
+				break;
+			fi
+		done
+	done
 }
 
 do_compile_kernelmodules() {
@@ -239,7 +297,9 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
-	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	for type in ${KERNEL_IMAGETYPES} ; do
+		install -m 0644 ${KERNEL_OUTPUT}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
+	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
@@ -350,12 +410,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
-FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
-# Allow machines to override this dependency if kernel image files are 
+# Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
@@ -378,14 +438,6 @@ pkg_postinst_kernel-base () {
 	fi
 }
 
-pkg_postinst_kernel-image () {
-	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-}
-
-pkg_postrm_kernel-image () {
-	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
-}
-
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
@@ -439,10 +491,6 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
-# Don't include the DATETIME variable in the sstate package signatures
-KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
 MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
@@ -451,15 +499,25 @@ MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
 kernel_do_deploy() {
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	for base_name in ${KERNEL_IMAGE_BASE_NAME} ; do
+		type=${base_name%%-*}
+		install -m 0644 ${KERNEL_OUTPUT}/${type} ${DEPLOYDIR}/${base_name}.bin
+	done
+
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
+	for base_name in ${KERNEL_IMAGE_BASE_NAME} ; do
+		type=${base_name%%-*}
+		machine=${base_name%-*}
+		machine=${machine##*-}
+		symlink_name=${type}"-"${machine}
+		ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
+		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
+	done
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 075ab6a..b2626e6 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -245,6 +245,7 @@ KERNEL_CLASSES[doc] = "A list of classes defining kernel image types that kernel
 KERNEL_EXTRA_ARGS[doc] = "Specifies additional make command-line arguments the OpenEmbedded build system passes on when compiling the kernel."
 KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project kernel Git repository. The metadata you add through this variable includes config fragments and features descriptions."
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually set by the machine configuration files and defaults to 'zImage'."
+KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a device, usually set by the machine configuration files and defaults to KERNEL_IMAGETYPE."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded during boot"
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index ee3a5e1..ee4300e 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -25,7 +25,8 @@ do_install_append() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			IMAGE_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | awk -F " " '{print $1}'`
+			DTB_SYMLINK_NAME=`echo ${IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
@@ -43,8 +44,10 @@ do_deploy_append() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			IMAGE_BASE_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | awk -F " " '{print $1}'`
+			DTB_NAME=`echo ${IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			IMAGE_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | awk -F " " '{print $1}'`
+			DTB_SYMLINK_NAME=`echo ${IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
@@ -63,7 +66,8 @@ pkg_postinst_kernel-devicetree () {
 	for DTB_FILE in ${KERNEL_DEVICETREE}
 	do
 		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		IMAGE_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | awk -F " " '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
@@ -73,7 +77,8 @@ pkg_postrm_kernel-devicetree () {
 	for DTB_FILE in ${KERNEL_DEVICETREE}
 	do
 		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		IMAGE_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | awk -F " " '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
-- 
2.1.0


