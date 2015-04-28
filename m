Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id E4E6C73D91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:43 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZV70SCz3hj5n;
	Tue, 28 Apr 2015 18:38:42 +0200 (CEST)
X-Auth-Info: INckGUEBM0va0JGskv6IY3Ac5ZM0Ovnkm368p7vdGYQ=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZV40ZmzvhTq;
	Tue, 28 Apr 2015 18:38:42 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:33 +0200
Message-Id: <1430239116-7671-6-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 5/8] kernel: Separate out uboot_prep_kimage
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

Separate the function which prepares the kernel for packing into
uImage into separate class, so this function can be reused by the
fitImage class.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-uboot.bbclass  | 21 +++++++++++++++++++++
 meta/classes/kernel-uimage.bbclass | 24 ++----------------------
 2 files changed, 23 insertions(+), 22 deletions(-)
 create mode 100644 meta/classes/kernel-uboot.bbclass

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
new file mode 100644
index 0000000..8ab30b8
--- /dev/null
+++ b/meta/classes/kernel-uboot.bbclass
@@ -0,0 +1,21 @@
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
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 8a3efc6..ce8f96f 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,3 +1,5 @@
+inherit kernel-uboot
+
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'uImage':
@@ -6,28 +8,6 @@ python __anonymous () {
         d.setVar("DEPENDS", depends)
 }
 
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
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
-- 
2.1.4


