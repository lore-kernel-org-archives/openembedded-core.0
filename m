Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2FCE2784D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:21:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 16 Jun 2017 06:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1141947552"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2017 06:21:43 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AEB9A58027E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 06:21:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:19:30 +0300
Message-Id: <cf0c15b105721774d88cd5071d2d52ab572f29cf.1497618833.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497618833.git.ed.bartosh@linux.intel.com>
References: <cover.1497618833.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/4] wic: fix restoring of original fstab
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
X-List-Received-Date: Fri, 16 Jun 2017 13:21:43 -0000

Wic updates fstab if mount points are specified in .wks.
After partition images are created the original fstab is restored.
However, if exception is raised when partition image being prepared
wic doesn't restore original fstab. This can cause duplication of
added lines in fstab when 'wic create' runs next time.

Wrapping call of 'prepare' method and restoring original fstab
even if exception occurs should fix this.

[YOCTO #11633]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index e09350b..e26defb 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -172,10 +172,11 @@ class DirectPlugin(ImagerPlugin):
                     if rsize_bb:
                         part.size = int(round(float(rsize_bb)))
 
-        self._image.prepare(self)
-
-        if fstab_path:
-            shutil.move(fstab_path + ".orig", fstab_path)
+        try:
+            self._image.prepare(self)
+        finally:
+            if fstab_path:
+                shutil.move(fstab_path + ".orig", fstab_path)
 
         self._image.layout_partitions()
         self._image.create()
-- 
2.1.4


