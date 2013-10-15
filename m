Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DE4986D143
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:47:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Oct 2013 14:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,502,1378882800"; d="scan'208";a="375213323"
Received: from unknown (HELO localhost) ([10.255.15.226])
	by azsmga001.ch.intel.com with ESMTP; 15 Oct 2013 14:46:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Tue, 15 Oct 2013 14:46:23 -0700
Message-Id: <1381f3f71df0a605f65231cfced4fdbaaf5c76d2.1381869082.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1381869082.git.dvhart@linux.intel.com>
References: <cover.1381869082.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1381869082.git.dvhart@linux.intel.com>
References: <cover.1381869082.git.dvhart@linux.intel.com>
Subject: [PATCH 1/2] wic: Force lba off for FAT16 partitions
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
X-List-Received-Date: Tue, 15 Oct 2013 21:47:06 -0000

If fat16 is specified to the mkpart parted command, parted will
default to setting the lba flag which causes certain EFI firmware
to fail to detect the filesystem. lba shouldn't be necessary for
FAT16 filesystems anyway, explicitly disable it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/lib/mic/utils/partitionedfs.py |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index e8cded2..59263ba 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -352,6 +352,16 @@ class PartitionedMount(Mount):
                 self.__run_parted(["-s", d['disk'].device, "set",
                                    "%d" % p['num'], flag_name, "on"])
 
+            # Parted defaults to enabling the lba flag for fat16 partitions,
+            # which causes compatibility issues with some firmware (and really
+            # isn't necessary).
+            if parted_fs_type == "fat16":
+                if d['ptable_format'] == 'msdos':
+                    msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
+                                (p['num'], d['disk'].device))
+                    self.__run_parted(["-s", d['disk'].device, "set",
+                                       "%d" % p['num'], "lba", "off"])
+
         # If the partition table format is "gpt", find out PARTUUIDs for all
         # the partitions. And if users specified custom parition type UUIDs,
         # set them.
-- 
1.7.9.5


