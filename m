Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 94CE970A6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582200407"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 15:06:39 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:45 -0500
Message-Id: <b11ddbe5ba010c8084f8b12084211efa1abbbea6.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 20/35] wic: Clean up DirectImageCreator
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:40 -0000

Remove what wic doesn't use from DirectImageCreator.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                | 8 +-------
 scripts/lib/mic/plugins/imager/direct_plugin.py | 5 +----
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 93f0cd9..92473b5 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -54,8 +54,7 @@ class DirectImageCreator(BaseImageCreator):
 
     def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
                  kernel_dir, native_sysroot, hdddir, staging_data_dir,
-                 creatoropts=None, compress_image=None,
-                 generate_bmap=None, fstab_entry="uuid"):
+                 creatoropts=None):
         """
         Initialize a DirectImageCreator instance.
 
@@ -64,19 +63,14 @@ class DirectImageCreator(BaseImageCreator):
         BaseImageCreator.__init__(self, creatoropts)
 
         self.__instimage = None
-        self.__imgdir = None
         self.__disks = {}
         self.__disk_format = "direct"
         self._disk_names = []
         self._ptable_format = self.ks.handler.bootloader.ptable
-        self.use_uuid = fstab_entry == "uuid"
-        self.compress_image = compress_image
-        self.bmap_needed = generate_bmap
 
         self.oe_builddir = oe_builddir
         if image_output_dir:
             self.tmpdir = image_output_dir
-            self.cachedir = "%s/cache" % image_output_dir
         self.rootfs_dir = rootfs_dir
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index d3a0ba7..877aaf6 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -88,10 +88,7 @@ class DirectPlugin(ImagerPlugin):
                                             native_sysroot,
                                             hdddir,
                                             staging_data_dir,
-                                            creatoropts,
-                                            None,
-                                            None,
-                                            None)
+                                            creatoropts)
 
         try:
             creator.mount(None, creatoropts["cachedir"])
-- 
1.8.3.1


