Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 57D2560601
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 19:15:56 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jLW631rbzz3hjZY;
	Sun, 19 Oct 2014 21:15:55 +0200 (CEST)
X-Auth-Info: doeIrmtDKaigLNi/nuOzQ5a0V2f8kzRjHrKqO7FI650=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3jLW625LTfzvdWV;
	Sun, 19 Oct 2014 21:15:54 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Oct 2014 21:15:41 +0200
Message-Id: <1413746147-7120-2-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1413746147-7120-1-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Sun, 19 Oct 2014 19:16:01 -0000

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
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f300fa3..762d3df 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -12,12 +12,16 @@ INITRAMFS_TASK ?= ""
 INITRAMFS_IMAGE_BUNDLE ?= ""
 
 python __anonymous () {
+    import re
+
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'uImage':
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
+    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
+
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
@@ -79,8 +83,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
 
-KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
-
 copy_initramfs() {
 	echo "Copying initramfs into ./usr ..."
 	# In case the directory is not created yet from the first pass compile:
-- 
2.1.1


