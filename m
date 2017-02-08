Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED4271C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2017 11:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="1092446803"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 11:14:42 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A45E76A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:41 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:33 +0200
Message-Id: <55f824bf80e7db37a35918c55f4ad013a9c10ef4.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 9/9] wic: remove unused argument scripts_path
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:42 -0000

There is no need to pass scripts_path from main wic module
down the stack as it's not used there.

Removed scripts_path argument from DirectPlugin class
and wic_create function.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                | 7 +++----
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 scripts/wic                              | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index e27598d..1aa8f65 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -145,8 +145,8 @@ def list_source_plugins():
         print("  %s" % plugin)
 
 
-def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
-               scripts_path, options):
+def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+               native_sysroot, options):
     """
     Create image
 
@@ -155,7 +155,6 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
     bootimg_dir - absolute path to the build's boot artifacts directory
     kernel_dir - absolute path to the build's kernel directory
     native_sysroot - absolute path to the build's native sysroots dir
-    scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
     options - wic command line options (debug, bmap, etc)
 
@@ -195,7 +194,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
         msger.error('Unknown plugin: %s' % pname)
 
     plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                          native_sysroot, scripts_path, oe_builddir, options)
+                          native_sysroot, oe_builddir, options)
 
     plugin.do_create()
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index c399d47..a9144e2 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -68,7 +68,7 @@ class DirectPlugin(ImagerPlugin):
     name = 'direct'
 
     def __init__(self, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                 native_sysroot, scripts_path, oe_builddir, options):
+                 native_sysroot, oe_builddir, options):
         try:
             self.ks = KickStart(wks_file)
         except KickStartError as err:
diff --git a/scripts/wic b/scripts/wic
index 8a959a0..1b7d7df 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -250,7 +250,7 @@ def wic_create_subcommand(args, usage_str):
 
     print("Creating image(s)...\n")
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                      native_sysroot, scripts_path, options)
+                      native_sysroot, options)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
2.1.4


