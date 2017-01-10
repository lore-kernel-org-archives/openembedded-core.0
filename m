Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3F85171A50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:12:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jan 2017 10:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,344,1477983600"; d="scan'208";a="211788673"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2017 10:08:38 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3FBD56A4006;
	Tue, 10 Jan 2017 10:07:44 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 19:46:08 +0200
Message-Id: <1484070369-26765-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] direct.py: fix getting image name
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
X-List-Received-Date: Tue, 10 Jan 2017 18:12:18 -0000

part.rootfs_dir was used as an image name in the code.
However, when multi-rootfs feature is used this attribute
points to the name of the rootfs, e.g. if --rootfs command line
is rootfs1=core-image-minimal partf.rootfs_dir is 'rootfs1'.

The code also fails when image name is not provided in wic
commandline. For example, when wic is called with
--rootfs-dir=<path> part.rootfs_dir will contain path and
wic will crash trying to call bitbake -e <path> to get
value of ROOTFS_SIZE variable.

Fixed the code by getting image name properly and checking
if it's not a path.

[YOCTO #10815]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 11ec15e..52828c1 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -270,8 +270,8 @@ class DirectImageCreator(BaseImageCreator):
             # get rootfs size from bitbake variable if it's not set in .ks file
             if not part.size:
                 # and if rootfs name is specified for the partition
-                image_name = part.rootfs_dir
-                if image_name:
+                image_name = self.rootfs_dir.get(part.rootfs_dir)
+                if image_name and os.path.sep not in image_name:
                     # Bitbake variable ROOTFS_SIZE is calculated in
                     # Image._get_rootfs_size method from meta/lib/oe/image.py
                     # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-- 
2.1.4


