Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E41086025E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:21:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 23 Sep 2016 05:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1060968758"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2016 05:21:20 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id E77AF6A4080;
	Fri, 23 Sep 2016 05:20:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:10:26 +0300
Message-Id: <1474632626-507-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1474537680-13224-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1474537680-13224-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2] wic: remove partition images
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
X-List-Received-Date: Fri, 23 Sep 2016 12:21:19 -0000

Preserving images for every partition doubles disk space
consumed by an image build. As those images are not used,
so it's better to remove them after assembling final image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 46b5d34..cafb933 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -43,6 +43,7 @@ class Image():
     def __init__(self, native_sysroot=None):
         self.disks = {}
         self.partitions = []
+        self.partimages = []
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self._partitions_layed_out = False
@@ -336,6 +337,10 @@ class Image():
                     disk['disk'].cleanup()
                 except:
                     pass
+        # remove partition images
+        for image in self.partimages:
+            if os.path.isfile(image):
+                os.remove(image)
 
     def assemble(self, image_file):
         msger.debug("Installing partitions")
@@ -351,7 +356,9 @@ class Image():
                             (source, part['num'], part['start'],
                              part['start'] + part['size'] - 1, part['size']))
 
-                os.rename(source, image_file + '.p%d' % part['num'])
+                partimage = image_file + '.p%d' % part['num']
+                os.rename(source, partimage)
+                self.partimages.append(partimage)
 
     def create(self):
         for dev in self.disks:
-- 
2.1.4


