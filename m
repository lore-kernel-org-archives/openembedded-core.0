Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SjNEV-0004oy-9W
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 06:18:31 +0200
Received: from mail79-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE010.bigfish.com (10.9.40.30) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Jun 2012 03:35:46 +0000
Received: from mail79-tx2 (localhost [127.0.0.1])	by mail79-tx2-R.bigfish.com
	(Postfix) with ESMTP id 0E42844013E	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 03:35:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah)
Received: from mail79-tx2 (localhost.localdomain [127.0.0.1]) by mail79-tx2
	(MessageSwitch) id 1340681744437635_15294;
	Tue, 26 Jun 2012 03:35:44 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.250])	by
	mail79-tx2.bigfish.com (Postfix) with ESMTP id 5EC1B8022F	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 03:35:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Jun 2012 03:35:44 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Mon, 25 Jun 2012 22:37:23 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id q5Q3bKnc026157;
	Mon, 25 Jun 2012 20:37:22 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2012 11:53:16 +0800
Message-ID: <1340682796-11569-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: linux-dtb: add multi-dtb build support
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
X-List-Received-Date: Tue, 26 Jun 2012 04:18:31 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    including following enhancement:
    * support multi-dtb build
    * skip dtb build and install when KERNEL_DEVICETREE is empty
    * print a warning message when specified dts file is not available

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   36 +++++++++++++++++++++++++------
 1 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 9188cee..8aa1458 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -15,13 +15,35 @@ python __anonymous () {
 
 do_install_append() {
     if test -n "${KERNEL_DEVICETREE}"; then
-	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
-	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
-	install -d ${DEPLOYDIR}
-	install -m 0644 devicetree ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
-	cd ${DEPLOYDIR}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            if [ ! -f ${DTS_FILE} ]; then
+                echo "Warning: ${DTS_FILE} is not available!"
+                continue
+            fi
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
+            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+        done
     fi
 }
 
+do_deploy_append() {
+    if test -n "${KERNEL_DEVICETREE}"; then
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            if [ ! -f ${DTS_FILE} ]; then
+                echo "Warning: ${DTS_FILE} is not available!"
+                continue
+            fi
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            install -d ${DEPLOYDIR}
+            install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+            cd ${DEPLOYDIR}
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+            cd -
+        done
+    fi
+}
-- 
1.7.0.4




