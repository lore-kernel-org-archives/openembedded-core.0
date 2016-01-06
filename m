Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 316BA731F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:15:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jan 2016 14:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,530,1444719600"; d="scan'208";a="854932598"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2016 14:15:57 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 14:15:50 -0800
Message-Id: <937d3f9a89c8451a999e0a3c93cdd8dcaa15915d.1452118391.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <ba0f9159197a8f0af61c637a5f4fdf024a2dbab0.1452118391.git.randy.e.witt@linux.intel.com>
References: <ba0f9159197a8f0af61c637a5f4fdf024a2dbab0.1452118391.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1452118391.git.randy.e.witt@linux.intel.com>
References: <cover.1452118391.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] populate_sdk_ext: Don't put nativesdk and crosssdk items in ext sdk
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
X-List-Received-Date: Wed, 06 Jan 2016 22:15:56 -0000

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
index c30181a..60467b9 100644
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
                                          excluded_targets,
-- 
2.5.0


