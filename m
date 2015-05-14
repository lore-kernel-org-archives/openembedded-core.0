Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9F75D73F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 12:31:35 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lnXKx56S2z3hhl7;
	Thu, 14 May 2015 14:31:33 +0200 (CEST)
X-Auth-Info: pQUbIhyu/ZfCpSq89Oo1RMKFQmTxGKSqbIq91iupWqs=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lnXKx1sBrzvhTZ;
	Thu, 14 May 2015 14:31:33 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 14:31:06 +0200
Message-Id: <1431606674-5173-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431606674-5173-1-git-send-email-marex@denx.de>
References: <1431606674-5173-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/9] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 14 May 2015 12:31:36 -0000

Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
set it in the anonymous python function. This also allows us to handle
image types which are not supported directly by kernel, but require some
other kernel target to be built. This is the case for example with the
fitImage, which is the uImage successor.

There is no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 125ed88..75bfd76 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -17,12 +17,16 @@ INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
+    import re
+
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'uImage':
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
+    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.gz$', '', kerneltype))
+
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
@@ -104,8 +108,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
 
-KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
-
 copy_initramfs() {
 	echo "Copying initramfs into ./usr ..."
 	# In case the directory is not created yet from the first pass compile:
-- 
2.1.4


