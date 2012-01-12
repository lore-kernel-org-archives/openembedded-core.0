Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlOLG-0003Qi-Nx
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 18:21:35 +0100
Received: from mail116-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jan 2012 17:14:03 +0000
Received: from mail116-tx2 (localhost [127.0.0.1])	by
	mail116-tx2-R.bigfish.com (Postfix) with ESMTP id E95A3700544	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:14:02 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dhc1ahc1bh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail116-tx2 (localhost.localdomain [127.0.0.1]) by mail116-tx2
	(MessageSwitch) id 1326388419333243_7070;
	Thu, 12 Jan 2012 17:13:39 +0000 (UTC)
Received: from TX2EHSMHS044.bigfish.com (unknown [10.9.14.247])	by
	mail116-tx2.bigfish.com (Postfix) with ESMTP id 4A068100046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:13:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS044.bigfish.com
	(10.9.99.144) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jan 2012 17:13:33 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 12 Jan 2012 11:13:33 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q0CHDW2Z010677	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 11:13:33 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 11:13:31 -0600
Message-ID: <1326388412-9899-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] image_types.bbclass: Fix generating uncompressed ext2 images
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
X-List-Received-Date: Thu, 12 Jan 2012 17:21:35 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 3010549..4908ed9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -40,7 +40,12 @@ IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IM
 
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 
-IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2"
+IMAGE_CMD_ext2 () {
+	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
+	genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
+	mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2
+	rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
+}
 IMAGE_CMD_ext2.gz () {
 	rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
 	genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
-- 
1.7.6.1




