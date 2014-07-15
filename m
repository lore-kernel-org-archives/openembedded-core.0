Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1CD70641
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:43:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2014 08:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="457235042"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2014 08:43:40 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:34 -0500
Message-Id: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1405438752.git.tom.zanussi@linux.intel.com>
References: <cover.1405438752.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/5] wic: Error on parted non-zero error code
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
X-List-Received-Date: Tue, 15 Jul 2014 15:43:40 -0000

The current code uses msger.debug() to note errors, effectively
squelching them if --debug isn't used.  Apparently this is because it
can return non-zero for some loop device failures.  We don't care
about loop devices, and not paying attention to the error code
actually results in invalid images, so error out on parted failures as
we should be.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/partitionedfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 6607466..593cf1f 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -272,7 +272,7 @@ class PartitionedMount(Mount):
             # parted always fails to reload part table with loop devices. This
             # prevents us from distinguishing real errors based on return
             # code.
-            msger.debug("WARNING: parted returned '%s' instead of 0" % rc)
+            msger.error("WARNING: parted returned '%s' instead of 0 (use --debug for details)" % rc)
 
     def __create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
-- 
1.8.3.1


