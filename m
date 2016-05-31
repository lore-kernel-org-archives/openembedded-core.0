Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id 2F562601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 12:00:42 +0000 (UTC)
Received: from nbhjo (LFbn-1-3582-159.w90-127.abo.wanadoo.fr [90.127.97.159])
	by msfrf2615.sfr.fr (SMTP Server) with ESMTP id B00091C00F46B;
	Tue, 31 May 2016 14:00:41 +0200 (CEST)
Received: from nbhjo (LFbn-1-3582-159.w90-127.abo.wanadoo.fr
	[90.127.97.159])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2615.sfr.fr (SMTP Server) with ESMTPSA;
	Tue, 31 May 2016 14:00:41 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: zhe.he@windriver.com, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <cover.1464145184.git.zhe.he@windriver.com>
	<2902d349f5561da111ada2db1831faa399479fac.1464145184.git.zhe.he@windriver.com>
In-Reply-To: 
Date: Tue, 31 May 2016 14:00:37 +0200
Message-ID: <005501d1bb34$0bbdb2d0$23391870$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQKD3da8LLjJ3ZMdn+LXK7X7602NuwHWsi+Enl/ufICAAAgjYA==
X-sfr-mailing: LEGIT
Subject: Re: [PATCH 1/2 v4] kernel: Add KERNEL_IMAGETYPES to build	multi types kernel at one time
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
X-List-Received-Date: Tue, 31 May 2016 12:00:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Hi,

OK, it seems I've found a patch for meta-raspberrypi. I'll be submitting it
to the Yocto mailing list.
Sorry for the noise.

Herve

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: mardi 31 mai 2016 13:37
To: 'zhe.he@windriver.com' <zhe.he@windriver.com>;
'richard.purdie@linuxfoundation.org' <richard.purdie@linuxfoundation.org>;
'openembedded-core@lists.openembedded.org'
<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2 v4] kernel: Add KERNEL_IMAGETYPES to build
multi types kernel at one time

Hi,

I've just found out that this breaks the kernel builds on raspberrypi,
because do_rpiboot_mkimage() uses ${KERNEL_OUTPUT}, and this patch removes
it...
(sorry to find that only now, but I only today switched to a new environment
for some tests) I'm trying to find a patch to that one, but in the meantime,
people might need to revert it if they meet that kind of problems.

Herve

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
zhe.he@windriver.com
Sent: mercredi 25 mai 2016 10:47
To: richard.purdie@linuxfoundation.org;
openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/2 v4] kernel: Add KERNEL_IMAGETYPES to build
multi types kernel at one time

From: He Zhe <zhe.he@windriver.com>

Add KERNEL_IMAGETYPES to support building packaging and installing multi
types of kernel images, such as zImage uImage, at one time.

KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE work as before.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/classes/kernel-fitimage.bbclass    |  20 ++--
 meta/classes/kernel-grub.bbclass        |  44 +++++---
 meta/classes/kernel-uimage.bbclass      |  10 +-
 meta/classes/kernel.bbclass             | 174
+++++++++++++++++++++++---------
 meta/conf/documentation.conf            |   1 +
 meta/recipes-kernel/linux/linux-dtb.inc |  49 +++++----
 6 files changed, 202 insertions(+), 96 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass
b/meta/classes/kernel-fitimage.bbclass
index 298eda2..9a3caf5 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,8 +1,8 @@
 inherit kernel-uboot uboot-sign
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'fitImage':
+    kerneltypes = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    if 'fitImage' in kerneltypes.split():
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
@@ -10,7 +10,9 @@ python __anonymous () {
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
 	# (at least for now) into the fitImage .
-        d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
+        typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+        if 'fitImage' in typeformake.split():
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE',
+ typeformake.replace('fitImage', 'zImage'))
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
@@ -187,7 +189,7 @@ EOF
 }
 
 do_assemble_fitimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		kernelcount=1
 		dtbcount=""
 		rm -f fit-image.its arch/${ARCH}/boot/fitImage @@ -265,14
+267,14 @@ addtask assemble_fitimage before do_install after do_compile
kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
-	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		cd ${B}
 		echo "Copying fit-image.its source file..."
-
its_base_name="${KERNEL_IMAGETYPE}-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
-		its_symlink_name=${KERNEL_IMAGETYPE}-its-${MACHINE}
+
its_base_name="fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		its_symlink_name=fitImage-its-${MACHINE}
 		install -m 0644 fit-image.its
${DEPLOYDIR}/${its_base_name}.its
-
linux_bin_base_name="${KERNEL_IMAGETYPE}-linux.bin-${PV}-${PR}-${MACHINE}-${
DATETIME}"
-
linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
+
linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIME}"
+		linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
 		install -m 0644 linux.bin
${DEPLOYDIR}/${linux_bin_base_name}.bin
 
 		cd ${DEPLOYDIR}
diff --git a/meta/classes/kernel-grub.bbclass
b/meta/classes/kernel-grub.bbclass
index a63f482..f7dcc07 100644
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
 		# Dereference symlink to avoid confliction with new kernel
name.
-		if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg; then
-			if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
-				kimage=`realpath $D/boot/${KERNEL_IMAGETYPE}
2>/dev/null`
+		if grep -q "/KERNEL_IMAGETYPE \+root=" $grubcfg; then
+			if [ -L "$D/boot/KERNEL_IMAGETYPE" ]; then
+				kimage=`realpath $D/boot/KERNEL_IMAGETYPE
2>/dev/null`
 				if [ -f "$D$kimage" ]; then
-					sed -i "s:${KERNEL_IMAGETYPE}
\+root=:${kimage##*/} root=:" $grubcfg
+					sed -i "s:KERNEL_IMAGETYPE
\+root=:${kimage##*/} root=:" $grubcfg
 				fi
 			fi
 		fi
 
 		# Rename old kernel if it conflicts with new kernel name.
-		if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root="
$grubcfg; then
-			if [ -f
"$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
+		if grep -q "/KERNEL_IMAGETYPE-${KERNEL_VERSION} \+root="
$grubcfg; then
+			if [ -f "$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}"
]; then
 				timestamp=`date +%s`
-
kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
-				sed -i
"s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:"
$grubcfg
-				mv
"$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
+
kimage="$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}-$timestamp-back"
+				sed -i "s:KERNEL_IMAGETYPE-${KERNEL_VERSION}
\+root=:${kimage##*/} root=:" $grubcfg
+				mv
"$D/boot/KERNEL_IMAGETYPE-${KERNEL_VERSION}" "$kimage"
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
+		title="Update KERNEL_IMAGETYPE-${KERNEL_VERSION}-${PV}"
 		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
 			rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg -m
1 | \
-				 sed
"s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
+				 sed
+"s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
 
 			echo "menuentry \"$title\" {"
 			echo "    set root=(hd0,1)"
@@ -52,7 +55,7 @@ pkg_postinst_kernel-image_prepend () {
 			echo "}"
 		elif [ "${grubcfg##*/}" = "menu.list" ]; then
 			rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m 1
| \
-				 sed
"s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
+				 sed
+"s#${old_image}#${old_image%/*}/KERNEL_IMAGETYPE-${KERNEL_VERSION}#"`
 
 			echo "default 0"
 			echo "timeout 30"
@@ -87,5 +90,16 @@ pkg_postinst_kernel-image_prepend () {
 		mv $grubcfgtmp $grubcfg
 		echo "Caution! Update kernel may affect kernel-module!"
 	fi
+'''
+
+    imagetypes = d.getVar('KERNEL_IMAGETYPES', True)
+    imagetypes = re.sub(r'\.gz$', '', imagetypes)
+
+    for type in imagetypes.split():
+        typelower = type.lower()
+        preinst_append = preinst.replace('KERNEL_IMAGETYPE', type)
+        postinst_prepend = postinst.replace('KERNEL_IMAGETYPE', type)
+        d.setVar('pkg_preinst_kernel-image-' + typelower + '_append',
preinst_append)
+        d.setVar('pkg_postinst_kernel-image-' + typelower + '_prepend',
+ postinst_prepend)
 }
 
diff --git a/meta/classes/kernel-uimage.bbclass
b/meta/classes/kernel-uimage.bbclass
index 543f543..2a187f5 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,8 +1,7 @@
 inherit kernel-uboot
 
 python __anonymous () {
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'uImage':
+    if "uImage" in (d.getVar('KERNEL_IMAGETYPES', True) or "").split():
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
@@ -13,11 +12,14 @@ python __anonymous () {
         # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
         # the uImage .
         if d.getVar("KEEPUIMAGE", True) != 'yes':
-            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "vmlinux")
+            typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
+            if "uImage" in typeformake.split():
+                typeformake.replace('uImage', 'vmlinux')
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
 }
 
 do_uboot_mkimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
+	if echo "${KERNEL_IMAGETYPES}" | grep -wq "uImage"; then
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
 			uboot_prep_kimage
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass index
c5355cf..e7e2cb3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -16,12 +16,53 @@ INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
+# KERNEL_VERSION is extracted from source code. It is evaluated as # 
+None for the first parsing, since the code has not been fetched.
+# After the code is fetched, it will be evaluated as real version # 
+number and cause kernel to be rebuilt. To avoid this, make # 
+KERNEL_VERSION_NAME and KERNEL_VERSION_PKG_NAME depend on # 
+LINUX_VERSION which is a constant.
+KERNEL_VERSION_NAME = "${@d.getVar('KERNEL_VERSION', True) or ""}"
+KERNEL_VERSION_NAME[vardepvalue] = "${LINUX_VERSION}"
+KERNEL_VERSION_PKG_NAME =
"${@legitimize_package_name(d.getVar('KERNEL_VERSION', True))}"
+KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
+
 python __anonymous () {
     import re
 
-    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
+    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
KERNEL_IMAGETYPES
+    type = d.getVar('KERNEL_IMAGETYPE', True) or ""
+    alttype = d.getVar('KERNEL_ALT_IMAGETYPE', True) or ""
+    types = d.getVar('KERNEL_IMAGETYPES', True) or ""
+    if type not in types.split():
+        types = (type + ' ' + types).strip()
+    if alttype not in types.split():
+        types = (alttype + ' ' + types).strip()
+    d.setVar('KERNEL_IMAGETYPES', types)
+
+    typeformake = re.sub(r'\.gz', '', types)
+    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
+
+    for type in typeformake.split():
+        typelower = type.lower()
+
+        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
+
+        d.setVar('FILES_kernel-image-' + typelower, '/boot/' + type +
+ '*')
+
+        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
+ typelower)
+
+        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + 
+ typelower + '-${KERNEL_VERSION_PKG_NAME}')
 
-    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
+        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
+
+        imagedest = d.getVar('KERNEL_IMAGEDEST', True)
+        priority = d.getVar('KERNEL_PRIORITY', True)
+        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' +
imagedest + '/' + type + ' ' + type + ' ' + '/' + imagedest + '/' + type +
'-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
+        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
+
+        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' +
type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
+        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
 
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
@@ -92,8 +133,8 @@ KERNEL_PRIORITY ?=
"${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-# Where built kernel lies in the kernel tree -KERNEL_OUTPUT ?=
"arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
+# The directory where built kernel lies in the kernel tree 
+KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST = "boot"
 
 #
@@ -162,23 +203,48 @@ copy_initramfs() {
 	echo "Finished copy of initramfs into ./usr"
 }
 
-INITRAMFS_BASE_NAME =
"${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
+INITRAMFS_BASE_NAME = "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1
]; then
 		echo "Creating a kernel image with a bundled initramfs..."
 		copy_initramfs
-		if [ -e ${KERNEL_OUTPUT} ] ; then
-			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
-		fi
+		# Backing up kernel image relies on its type(regular file or
symbolic link)
+		tmp_path=""
+		for type in ${KERNEL_IMAGETYPES} ; do
+			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+				linkpath=`readlink -n
${KERNEL_OUTPUT_DIR}/$type`
+				realpath=`readlink -fn
${KERNEL_OUTPUT_DIR}/$type`
+				mv -f $realpath $realpath.bak
+				tmp_path=$tmp_path"
"$type"#"$linkpath"#"$realpath
+			elif [ -f ${KERNEL_OUTPUT_DIR}/$type ]; then
+				mv -f ${KERNEL_OUTPUT_DIR}/$type
${KERNEL_OUTPUT_DIR}/$type.bak
+				tmp_path=$tmp_path" "$type"##"
+			fi
+		done
 
use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${M
ACHINE}.cpio
 		kernel_do_compile
-		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
-		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
+		# Restoring kernel image
+		for tp in $tmp_path ; do
+			type=`echo $tp|cut -d "#" -f 1`
+			linkpath=`echo $tp|cut -d "#" -f 2`
+			realpath=`echo $tp|cut -d "#" -f 3`
+			if [ -n "$realpath" ]; then
+				mv -f $realpath $realpath.initramfs
+				mv -f $realpath.bak $realpath
+				cd ${B}/${KERNEL_OUTPUT_DIR}
+				ln -sf $linkpath.initramfs
+			else
+				mv -f ${KERNEL_OUTPUT_DIR}/$type
${KERNEL_OUTPUT_DIR}/$type.initramfs
+				mv -f ${KERNEL_OUTPUT_DIR}/$type.bak
${KERNEL_OUTPUT_DIR}/$type
+			fi
+		done
 		# Update install area
-		echo "There is kernel image bundled with initramfs:
${B}/${KERNEL_OUTPUT}.initramfs"
-		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
-		echo "${B}/${KERNEL_OUTPUT}.initramfs"
+		for type in ${KERNEL_IMAGETYPES} ; do
+			echo "There is kernel image bundled with initramfs:
${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
+			install -m 0644
${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs
${D}/boot/$type-initramfs-${MACHINE}.bin
+			echo "${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
+		done
 	fi
 }
 
@@ -203,10 +269,15 @@ kernel_do_compile() {
 		copy_initramfs
 
use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${M
ACHINE}.cpio
 	fi
-	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE}
CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
$use_alternate_initrd
-	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}";
then
-		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" >
"${KERNEL_OUTPUT}"
-	fi
+	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+		oe_runmake ${typeformake} CC="${KERNEL_CC}"
LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
+		for type in ${KERNEL_IMAGETYPES} ; do
+			if test "${typeformake}.gz" = "${type}"; then
+				gzip -9c < "${typeformake}" >
"${KERNEL_OUTPUT_DIR}/${type}"
+				break;
+			fi
+		done
+	done
 }
 
 do_compile_kernelmodules() {
@@ -247,7 +318,9 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
-	install -m 0644 ${KERNEL_OUTPUT}
${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	for type in ${KERNEL_IMAGETYPES} ; do
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
+	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
@@ -375,12 +448,12 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev
kernel-modules"
 FILES_${PN} = ""
 FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
/lib/modules/${KERNEL_VERSION}/modules.builtin"
-FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
+FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
-# Allow machines to override this dependency if kernel image files are 
+# Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image =
"kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
@@ -404,14 +477,6 @@ pkg_postinst_kernel-base () {
 	fi
 }
 
-pkg_postinst_kernel-image () {
-	update-alternatives --install
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}
/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
${KERNEL_PRIORITY} || true
-}
-
-pkg_postrm_kernel-image () {
-	update-alternatives --remove ${KERNEL_IMAGETYPE}
${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
-}
-
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
@@ -432,13 +497,13 @@ do_kernel_link_vmlinux() {
 
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
-			bbwarn "image type will not be stripped (not
supported): ${KERNEL_IMAGETYPE}"
+		if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux");
then
+			bbwarn "image type(s) will not be stripped (not
supported): ${KERNEL_IMAGETYPES}"
 			return
 		fi
 
 		cd ${B}
-		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT} | \
+		headers=`"$CROSS_COMPILE"readelf -S
${KERNEL_OUTPUT_DIR}/vmlinux | \
 			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
 			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
 			  gawk '{print $1}'`
@@ -448,7 +513,7 @@ do_strip() {
 				bbwarn "Section not found: $str";
 			fi
 
-			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT}
+			"$CROSS_COMPILE"strip -s -R $str
${KERNEL_OUTPUT_DIR}/vmlinux
 		}; done
 
 		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping
sections:" \ @@ -467,20 +532,22 @@ do_sizecheck() {
 		if [ -n "$invalid" ]; then
 			die "Invalid KERNEL_IMAGE_MAXSIZE:
${KERNEL_IMAGE_MAXSIZE}, should be an integerx (The unit is Kbytes)"
 		fi
-		size=`du -ks ${B}/${KERNEL_OUTPUT} | awk '{ print $1}'`
-		if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
-			die "This kernel (size=$size(K) >
${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the
size of the kernel by making more of it modular."
-		fi
+		for type in ${KERNEL_IMAGETYPES} ; do
+			size=`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$type | awk
'{print $1}'`
+			if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
+				warn "This kernel $type (size=$size(K) >
${KERNEL_IMAGE_MAXSIZE}(K)) is too big for your device. Please reduce the
size of the kernel by making more of it modular."
+			fi
+		done
 	fi
 }
 do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-KERNEL_IMAGE_BASE_NAME ?=
"${KERNEL_IMAGETYPE}-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
-KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
 MODULE_IMAGE_BASE_NAME ?=
"modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
@@ -489,28 +556,37 @@ MODULE_TARBALL_SYMLINK_NAME ?=
"modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
 kernel_do_deploy() {
-	install -m 0644 ${KERNEL_OUTPUT}
${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	for type in ${KERNEL_IMAGETYPES} ; do
+		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}
${DEPLOYDIR}/${base_name}.bin
+	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e
'^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D}
lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME}
${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
${DEPLOYDIR}/${KERNEL_IMAGETYPE}
+	for type in ${KERNEL_IMAGETYPES} ; do
+		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
+		ln -sf ${base_name}.bin ${DEPLOYDIR}/${symlink_name}.bin
+		ln -sf ${base_name}.bin ${DEPLOYDIR}/${type}
+	done
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt
${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
 	cd ${B}
 	# Update deploy directory
-	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
-		echo "Copying deploy kernel-initramfs image and setting up
links..."
-		initramfs_base_name=${INITRAMFS_BASE_NAME}
-
initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
-		install -m 0644 ${KERNEL_OUTPUT}.initramfs
${DEPLOYDIR}/${initramfs_base_name}.bin
-		cd ${DEPLOYDIR}
-		ln -sf ${initramfs_base_name}.bin
${initramfs_symlink_name}.bin
-	fi
+	for type in ${KERNEL_IMAGETYPES} ; do
+		if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+			echo "Copying deploy ${type} kernel-initramfs image
and setting up links..."
+			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
+			initramfs_symlink_name=${type}-initramfs-${MACHINE}
+			install -m 0644
${KERNEL_OUTPUT_DIR}/${type}.initramfs
${DEPLOYDIR}/${initramfs_base_name}.bin
+			cd ${DEPLOYDIR}
+			ln -sf ${initramfs_base_name}.bin
${initramfs_symlink_name}.bin
+		fi
+	done
 }
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 4234d75..dcc324c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -245,6 +245,7 @@ KERNEL_CLASSES[doc] = "A list of classes defining kernel
image types that kernel  KERNEL_EXTRA_ARGS[doc] = "Specifies additional make
command-line arguments the OpenEmbedded build system passes on when
compiling the kernel."
 KERNEL_FEATURES[doc] = "Includes additional metadata from the Yocto Project
kernel Git repository. The metadata you add through this variable includes
config fragments and features descriptions."
 KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device, usually
set by the machine configuration files and defaults to 'zImage'."
+KERNEL_IMAGETYPES[doc] = "The list of types of kernel to build for a
device, usually set by the machine configuration files and defaults to
KERNEL_IMAGETYPE."
 KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be
auto-loaded during boot"
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build
system expects to find module_conf_* values that specify configuration for
each of the modules"
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is
set to the value of the STAGING_KERNEL_DIR within the module class
(module.bbclass)."
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
b/meta/recipes-kernel/linux/linux-dtb.inc
index 651a19e..74f5ef8 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -34,9 +34,12 @@ do_install_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-		install -m 0644 ${DTB_PATH}
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+			install -m 0644 ${DTB_PATH}
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+		done
 	done
 }
 
@@ -44,31 +47,39 @@ do_deploy_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
-		DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-		install -d ${DEPLOYDIR}
-		install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
-		ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_NAME=`echo ${base_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+			install -d ${DEPLOYDIR}
+			install -m 0644 ${DTB_PATH}
${DEPLOYDIR}/${DTB_NAME}.dtb
+			ln -sf ${DTB_NAME}.dtb
${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+		done
 	done
 }
 
 pkg_postinst_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTB in ${KERNEL_DEVICETREE}
-	do
-		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		update-alternatives --install
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	for DTB in ${KERNEL_DEVICETREE}; do
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
$1}'`
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			update-alternatives --install
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		done
 	done
 }
 
 pkg_postrm_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTB in ${KERNEL_DEVICETREE}
-	do
-		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		update-alternatives --remove ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	for DTB in ${KERNEL_DEVICETREE}; do
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
$1}'`
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			update-alternatives --remove ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		done
 	done
 }
--
2.8.1

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core


