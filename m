Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1490D73182
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="97149045"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 May 2016 08:27:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 3373E6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:14:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:16 +0300
Message-Id: <5e77df0d3cd2a5f54f084d4be9c06384f72e9de3.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 03/14] wic: don't use dict.keys and dict.has_key
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
X-List-Received-Date: Wed, 04 May 2016 15:27:17 -0000

Replaced calls of dict.keys and dict.has_key methods with the
'key in dict' statement. 'key in dict' is more pythonic, faster
and readable. dict.has_key doesn't exist in Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/baseimager.py   | 2 +-
 scripts/lib/wic/plugin.py              | 2 +-
 scripts/lib/wic/utils/partitionedfs.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 760cf8a..557f536 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -68,7 +68,7 @@ class BaseImageCreator(object):
                      }
 
             # update setting from createopts
-            for key in createopts.keys():
+            for key in createopts:
                 if key in optmap:
                     option = optmap[key]
                 else:
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 80c609c..933647d 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -137,7 +137,7 @@ class PluginMgr(object):
         return_methods = None
         for _source_name, klass in self.get_plugins('source').items():
             if _source_name == source_name:
-                for _method_name in methods.keys():
+                for _method_name in methods:
                     if not hasattr(klass, _method_name):
                         msger.warning("Unimplemented %s source interface for: %s"\
                                       % (_method_name, _source_name))
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 534635b..89a7c13 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -132,7 +132,7 @@ class Image(object):
         for num in range(len(self.partitions)):
             part = self.partitions[num]
 
-            if not self.disks.has_key(part['disk_name']):
+            if part['disk_name'] not in self.disks:
                 raise ImageError("No disk %s for partition %s" \
                                  % (part['disk_name'], part['mountpoint']))
 
@@ -236,7 +236,7 @@ class Image(object):
     def __format_disks(self):
         self.layout_partitions()
 
-        for dev in self.disks.keys():
+        for dev in self.disks:
             disk = self.disks[dev]
             msger.debug("Initializing partition table for %s" % \
                         (disk['disk'].device))
@@ -354,7 +354,7 @@ class Image(object):
                 os.rename(source, image_file + '.p%d' % part['num'])
 
     def create(self):
-        for dev in self.disks.keys():
+        for dev in self.disks:
             disk = self.disks[dev]
             disk['disk'].create()
 
-- 
2.1.4


