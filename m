Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1E3C60232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:14:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jan 2016 06:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="890434318"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2016 06:13:47 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 2C6CE6A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:01:41 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:53 +0200
Message-Id: <3844376a0edcaa2050c86b1061fb6a92bb262722.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/9] wic: use new kickstart parser
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
X-List-Received-Date: Thu, 14 Jan 2016 14:14:13 -0000

Used KickStart parser class instead of pykickstart API.

This commit breaks wic as data structures and field names
provided by new API are a bit different from old ones.
This issue will be addressed in the following commits.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py          | 4 ++--
 scripts/lib/wic/imager/direct.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index 1d4363a..2e29451 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -17,8 +17,8 @@
 
 import os
 
+from wic.kickstart import KickStart
 from wic import msger
-from wic import kickstart
 from wic.utils import misc
 
 
@@ -87,7 +87,7 @@ class ConfigMgr(object):
         if not ksconf:
             return
 
-        ksobj = kickstart.read_kickstart(ksconf)
+        ksobj = KickStart(ksconf)
 
         self.create['ks'] = ksobj
         self.create['name'] = os.path.splitext(os.path.basename(ksconf))[0]
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index d5603fa..f89c42c 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -27,7 +27,7 @@
 import os
 import shutil
 
-from wic import kickstart, msger
+from wic import msger
 from wic.utils import fs_related
 from wic.utils.oe.misc import get_bitbake_var
 from wic.utils.partitionedfs import Image
-- 
2.1.4


