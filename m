Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 815206FC2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 17E363160BB9;
	Mon, 22 Sep 2014 13:36:18 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:15 +0200
Message-Id: <1411385721-22264-4-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/9] wic: fix vfat partition sector count only if needed
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

VFAT rootfs partitions sector count would get updated always even if
there is no need. Since parition size in wic is expressed in MB, any
sub MB change will cause the generated partition image to be larger
than allocated space within the disk image. Fortunately, partitions
sized in MB will most of the time have a proper sector count.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index f41d136..8b0ace6 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -318,9 +318,11 @@ class Wic_PartData(Mic_PartData):
 
         # Ensure total sectors is an integral number of sectors per
         # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation is
-        # done in blocks, thus the mod by 16 instead of 32.
-        blocks += (16 - (blocks % 16))
+        # generate images with 32 sectors per track. This calculation
+        # is done in blocks, thus the mod by 16 instead of 32. Apply
+        # sector count fix only when needed.
+        if blocks % 16 != 0:
+            blocks += (16 - (blocks % 16))
 
         dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (rootfs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
-- 
1.9.0


