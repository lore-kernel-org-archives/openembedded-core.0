Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE7F78461
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:52:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2017 02:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,425,1496127600"; d="scan'208";a="130521825"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 28 Jul 2017 02:52:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 059FE580941
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 02:52:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 12:29:22 +0300
Message-Id: <8b36d26f483323a22826a690a2b11a6b39c888df.1501233796.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501233796.git.ed.bartosh@linux.intel.com>
References: <cover.1501233796.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 1/7] image_types.bbclass: ignore tar exit code 1
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
X-List-Received-Date: Fri, 28 Jul 2017 09:52:48 -0000

tar exists with 1 and produces warning "file changed as we read it"
if content is changed while tar archives it. Even hardlinking content
causes tar to fail this way as it changes file ctime.

Other tasks running in parallel with do_image_tar may need to hardlink
rootfs content in order to change it, e.g. do_image_wic does this to
update etc/fstab.

Ignored tar exit code 1 to be able to hardlink rootfs content while
do_rootfs_tar is tarring it.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cf946a6..2365ce8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -119,7 +119,8 @@ IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # In practice, it turned out to be not needed when creating archives and
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} ."
+# ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [[ $? -eq 1 ]]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.1.4


