Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A26C792B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7GL3kRZ027196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2018 14:03:46 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 16 Aug 2018 14:03:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 16 Aug 2018 17:03:41 -0400
Message-ID: <1534453421-28943-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 16 Aug 2018 21:03:47 -0000
Content-Type: text/plain

The existing kernel-devsrc package starts with a full copy of the kernel
source and then starts to strip out elements that are not required.

This results in extra time (I/O) and extra space being taken up in the
final package. The main purpose of the kernel-devsrc package has been to
build modules against the running kernel, not to include a full copy of
the source code for re-building the kernel. The end result was a
600M kernel-devsrc package.

This restructuring of the package uses an approach similar to other
distros, where the kernel-devsrc package is for building against the
running kernel and uses a curated set of copied infrastructure, versus
a mass copy of the entire kernel.

The differences in this approach versus other is largely due to the
architecture support and the split build/source directory of the
kernel.

The result is a kernel-devsrc package of about 10M, which is capable
of running "make scripts" and compiling kernel modules against the
running kernel.

Along with the changes to the copying of the infrascture, we also
have the following changes:

 - a better/more explicit listing of dependencies for on-target
   builds of "make scripts" or "make modules_prepare"

 - The kernel source is installed into /lib/modules/<version>/build
   and a symlink created from /usr/src/kernel to the new location.
   This aligns with the standard location for module support
   code

 - There is also a symlink from /lib/modules/<version>/source -> build
   to reserve a spot for a new package that is simply the kernel
   source. That package is not part of this update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

Here's v4 of the devsrc re-work. I haven't tested the oeqa test
or build appliance yet, since my build is still running. If it
still breaks, I'll re-spin.

v2: drop DEPENDS on perf. We no longer need to depend on 
    perf since the source is copied before modification.

v3: build fixes for:
      - DESCEND  objtool build failure
      - No rule to make target 'arch/mips/boot/tools/relocs_32.c'
      - No rule to make target 'arch/arm/tools/syscall.tbl'
      - No rule to make target 'arch/arm64/kernel/vdso/vdso.lds'

v4: adjust build appliance and oeqa tests to the new build location

 meta/lib/oeqa/runtime/cases/stap.py                |   2 +-
 .../images/build-appliance-image_15.0.0.bb         |   6 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb         | 228 ++++++++++++++++-----
 3 files changed, 186 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index fc728bfc5536..96e197a2d68c 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -25,7 +25,7 @@ class StapTest(OERuntimeTestCase):
     def test_stap(self):
         cmds = [
             'cd /usr/src/kernel && make scripts prepare',
-            'cd /lib/modules/`uname -r` && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)',
+            'cd /lib/modules/`uname -r` && (if [ ! -e build ]; then ln -s /usr/src/kernel build; fi)',
             'stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hello.stp'
             ]
         for cmd in cmds:
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index db2f58dfb93f..7b210f096921 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -59,8 +59,10 @@ fakeroot do_populate_poky_src () {
 	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
 	# Create a symlink, needed for out-of-tree kernel modules build
-	rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-	lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+	if [ ! -e ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build ]; then
+		rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+		lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
+	fi
 
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8bbfa23e4b86..719a5497ef30 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -30,57 +30,191 @@ do_populate_sysroot[noexec] = "1"
 S = "${STAGING_KERNEL_DIR}"
 B = "${STAGING_KERNEL_BUILDDIR}"
 
-KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+KERNEL_BUILD_ROOT="/lib/modules/"
+
 do_install() {
-        kerneldir=${D}${KERNEL_SRC_PATH}
-        install -d $kerneldir
-
-        #
-        # Copy the staging dir source (and module build support) into the devsrc structure.
-        # We can keep this copy simple and take everything, since a we'll clean up any build
-        # artifacts afterwards, and the extra i/o is not significant
-        #
-        cd ${B}
-        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
-        cd ${S}
-	find . -type d -name '.git*' -prune -o -type d -name '.kernel-meta' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
-
-        # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
-        # The main build artifacts. We clean the directory to avoid QA errors on mismatched
-        # architecture (since scripts and helpers are native format).
-        KBUILD_OUTPUT="$kerneldir"
-        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
-        # make clean generates an absolute path symlink called "source"
-        # in $kerneldir points to $kerneldir, which doesn't make any
-        # sense, so remove it.
-        if [ -L $kerneldir/source ]; then
-            bbnote "Removing $kerneldir/source symlink"
-            rm -f $kerneldir/source
-        fi
-
-        # As of Linux kernel version 3.0.1, the clean target removes
-        # arch/powerpc/lib/crtsavres.o which is present in
-        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
-        if [ ${ARCH} = "powerpc" ]; then
-                mkdir -p $kerneldir/arch/powerpc/lib/
-                cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
-        fi
-
-        # Remove fixdep/objtool as they won't be target binaries
-        for i in fixdep objtool; do
-                if [ -e $kerneldir/tools/objtool/$i ]; then
-                        rm -rf $kerneldir/tools/objtool/$i
-                fi
-        done
-
-        chown -R root:root ${D}
+    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
+    install -d $kerneldir
+
+    # create the directory structure
+    rm -f $kerneldir/build
+    rm -f $kerneldir/source
+    mkdir -p $kerneldir/build
+
+    # for compatibility with some older variants of this package, we
+    # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
+    mkdir -p ${D}/usr/src
+    (
+	cd ${D}/usr/src
+	ln -s ${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
+    )
+
+    # for on target purposes, we unify build and source
+    (
+	cd $kerneldir
+	ln -s build source
+    )
+
+    # first copy everything
+    (
+	cd ${S}
+	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
+	cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
+    )
+
+    # then drop all but the needed Makefiles/Kconfig files
+    rm -rf $kerneldir/build/Documentation
+    rm -rf $kerneldir/build/scripts
+    rm -rf $kerneldir/build/include
+
+    # now copy in parts from the build that we'll need later
+    (
+	cd ${B}
+
+	cp Module.symvers $kerneldir/build
+	cp System.map* $kerneldir/build
+	if [ -s Module.markers ]; then
+	    cp Module.markers $kerneldir/build
+	fi
+
+	cp .config $kerneldir/build
+
+	# This scripts copy blow up QA, so for now, we require a more
+	# complex 'make scripts' to restore these, versus copying them
+	# here. Left as a reference to indicate that we know the scripts must
+	# be dealt with.
+	# cp -a scripts $kerneldir/build
+
+        if [ -d arch/${ARCH}/scripts ]; then
+	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
+	fi
+	if [ -f arch/${ARCH}/*lds ]; then
+	    cp -a arch/${ARCH}/*lds $kerneldir/build/arch/${ARCH}
+	fi
+
+	rm -f $kerneldir/build/scripts/*.o
+	rm -f $kerneldir/build/scripts/*/*.o
+
+	if [ "${ARCH}" = "powerpc" ]; then
+	    if [ -e arch/powerpc/lib/crtsavres.S ] ||
+		   [ -e arch/powerpc/lib/crtsavres.o ]; then
+		cp -a --parents arch/powerpc/lib/crtsavres.[So] $kerneldir/build/
+	    fi
+	fi
+
+	if [ "${ARCH}" = "arm64" ]; then
+	    cp -a --parents arch/arm64/kernel/vdso/vdso.lds $kerneldir/build/
+	fi
+
+	cp -a include $kerneldir/build/include
+    )
+
+    # now grab the chunks from the source tree that we need
+    (
+	cd ${S}
+
+	cp -a scripts $kerneldir/build
+
+	# if our build dir had objtool, it will also be rebuilt on target, so
+	# we copy what is required for that build
+	if [ -f ${B}/tools/objtool/objtool ]; then
+	    # these are a few files associated with objtool, since we'll need to
+	    # rebuild it
+	    cp -a --parents tools/build/Build.include $kerneldir/build/
+	    cp -a --parents tools/build/Build $kerneldir/build/
+	    cp -a --parents tools/build/fixdep.c $kerneldir/build/
+	    cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
+
+	    # extra files, just in case
+	    cp -a --parents tools/objtool/* $kerneldir/build/
+	    cp -a --parents tools/lib/str_error_r.c $kerneldir/build/
+	    cp -a --parents tools/lib/string.c $kerneldir/build/
+	    cp -a --parents tools/lib/subcmd/* $kerneldir/build/
+
+	    cp -a --parents tools/include/* $kerneldir/build/
+	fi
+
+	if [ "${ARCH}" = "arm64" ]; then
+	    # arch/arm64/include/asm/xen references arch/arm
+	    cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
+	    # arch/arm64/include/asm/opcodes.h references arch/arm
+	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
+
+            cp -a --parents arch/arm64/kernel/vdso/gettimeofday.S $kerneldir/build/
+            cp -a --parents arch/arm64/kernel/vdso/sigreturn.S $kerneldir/build/
+            cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
+            cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
+	fi
+
+	# include the machine specific headers for ARM variants, if available.
+	if [ "${ARCH}" = "arm" ]; then
+	    cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
+
+	    # include a few files for 'make prepare'
+	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
+	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
+	    cp -a --parents arch/arm/tools/syscall* $kerneldir/build/
+	fi
+
+	if [ -d arch/${ARCH}/include ]; then
+	    cp -a --parents arch/${ARCH}/include $kerneldir/build/
+	fi
+
+	cp -a include $kerneldir/build
+
+	cp -a --parents tools/include/tools/le_byteshift.h $kerneldir/build/
+	cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
+
+	if [ "${ARCH}" = "x86" ]; then
+	    # files for 'make prepare' to succeed with kernel-devel
+	    cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build/
+	    cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh $kerneldir/build/
+	    cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh $kerneldir/build/
+	    cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl $kerneldir/build/
+	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
+	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
+	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
+	    cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
+	    cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/sha256.h $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
+	    cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
+	    cp -a --parents arch/x86/boot/string.h $kerneldir/build/
+	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
+	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
+	fi
+
+	if [ "${ARCH}" = "mips" ]; then
+	    cp -a --parents arch/mips/Kbuild.platforms $kerneldir/build/
+	    cp --parents $(find	 -type f -name "Platform") $kerneldir/build
+	    cp --parents arch/mips/boot/tools/relocs* $kerneldir/build
+	fi
+    )
+
+    # Make sure the Makefile and version.h have a matching timestamp so that
+    # external modules can be built
+    touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
+
+    # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
+    cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
+
+    chown -R root:root ${D}
 }
+
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
-PACKAGES = "kernel-devsrc"
-FILES_${PN} = "${KERNEL_SRC_PATH}"
-RDEPENDS_${PN} = "bc"
+FILES_${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
+FILES_${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
+
+RDEPENDS_${PN} = "bc python ${TCLIBC}-utils"
+# 4.15+ needs these next two RDEPENDS
+RDEPENDS_${PN} += "openssl-dev util-linux"
+# and x86 needs a bit more for 4.15+
+RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
-- 
2.5.0


