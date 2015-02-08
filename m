Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 58E106E277
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 23:16:27 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 1AA9B387; Mon,  9 Feb 2015 00:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id DA35132B;
	Mon,  9 Feb 2015 00:16:33 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon,  9 Feb 2015 00:16:24 +0100
Message-Id: <1423437384-21971-4-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423437384-21971-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] wic: remove useless calls to __write_fstab
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
X-List-Received-Date: Sun, 08 Feb 2015 23:16:36 -0000

__write_fstab() is already iterating over parts. There is now need to
call it fort each parts.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/imager/direct.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 38d4e78e6273..c605e6423826 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -136,7 +136,7 @@ class DirectImageCreator(BaseImageCreator):
             fstab_lines.append(fstab_entry)
 
     def _write_fstab(self, fstab, fstab_lines):
-        fstab = open(fstab, "w")
+        fstab = open(fstab + ".new", "w")
         for line in fstab_lines:
             fstab.write(line)
         fstab.close()
@@ -258,12 +258,9 @@ class DirectImageCreator(BaseImageCreator):
             # self.assemble() calls Image.assemble() which calls
             # __write_partitition() for each partition to dd the fs
             # into the partitions.
-            fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
-
             p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
                       self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
-            self._restore_fstab(fstab)
 
             self.__image.add_partition(int(p.size),
                                        p.disk,
@@ -277,6 +274,9 @@ class DirectImageCreator(BaseImageCreator):
                                        no_table = p.no_table,
                                        part_type = p.part_type)
 
+        fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        self._restore_fstab(fstab)
+
         self.__image.layout_partitions(self._ptable_format)
 
         self.__imgdir = self.workdir
-- 
2.1.0


