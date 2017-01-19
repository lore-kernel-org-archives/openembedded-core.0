Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE9C871D9D
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 21:14:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0JLEhVP001430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 13:14:43 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 13:14:43 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2017 13:14:41 -0800
Message-ID: <20170119211441.126457-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170119211441.126457-1-jason.wessel@windriver.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Thu, 19 Jan 2017 21:14:43 -0000
Content-Type: text/plain

This reverts commit 0ccb2efe9837e2915c093341a662dffc1df00866.

The OVS fails to function and the kernel modules cannot be found by
any of the kernel tools such as depmod because they are installed
into the wrong directory in multilib 64bit/32bit bulids.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/kernel-module-split.bbclass |  2 +-
 meta/classes/kernel.bbclass              | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 0e4e110f0c..efe1b42656 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -127,7 +127,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='${base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 74517e8d92..3630042dbd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -296,11 +296,11 @@ kernel_do_install() {
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake DEPMOD=echo MODLIB=${D}${base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${base_libdir}/firmware modules_install
-		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
-		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"
+		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
+		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
+		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel"
+		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
 	else
 		bbnote "no modules to install"
 	fi
@@ -478,7 +478,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "${base_libdir}/modules/${KERNEL_VERSION}/modules.order ${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = ""
 FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
@@ -511,7 +511,7 @@ pkg_postinst_kernel-base () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='${base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
2.11.0


