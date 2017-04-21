Return-Path: <andreas.reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8563D77ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 0F7641E1A34;
	Fri, 21 Apr 2017 14:10:24 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001,
	URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SnqajX8wepxj; Fri, 21 Apr 2017 14:10:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id D2C261E1A31;
	Fri, 21 Apr 2017 14:10:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TI1aoGcSK1Cx; Fri, 21 Apr 2017 14:10:21 +0200 (CEST)
Received: from localhost.localdomain (p578a821c.dip0.t-ipconnect.de
	[87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id 8FAD71E1A43;
	Fri, 21 Apr 2017 14:10:18 +0200 (CEST)
From: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:11:44 +0200
Message-Id: <20170421121145.9797-5-andreas.reichel@tngtech.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170421121145.9797-1-andreas.reichel@tngtech.com>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>
Subject: [wic patch 4/5] wic: Add option to keep partition images
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
X-List-Received-Date: Fri, 21 Apr 2017 12:16:16 -0000

Add new option -P, --keep-partition-images to prevent
deletion of .p* files created by wic's direct imager plugin.

Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>

---
 scripts/lib/wic/help.py                  |  5 +++++
 scripts/lib/wic/plugins/imager/direct.py | 28 +++++++++++++++++++---------
 scripts/wic                              |  2 ++
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index ba0c8e5eea..026a383155 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -134,6 +134,7 @@ wic_create_usage = """
             [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
             [-r, --rootfs-dir] [-b, --bootimg-dir]
             [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+            [-P, --keep-partition-images]
             [-c, --compress-with] [-m, --bmap]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
@@ -155,6 +156,7 @@ SYNOPSIS
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
         [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+        [-P, --keep-partition-images]
         [-c, --compress-with] [-m, --bmap]
 
 DESCRIPTION
@@ -227,6 +229,9 @@ DESCRIPTION
 
     The -m option is used to produce .bmap file for the image. This file
     can be used to flash image using bmaptool utility.
+
+    The -p option is used to keep the individual partition image files .p*,
+    created by the direct imager plugin.
 """
 
 wic_list_usage = """
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index d6b47ff0bb..b27584bdbe 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -84,8 +84,12 @@ class DirectPlugin(ImagerPlugin):
                 break
 
         image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
+        self.keep_partimages = options.keep_partimages
+
         self._image = PartitionedImage(image_path, self.ptable_format,
-                                       self.parts, self.native_sysroot)
+                                       self.parts, self.native_sysroot,
+                                       keep_partimages=self.keep_partimages)
+
 
     def do_create(self):
         """
@@ -287,7 +291,9 @@ class PartitionedImage():
     Partitioned image in a file.
     """
 
-    def __init__(self, path, ptable_format, partitions, native_sysroot=None):
+    def __init__(self, path, ptable_format, partitions, native_sysroot=None,
+        keep_partimages=False):
+
         self.path = path  # Path to the image file
         self.numpart = 0  # Number of allocated partitions
         self.realpart = 0 # Number of partitions in the partition table
@@ -325,6 +331,8 @@ class PartitionedImage():
                 else: # msdos partition table
                     part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
 
+        self.keep_partimages = keep_partimages
+
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
         for part in self.partitions:
@@ -540,13 +548,15 @@ class PartitionedImage():
 
     def cleanup(self):
         # remove partition images
-        for image in set(self.partimages):
-            try:
-                os.remove(image)
-            except IOError as e:
-                logger.warning(
-                    "Could not delete file. {0}: I/O error ({1}): {2}\n".format(
-                    image, e.errno, e.strerror))
+        if not self.keep_partimages:
+            # remove partition images
+            for image in set(self.partimages):
+                try:
+                    os.remove(image)
+                except IOError as e:
+                    logger.warning(
+                        "Could not delete file. {0}: I/O error ({1}): {2}\n".format(
+                        image, e.errno, e.strerror))
 
     def assemble(self):
         logger.debug("Installing partitions")
diff --git a/scripts/wic b/scripts/wic
index 49cad869e2..98f7405702 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -303,6 +303,8 @@ def wic_init_parser_create(subparser):
                            "bitbake variables")
     subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
                       default=False, help="output debug information")
+    subparser.add_argument("-P", "--keep-partition-images", dest="keep_partimages",
+                      action="store_true", default=False)
     return
 
 
-- 
2.11.0


