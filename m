Return-Path: <alessio.bogani@elettra.eu>
Received: from spamalot.elettra.eu (spamalot.elettra.trieste.it
	[140.105.206.208])
	by mail.openembedded.org (Postfix) with ESMTP id 9206F7F22D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id
	18853440E38_D8C864AB; Thu, 26 Sep 2019 09:35:06 +0000 (GMT)
Received: from unknown-host by spamalot.elettra.eu with queue id 783001;
	Thu, 26 Sep 2019 09:35:05 GMT
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
	[192.168.205.44])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id
	1B76D43E352_D8C8649F; Thu, 26 Sep 2019 09:35:05 +0000 (GMT)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 11:35:02 +0200
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f313da8e-6f87-a0d3-413b-d69d0fec9f12@windriver.com>
References: <f313da8e-6f87-a0d3-413b-d69d0fec9f12@windriver.com>
X-SASI-RCODE: 200
Message-Id: <20190926093506.18853440E38_D8C864AB@spamalot.elettra.eu>
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH v2] wic: Using the right rootfs size during prepare_rootfs
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
X-List-Received-Date: Thu, 26 Sep 2019 09:35:07 -0000

The commit 8e48b4d6c4 makes wic ignores IMAGE_ROOTFS_SIZE for rootfs
size and makes it uses the computed one only. Re-add support for
IMAGE_ROOTFS_SIZE variable and compute roots size only if the former
is not defined. Moreover the size of a provided directory with
--rootfs-dir="" in the .wks file should always be computed on the fly,
else every partition will be constrained to be the same size as what
ever value was in ROOTFS_SIZE.

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/lib/wic/partition.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2a71d7b1d6..d809408e1a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -212,13 +212,24 @@ class Partition():
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
-        # If size is not specified compute it from the rootfs_dir size
         if not self.size and real_rootfs:
-            # Use the same logic found in get_rootfs_size()
-            # from meta/classes/image.bbclass
-            du_cmd = "du -ks %s" % rootfs_dir
-            out = exec_cmd(du_cmd)
-            self.size = int(out.split()[0])
+            # The rootfs size is not set in .ks file so try to get it
+            # from bitbake variable
+            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
+            rdir = get_bitbake_var('IMAGE_ROOTFS')
+            if rsize_bb and rdir == rootfs_dir:
+                # Bitbake variable ROOTFS_SIZE is calculated in
+                # Image._get_rootfs_size method from meta/lib/oe/image.py
+                # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
+                # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
+                self.size = int(round(float(rsize_bb)))
+            else:
+                # Bitbake variable ROOTFS_SIZE is not defined so compute it
+                # from the rootfs_dir size using the same logic found in
+                # get_rootfs_size() from meta/classes/image.bbclass
+                du_cmd = "du -ks %s" % rootfs_dir
+                out = exec_cmd(du_cmd)
+                self.size = int(out.split()[0])
 
         prefix = "ext" if self.fstype.startswith("ext") else self.fstype
         method = getattr(self, "prepare_rootfs_" + prefix)
-- 
2.17.1


