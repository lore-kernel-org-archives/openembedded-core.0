Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A10A66007A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 11:57:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 04 Jan 2017 03:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="1079063585"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga001.jf.intel.com with ESMTP; 04 Jan 2017 03:57:40 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 13:58:23 +0200
Message-Id: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] kernel: Modify kernel modules installation path.
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
X-List-Received-Date: Wed, 04 Jan 2017 11:57:44 -0000

Use ${base_libdir}/modules inplace of /lib/modules for kernel modules installation path.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/kernel-module-split.bbclass |  2 +-
 meta/classes/kernel.bbclass              | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index efe1b42..0e4e110 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -127,7 +127,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
+    modules = do_split_packages(d, root='${base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3630042..74517e8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -296,11 +296,11 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
-		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
-		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
+		oe_runmake DEPMOD=echo MODLIB=${D}${base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${base_libdir}/firmware modules_install
+		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
+		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
+		rmdir --ignore-fail-on-non-empty "${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel"
 	else
 		bbnote "no modules to install"
 	fi
@@ -478,7 +478,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_kernel-base = "${base_libdir}/modules/${KERNEL_VERSION}/modules.order ${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
@@ -511,7 +511,7 @@ pkg_postinst_kernel-base () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='${base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
2.7.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


