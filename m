Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 02AD175C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:15 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 30 Aug 2016 02:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2696256"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 30 Aug 2016 02:31:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 4AB2C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:44 +0300
Message-Id: <1f8d8e14b217e600e8ba5ab4bf21626f63c3eefb.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/18] rootfs.py: use DEPLOYDIR instead of DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:16 -0000

Updated the code of Rootfs class to use DEPLOYDIR variable
as it's now used as a new deployment destination.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7c620e9..076bc33 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -19,7 +19,7 @@ class Rootfs(object, metaclass=ABCMeta):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
-        self.deploy_dir_image = self.d.getVar('DEPLOY_DIR_IMAGE', True)
+        self.deploydir = self.d.getVar('DEPLOYDIR', True)
         self.progress_reporter = progress_reporter
 
         self.install_order = Manifest.INSTALL_ORDER
@@ -182,12 +182,12 @@ class Rootfs(object, metaclass=ABCMeta):
 
         bb.utils.mkdirhier(self.image_rootfs)
 
-        bb.utils.mkdirhier(self.deploy_dir_image)
+        bb.utils.mkdirhier(self.deploydir)
 
         shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
         shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
-                    self.deploy_dir_image +
+                    self.deploydir +
                     "/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt")
 
         execute_pre_post_process(self.d, pre_process_cmds)
-- 
2.1.4


