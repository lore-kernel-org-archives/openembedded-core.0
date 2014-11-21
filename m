Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F373272160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:08:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Nov 2014 08:07:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="611866806"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2014 08:07:57 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:48 -0600
Message-Id: <b2e35996375ed33804f46bdc6f89f4e8c52d4421.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
References: <db14e81d99065b4381af1878a856f4933a0aa9c5.1416585198.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/6][dizzy] wic: Use overhead factor when creating partitions from rootfs directories
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
X-List-Received-Date: Fri, 21 Nov 2014 16:08:40 -0000

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

(From OE-Core rev: bbaef3ff5833fc1d97b7b028d7770834f62789da)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


