Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SRH3F-0008Rn-3i
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 08:04:05 +0200
Received: from mail156-ch1-R.bigfish.com (10.43.68.233) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Mon, 7 May 2012 05:23:49 +0000
Received: from mail156-ch1 (localhost [127.0.0.1])	by
	mail156-ch1-R.bigfish.com (Postfix) with ESMTP id A235C1201E3	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 05:23:49 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bh)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail156-ch1 (localhost.localdomain [127.0.0.1]) by mail156-ch1
	(MessageSwitch) id 1336368227370260_17234;
	Mon,  7 May 2012 05:23:47 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail156-ch1.bigfish.com (Postfix) with ESMTP id
	4E1C42400E0	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 05:23:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 7 May 2012 05:23:47 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Mon, 7 May 2012 00:23:58 -0500
Received: from sbuilder136.ap.freescale.net ([10.192.208.136])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q475NudQ024067;
	Sun, 6 May 2012 22:23:57 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 May 2012 12:44:29 +0800
Message-ID: <1336365869-12720-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] image_types.bbclass: redefine EXTRA_IMAGECMD_jffs2 to leverage siteinfo
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
X-List-Received-Date: Mon, 07 May 2012 06:04:06 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/classes/image_types.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b590ae1..55f122e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -188,7 +188,12 @@ IMAGE_CMD_ubi () {
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
-EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
+
+inherit siteinfo
+JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-endian', '--big-endian', d)}"
+JFFS2_ERASEBLOCK ?= "0x40000"
+EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
+
 # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
 EXTRA_IMAGECMD_ext3 ?= "-i 8192"
-- 
1.7.5




