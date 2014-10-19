Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8540E65C78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:16:02 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLW646G80z3hjNK;
	Sun, 19 Oct 2014 21:15:56 +0200 (CEST)
X-Auth-Info: jFm2m25Y/0swamia77F7h0PbCJckFzRAsboO+UiqNFs=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3jLW643LvFzvdWR;
	Sun, 19 Oct 2014 21:15:56 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Oct 2014 21:15:44 +0200
Message-Id: <1413746147-7120-5-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1413746147-7120-1-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 4/7] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Sun, 19 Oct 2014 19:16:03 -0000

Pull the uImage image format generation from kernel.bbclass into
a separate kernel-uimage.bbclass. The recipes which now need to
generate an uImage will have to inherit kernel-uimage instead of
kernel class.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel-uimage.bbclass | 44 +++++++++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass        | 45 --------------------------------------
 2 files changed, 44 insertions(+), 45 deletions(-)
 create mode 100644 meta/classes/kernel-uimage.bbclass

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
new file mode 100644
index 0000000..f51321b
--- /dev/null
+++ b/meta/classes/kernel-uimage.bbclass
@@ -0,0 +1,44 @@
+inherit kernel
+
+DEPENDS += " u-boot-mkimage-native "
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
index ec4d930..f3ba19c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -15,10 +15,6 @@ python __anonymous () {
     import re
 
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
-    if kerneltype == 'uImage':
-        depends = d.getVar("DEPENDS", True)
-        depends = "%s u-boot-mkimage-native" % depends
-        d.setVar("DEPENDS", depends)
 
     d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
 
@@ -448,47 +444,6 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
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
2.1.1


