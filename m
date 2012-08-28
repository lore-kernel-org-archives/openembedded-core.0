Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FhE-0006Ki-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 08:54:45 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1416465eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/NydDTGd9o7nTWT00n19/wLagyfWF9op5SXxUB4TQmI=;
	b=jAl957vakMsK1s339pDu73uHZwabJuhxehixoAjO+B7rDxzeljEq8hQZwp7w5iJvMj
	KVNH3fe2pTDOxmI+KSHEiFQ+bTkmYdd0CijBmXv6MuTa9QERN+yCYs5mtX2PRcl0oy7V
	LOL1xCBpN0B5kqLaeNvBTcUDXnbkZk0Amnqvr137Ggqab0l0ocd+cFoFouYmlWyGFsWL
	WQ/OPmvbjC/gND+ds/I0Cc8FJj+gvSKO+kM53+R79EZ5KyiloDWdBZy5Ixvl78AZmvFg
	wU1WIiVlw7tJnVSfcYoxXOgMwuBJeg7oohuZsxq786NCne4o5PEZbh2sDwqq+m3SIaIU
	wesg==
Received: by 10.14.221.197 with SMTP id r45mr18380723eep.41.1346136154281;
	Mon, 27 Aug 2012 23:42:34 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z3sm58198799eel.15.2012.08.27.23.42.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:42:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:41:46 +0200
Message-Id: <1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlji1Eo/95/MfjMFgm23u3Kt/sN2XP3wRla4l0j+VtB2asZN8zbR5U57IjQnX/9j/QVM5O5
Cc: Darren Hart <dvhart@linux.intel.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 06:54:46 -0000

From: Darren Hart <dvhart@linux.intel.com>

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
 meta/classes/kernel.bbclass |   25 +++++++++++--------------
 meta/conf/bitbake.conf      |    2 +-
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3ccd753..d79ba9f 100644
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
@@ -191,20 +195,15 @@ kernel_do_install() {
 	# Remove the following binaries which cause strip errors
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
@@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
-PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
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
@@ -475,7 +472,7 @@ python populate_packages_prepend () {
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
 	d.setVar('FILES_' + metapkg, "")
-	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
+	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg' ]
 	for l in module_deps.values():
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 618780c..85ba108 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -376,7 +376,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 ##################################################################
 
 OLDEST_KERNEL = "2.6.16"
-STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/kernel"
+STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
 
 ##################################################################
 # Specific image creation and rootfs population info.
-- 
1.7.7.6



