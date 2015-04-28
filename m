Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7E06373D9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 16:38:45 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbpZX3N5Bz3hkSY;
	Tue, 28 Apr 2015 18:38:44 +0200 (CEST)
X-Auth-Info: KqxfX84qcJ78IUyes/QYC0Qc7PlDYbdeffnGbvEhDy0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3lbpZX0KGZzvhV2;
	Tue, 28 Apr 2015 18:38:43 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 18:38:36 +0200
Message-Id: <1430239116-7671-9-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430239116-7671-1-git-send-email-marex@denx.de>
References: <1430239116-7671-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 8/8] kernel: Build uImage only when really needed
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

Build the uImage file using the kernel build system only when
it is really required, which is only in case KEEPUIMAGE == yes.
Otherwise, just build zImage, since the Yocto build system will
handle the uImage generation for us.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-uimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index ce8f96f..acde9ae 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -6,6 +6,14 @@ python __anonymous () {
         depends = d.getVar("DEPENDS", True)
         depends = "%s u-boot-mkimage-native" % depends
         d.setVar("DEPENDS", depends)
+
+	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+	# to kernel.bbclass . We override the variable here, since we need
+	# to build uImage using the kernel build system if and only if
+	# KEEPUIMAGE != yes. Otherwise, we pack compressed vmlinux into
+	# the uImage .
+	if d.getVar("KEEPUIMAGE", True) == 'yes':
+            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
 }
 
 do_uboot_mkimage() {
-- 
2.1.4


