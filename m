Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99E9660C19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:36:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2014 18:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="557165654"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2014 18:35:46 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:38 -0500
Message-Id: <a044a69b57c58eae68b9f66bf01879851019c420.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
References: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/7] wic: Parse and pass sourceparams to partition plugin methods
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
X-List-Received-Date: Tue, 12 Aug 2014 01:36:01 -0000

Add code to parse the sourceparams and pass them to the partition
plugin methods.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 76cf7a9..a3d5ef3 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -126,6 +126,11 @@ class Wic_PartData(Mic_PartData):
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
+        self.sourceparams_dict = {}
+
+        if self.sourceparams:
+            self.sourceparams_dict = parse_sourceparams(self.sourceparams)
+
         if not self.source:
             if not self.size:
                 msger.error("The %s partition has a size of zero.  Please specify a non-zero --size for that partition." % self.mountpoint)
@@ -143,16 +148,19 @@ class Wic_PartData(Mic_PartData):
             msger.error("The '%s' --source specified for %s doesn't exist.\n\tSee 'wic list source-plugins' for a list of available --sources.\n\tSee 'wic help source-plugins' for details on adding a new source plugin." % (self.source, self.mountpoint))
 
         self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
-        self._source_methods["do_configure_partition"](self, None, cr, cr_workdir,
+        self._source_methods["do_configure_partition"](self, self.sourceparams_dict,
+                                                       cr, cr_workdir,
                                                        oe_builddir,
                                                        bootimg_dir,
                                                        kernel_dir,
                                                        native_sysroot)
-        self._source_methods["do_stage_partition"](self, None, cr, cr_workdir,
+        self._source_methods["do_stage_partition"](self, self.sourceparams_dict,
+                                                   cr, cr_workdir,
                                                    oe_builddir,
                                                    bootimg_dir, kernel_dir,
                                                    native_sysroot)
-        self._source_methods["do_prepare_partition"](self, None, cr, cr_workdir,
+        self._source_methods["do_prepare_partition"](self, self.sourceparams_dict,
+                                                     cr, cr_workdir,
                                                      oe_builddir,
                                                      bootimg_dir, kernel_dir, rootfs_dir,
                                                      native_sysroot)
-- 
1.8.3.1


