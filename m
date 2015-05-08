Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 410B560034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 19:17:24 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id EEC3A422; Fri,  8 May 2015 21:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id A9B3E78;
	Fri,  8 May 2015 21:17:26 +0200 (CEST)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 21:17:14 +0200
Message-Id: <1431112634-16635-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] wic: remove intermediate partitions
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
X-List-Received-Date: Fri, 08 May 2015 19:17:27 -0000

Remove intermediate partitions that may have been created by a previous
wic invocation. Those partitions are causing issues on some systems. In
particular vfat partition creation is hanging on mcopy execution on
Fedora.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---

Changes in v2:
 - use os.remove instead of executing rm directly.

 scripts/lib/wic/kickstart/custom_commands/partition.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index ff906010b8bf..e864076c992d 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -230,6 +230,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -281,6 +282,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -ks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
@@ -325,6 +327,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(rootfs)
         du_cmd = "du -bks %s" % image_rootfs
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
@@ -377,6 +380,7 @@ class Wic_PartData(Mic_PartData):
         image_rootfs = rootfs_dir
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
+        os.remove(rootfs)
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
         exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
@@ -415,6 +419,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -442,6 +447,7 @@ class Wic_PartData(Mic_PartData):
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
+        os.remove(fs)
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
             (fs, self.size)
         exec_cmd(dd_cmd)
@@ -466,6 +472,7 @@ class Wic_PartData(Mic_PartData):
         Prepare an empty vfat partition.
         """
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        os.remove(fs)
 
         blocks = self.size
 
@@ -492,6 +499,7 @@ class Wic_PartData(Mic_PartData):
                       "Proceeding as requested." % self.mountpoint)
 
         fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        os.remove(fs)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
-- 
2.1.4


