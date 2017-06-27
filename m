Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F00F77EA5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:31:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 06:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="872166604"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2017 06:31:10 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0DF1458069C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:31:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:28:38 +0300
Message-Id: <e2078eb1b9bfdbbbf13f235b7f759702d5821b1c.1498569961.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1498569961.git.ed.bartosh@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 2/5] wic: use absolute paths in rootfs plugin
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
X-List-Received-Date: Tue, 27 Jun 2017 13:31:09 -0000

Using relative paths can cause copyhardlinktree API to fail as
it changes current directory when working. Converted all paths
to absolute paths using os.path.realpath.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 4dc4cb8..c08f760 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -48,7 +48,7 @@ class RootfsPlugin(SourcePlugin):
     @staticmethod
     def __get_rootfs_dir(rootfs_dir):
         if os.path.isdir(rootfs_dir):
-            return rootfs_dir
+            return os.path.realpath(rootfs_dir)
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
@@ -56,7 +56,7 @@ class RootfsPlugin(SourcePlugin):
                            "named %s has been found at %s, exiting." %
                            (rootfs_dir, image_rootfs_dir))
 
-        return image_rootfs_dir
+        return os.path.realpath(image_rootfs_dir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-- 
2.1.4


