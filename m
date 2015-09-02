Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7086977059
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2015 04:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="796215128"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 04:00:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 880986A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:14 +0300
Message-Id: <37696f8c1bdafe09f0b282df0acc006bc49cfa6c.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 14/17] wic: fix pylint warning redefined-builtin
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:31 -0000

Renamed variables named as Python builtin functions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py                        | 18 +++++++++---------
 scripts/lib/wic/imager/baseimager.py             |  4 ++--
 scripts/lib/wic/imager/direct.py                 |  6 +++---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  6 +++---
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 30c4fa3..d4a7be6 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -77,11 +77,11 @@ def find_canned_image(scripts_path, wks_file):
 
     for canned_wks_dir in layers_canned_wks_dir:
         for root, dirs, files in os.walk(canned_wks_dir):
-            for file in files:
-                if file.endswith("~") or file.endswith("#"):
+            for fname in files:
+                if fname.endswith("~") or fname.endswith("#"):
                     continue
-                if file.endswith(".wks") and wks_file + ".wks" == file:
-                    fullpath = os.path.join(canned_wks_dir, file)
+                if fname.endswith(".wks") and wks_file + ".wks" == fname:
+                    fullpath = os.path.join(canned_wks_dir, fname)
                     return fullpath
     return None
 
@@ -94,11 +94,11 @@ def list_canned_images(scripts_path):
 
     for canned_wks_dir in layers_canned_wks_dir:
         for root, dirs, files in os.walk(canned_wks_dir):
-            for file in files:
-                if file.endswith("~") or file.endswith("#"):
+            for fname in files:
+                if fname.endswith("~") or fname.endswith("#"):
                     continue
-                if file.endswith(".wks"):
-                    fullpath = os.path.join(canned_wks_dir, file)
+                if fname.endswith(".wks"):
+                    fullpath = os.path.join(canned_wks_dir, fname)
                     f = open(fullpath, "r")
                     lines = f.readlines()
                     for line in lines:
@@ -107,7 +107,7 @@ def list_canned_images(scripts_path):
                         if idx != -1:
                             desc = line[idx + len("short-description:"):].strip()
                             break
-                    basename = os.path.splitext(file)[0]
+                    basename = os.path.splitext(fname)[0]
                     print "  %s\t\t%s" % (basename.ljust(30), desc)
 
 
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 4abcabc..acbe948 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -186,7 +186,7 @@ class BaseImageCreator(object):
     def print_outimage_info(self):
         msg = "The new image can be found here:\n"
         self.outimage.sort()
-        for file in self.outimage:
-            msg += '  %s\n' % os.path.abspath(file)
+        for path in self.outimage:
+            msg += '  %s\n' % os.path.abspath(path)
 
         msger.info(msg)
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 74ebbe7..761e436 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -340,10 +340,10 @@ class DirectImageCreator(BaseImageCreator):
             if p.get_rootfs() is None:
                 continue
             if p.mountpoint == '/':
-                str = ':'
+                suffix = ':'
             else:
-                str = '["%s"]:' % (p.mountpoint or p.label)
-            msg += '  ROOTFS_DIR%s%s\n' % (str.ljust(20), p.get_rootfs())
+                suffix = '["%s"]:' % (p.mountpoint or p.label)
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), p.get_rootfs())
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 721c524..3c2dbc9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -127,9 +127,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        def _has_syslinux(dir):
-            if dir:
-                syslinux = "%s/syslinux" % dir
+        def _has_syslinux(dirname):
+            if dirname:
+                syslinux = "%s/syslinux" % dirname
                 if os.path.exists(syslinux):
                     return True
             return False
-- 
2.1.4


