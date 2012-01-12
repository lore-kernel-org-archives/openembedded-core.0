Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlOL8-0003QN-KG
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 18:21:26 +0100
Received: from mail67-db3-R.bigfish.com (10.3.81.249) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Thu, 12 Jan 2012 17:13:54 +0000
Received: from mail67-db3 (localhost [127.0.0.1])	by mail67-db3-R.bigfish.com
	(Postfix) with ESMTP id 355601401B1	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:13:54 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dhc1ahc1bh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail67-db3 (localhost.localdomain [127.0.0.1]) by mail67-db3
	(MessageSwitch) id 1326388434125783_14711;
	Thu, 12 Jan 2012 17:13:54 +0000 (UTC)
Received: from DB3EHSMHS017.bigfish.com (unknown [10.3.81.245])	by
	mail67-db3.bigfish.com (Postfix) with ESMTP id 1BC42500042	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 17:13:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS017.bigfish.com
	(10.3.87.117) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 12 Jan 2012 17:13:50 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 12 Jan 2012 11:13:33 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q0CHDW2a010677	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 11:13:33 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 11:13:32 -0600
Message-ID: <1326388412-9899-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1326388412-9899-1-git-send-email-msm@freescale.com>
References: <1326388412-9899-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] image_types_uboot.bbclass: Add uncompressed ext2 image option
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
X-List-Received-Date: Thu, 12 Jan 2012 17:21:26 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/image_types_uboot.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 65dc91b..8d1081c 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -5,6 +5,10 @@ oe_mkimage () {
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
 }
 
+IMAGE_DEPENDS_ext2.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
+IMAGE_CMD_ext2.u-boot      = "${IMAGE_CMD_ext2} \
+                                 oe_mkimage ${IMAGE_NAME}.rootfs.ext2 none"
+
 IMAGE_DEPENDS_ext2.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage-native"
 IMAGE_CMD_ext2.gz.u-boot      = "${IMAGE_CMD_ext2.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext2.gz gzip"
@@ -25,4 +29,4 @@ IMAGE_DEPENDS_ext4.gz.u-boot = "genext2fs-native e2fsprogs-native u-boot-mkimage
 IMAGE_CMD_ext4.gz.u-boot      = "${IMAGE_CMD_ext4.gz} \
                                  oe_mkimage ${IMAGE_NAME}.rootfs.ext4.gz gzip"
 
-IMAGE_TYPES += "ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
+IMAGE_TYPES += "ext2.u-boot ext2.gz.u-boot ext2.bz2.u-boot ext2.lzma.u-boot ext3.gz.u-boot ext4.gz.u-boot"
-- 
1.7.6.1




