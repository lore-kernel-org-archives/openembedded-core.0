Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 252F6617B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 98DB7401199;
	Tue, 19 Aug 2014 15:14:37 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 15:14:18 +0200
Message-Id: <1408454058-2192-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1408454058-2192-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1408454058-2192-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/2] wic: do not realign aligned partitions
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
X-List-Received-Date: Tue, 19 Aug 2014 13:14:43 -0000

The change prevents additional realignment of already aligned
partition. Previously, even already aligned partitions would be pushed
forward by the amount of --align.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 36ef406..791f488 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -164,16 +164,19 @@ class Image:
 
                 # Calc how much the alignment is off.
                 align_sectors = d['offset'] % (p['align'] * 1024 / self.sector_size)
-                # We need to move forward to the next alignment point
-                align_sectors = (p['align'] * 1024 / self.sector_size) - align_sectors
 
-                msger.debug("Realignment for %s%s with %s sectors, original"
-                            " offset %s, target alignment is %sK." %
-                            (p['disk_name'], d['numpart'], align_sectors,
-                             d['offset'], p['align']))
+                if align_sectors:
+                    # If partition is not aligned as required, we need
+                    # to move forward to the next alignment point
+                    align_sectors = (p['align'] * 1024 / self.sector_size) - align_sectors
 
-                # increase the offset so we actually start the partition on right alignment
-                d['offset'] += align_sectors
+                    msger.debug("Realignment for %s%s with %s sectors, original"
+                                " offset %s, target alignment is %sK." %
+                                (p['disk_name'], d['numpart'], align_sectors,
+                                 d['offset'], p['align']))
+
+                    # increase the offset so we actually start the partition on right alignment
+                    d['offset'] += align_sectors
 
             p['start'] = d['offset']
             d['offset'] += p['size']
-- 
1.9.0


