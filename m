Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id CF08B73298
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 23:46:48 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 573FF8F; Tue, 10 Feb 2015 00:46:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 1E96D7E;
	Tue, 10 Feb 2015 00:46:49 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Tue, 10 Feb 2015 00:46:44 +0100
Message-Id: <1423525604-18344-5-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1423525604-18344-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] wic: add GPT support
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
X-List-Received-Date: Mon, 09 Feb 2015 23:46:52 -0000

Add GPT partition table support.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 87d2929f6c8a..162f8e1b9c6a 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -29,6 +29,9 @@ from wic.utils.oe.misc import *
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
 
+# Overhead of the GPT partitioning scheme
+GPT_OVERHEAD = 34
+
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
@@ -122,7 +125,7 @@ class Image:
 
         msger.debug("Assigning %s partitions to disks" % ptable_format)
 
-        if ptable_format not in ('msdos'):
+        if ptable_format not in ('msdos', 'gpt'):
             raise ImageError("Unknown partition table format '%s', supported " \
                              "formats are: 'msdos'" % ptable_format)
 
@@ -156,6 +159,8 @@ class Image:
             if d['numpart'] == 1:
                 if ptable_format == "msdos":
                     overhead = MBR_OVERHEAD
+                elif ptable_format == "gpt":
+                    overhead = GPT_OVERHEAD
 
                 # Skip one sector required for the partitioning scheme overhead
                 d['offset'] += overhead
@@ -214,6 +219,8 @@ class Image:
         # minumim disk sizes.
         for disk_name, d in self.disks.items():
             d['min_size'] = d['offset']
+            if d['ptable_format'] == "gpt":
+                d['min_size'] += GPT_OVERHEAD
 
             d['min_size'] *= self.sector_size
 
-- 
2.1.0


