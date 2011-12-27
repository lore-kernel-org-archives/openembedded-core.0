Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RfO6A-0002X2-6N
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 04:53:11 +0100
Received: from mail179-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Tue, 27 Dec 2011 03:30:30 +0000
Received: from mail179-ch1 (localhost [127.0.0.1])	by
	mail179-ch1-R.bigfish.com (Postfix) with ESMTP id 4532A26007B	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 03:30:50 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail179-ch1 (localhost.localdomain [127.0.0.1]) by mail179-ch1
	(MessageSwitch) id 1324956647936667_7568;
	Tue, 27 Dec 2011 03:30:47 +0000 (UTC)
Received: from CH1EHSMHS030.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.248])	by mail179-ch1.bigfish.com (Postfix) with ESMTP id
	D8BEB180043	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 03:30:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS030.bigfish.com
	(10.43.70.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 27 Dec 2011 03:30:27 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 26 Dec 2011 21:30:45 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBR3UgBd024920;
	Mon, 26 Dec 2011 21:30:43 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Dec 2011 11:34:20 +0800
Message-ID: <1324956860-6782-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 oe-core] linux-dtb: add multi-dtb build support and keep dtb in deploy cache package
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
X-List-Received-Date: Tue, 27 Dec 2011 03:53:11 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    1. add multiple dtb build support, define KERNEL_DEVICETREE as following:
           KERNEL_DEVICETREE= "${S}/arch/powerpc/boot/dts/p3041ds.dts \
                               ${S}/arch/powerpc/boot/dts/p3041ds-usdpaa.dts"
    2. keep dtb files are included in the deploy cache package

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   33 ++++++++++++++++++++++++------
 1 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7ec7584..de83e78 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -15,13 +15,32 @@ python __anonymous () {
 
 do_install_append() {
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
+            install -d ${DEPLOY_DIR_IMAGE}
+            install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb
+            cd ${DEPLOY_DIR_IMAGE}
+            rm -f ${DTB_SYMLINK_NAME}.dtb
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+            cd -
+        done
     fi
 }
 
+do_deploy_append() {
+    if test -n "${KERNEL_DEVICETREE}"; then
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            install -d ${DEPLOYDIR}
+            install -m 0644 ${DEPLOY_DIR_IMAGE}/${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
+            cd ${DEPLOYDIR}
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME=}.dtb
+        done
+    fi
+}
-- 
1.7.0.4




