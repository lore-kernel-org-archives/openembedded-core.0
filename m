Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3DB76710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 28 Apr 2016 06:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="968399741"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2016 06:18:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 626436A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:52 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:11 +0300
Message-Id: <dfb8515aeb309d0a3ff1c2bdfef18a890f4d74ed.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 8/8] wic: use sparse_copy to preserve sparseness
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:22 -0000

Used sparse_copy API in favor of dd/cp in rawcopy plugin to
preserve sparseness of the copied raw content.

[YOCTO #9099]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 0472f53..ba014b0 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -20,6 +20,7 @@ import os
 from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.oe.misc import exec_cmd, get_bitbake_var
+from wic.filemap import sparse_copy
 
 class RawCopyPlugin(SourcePlugin):
     """
@@ -70,11 +71,9 @@ class RawCopyPlugin(SourcePlugin):
         dst = os.path.join(cr_workdir, source_params['file'])
 
         if 'skip' in source_params:
-            dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
-                    (src, dst, source_params['skip'])
+            sparse_copy(src, dst, skip=source_params['skip'])
         else:
-            dd_cmd = "cp %s %s" % (src, dst)
-        exec_cmd(dd_cmd)
+            sparse_copy(src, dst)
 
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
-- 
2.1.4


