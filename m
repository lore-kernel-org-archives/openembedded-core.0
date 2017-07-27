Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0066778308
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 14:26:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 07:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="997843898"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2017 07:26:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9D966580571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 07:26:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 17:02:43 +0300
Message-Id: <b708afa66ad343853342e781228c7f01881a2838.1501162988.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1501162988.git.ed.bartosh@linux.intel.com>
References: <cover.1501162988.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 2/6] wic: use absolute paths in rootfs plugin
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
X-List-Received-Date: Thu, 27 Jul 2017 14:26:09 -0000

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


