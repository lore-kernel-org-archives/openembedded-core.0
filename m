Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD67772C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP; 01 Feb 2017 06:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="59948491"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2017 06:11:25 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C02496A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:12 +0200
Message-Id: <df4bb3a543c227fea327a5a15c3387e447719917.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/18] wic: get rid of __rootfs_dir_to_dict method
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:25 -0000

Replaced class method __rootfs_dir_to_dict with a list
comprehension.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct_plugin.py | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 91a9792..c6df5fb 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -53,21 +53,8 @@ class DirectPlugin(ImagerPlugin):
 
     name = 'direct'
 
-    @classmethod
-    def __rootfs_dir_to_dict(cls, rootfs_dirs):
-        """
-        Gets a string that contain 'connection=dir' splitted by
-        space and return a dict
-        """
-        krootfs_dir = {}
-        for rootfs_dir in rootfs_dirs.split(' '):
-            key, val = rootfs_dir.split('=')
-            krootfs_dir[key] = val
-
-        return krootfs_dir
-
-    @classmethod
-    def do_create(cls, opts, *args):
+    @staticmethod
+    def do_create(opts, *args):
         """
         Create direct image, called from creator as 'direct' cmd
         """
@@ -92,7 +79,9 @@ class DirectPlugin(ImagerPlugin):
 
         image_name = "%s-%s" % (splitext(basename(ksconf))[0],
                           strftime("%Y%m%d%H%M"))
-        krootfs_dir = cls.__rootfs_dir_to_dict(rootfs_dir)
+
+        # parse possible 'rootfs=name' items
+        krootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
 
         creator = DirectImageCreator(image_name, ksobj, oe_builddir,
                                      image_output_dir, krootfs_dir,
-- 
2.1.4


