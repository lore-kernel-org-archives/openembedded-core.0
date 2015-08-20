Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAFC76A79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:57:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 04:57:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787701017"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 04:57:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id CBB7F6A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:29 +0300
Message-Id: <cb57a096295b43c4b65ba85d743bb4f61755d8cb.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 16/17] wic: use bitbake variable ROOTFS_SIZE
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
X-List-Received-Date: Thu, 20 Aug 2015 11:57:02 -0000

If bitbake image is referenced in .ks file and --size is not used
there wic uses ROOTFS_SIZE variable to set minimum partition size.

ROOTFS_SIZE is calculated in meta/lib/oe/image.py when rootfs is
created. The calculation is done using other image parameters:
IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT, IMAGE_OVERHEAD_FACTOR
and IMAGE_ROOTFS_EXTRA_SPACE.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 57b1335..d68fd2a 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -29,6 +29,7 @@ import shutil
 
 from wic import kickstart, msger
 from wic.utils import fs_related
+from wic.utils.oe.misc import get_bitbake_var
 from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
 from wic.imager.baseimager import BaseImageCreator
@@ -229,6 +230,19 @@ class DirectImageCreator(BaseImageCreator):
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for p in parts:
+            # get rootfs size from bitbake variable if it's not set in .ks file
+            if not p.size:
+                # and if rootfs name is specified for the partition
+                image_name = p.get_rootfs()
+                if image_name:
+                    # Bitbake variable ROOTFS_SIZE is calculated in
+                    # Image._get_rootfs_size method from meta/lib/oe/image.py
+                    # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
+                    # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
+                    rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
+                    if rsize_bb:
+                        # convert from Kb to Mb
+                        p.size = int(rsize_bb) / 1024
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
             # Image.create() actually calls __format_disks() to create
-- 
2.1.4


