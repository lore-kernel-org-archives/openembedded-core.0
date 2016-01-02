Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id ED9666FF69
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jan 2016 23:53:08 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id CE53E1814E1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jan 2016 00:53:07 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jan 2016 00:52:59 +0100
Message-Id: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH v2 1/3] kernel: allow kernel module and firmware installation with ${nonarch_base_libdir} != "/lib"
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
X-List-Received-Date: Sat, 02 Jan 2016 23:53:10 -0000

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
v2:
* also adjust comments
* use ${nonarch_base_libdir} instead of ${base_libdir}, modules and
  firmware are always expected under /lib, while ppc64 has ${base_libdir}
  = "/lib64".


 meta/classes/kernel-module-split.bbclass |  6 +++---
 meta/classes/kernel.bbclass              | 25 ++++++++++++++++++-------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e1a70e6..dd31587 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -108,8 +108,8 @@ python split_kernel_module_packages () {
     def get_dependencies(file, pattern, format):
         # file no longer includes PKGD
         file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+        # instead is prefixed with ${nonarch_base_libdir}/modules/${KERNEL_VERSION}
+        file = file.replace("%s/modules/%s/" % (d.getVar('nonarch_base_libdir', True), d.getVar('KERNEL_VERSION', True)), '', 1)
 
         if file in module_deps:
             dependencies = []
@@ -186,7 +186,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='%s/modules' % d.getVar('nonarch_base_libdir', True), file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..3794ee0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -242,6 +242,11 @@ kernel_do_install() {
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
 		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
+
+		if [ "${nonarch_base_libdir}" != "/lib" ]; then
+			install -d "${D}${nonarch_base_libdir}"
+			mv "${D}/lib/modules" "${D}${nonarch_base_libdir}"
+		fi
 	else
 		bbnote "no modules to install"
 	fi
@@ -258,6 +263,12 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
+
+	if [ "${nonarch_base_libdir}" != "/lib" ]; then
+		install -d "${D}${nonarch_base_libdir}"
+		mv "${D}/lib/firmware" "${D}${nonarch_base_libdir}"
+		rmdir --ignore-fail-on-non-empty "${D}/lib"
+	fi
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
@@ -364,9 +375,9 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_kernel-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
@@ -384,8 +395,8 @@ ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
 pkg_postinst_kernel-base () {
-	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
-		mkdir -p $D/lib/modules/${KERNEL_VERSION}
+	if [ ! -e "$D${nonarch_base_libdir}/modules/${KERNEL_VERSION}" ]; then
+		mkdir -p $D${nonarch_base_libdir}/modules/${KERNEL_VERSION}
 	fi
 	if [ -n "$D" ]; then
 		depmodwrapper -a -b $D ${KERNEL_VERSION}
@@ -405,7 +416,7 @@ pkg_postrm_kernel-image () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='%s/firmware' % d.getVar('nonarch_base_libdir', True), file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 do_strip() {
@@ -469,8 +480,8 @@ MODULE_TARBALL_DEPLOY ?= "1"
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		mkdir -p ${D}/lib
-		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		mkdir -p ${D}${nonarch_base_libdir}
+		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} ${@d.getVar('nonarch_base_libdir', True)[1:]}
 		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-- 
2.6.4


