Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5716AC47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 15:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="598625660"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2014 15:04:32 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:20 -0500
Message-Id: <3bbbd217adc6513036373df284b08651fcec1db0.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
References: <92a50f084bc31cb2824d01435737b85be99f0d1d.1414618765.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/6] wic: Use overhead factor when creating partitions from rootfs directories
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:34 -0000

When creating partitions sized to given rootfs directories, filesystem
creation could fail in cases where the calculated target partition
size was too small to contain the filesystem created using mkfs.  This
occurred in particular when creating partitions to contain very large
filesystems such as those containing sdk image artifacts.

This same limition is present in the oe-core image creation classes,
which can be readily see by changing IMAGE_OVERHEAD_FACTOR from the
default 1.3 to 1.0 and building a sato-sdk image.

It should be possible to calculate required sizes exactly given the
source rootfs and target filesystem types, but for now, to address the
specific problem users are hitting in such situations, we'll just do
exactly what oe-core does and define and use an IMAGE_OVERHEAD_FACTOR
or 1.3 in those cases.

Fixes [YOCTO #6863].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 2 ++
 scripts/lib/wic/utils/oe/misc.py                       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 3950b43..54a494e 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -229,6 +229,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = IMAGE_EXTRA_SPACE
 
         rootfs_size = actual_rootfs_size + extra_blocks
+        rootfs_size *= IMAGE_OVERHEAD_FACTOR
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
@@ -276,6 +277,7 @@ class Wic_PartData(Mic_PartData):
             extra_blocks = IMAGE_EXTRA_SPACE
 
         rootfs_size = actual_rootfs_size + extra_blocks
+        rootfs_size *= IMAGE_OVERHEAD_FACTOR
 
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, rootfs_size))
diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index aa9b235..b0b5baa 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -123,6 +123,7 @@ def add_wks_var(key, val):
 
 BOOTDD_EXTRA_SPACE = 16384
 IMAGE_EXTRA_SPACE = 10240
+IMAGE_OVERHEAD_FACTOR = 1.3
 
 __bitbake_env_lines = ""
 
-- 
1.9.3


