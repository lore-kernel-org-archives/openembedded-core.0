Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpMv-0003Ps-5P
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:33:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2012 21:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186844008"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2012 21:22:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 21:20:41 -0700
Message-Id: <a18f7d70be0fd3581d0a696ff9886f5572a37867.1341000751.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1341000751.git.dvhart@linux.intel.com>
References: <cover.1341000751.git.dvhart@linux.intel.com>
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
X-List-Received-Date: Sat, 30 Jun 2012 04:33:13 -0000

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

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel.bbclass |   15 +++++++--------
 meta/conf/bitbake.conf      |    2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 31e633b..27e0033 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -130,7 +130,7 @@ kernel_do_install() {
 	# Support for external module building - create a minimal copy of the
 	# kernel source tree.
 	#
-	kerneldir=${D}/kernel
+	kerneldir=${D}/usr/src/kernel
 	install -d $kerneldir
 
 	#
@@ -183,10 +183,11 @@ kernel_do_install() {
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
@@ -247,13 +248,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-misc"
+PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
 FILES = ""
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* /usr/src/kernel"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
-# misc is a package to contain files we need in staging
-FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel/drivers/media"
 RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
@@ -469,7 +468,7 @@ python populate_packages_prepend () {
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
-- 
1.7.10.2



