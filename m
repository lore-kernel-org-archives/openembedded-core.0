Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1258D7408F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:31:37 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lnXKy4vd2z3hjR3;
	Thu, 14 May 2015 14:31:34 +0200 (CEST)
X-Auth-Info: aBnbpbPDvYwYHZ2OG6MZ3OXqZ0GHMh0GR/z7ehAUdps=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lnXKy22jHzvhTg;
	Thu, 14 May 2015 14:31:34 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 14:31:08 +0200
Message-Id: <1431606674-5173-4-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431606674-5173-1-git-send-email-marex@denx.de>
References: <1431606674-5173-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 3/9] kernel: Pull out the linux.bin generation
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
X-List-Received-Date: Thu, 14 May 2015 12:31:37 -0000

Pull the generation of linux.bin image, which is then packed into uImage,
into a separate function. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e85e73b..2895e5e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -432,26 +432,32 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
 MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
 MODULE_TARBALL_DEPLOY ?= "1"
 
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
 do_uboot_mkimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then 
 		if test "x${KEEPUIMAGE}" != "xyes" ; then
-			if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
-				vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
-				linux_suffix=""
-				linux_comp="none"
-			else
-				vmlinux_path="vmlinux"
-				linux_suffix=".gz"
-				linux_comp="gzip"
-			fi
-
-			${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
-
-			if [ "${linux_comp}" != "none" ] ; then
-				rm -f linux.bin
-				gzip -9 linux.bin
-				mv -f "linux.bin${linux_suffix}" linux.bin
-			fi
+			uboot_prep_kimage
 
 			ENTRYPOINT=${UBOOT_ENTRYPOINT}
 			if test -n "${UBOOT_ENTRYSYMBOL}"; then
-- 
2.1.4


