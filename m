Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rk6L0-0001jD-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 04:56:01 +0100
Received: from mail178-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jan 2012 03:33:21 +0000
Received: from mail178-ch1 (localhost [127.0.0.1])	by
	mail178-ch1-R.bigfish.com (Postfix) with ESMTP id 705C43E02E7	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 03:33:20 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail178-ch1 (localhost.localdomain [127.0.0.1]) by mail178-ch1
	(MessageSwitch) id 1326079998354149_10686;
	Mon,  9 Jan 2012 03:33:18 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail178-ch1.bigfish.com (Postfix) with ESMTP id
	52BA93A003F	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 03:33:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jan 2012 03:33:18 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Sun, 8 Jan 2012 21:33:18 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id q093XFjt026158;
	Sun, 8 Jan 2012 21:33:16 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2012 11:37:54 +0800
Message-ID: <1326080274-1998-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH oe-core v6] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Mon, 09 Jan 2012 03:56:01 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   24 +++++++++++++++---------
 1 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7ec7584..fc29d14 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -13,15 +13,21 @@ python __anonymous () {
 	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
 }
 
-do_install_append() {
+kernel_do_deploy_append() {
     if test -n "${KERNEL_DEVICETREE}"; then
-	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
-	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
-	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
-	cd ${DEPLOY_DIR_IMAGE}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${DTS_FILE}
+            install -m 0644 devicetree ${D}/boot/devicetree-${DTS_BASE_NAME}-${KERNEL_VERSION}
+
+            install -d ${DEPLOYDIR}
+            install -m 0644 devicetree ${DEPLOYDIR}/${DTB_NAME}.dtb
+            rm -f devicetree
+            cd ${DEPLOYDIR}
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+            cd -
+        done
     fi
 }
-
-- 
1.7.0.4




