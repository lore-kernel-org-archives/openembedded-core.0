Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8B52071DCF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:21 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Feb 2017 06:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="54393975"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 01 Feb 2017 06:11:21 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3669A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:22 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:09 +0200
Message-Id: <f091221c91ef3bd28734609761ba9fbf85cedaa2.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/18] wic: direct_plugin: stop using config manager
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:22 -0000

This is a preparation to removing conf.py and config/wic.conf
from the codebase.

Got rid of using configmgr global object in direct_plugin and direct
modules. It was used to implicitly parse kickstart file and set
couple of variables.

Replaced usage of configmgr by passing parameters directly to the
DirectImageCreator.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py                | 10 +++++-----
 scripts/lib/wic/plugins/imager/direct_plugin.py | 22 +++++++++++++++-------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 575fd95..ff06b50 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -72,18 +72,18 @@ class DirectImageCreator:
     media and used on actual hardware.
     """
 
-    def __init__(self, oe_builddir, image_output_dir, rootfs_dir,
-                 bootimg_dir, kernel_dir, native_sysroot, compressor,
-                 creatoropts, bmap=False):
+    def __init__(self, image_name, ksobj, oe_builddir, image_output_dir,
+                 rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
+                 compressor, bmap=False):
         """
         Initialize a DirectImageCreator instance.
 
         This method takes the same arguments as ImageCreator.__init__()
         """
-        self.name = creatoropts['name']
+        self.name = image_name
         self.outdir = image_output_dir
         self.workdir = tempfile.mktemp(prefix='wic')
-        self.ks = creatoropts['ks']
+        self.ks = ksobj
 
         self.__image = None
         self.__disks = {}
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 8fe3930..e839d2f 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -24,8 +24,12 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
+from time import strftime
+
+from os.path import basename, splitext
 from wic.utils import errors
-from wic.conf import configmgr
+from wic.ksparser import KickStart, KickStartError
+from wic import msger
 
 import wic.imager.direct as direct
 from wic.pluginbase import ImagerPlugin
@@ -68,27 +72,31 @@ class DirectPlugin(ImagerPlugin):
         bootimg_dir = args[2]
         rootfs_dir = args[3]
 
-        creatoropts = configmgr.create
         ksconf = args[4]
 
         image_output_dir = args[5]
         oe_builddir = args[6]
         compressor = args[7]
 
-        krootfs_dir = cls.__rootfs_dir_to_dict(rootfs_dir)
+        try:
+            ksobj = KickStart(ksconf)
+        except KickStartError as err:
+            msger.error(str(err))
 
-        configmgr._ksconf = ksconf
+        image_name = "%s-%s" % (splitext(basename(ksconf))[0],
+                          strftime("%Y%m%d%H%M"))
+        krootfs_dir = cls.__rootfs_dir_to_dict(rootfs_dir)
 
-        creator = direct.DirectImageCreator(oe_builddir,
+        creator = direct.DirectImageCreator(image_name,
+                                            ksobj,
+                                            oe_builddir,
                                             image_output_dir,
                                             krootfs_dir,
                                             bootimg_dir,
                                             kernel_dir,
                                             native_sysroot,
                                             compressor,
-                                            creatoropts,
                                             opts.bmap)
-
         try:
             creator.create()
             creator.assemble()
-- 
2.1.4


