Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DF1CB75A39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="751635332"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2015 02:53:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id D7B906A4083;
	Tue, 23 Jun 2015 02:53:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:53:00 +0300
Message-Id: <1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/6] wic: Implement image compressing
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

Implemented compressing result image with specified compressor.
Updated reporting code to show compressed image.

[YOCTO #7593]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index f3f20e0..2ea7e4e 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -33,6 +33,7 @@ from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
 from wic.imager.baseimager import BaseImageCreator
 from wic.plugin import pluginmgr
+from wic.utils.oe.misc import exec_cmd
 
 disk_methods = {
     "do_install_disk":None,
@@ -71,6 +72,7 @@ class DirectImageCreator(BaseImageCreator):
         self.bootimg_dir = bootimg_dir
         self.kernel_dir = kernel_dir
         self.native_sysroot = native_sysroot
+        self.compressor = compressor
 
     def __get_part_num(self, num, parts):
         """calculate the real partition number, accounting for partitions not
@@ -318,6 +320,13 @@ class DirectImageCreator(BaseImageCreator):
                                                         self.bootimg_dir,
                                                         self.kernel_dir,
                                                         self.native_sysroot)
+        # Compress the image
+        if self.compressor:
+            for disk_name, disk in self.__image.disks.items():
+                full_path = self._full_path(self.__imgdir, disk_name, "direct")
+                msger.debug("Compressing disk %s with %s" % \
+                            (disk_name, self.compressor))
+                exec_cmd("%s %s" % (self.compressor, full_path))
 
     def print_outimage_info(self):
         """
@@ -328,7 +337,11 @@ class DirectImageCreator(BaseImageCreator):
         parts = self._get_parts()
 
         for disk_name, disk in self.__image.disks.items():
-            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            extension = "direct" + {"gzip": ".gz",
+                                    "bzip2": ".bz2",
+                                    "xz": ".xz",
+                                    "": ""}.get(self.compressor)
+            full_path = self._full_path(self.__imgdir, disk_name, extension)
             msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
-- 
2.1.4


