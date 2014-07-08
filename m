Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 04FE265CC1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2014 07:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="540295622"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2014 07:52:01 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:54 -0500
Message-Id: <2bdfc41eabf5c876d0fe2f75584d3cb930b46539.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
References: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1404830754.git.tom.zanussi@linux.intel.com>
References: <cover.1404830754.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/5] wic: Print error if a partition specifies an invalid --source
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:09 -0000

If a partition specified in a .wks file specifies a nonexistent
--source, print an error to that effect and exit.  The error text also
points the user to a command listing valid sources, and help on adding
a new source plugin.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 6b575c0..75ad6ad 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -130,6 +130,11 @@ class Wic_PartData(Mic_PartData):
                                              native_sysroot)
             return
 
+        plugins = pluginmgr.get_source_plugins()
+
+        if self.source not in plugins:
+            msger.error("The '%s' --source specified for %s doesn't exist.\n\tSee 'wic list source-plugins' for a list of available --sources.\n\tSee 'wic help source-plugins' for details on adding a new source plugin." % (self.source, self.mountpoint))
+
         self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
         self._source_methods["do_configure_partition"](self, cr, cr_workdir,
                                                        oe_builddir,
-- 
1.8.3.1


