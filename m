Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 5F94E71637
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 12:54:20 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id CC3E3496; Sun,  1 Mar 2015 13:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 95FB2494;
	Sun,  1 Mar 2015 13:54:19 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Sun,  1 Mar 2015 13:54:14 +0100
Message-Id: <1425214456-12241-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] wic: fix fstab generation
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
X-List-Received-Date: Sun, 01 Mar 2015 12:54:26 -0000

Commit 0a6668f6e60b4195ff4163c00fc972bacdb27b4b still included some
debug and is not working properly as the new fstab is generated too
late.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/imager/direct.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index c605e6423826..d368401af439 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -136,7 +136,7 @@ class DirectImageCreator(BaseImageCreator):
             fstab_lines.append(fstab_entry)
 
     def _write_fstab(self, fstab, fstab_lines):
-        fstab = open(fstab + ".new", "w")
+        fstab = open(fstab, "w")
         for line in fstab_lines:
             fstab.write(line)
         fstab.close()
@@ -250,6 +250,8 @@ class DirectImageCreator(BaseImageCreator):
             if not self.ks.handler.bootloader.source and p.mountpoint == "/boot":
                 self.ks.handler.bootloader.source = p.source
 
+        fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+
         for p in parts:
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
@@ -274,7 +276,6 @@ class DirectImageCreator(BaseImageCreator):
                                        no_table = p.no_table,
                                        part_type = p.part_type)
 
-        fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
         self._restore_fstab(fstab)
 
         self.__image.layout_partitions(self._ptable_format)
-- 
2.1.0


