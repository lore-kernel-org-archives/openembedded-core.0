Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id B6A1B71B69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:41:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2018 01:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,333,1526367600"; d="scan'208";a="214788435"
Received: from hharm-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.169.237])
	by orsmga004.jf.intel.com with ESMTP; 10 Jul 2018 01:41:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:41:41 +0800
Message-Id: <20180710084141.9705-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710084141.9705-1-anuj.mittal@intel.com>
References: <20180710084141.9705-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] image-live: fix check for rootfs size with hddimg images
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
X-List-Received-Date: Tue, 10 Jul 2018 08:41:57 -0000

Currently we check if the rootfs.img size is greater than 4 GB and use
mcopy to copy it over to a hddimg, a FAT32 volume.

This results in problems when IMAGE_ROOTFS_SIZE is set to be exact 4 GB
(4294967296 bytes). mcopy uses the max offset/file size to be 4294967295
and as a result, it errors out without any warning to the user.

Change the 4 GB check to '-ge' to catch these cases. Since we allow
IMAGE_ROOTFS_SIZE to be in KBs, the maximum allowed is 4194303 KB. Also,
tweaked the error message to refer to wic too.

Fixes [YOCTO #12776]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image-live.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 966277c678..90e5a815c2 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -232,11 +232,11 @@ build_hddimg() {
 		if [ -f ${HDDDIR}/rootfs.img ]; then
 			rootfs_img_size=`stat -c '%s' ${HDDDIR}/rootfs.img`
 			max_size=`expr 4 \* 1024 \* 1024 \* 1024`
-			if [ $rootfs_img_size -gt $max_size ]; then
-				bberror "${HDDDIR}/rootfs.img execeeds 4GB,"
-				bberror "this doesn't work on FAT filesystem, you can try either of:"
-				bberror "1) Reduce the size of rootfs.img"
-				bbfatal "2) Use iso, vmdk or vdi to instead of hddimg\n"
+			if [ $rootfs_img_size -ge $max_size ]; then
+				bberror "${HDDDIR}/rootfs.img rootfs size is greather than or equal to 4GB,"
+				bberror "and this doesn't work on a FAT filesystem. You can either:"
+				bberror "1) Reduce the size of rootfs.img, or,"
+				bbfatal "2) Use wic, vmdk or vdi instead of hddimg\n"
 			fi
 		fi
 
-- 
2.17.1


