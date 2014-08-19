Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 261B46FE55
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 4B19C3FC813;
	Tue, 19 Aug 2014 15:14:37 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 15:14:17 +0200
Message-Id: <1408454058-2192-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1408454058-2192-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1408454058-2192-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/2] wic: do not steal sectors from the first partition
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

In order to make up for space loss due to overhead located before the
first partition, same amount of bytes was extracted from the first
partition's size. This leads to unexpected change of first partition's
size, and is not matched by similar adjustment at the time the partition
image is generated. Thus it is possible that the first partition may
partially overwrite contents of the following partition, as the
partition image is larger than the allocated space.

This is also problematic on certain platforms such as OMAP, where the
first partition is required for have an even number of
sectors (typically already expressed by --size in kickstart
file). Subtracting an odd number of sectors lost for overhead, leads to
an odd number of sectors assigned for partition, preventing the board,
such as beaglebone, from booting correctly.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 76aa421..36ef406 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -155,9 +155,6 @@ class Image:
 
                 # Skip one sector required for the partitioning scheme overhead
                 d['offset'] += overhead
-                # Steal few sectors from the first partition to offset for the
-                # partitioning overhead
-                p['size'] -= overhead
 
             if p['align']:
                 # If not first partition and we do have alignment set we need
-- 
1.9.0


