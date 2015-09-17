Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 655C17701D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 08:50:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Sep 2015 01:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,545,1437462000"; d="scan'208";a="807104599"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2015 01:49:41 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 3A91C6A4087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 01:48:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 11:49:32 +0300
Message-Id: <a4f95ea38b91d00ca20a8451db9fe07dbaa15b87.1442479528.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1442479528.git.ed.bartosh@linux.intel.com>
References: <cover.1442479528.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1442479528.git.ed.bartosh@linux.intel.com>
References: <cover.1442479528.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/4] wic: fix partition size calculation
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
X-List-Received-Date: Thu, 17 Sep 2015 08:50:11 -0000

It was wrongly assumed that part.size is meagured in Mb. In fact it's
in Kb, so there is no need to convert bitbake variable ROOTFS_SIZE as
it's also in Kb.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 146a0d1..d5603fa 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -241,8 +241,7 @@ class DirectImageCreator(BaseImageCreator):
                     # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
                     rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
                     if rsize_bb:
-                        # convert from Kb to Mb
-                        part.size = int(round(float(rsize_bb) / 1024.))
+                        part.size = int(round(float(rsize_bb)))
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
             # Image.create() actually calls __format_disks() to create
-- 
2.1.4


