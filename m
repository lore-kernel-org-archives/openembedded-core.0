Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A9E65719A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:30:56 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 06 Feb 2017 12:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="61869047"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2017 12:30:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:30:50 +1300
Message-Id: <8cb42f39f3a882e51a0456278ae5ebe31997e28a.1486412900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486412900.git.paul.eggleton@linux.intel.com>
References: <cover.1486412900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/populate_sdk_ext: account for custom image tasks
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
X-List-Received-Date: Mon, 06 Feb 2017 20:30:56 -0000

Any custom tasks that were added on the image between do_image_complete
and do_build were not being taken into account. Use the newly added
bb.build.tasksbetween() function to take care of that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4eda06b..95b3d23 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -45,8 +45,10 @@ def get_sdk_install_targets(d, images_only=False):
         sdk_install_targets = d.getVar('SDK_TARGETS')
 
         depd = d.getVar('BB_TASKDEPDATA', False)
+        tasklist = bb.build.tasksbetween('do_image_complete', 'do_build', d)
+        tasklist.remove('do_build')
         for v in depd.values():
-            if v[1] == 'do_image_complete':
+            if v[1] in tasklist:
                 if v[0] not in sdk_install_targets:
                     sdk_install_targets += ' {}'.format(v[0])
 
@@ -630,7 +632,9 @@ def get_ext_sdk_depends(d):
     deps = d.getVarFlag('do_image_complete', 'deps', False)
     pn = d.getVar('PN')
     deplist = ['%s:%s' % (pn, dep) for dep in deps]
-    for task in ['do_image_complete', 'do_rootfs', 'do_build']:
+    tasklist = bb.build.tasksbetween('do_image_complete', 'do_build', d)
+    tasklist.append('do_rootfs')
+    for task in tasklist:
         deplist.extend((d.getVarFlag(task, 'depends') or '').split())
     return ' '.join(deplist)
 
-- 
2.9.3


