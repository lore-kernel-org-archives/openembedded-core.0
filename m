Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 834FC60034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0TEZMtS021421; Thu, 29 Jan 2015 14:35:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IQga18cz7DXP; Thu, 29 Jan 2015 14:35:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0TEZ8K8021417
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Jan 2015 14:35:19 GMT
Message-ID: <1422542108.5312.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jan 2015 14:35:08 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] kernel: Fix depmod for multilib
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
X-List-Received-Date: Thu, 29 Jan 2015 14:35:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Using populate_sysroot for this data was a nice idea but flawed as it
doesn't work in multilib builds. Instead we can use PKGDATA_DIR since
this is consistent over multilib builds. It also turns out to be
slightly neater code too. Hopefully this resolves the problem once and
for all.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 29498b4..125ed88 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -231,16 +231,20 @@ kernel_do_install() {
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
-
-	# Stash data for depmod
-	install -d ${D}${datadir}/kernel-depmod/
-	echo "${KERNEL_VERSION}" > ${D}${datadir}/kernel-depmod/kernel-abiversion
-	cp System.map ${D}${datadir}/kernel-depmod/System.map-${KERNEL_VERSION}
 }
 do_install[prefuncs] += "package_get_auto_pr"
 
 addtask shared_workdir after do_compile before do_install
 
+emit_depmod_pkgdata() {
+	# Stash data for depmod
+	install -d ${PKGDESTWORK}/kernel-depmod/
+	echo "${KERNEL_VERSION}" > ${PKGDESTWORK}/kernel-depmod/kernel-abiversion
+	cp System.map ${PKGDESTWORK}/kernel-depmod/System.map-${KERNEL_VERSION}
+}
+
+PACKAGEFUNCS += "emit_depmod_pkgdata"
+
 do_shared_workdir () {
 	cd ${B}
 
@@ -285,21 +289,13 @@ do_shared_workdir () {
 	fi
 }
 
-# Only stage the files we need for depmod, not the modules/firmware
+# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
 sysroot_stage_all () {
-	sysroot_stage_dir ${D}${datadir}/kernel-depmod ${SYSROOT_DESTDIR}${datadir}/kernel-depmod
+	:
 }
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
 
-PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
-
-kernel_package_preprocess () {
-    rm -rf ${PKGD}${datadir}/kernel-depmod
-    rmdir ${PKGD}${datadir}
-    rmdir ${PKGD}${exec_prefix}
-}
-
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0665e0c..5ab81a1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -211,7 +211,7 @@ class Rootfs(object):
                                   'new', '-v'])
 
     def _generate_kernel_module_deps(self):
-        kernel_abi_ver_file = oe.path.join(self.d.getVar('STAGING_DIR_TARGET', True), self.d.getVar('datadir', True), "kernel-depmod",
+        kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR', True), "kernel-depmod",
                                            'kernel-abiversion')
         if not os.path.exists(kernel_abi_ver_file):
             bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 83a382a..44b7650 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -19,21 +19,21 @@ if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
     echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
     exit 1
 fi
-if [ ! -r ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion ]; then
-    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion" >&2
+if [ ! -r ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion ]; then
+    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion" >&2
 else
-    kernelabi=\$(cat ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/kernel-abiversion)
+    kernelabi=\$(cat ${PKGDATA_DIR}/kernel-depmod/kernel-abiversion)
     if [ "\$kernelabi" != "\$4" ]; then
         echo "Error: Kernel version \$4 does not match kernel-abiversion (\$kernelabi)" >&2
         exit 1
     fi
 fi
 
-if [ ! -r ${STAGING_DIR_TARHET}${datadir}/kernel-depmod/System.map-\$4 ]; then
-    echo "Unable to read: ${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" >&2
+if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ]; then
+    echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
     exec env depmod "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod "\$1" "\$2" "\$3" -F "${STAGING_DIR_TARGET}${datadir}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper



