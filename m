Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 472C173D9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:46 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZV3Twwz3hkSM;
	Tue, 28 Apr 2015 18:38:42 +0200 (CEST)
X-Auth-Info: INckGUEBM0va0JGskv6IY3Ac5ZM0Ovnkm368p7vdGYQ=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZV0Z3ZzvhTm;
	Tue, 28 Apr 2015 18:38:42 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:32 +0200
Message-Id: <1430239116-7671-5-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 4/8] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Tue, 28 Apr 2015 16:38:47 -0000

Pull the uImage image format generation from kernel.bbclass into
a separate kernel-uimage.bbclass. The recipes which now need to
generate an uImage will have to inherit kernel-uimage instead of
kernel class.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-uimage.bbclass | 48 +++++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass        | 55 +++++++-------------------------------
 2 files changed, 58 insertions(+), 45 deletions(-)
 create mode 100644 meta/classes/kernel-uimage.bbclass

NOTE: The "inherit kernel-uimage" in kernel.bbclass should be changed to
      something like "inherit kernel-${@d.getVar("KERNEL_IMAGETYPE", True).lower()}"
      but the problem is that I only want to perform the inheritance for uimage
      and fitimage, the other image types don't need to inherit any additional
      special stuff.
      Paul suggested I can do "inherit <empty here>". This would at least let me
      implement a python function which returns either "kernel-uimage",
      "kernel-fitimage" or "" and based on that, I could inherit the particular
      image type specifics into kernel.bbclass.
      What I don't know how to implement well is this function which returns
      those three strings based on the KERNEL_IMAGETYPE. What I would like to
      avoid is encoding those strings explicitly into the function, since that
      would force each new kernel image format to also edit this function in
      kernel.bbclass . Apparently, checking whether class exists and inheriting
      it only if it does is also not a simple task.
      
      The conditional inheritance here would also allow me to remove all those
      if [ $KERNEL_IMAGETYPE = "uImage" ] checks from kernel-uimage.bbclass and
      kernel-fitimage.bbclass, since those classes would be inherited only if
      the matching imagetype would be selected.

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
new file mode 100644
index 0000000..8a3efc6
--- /dev/null
+++ b/meta/classes/kernel-uimage.bbclass
@@ -0,0 +1,48 @@
+python __anonymous () {
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
+    if kerneltype == 'uImage':
+        depends = d.getVar("DEPENDS", True)
+        depends = "%s u-boot-mkimage-native" % depends
+        d.setVar("DEPENDS", depends)
+}
+
+uboot_prep_kimage() {
+	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
+		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
+		linux_suffix=""
+		linux_comp="none"
+	else
+		vmlinux_path="vmlinux"
+		linux_suffix=".gz"
+		linux_comp="gzip"
+	fi
+
+	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+
+	if [ "${linux_comp}" != "none" ] ; then
+		rm -f linux.bin
+		gzip -9 linux.bin
+		mv -f "linux.bin${linux_suffix}" linux.bin
+	fi
+
+	echo "${linux_comp}"
+}
+
+do_uboot_mkimage() {
+	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
+		if test "x${KEEPUIMAGE}" != "xyes" ; then
+			uboot_prep_kimage
+
+			ENTRYPOINT=${UBOOT_ENTRYPOINT}
+			if test -n "${UBOOT_ENTRYSYMBOL}"; then
+				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			fi
+
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+			rm -f linux.bin
+		fi
+	fi
+}
+
+addtask uboot_mkimage before do_install after do_compile
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2895e5e..9723be2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -20,10 +20,6 @@ python __anonymous () {
     import re
 
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'uImage':
-        depends = d.getVar("DEPENDS", True)
-        depends = "%s u-boot-mkimage-native" % depends
-        d.setVar("DEPENDS", depends)
 
     d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
 
@@ -40,6 +36,16 @@ python __anonymous () {
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
+# Here we pull in all various kernel image types which we support.
+#
+# In case you're wondering why kernel.bbclass inherits the other image
+# types instead of the other way around, the reason for that is to
+# maintain compatibility with various currently existing meta-layers.
+# By pulling in the various kernel image types here, we retain the
+# original behavior of kernel.bbclass, so no meta-layers should get
+# broken.
+inherit kernel-uimage
+
 # Old style kernels may set ${S} = ${WORKDIR}/git for example
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
 # create the symlink in advance as the git fetcher can't cope with
@@ -432,47 +438,6 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
-uboot_prep_kimage() {
-	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
-		linux_suffix=""
-		linux_comp="none"
-	else
-		vmlinux_path="vmlinux"
-		linux_suffix=".gz"
-		linux_comp="gzip"
-	fi
-
-	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-
-	if [ "${linux_comp}" != "none" ] ; then
-		rm -f linux.bin
-		gzip -9 linux.bin
-		mv -f "linux.bin${linux_suffix}" linux.bin
-	fi
-
-	echo "${linux_comp}"
-}
-
-do_uboot_mkimage() {
-	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
-		if test "x${KEEPUIMAGE}" != "xyes" ; then
-			uboot_prep_kimage
-
-			ENTRYPOINT=${UBOOT_ENTRYPOINT}
-			if test -n "${UBOOT_ENTRYSYMBOL}"; then
-				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-			fi
-
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
-			rm -f linux.bin
-		fi
-	fi
-}
-
-addtask uboot_mkimage before do_install after do_compile
-
 kernel_do_deploy() {
 	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-- 
2.1.4


