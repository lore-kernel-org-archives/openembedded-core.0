Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 889E372817
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 829BA3FC70F;
	Mon, 22 Dec 2014 15:28:11 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Mon, 22 Dec 2014 15:28:02 +0100
Message-Id: <1419258482-10101-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] wic: account for mmcblk device partition naming
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
X-List-Received-Date: Mon, 22 Dec 2014 14:28:21 -0000

MMC block device partitions are named differently than other block
devices and use the scheme: mmcblk<devnum>p<partnum>, ex: mmcblk0p1,
mmcblk0p2. The current code generates incorrect parition names missing
'p' infix for fstab entries. The patch resolves this problem.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/imager/direct.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 6b2ab33..b1dc3e9 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -100,10 +100,18 @@ class DirectImageCreator(BaseImageCreator):
         for num, p in enumerate(parts, 1):
             if not p.mountpoint or p.mountpoint == "/" or p.mountpoint == "/boot":
                 continue
-            if self._ptable_format == 'msdos' and num > 3:
-                device_name = "/dev/" + p.disk + str(num + 1)
-            else:
-                device_name = "/dev/" + p.disk + str(num)
+
+            part = ''
+            # mmc device partitions are named mmcblk0p1, mmcblk0p2..
+            if p.disk.startswith('mmcblk'):
+                part = 'p'
+
+            pnum = num
+            if self._ptable_format == 'msdos' and pnum > 3:
+                # account for logical partition numbering, ex. sda5..
+                pnum += 1
+
+            device_name = "/dev/" + p.disk + part + str(pnum)
 
             opts = "defaults"
             if p.fsopts:
-- 
1.9.3


