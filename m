Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD2570A3A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 15:26:13 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hTYGj2g42z3hhxF;
	Thu,  7 Aug 2014 17:17:33 +0200 (CEST)
X-Auth-Info: PdHrcRfeHK8th6MxB0I8I2GjUdxUbOZVfdjtNdquLgg=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3hTYGg141lz7S6ST; 
	Thu,  7 Aug 2014 17:17:30 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 17:17:10 +0200
Message-Id: <1407424632-32649-4-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1407424632-32649-1-git-send-email-marex@denx.de>
References: <1407424632-32649-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 3/5] Yocto: kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 07 Aug 2014 15:26:14 -0000

Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and instead
set it in the anonymous python function. This also allows us to handle
image types which are not supported directly by kernel, but require some
other kernel target to be built. This is the case for example with the
fitImage, which is the uImage successor.

There is no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 62e3a4b..b23e2e0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -18,6 +18,8 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
 
+    d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
+
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
@@ -79,8 +81,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
 # they are staged.
 KERNEL_SRC_PATH = "/usr/src/kernel"
 
-KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
-
 copy_initramfs() {
 	echo "Copying initramfs into ./usr ..."
 	# In case the directory is not created yet from the first pass compile:
-- 
2.0.1


