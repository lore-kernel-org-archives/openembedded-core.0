Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhR-0006sq-EA
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443346"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:23 -0700
Message-Id: <7ceea61636d6a6f886002e3c29941da3356157ac.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/30] image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed data to file
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:06 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Having -c modifier makes xz to output the compressed data to stdout. In this
way the needed data will be in the do_rootfs log.
Redirect data to ${IMAGE_NAME}.rootfs.${type}.xz .

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5734edf..0e79820 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -236,7 +236,7 @@ COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.7.6



