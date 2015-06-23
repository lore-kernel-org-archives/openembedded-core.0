Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE72B75A1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="732871083"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2015 02:53:48 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 76AFA6A4083;
	Tue, 23 Jun 2015 02:53:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:52:59 +0300
Message-Id: <1435053182-8028-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 3/6] wic: Add new argument to direct plugin
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
X-List-Received-Date: Tue, 23 Jun 2015 09:54:10 -0000

Added 'compressor' argument to Direct plugin API to
pass a name of compressor utility.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 047c40d..d5c34b4 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -217,6 +217,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         sys.exit(1)
 
     direct_args = list()
+    direct_args.insert(0, compressor or "")
     direct_args.insert(0, oe_builddir)
     direct_args.insert(0, image_output_dir)
     direct_args.insert(0, wks_file)
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 2290ecd..f3f20e0 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -50,7 +50,7 @@ class DirectImageCreator(BaseImageCreator):
     """
 
     def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
-                 kernel_dir, native_sysroot, creatoropts=None):
+                 kernel_dir, native_sysroot, compressor, creatoropts=None):
         """
         Initialize a DirectImageCreator instance.
 
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 07811bd..db01c41 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
         """
         Create direct image, called from creator as 'direct' cmd
         """
-        if len(args) != 7:
+        if len(args) != 8:
             raise errors.Usage("Extra arguments given")
 
         native_sysroot = args[0]
@@ -75,6 +75,7 @@ class DirectPlugin(ImagerPlugin):
 
         image_output_dir = args[5]
         oe_builddir = args[6]
+        compressor = args[7]
 
         krootfs_dir = cls.__rootfs_dir_to_dict(rootfs_dir)
 
@@ -86,6 +87,7 @@ class DirectPlugin(ImagerPlugin):
                                             bootimg_dir,
                                             kernel_dir,
                                             native_sysroot,
+                                            compressor,
                                             creatoropts)
 
         try:
-- 
2.1.4


