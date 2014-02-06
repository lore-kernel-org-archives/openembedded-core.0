Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA856D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 10:04:22 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id kp14so1501656pab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 02:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SCVlAF53+MOOeJ8hBSWg23z5e8nuBjsA2Vrw07mX5H8=;
	b=SuHJ71zYtxYVmTRN1RHKvDs1qz/WSxzP2VgS3uNh7qJ8+qgnKZfqYpB3kVfTNn7SHN
	ky0W6wpofNGCu0tWAsuzaimtIGQ/1Hnc/s+tLbD7aXx/0sZIsWIJSYov88fJIwjLsnT9
	3qOlLNQI6KoeUUMAmbqEYGQ/wxnrhuge7QnxKtGyH55fVPkpJ/+YPKEX94Qf+VLvr9BW
	sMnCQgaUoDojsbResjYZGsTCWrqmFGbM9tPew03XO2XsEkwGNiYtqRqWY4onBuIUTZxJ
	k6WIe+YsKAw6ci1KMreryqsXoO/v/zQQUkiwIe/M2qC/kXMnjtEz1QNSINsLPKM+p9Oy
	9qow==
X-Received: by 10.68.66.33 with SMTP id c1mr11375551pbt.118.1391681063337;
	Thu, 06 Feb 2014 02:04:23 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id y9sm3242096pas.10.2014.02.06.02.04.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Feb 2014 02:04:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@windriver.com
Date: Thu,  6 Feb 2014 02:05:05 -0800
Message-Id: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [RFC][PATCH] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Thu, 06 Feb 2014 10:04:22 -0000

This also make a change where for kernel
S != B, this is done because when S = B
and we use O= option or set KBUILD_OUTPUT
to point to objectdir, kernel build system
ends up denoting itself dirty and asking for
running mrproper during later build steps
after do_configure but works perfectly
for when S != B

Additional fixes make sure that we do not
assume directory paths when accessing files

Move exporting KBUILD_OUTPUT from kernel-yocto
into kernel class

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-yocto.bbclass |  3 +-
 meta/classes/kernel.bbclass       | 71 ++++++++++++++++++++++-----------------
 2 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8f79932..73257e1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -408,6 +408,5 @@ do_kernel_link_vmlinux() {
 	ln -sf ../../../vmlinux
 }
 
-OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
+OE_TERMINAL_EXPORTS += "GUILT_BASE"
 GUILT_BASE = "meta"
-KBUILD_OUTPUT = "${B}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 51626b0..b000147 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -10,6 +10,7 @@ KERNEL_IMAGETYPE ?= "zImage"
 INITRAMFS_IMAGE ?= ""
 INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
+B = "${WORKDIR}/build"
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
@@ -157,6 +158,7 @@ kernel_do_compile() {
 	# different initramfs image.  The way to do that in the kernel
 	# is to specify:
 	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
+	cd ${S}
 	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
 		# The old style way of copying an prebuilt image and building it
 		# is turned on via INTIRAMFS_TASK != ""
@@ -165,13 +167,14 @@ kernel_do_compile() {
 	fi
 	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
-		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
+		gzip -9c < "${B}/${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
 	fi
 }
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	cd ${S}
+	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	else
 		bbnote "no modules to compile"
@@ -184,7 +187,8 @@ kernel_do_install() {
 	# First install the modules
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	cd ${S}
+	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
@@ -200,10 +204,10 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
-	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
-	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
+	install -m 0644 ${B}/System.map ${D}/boot/System.map-${KERNEL_VERSION}
+	install -m 0644 ${B}/.config ${D}/boot/config-${KERNEL_VERSION}
+	install -m 0644 ${B}/vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
+	[ -e ${B}/Module.symvers ] && install -m 0644 ${B}/Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 
@@ -232,20 +236,21 @@ kernel_do_install() {
 	# dir. This ensures the original Makefiles are used and not the
 	# redirecting Makefiles in the build directory.
 	#
+	pwd="$PWD"
+	cd "${B}"
 	find . -depth -not -name "*.cmd" -not -name "*.o" -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
-	cp .config $kerneldir
+	cp ${B}/.config $kerneldir
 	if [ "${S}" != "${B}" ]; then
-		pwd="$PWD"
 		cd "${S}"
 		find . -depth -not -path "./Documentation*" -not -path "./.*" -print0 | cpio --null -pdlu $kerneldir
-		cd "$pwd"
 	fi
+	cd "$pwd"
 
 	# Test to ensure that the output file and image type are not actually
 	# the same file. If hardlinking is used, they will be the same, and there's
 	# no need to install.
 	! [ ${KERNEL_OUTPUT} -ef $kerneldir/${KERNEL_IMAGETYPE} ] && install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
-	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
+	install -m 0644 ${B}/System.map $kerneldir/System.map-${KERNEL_VERSION}
 
 	# Dummy Makefile so the clean below works
         mkdir $kerneldir/Documentation
@@ -260,24 +265,24 @@ kernel_do_install() {
 	# we clean the scripts dir while leaving the generated config
 	# and include files.
 	#
-	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
-	make -C $kerneldir _mrproper_scripts
+	oe_runmake KBUILD_OUTPUT= -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
+	make KBUILD_OUTPUT= -C $kerneldir _mrproper_scripts
 	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
 	# arch/powerpc/lib/crtsavres.o which is present in
 	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
 	if [ ${ARCH} = "powerpc" ]; then
-		cp -l arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+		cp -l ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
 	# Necessary for building modules like compat-wireless.
-	if [ -f include/generated/bounds.h ]; then
-		cp -l include/generated/bounds.h $kerneldir/include/generated/bounds.h
+	if [ -f ${B}/include/generated/bounds.h ]; then
+		cp -l ${B}/include/generated/bounds.h $kerneldir/include/generated/bounds.h
 	fi
-	if [ -d arch/${ARCH}/include/generated ]; then
+	if [ -d ${B}/arch/${ARCH}/include/generated ]; then
 		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-		cp -flR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+		cp -flR ${B}/arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
 
 	# Remove the following binaries which cause strip or arch QA errors
@@ -302,6 +307,7 @@ python sysroot_stage_all () {
 }
 
 kernel_do_configure() {
+	cd ${S}
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
@@ -313,7 +319,7 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
-	yes '' | oe_runmake oldconfig
+	oe_runmake olddefconfig
 }
 
 do_savedefconfig() {
@@ -432,19 +438,19 @@ do_uboot_mkimage() {
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
-				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+				ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
 					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
 			fi
-			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-				${OBJCOPY} -O binary -R .note -R .comment -S arch/${ARCH}/boot/compressed/vmlinux linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-				rm -f linux.bin
+			if test -e ${B}/arch/${ARCH}/boot/compressed/vmlinux ; then
+				${OBJCOPY} -O binary -R .note -R .comment -S ${B}/arch/${ARCH}/boot/compressed/vmlinux ${B}/linux.bin
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d ${B}/linux.bin ${B}/arch/${ARCH}/boot/uImage
+				rm -f ${B}/linux.bin
 			else
-				${OBJCOPY} -O binary -R .note -R .comment -S vmlinux linux.bin
-				rm -f linux.bin.gz
-				gzip -9 linux.bin
-				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
-				rm -f linux.bin.gz
+				${OBJCOPY} -O binary -R .note -R .comment -S ${B}/vmlinux ${B}/linux.bin
+				rm -f ${B}/linux.bin.gz
+				gzip -9 ${B}/linux.bin > ${B}/linux.bin.gz
+				uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d ${B}/linux.bin.gz ${B}/arch/${ARCH}/boot/uImage
+				rm -f ${B}/linux.bin.gz
 			fi
 		fi
 	fi
@@ -453,8 +459,8 @@ do_uboot_mkimage() {
 addtask uboot_mkimage before do_install after do_compile
 
 kernel_do_deploy() {
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
-	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		mkdir -p ${D}/lib
 		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
 		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
@@ -483,3 +489,6 @@ addtask deploy before do_build after do_install
 
 EXPORT_FUNCTIONS do_deploy
 
+OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
+export KBUILD_OUTPUT = "${B}"
+
-- 
1.8.5.3


