Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5DC77F351
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:55:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x78CtBmJ021329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 05:55:12 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 05:55:11 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 5B7E1AA4822;
	Thu,  8 Aug 2019 05:55:11 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 05:55:08 -0700
Message-ID: <20190808125509.120784-3-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808125509.120784-1-jason.wessel@windriver.com>
References: <20190808125509.120784-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] wic: Make disk partition size consistently computed
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
X-List-Received-Date: Thu, 08 Aug 2019 12:55:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When using different root directories with a wks file wic is using the
value from the original ROOTFS_SIZE which is not correct.  Example:

Number  Start   End     Size    File system  Name       Flags
 1      20.5kB  318MB   318MB   fat16        otaefi     legacy_boot, msftdata
 2      318MB   636MB   318MB   ext4         otaboot
 3      636MB   1709MB  1074MB  ext4         otaroot
 4      1709MB  2027MB  318MB   ext4         otaboot_b
 5      2027MB  3101MB  1074MB  ext4         otaroot_b
 6      3101MB  5249MB  2147MB  ext4         fluxdata

The partitions 1, 2, and 3 incorrectly inherit the size, instead of using
a computed size.  With the patch applied it is working properly:

Number  Start   End     Size    File system  Name       Flags
 1      20.5kB  14.5MB  14.5MB  fat16        otaefi     legacy_boot, msftdata
 2      14.5MB  65.3MB  50.8MB  ext4         otaboot
 3      65.3MB  1139MB  1074MB  ext4         otaroot
 4      1139MB  1190MB  50.8MB  ext4         otaboot_b
 5      1190MB  2264MB  1074MB  ext4         otaroot_b
 6      2264MB  4411MB  2147MB  ext4         fluxdata

As for the removal of the bb.warn, if the size is not specified, it is
not something to warn the end user about.  Some of my default images
make use of the head room + a computed directory size or while generating
images.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/lib/wic/partition.py | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f427c8101b..2a71d7b1d6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -212,19 +212,13 @@ class Partition():
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
-        # Get rootfs size from bitbake variable if it's not set in .ks file
+        # If size is not specified compute it from the rootfs_dir size
         if not self.size and real_rootfs:
-            # Bitbake variable ROOTFS_SIZE is calculated in
-            # Image._get_rootfs_size method from meta/lib/oe/image.py
-            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
-            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
-            if rsize_bb:
-                logger.warning('overhead-factor was specified, but size was not,'
-                               ' so bitbake variables will be used for the size.'
-                               ' In this case both IMAGE_OVERHEAD_FACTOR and '
-                               '--overhead-factor will be applied')
-                self.size = int(round(float(rsize_bb)))
+            # Use the same logic found in get_rootfs_size()
+            # from meta/classes/image.bbclass
+            du_cmd = "du -ks %s" % rootfs_dir
+            out = exec_cmd(du_cmd)
+            self.size = int(out.split()[0])
 
         prefix = "ext" if self.fstype.startswith("ext") else self.fstype
         method = getattr(self, "prepare_rootfs_" + prefix)
-- 
2.21.0


