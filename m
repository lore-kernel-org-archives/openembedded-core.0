Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpRA-0003fR-PM
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:37:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2012 21:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117571485"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jun 2012 21:26:38 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 21:25:04 -0700
Message-Id: <2e2f72682e773f4f97db3181112e7eb569df09da.1341025161.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1341025161.git.dvhart@linux.intel.com>
References: <cover.1341025161.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/3] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Sat, 30 Jun 2012 04:37:37 -0000

[YOCTO #1614]

Add the kernel headers to the kernel-dev package. This packages what was
already built and kept in sysroots for building modules with bitbake.
Making this available on the target requires removing some additional
host binaries.

Move the location to /usr/src/kernel

Before use on the target, the user will need to:

    # cd /usr/src/kernel
    # make scripts

This renders the kernel-misc recipe empty, so remove it.

As we use /usr/src/kernel in several places (and I missed one in the
previous version), add a KERNEL_SRC_DIR variable and use that throughout
the class to avoid update errors in the future.

Now that we package the kernel headers, drop the
kernel_package_preprocess function which removed them from PKGD.

All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
be installed by default on all such images.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass               |   27 ++++++++++++---------------
 meta/conf/bitbake.conf                    |    2 +-
 meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 31e633b..44461bc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -77,6 +77,10 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
+# Define where the kernel headers are installed on the target as well as where
+# they are staged.
+KERNEL_SRC_PATH = "/usr/src/kernel"
+
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
 kernel_do_compile() {
@@ -130,7 +134,7 @@ kernel_do_install() {
 	# Support for external module building - create a minimal copy of the
 	# kernel source tree.
 	#
-	kerneldir=${D}/kernel
+	kerneldir=${D}${KERNEL_SRC_PATH}
 	install -d $kerneldir
 
 	#
@@ -183,23 +187,18 @@ kernel_do_install() {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
-	# Remove the following binaries which cause strip errors
+	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-	           arch/powerpc/boot/mktree"
+	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
+		   scripts/kconfig/conf.o"
 	for entry in $bin_files; do
 		rm -f $kerneldir/$entry
 	done
 }
 
-PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
-
-kernel_package_preprocess () {
-	rm -rf ${PKGD}/kernel
-}
-
 sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
+	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
 }
 
 kernel_do_configure() {
@@ -247,13 +246,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
-# misc is a package to contain files we need in staging
-FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media"
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
@@ -469,7 +466,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9377ee6..7e3de09 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -381,7 +381,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 ##################################################################
 
 OLDEST_KERNEL = "2.6.16"
-STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
+STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
 
 ##################################################################
 # Specific image creation and rootfs population info.
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 9b46e74..973970d 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
-- 
1.7.10.2



