Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 545A373180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 18:21:29 +0000 (UTC)
Received: from avalon.neoraider.dn42 (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 31A80180FDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:12:04 +0100 (CET)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 19:11:58 +0100
Message-Id: <c69d29cd0ed3171613c5b30894a33e24ef29e20b.1450288828.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
In-Reply-To: <cover.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
Subject: [PATCH 2/4] kernel: allow kernel module and firmware installation with ${base_libdir} != "/lib"
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
X-List-Received-Date: Wed, 16 Dec 2015 18:21:31 -0000

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 meta/classes/kernel-module-split.bbclass |  4 ++--
 meta/classes/kernel.bbclass              | 25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e1a70e6..172b8df 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -109,7 +109,7 @@ python split_kernel_module_packages () {
         # file no longer includes PKGD
         file = file.replace(d.getVar('PKGD', True) or '', '', 1)
         # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+        file = file.replace("%s/modules/%s/" % (d.getVar('base_libdir', True), d.getVar('KERNEL_VERSION', True)), '', 1)
 
         if file in module_deps:
             dependencies = []
@@ -186,7 +186,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules', True)
     postrm = d.getVar('pkg_postrm_modules', True)
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    modules = do_split_packages(d, root='%s/modules' % d.getVar('base_libdir', True), file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..8fc1d5d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -242,6 +242,11 @@ kernel_do_install() {
 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 		# If the kernel/ directory is empty remove it to prevent QA issues
 		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
+
+		if [ "${base_libdir}" != "/lib" ]; then
+			install -d "${D}${base_libdir}"
+			mv "${D}/lib/modules" "${D}${base_libdir}"
+		fi
 	else
 		bbnote "no modules to install"
 	fi
@@ -258,6 +263,12 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
+
+	if [ "${base_libdir}" != "/lib" ]; then
+		install -d "${D}${base_libdir}"
+		mv "${D}/lib/firmware" "${D}${base_libdir}"
+		rmdir --ignore-fail-on-non-empty "${D}/lib"
+	fi
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
@@ -364,9 +375,9 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERISON}
 PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
 FILES_${PN} = ""
-FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_kernel-base = "${base_libdir}/modules/${KERNEL_VERSION}/modules.order ${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
-FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
+FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux = "/boot/vmlinux*"
 FILES_kernel-modules = ""
 RDEPENDS_kernel = "kernel-base"
@@ -384,8 +395,8 @@ ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
 pkg_postinst_kernel-base () {
-	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
-		mkdir -p $D/lib/modules/${KERNEL_VERSION}
+	if [ ! -e "$D${base_libdir}/modules/${KERNEL_VERSION}" ]; then
+		mkdir -p $D${base_libdir}/modules/${KERNEL_VERSION}
 	fi
 	if [ -n "$D" ]; then
 		depmodwrapper -a -b $D ${KERNEL_VERSION}
@@ -405,7 +416,7 @@ pkg_postrm_kernel-image () {
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
+    do_split_packages(d, root='%s/firmware' % d.getVar('base_libdir', True), file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
 do_strip() {
@@ -469,8 +480,8 @@ MODULE_TARBALL_DEPLOY ?= "1"
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		mkdir -p ${D}/lib
-		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} lib
+		mkdir -p ${D}${base_libdir}
+		tar -cvzf ${DEPLOYDIR}/${MODULE_TARBALL_BASE_NAME} -C ${D} ${@d.getVar('base_libdir', True)[1:]}
 		ln -sf ${MODULE_TARBALL_BASE_NAME} ${DEPLOYDIR}/${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-- 
2.6.4


