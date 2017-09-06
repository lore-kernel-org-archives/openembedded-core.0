Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2288777D6D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 12:10:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Sep 2017 05:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,483,1498546800"; d="scan'208";a="1215420929"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2017 05:10:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5BC87580A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 05:10:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Sep 2017 15:08:25 +0300
Message-Id: <39d1f67f80eecd81aa9505ad63c76d97c5e9b163.1504699594.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504699594.git.ed.bartosh@linux.intel.com>
References: <cover.1504699594.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/3] wic: run bmaptool with native Python3
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
X-List-Received-Date: Wed, 06 Sep 2017 12:10:18 -0000

Modified wic code to run bmaptool using native Python3
from wic-tools native sysroot.

[YOCTO #11891]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 5765bbb527b..a6abc3d09ef 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -213,8 +213,10 @@ class DirectPlugin(ImagerPlugin):
         # Generate .bmap
         if self.bmap:
             logger.debug("Generating bmap file for %s", disk_name)
-            exec_native_cmd("bmaptool create %s -o %s.bmap" % (full_path, full_path),
-                            self.native_sysroot)
+            python = os.path.join(self.native_sysroot, 'usr/bin/python3-native/python3')
+            bmaptool = os.path.join(self.native_sysroot, 'usr/bin/bmaptool')
+            exec_native_cmd("%s %s create %s -o %s.bmap" % \
+                            (python, bmaptool, full_path, full_path), self.native_sysroot)
         # Compress the image
         if self.compressor:
             logger.debug("Compressing disk %s with %s", disk_name, self.compressor)
-- 
2.13.5


