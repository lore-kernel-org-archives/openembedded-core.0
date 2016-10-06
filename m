Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 678C16078D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:59:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Oct 2016 03:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="887303557"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Oct 2016 03:59:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 85E656A4082;
	Thu,  6 Oct 2016 03:59:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 13:33:35 +0300
Message-Id: <1f8ac841fc0520358be1a4f7d8e091904722284b.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
Cc: Saul Wold <saul.wold@intel.com>
Subject: [wic][PATCH 1/4] wic: set PARTUUID only for gpt partition table
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
X-List-Received-Date: Thu, 06 Oct 2016 10:59:33 -0000

sgdisk fails to set PARTUUID for msdos partitions as it's only
supported for GPT partitions.

Checked partition table format to run sgdisk --partition-guid
only for GPT partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index cafb933..8d93a68 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -299,7 +299,7 @@ class Image():
                                          (part['num'], part['part_type'],
                                           disk['disk'].device), self.native_sysroot)
 
-            if part['uuid']:
+            if part['uuid'] and disk['ptable_format'] == "gpt":
                 msger.debug("partition %d: set UUID to %s" % \
                             (part['num'], part['uuid']))
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-- 
2.1.4


