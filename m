Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E0961731A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 19:24:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2016 11:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,534,1444719600"; d="scan'208";a="885911542"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 11:24:43 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 11:24:27 -0800
Message-Id: <d1316b64c02b7e6263fb292f4fc30bff7200a71a.1452194521.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
References: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1452194521.git.randy.e.witt@linux.intel.com>
References: <cover.1452194521.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 3/3] populate_sdk_ext: Don't put nativesdk and crosssdk items in ext sdk
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
X-List-Received-Date: Thu, 07 Jan 2016 19:24:43 -0000

The nativesdk and crosssdk targets were only getting pulled into the
extensible sdk due to buildtools dependencies being in BB_TASKDEPDATA.
However the nativesdk and crosssdk targets are not needed for the
extensible sdk to be used.

This patch therefore removes them since it reduces the size of the
extensible sdks that include sstate by ~300MB.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 5c99bd0..ef014b8 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -173,6 +173,12 @@ python copy_buildsystem () {
     # Filter the locked signatures file to just the sstate tasks we are interested in
     allowed_tasks = ['do_populate_lic', 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa', 'do_deploy']
     excluded_targets = d.getVar('SDK_TARGETS', True)
+
+    # Since buildtools is included in the sdk, the nativesdk items and
+    # crosssdk end up in the tasks in locked-sigs.inc. However, the nativesdk
+    # and crosssdk items aren't needed for the extensible sdk to function so
+    # remove them from the list.
+    excluded_targets += 'nativesdk crosssdk'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
                                          excluded_targets.split(),
-- 
2.5.0


