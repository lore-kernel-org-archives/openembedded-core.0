Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 95E1871633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0KDXF2w029542; Tue, 20 Jan 2015 13:33:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L2cM3oIsczwt; Tue, 20 Jan 2015 13:33:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0KDX3gr029477
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Jan 2015 13:33:14 GMT
Message-ID: <1421760783.1798.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jan 2015 13:33:03 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] kernel/image/depmodwrapper: Fixups for depmod
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
X-List-Received-Date: Tue, 20 Jan 2015 13:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the rpm package backend enabled, running:

bitbake <image>
bitbake virtual/kernel -c clean
bitbake <image> -c rootfs -f

results in an image with incorrect kernel module dependency information.
The problem is that the System.map and kernel-abiversion files are needed
for depmod and after the recent kernel changes, these are no longer in
sstate.

Its reasonable to require the kernel to unpack/build if you're
about to build a module against it. It is not reasonable to require this
just to build a rootfs.

Therefore stash the needed files specifically for depmod.

Also fix some STAGING_KERNEL_DIR references which were incorrect, found
whilst sorting through his change.

This patch also makes the depmod files being missing a fatal error rather than
something the system just ignores silently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07e7f99..22b6970 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -95,7 +95,7 @@ def rootfs_variables(d):
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
                  'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
-                 'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
+                 'COMPRESSIONTYPES']
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 2d43b51..32b8085 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -75,7 +75,7 @@ python split_kernel_module_packages () {
         if not os.path.exists(system_map_file):
             system_map_file = "%s/System.map-%s" % (staging_kernel_dir, kernelver)
             if not os.path.exists(system_map_file):
-                bb.fatal("System.map-%s does not exist in '%s/boot' nor STAGING_KERNEL_DIR '%s'" % (kernelver, dvar, staging_kernel_dir))
+                bb.fatal("System.map-%s does not exist in '%s/boot' nor STAGING_KERNEL_BUILDDIR '%s'" % (kernelver, dvar, staging_kernel_dir))
 
         cmd = "depmod -n -a -b %s -F %s %s" % (dvar, system_map_file, kernelver_stripped)
         f = os.popen(cmd, 'r')
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 805f799..2a16c71 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -231,6 +231,11 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
+
+	# Stash data for depmod
+	install -d ${D}${datadir}/kernel-depmod/
+	echo "${KERNEL_VERSION}" > ${D}${datadir}/kernel-depmod/kernel-abiversion
+	cp System.map ${D}${datadir}/kernel-depmod/System.map-${KERNEL_VERSION}
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
@@ -280,14 +285,21 @@ do_shared_workdir () {
 	fi
 }
 
-# We have an empty sysroot_stage_all to keep the default routine from
-# package.bbclass from expanding the kernel source into the sysroot and
-# colliding with linux-firmware files
+# Only stage the files we need for depmod, not the modules/firmware
 sysroot_stage_all () {
+	sysroot_stage_dir ${D}${datadir}/kernel-depmod ${SYSROOT_DESTDIR}${datadir}/kernel-depmod
 }
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
 
+PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
+
+kernel_package_preprocess () {
+    rm -rf ${PKGD}${datadir}/kernel-depmod
+    rmdir ${PKGD}${datadir}
+    rmdir ${PKGD}${exec_prefix}
+}
+
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index f2891a7..72d32f7 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -209,16 +209,17 @@ class Rootfs(object):
                                   'new', '-v'])
 
     def _generate_kernel_module_deps(self):
-        kernel_abi_ver_file = os.path.join(self.d.getVar('STAGING_KERNEL_BUILDDIR', True),
+        kernel_abi_ver_file = oe.path.join(self.d.getVar('STAGING_DIR_TARGET', True), self.d.getVar('datadir', True), "kernel-depmod",
                                            'kernel-abiversion')
-        if os.path.exists(kernel_abi_ver_file):
-            kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')
-            modules_dir = os.path.join(self.image_rootfs, 'lib', 'modules', kernel_ver)
+        if not os.path.exists(kernel_abi_ver_file):
+            bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
 
-            bb.utils.mkdirhier(modules_dir)
+        kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')
+        modules_dir = os.path.join(self.image_rootfs, 'lib', 'modules', kernel_ver)
 
-            self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs,
-                                  kernel_ver])
+        bb.utils.mkdirhier(modules_dir)
+
+        self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver])
 
     """
     Create devfs:
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 7533809..83a382a 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -19,21 +19,21 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
     echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
     exit 1
 fi
-if [ ! -r ${STAGING_KERNEL_BUILDDIR}/kernel-abiversion ]; then
-    echo "Unable to read: ${STAGING_KERNEL_BUILDDIR}/kernel-abiversion" >&2
+if [ ! -r ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion ]; then
+    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion" >&2
 else
-    kernelabi=\$(cat ${STAGING_KERNEL_BUILDDIR}/kernel-abiversion)
+    kernelabi=\$(cat ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion)
     if [ "\$kernelabi" != "\$4" ]; then
         echo "Error: Kernel version \$4 does not match kernel-abiversion (\$kernelabi)" >&2
         exit 1
     fi
 fi
 
-if [ ! -r ${STAGING_KERNEL_BUILDDIR}/System.map-\$4 ]; then
-    echo "Unable to read: ${STAGING_KERNEL_BUILDDIR}/System.map-\$4" >&2
+if [ ! -r ${STAGING_DIR_TARHET}${datadir}/kernel-depmod/System.map-\$4 ]; then
+    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" >&2
     exec env depmod "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod "\$1" "\$2" "\$3" -F "${STAGING_KERNEL_BUILDDIR}/System.map-\$4" "\$4"
+    exec env depmod "\$1" "\$2" "\$3" -F "${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index 4d2bec4..758908b 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -21,7 +21,7 @@ EXTRA_OEMAKE = ""
 # support.  Note that staprun expects it in the systemtap/runtime directory,
 # not in /lib/modules.
 do_compile() {
-	if grep -q "CONFIG_UTRACE=y" ${STAGING_KERNEL_DIR}/.config
+	if grep -q "CONFIG_UTRACE=y" ${STAGING_KERNEL_BUILDDIR}/.config
 	then
 		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
 		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \



