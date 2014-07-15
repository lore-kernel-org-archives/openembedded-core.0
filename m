Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B326C60D67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:44:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2014 08:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="543671708"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2014 08:43:46 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:38 -0500
Message-Id: <e25d490ce37196736b03574b7db299e2fc447958.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
References: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1405438752.git.tom.zanussi@linux.intel.com>
References: <cover.1405438752.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/5] wic: Error on zero-sized partitions
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
X-List-Received-Date: Tue, 15 Jul 2014 15:44:12 -0000

It doesn't make sense to create zero-sized partitions so assume user
error and notify the user they should be using a non-zero --size for
partitions that don't specify a --source.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 4662bdd..06f29a9 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -122,6 +122,8 @@ class Wic_PartData(Mic_PartData):
         partition command parameters.
         """
         if not self.source:
+            if not self.size:
+                msger.error("The %s partition has a size of zero.  Please specify a non-zero --size for that partition." % self.mountpoint)
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
-- 
1.8.3.1


