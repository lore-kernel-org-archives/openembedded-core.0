Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A7D6672A78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:43 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZW3Hbfz3hkSN;
	Tue, 28 Apr 2015 18:38:43 +0200 (CEST)
X-Auth-Info: INckGUEBM0va0JGskv6IY3Ac5ZM0Ovnkm368p7vdGYQ=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZW0KY6zvhTt;
	Tue, 28 Apr 2015 18:38:42 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:34 +0200
Message-Id: <1430239116-7671-7-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 6/8] kernel: Build DTBs early
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

Pull out the compilation of the DTB blobs right after the kernel's
own do_compile function finishes. This makes them available just in
time for the kernel image construction functions.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 6b8f1a5..ee3a5e1 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -5,6 +5,18 @@ python __anonymous () {
     d.appendVar("PACKAGES", " kernel-devicetree")
 }
 
+do_compile_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			oe_runmake ${DTB}
+		done
+	fi
+}
+
 do_install_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTB in ${KERNEL_DEVICETREE}; do
@@ -13,10 +25,8 @@ do_install_append() {
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
 			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-			oe_runmake ${DTB}
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
 			fi
-- 
2.1.4


