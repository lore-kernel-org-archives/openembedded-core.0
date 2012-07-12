Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SpFwA-0006EZ-Kq
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 11:43:54 +0200
Received: from mail6-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jul 2012 09:17:32 +0000
Received: from mail6-ch1 (localhost [127.0.0.1])	by mail6-ch1-R.bigfish.com
	(Postfix) with ESMTP id D186F1E00D6	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 09:17:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail6-ch1 (localhost.localdomain [127.0.0.1]) by mail6-ch1
	(MessageSwitch) id 1342084651175435_24394;
	Thu, 12 Jul 2012 09:17:31 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail6-ch1.bigfish.com (Postfix) with ESMTP id
	2958114022D for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 09:17:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jul 2012 09:17:29 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 12 Jul 2012 04:17:29 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6C9HSrX015572; Thu, 12 Jul 2012 02:17:28 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 04:17:26 -0500
Message-ID: <1342084646-23822-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1342084646-23822-1-git-send-email-b28495@freescale.com>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: [PATCH] linux-dtb.inc: update dtb name to keep it same in D and DEPLOYDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 09:43:54 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Device tree binary is named as "devicetree-*" in ${D},
"${KERNEL_IMAGETYPE}-*" in ${DEPLOYDIR}. Keep them the same.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 8aa1458..3dd4d41 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,5 +1,5 @@
 # Support for device tree generation
-FILES_kernel-devicetree = "/boot/devicetree*"
+FILES_kernel-devicetree = "/boot/*.dtb"
 KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
 
 python __anonymous () {
@@ -10,7 +10,7 @@ python __anonymous () {
 	depends = d.getVar("DEPENDS", True)
 	d.setVar("DEPENDS", "%s dtc-native" % depends)
 	packages = d.getVar("PACKAGES", True)
-	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
+	d.setVar("PACKAGES", "kernel-devicetree %s" % packages)
 }
 
 do_install_append() {
@@ -24,7 +24,10 @@ do_install_append() {
             DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
             DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
             dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/${DTB_NAME}.dtb
+            cd ${D}/boot/
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+            cd -
         done
     fi
 }
-- 
1.7.3.4




