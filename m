Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 81826778D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:09:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 06 Jul 2017 01:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="121504075"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 06 Jul 2017 01:09:30 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 237E25801CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:09:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:43 +0300
Message-Id: <cc0a981d128637275a9f9caca64a388697dc9b4d.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/8] wic: isoimage: do not remove temp directory
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
X-List-Received-Date: Thu, 06 Jul 2017 08:09:30 -0000

Removed isodir subrdirectory instead of removing temporary
working directory as working directory can contain copy of
rootfs partition and shouldn't be removed by any plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 85f35f7..ffa5429 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -204,8 +204,8 @@ class IsoImagePlugin(SourcePlugin):
         """
         isodir = "%s/ISO/" % cr_workdir
 
-        if os.path.exists(cr_workdir):
-            shutil.rmtree(cr_workdir)
+        if os.path.exists(isodir):
+            shutil.rmtree(isodir)
 
         install_cmd = "install -d %s " % isodir
         exec_cmd(install_cmd)
-- 
2.1.4


