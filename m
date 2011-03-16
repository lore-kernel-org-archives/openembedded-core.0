Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzuBa-0007jP-3W
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 18:07:02 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Mar 2011 10:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="403604359"
Received: from unknown (HELO localhost) ([10.255.12.146])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2011 10:05:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2011 10:04:47 -0700
Message-Id: <bf5f59e00a2ee59636426fabe2d4ae935fe2c4a5.1300295087.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>, Koen Kooi <koen@beagleboard.org>
Subject: [PATCH V2] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 17:07:02 -0000

NOT FOR INCLUSION

Before we include something like this, it needs review from folks like Koen and
Gary to confirm it works in their environment as well.

The existing infrastructure uses an external build tree which references the
kernel source in the work dir. If run with rm work, building external modules
will fail.

This patch places a configured source tree in sysroots. Striking a balance
between minimal size and minimal maintenance is difficult. A fully configured
tree is about 500MB after a clean. This version leans on the side of caution and
removes only the obviously unecessary parts of the source tree to conserve
space, resulting in about 170MB. The arch directories would be some additional
pruning we could do. Given examples from the devel package from distributions, I
suspect this size could be reduced to 75MB or so, but at the cost of a much more
complex recipe which is likely to require a great deal more maintenance to keep
current with kernel releases.

Care is also taken to clean the hostprogs in scripts, and the modules are
responsible for building them as needed. Although it is unclear to me if this is
really necessary, especially considering that modules put these bits back as
soon as they compile. If we are not generating an sstate package, I suspect we
can ignore these.

Please try this with your modules and let me know how it does. I tried to take
non linux-yocto kernel recipes into account, but I have only tested with
linux-yocto and the hello-mod recipe so far.

V2: o Address 000 perm quilt files (don't copy .pc dir)
    o Clear linux-yocto meta dir from sysroots

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Koen Kooi <koen@beagleboard.org>
CC: Gary Thomas <gary@mlbassoc.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass               |   97 ++++++++++------------------
 meta/classes/module.bbclass               |    9 ++-
 meta/recipes-kernel/linux/linux-yocto.inc |    6 ++
 3 files changed, 48 insertions(+), 64 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 90a7d64..5120065 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -110,78 +110,51 @@ kernel_do_install() {
 		install -d ${D}/etc/modprobe.d
 	fi
 
-
+	#
+	# Support for external module building - create a minimal copy of the
+	# kernel source tree.
+	#
+	kerneldir=${STAGING_KERNEL_DIR}
+	install -d $kerneldir
 
 	#
-	# Support for external module building - create a minimal copy of the kernel source tree
+	# Copy the entire source tree. In case an external build directory is
+	# used, copy the build directory over first, then copy over the source
+	# dir. This ensures the original Makefiles are used and not the
+	# redirecting Makefiles in the build directory.
 	#
-	kerneldir=${D}/kernel/
-
-	# Take care of arch specific headers	
-	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/${ARCH}/include/asm
-	if [ -e arch/${ARCH}/include/asm/ ] ; then 
-		install -d $kerneldir/arch/${ARCH}/
-		cp -fR arch/${ARCH}/* $kerneldir/arch/${ARCH}/
-
-	# Check for arch/x86 on i386
-	elif [ -d arch/x86/include/asm/ ]; then
-		if [ -e include/asm ] ; then
-			install -d $kerneldir/include/asm/
-			cp -fR arch/x86/include/asm/* $kerneldir/include/asm/
-		fi
-		install -d $kerneldir/arch/x86/include
-		cp -fR arch/x86/* $kerneldir/arch/x86/
+	# work and sysroots can be on different partitions, so we can't rely on
+	# hardlinking, unfortunately.
+	#
+	cp -fR * $kerneldir
+	cp .config $kerneldir
+	if [ ! "${S}" == "${B}" ]; then
+		cp -fR ${S}/* $kerneldir
 	fi
+	echo "LINUX BUILD TREE COPIED TO SYSROOTS"
+	du -hs $kerneldir
 
-	# Take care of the rest of the main directories we need
-	for entry in drivers/crypto drivers/media include scripts; do
-		if [ -d $entry ]; then
-			mkdir -p $kerneldir/$entry
-			cp -fR $entry/* $kerneldir/$entry/
-		fi
-	done
-
-	install -m 0644 .config $kerneldir/config-${KERNEL_VERSION}
-	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
-	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
-	echo "${KERNEL_VERSION}" >$kerneldir/kernel-abiversion
-	echo "${S}" >$kerneldir/kernel-source
-	echo "${KERNEL_CCSUFFIX}" >$kerneldir/kernel-ccsuffix
-	echo "${KERNEL_LDSUFFIX}" >$kerneldir/kernel-ldsuffix
-	[ -e vmlinux ] && install -m 0644 vmlinux $kerneldir/	
-	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
-	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
-	[ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/
-
-	# Copy over the main Makefiles
-	[ -e Rules.make ] && install -m 0644 Rules.make $kerneldir/
-	[ -e Makefile ] && install -m 0644 Makefile $kerneldir/
-	# Check if arch/${ARCH}/Makefile exists and install it
-	if [ -e arch/${ARCH}/Makefile ]; then
-		install -d $kerneldir/arch/${ARCH}
-		install -m 0644 arch/${ARCH}/Makefile* $kerneldir/arch/${ARCH}
-	# Otherwise check arch/x86/Makefile for i386 and x86_64 on kernels >= 2.6.24
-	elif [ -e arch/x86/Makefile ]; then
-		install -d $kerneldir/arch/x86
-		install -m 0644 arch/x86/Makefile* $kerneldir/arch/x86
-	fi
+	#
+	# Clean and remove files not needed for building modules.
+	# Some distributions go through a lot more trouble to strip out
+	# unecessary headers, for now, we just prune the obvious bits.
+	#
+	# We don't want to leave host-arch binaries in /sysroots, so
+	# we clean the scripts dir while leaving the generated config
+	# and include files.
+	#
+	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
+	make -C $kerneldir _mrproper_scripts
+	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# Remove the following binaries which cause strip errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-		arch/powerpc/boot/mktree scripts/bin2c scripts/conmakehash \
-		scripts/ihex2fw scripts/kallsyms scripts/pnmtologo scripts/basic/docproc \
-		scripts/basic/fixdep scripts/basic/hash scripts/dtc/dtc \
-		scripts/genksyms/genksyms scripts/kconfig/conf scripts/mod/mk_elfconfig \
-		scripts/mod/modpost scripts/recordmcount"
-	rm -rf $kerneldir/scripts/*.o
-	rm -rf $kerneldir/scripts/basic/*.o
-	rm -rf $kerneldir/scripts/kconfig/*.o
-	rm -rf $kerneldir/scripts/mod/*.o
-	rm -rf $kerneldir/scripts/dtc/*.o
+	           arch/powerpc/boot/mktree"
 	for entry in $bin_files; do
-		rm -f $kerneldir/$entry
-	done	
+	        rm -f $kerneldir/$entry
+	done
 }
 
 sysroot_stage_all_append() {
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index bbceaf7..572df0d 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -3,14 +3,19 @@ DEPENDS += "virtual/kernel"
 
 inherit module-base
 
-# Ensure the hostprogs are available for module compilation
-module_do_compile_prepend() {
+#
+# Ensure the hostprogs are available for module compilation. Modules that
+# inherit this recipe and override do_compile() should be sure to call
+# do_make_scripts() or ensure the scripts are built independently.
+#
+do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} scripts
 }
 
 module_do_compile() {
+	do_make_scripts
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
 		   KERNEL_SRC=${STAGING_KERNEL_DIR}    \
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0812144..c304d00 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -21,3 +21,9 @@ inherit kernel-yocto
 require linux-dtb.inc
 
 B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
+
+do_install_append(){
+	if [ -n "${KMETA}" ]; then
+		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
+	fi
+}
-- 
1.7.1



