Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D21A731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:14:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 28 Jun 2016 20:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="1007165027"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2016 20:14:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:13:51 +1200
Message-Id: <ee31a5dbc1f2fe6e7d8e459865c18d6c0f4267d8.1467169999.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467169999.git.paul.eggleton@linux.intel.com>
References: <cover.1467169999.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467169999.git.paul.eggleton@linux.intel.com>
References: <cover.1467169999.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_ext: ensure tasks to build the image are included
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
X-List-Received-Date: Wed, 29 Jun 2016 03:14:04 -0000

If you build an extensible SDK for an image and IMAGE_FSTYPES includes
"live" then the extensible SDK will fail to install with a bunch of
unexpected task execution errors, matching the missing items required to
build the live image. The issue was we were still depending on do_rootfs
rather than do_image_complete. The fix was slightly more complicated
than just changing the task name as do_image_complete's dependencies are
in the form of dependencies on tasks within the same recipe (represented
in the "deps" varflag rather than the "depends" varflag).

Fixes [YOCTO #9826].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index b9d9543..f68cee6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -447,7 +447,13 @@ fakeroot python do_populate_sdk_ext() {
 }
 
 def get_ext_sdk_depends(d):
-    return d.getVarFlag('do_rootfs', 'depends', True) + ' ' + d.getVarFlag('do_build', 'depends', True)
+    # Note: the deps varflag is a list not a string, so we need to specify expand=False
+    deps = d.getVarFlag('do_image_complete', 'deps', False)
+    pn = d.getVar('PN', True)
+    deplist = ['%s:%s' % (pn, dep) for dep in deps]
+    for task in ['do_image_complete', 'do_rootfs', 'do_build']:
+        deplist.extend((d.getVarFlag(task, 'depends', True) or '').split())
+    return ' '.join(deplist)
 
 python do_sdk_depends() {
     # We have to do this separately in its own task so we avoid recursing into
-- 
2.5.5


