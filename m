Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd3-00065p-Lw
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:40:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721085"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:57 -0700
Message-Id: <560c1e98435e6ade11d0d916df916815c96d1c27.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/12] image_types.bbclass: redefine EXTRA_IMAGECMD_jffs2 to leverage siteinfo
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
X-List-Received-Date: Wed, 09 May 2012 05:40:02 -0000

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
1.7.7.6



