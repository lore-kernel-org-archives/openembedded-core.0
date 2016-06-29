Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 765F06FF6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:14:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 28 Jun 2016 20:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="1007165062"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2016 20:14:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:13:52 +1200
Message-Id: <aa9884cb82fc31f73b9f37907a59fdd106338b08.1467169999.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467169999.git.paul.eggleton@linux.intel.com>
References: <cover.1467169999.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467169999.git.paul.eggleton@linux.intel.com>
References: <cover.1467169999.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/populate_sdk_ext: exclude initramfs images from locked signatures
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
X-List-Received-Date: Wed, 29 Jun 2016 03:14:06 -0000

Tasks for image recipes cannot be locked - there's nothing to restore
from shared state to cover them and as a result, if you had "live" in
IMAGE_FSTYPES the build would fail with "taskhash mismatch" errors for
do_rootfs and do_image_complete for the initramfs image recipe, since it
had to try to run those. We should probably catch that issue earlier in
the build and produce a proper error, but for now at least exclude these
signatures from the locked-sigs.inc file so that extensible SDK
installers built when IMAGE_FSTYPES includes "live". (It turned out we
already had code to find other image tasks in the task list in order to
generate the list of install targets.)

Follow-up fix for [YOCTO #9826].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f68cee6..23dedae 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -39,7 +39,7 @@ SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
 
-def get_sdk_install_targets(d):
+def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
     if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
         sdk_install_targets = d.getVar('SDK_TARGETS', True)
@@ -50,8 +50,9 @@ def get_sdk_install_targets(d):
                 if v[0] not in sdk_install_targets:
                     sdk_install_targets += ' {}'.format(v[0])
 
-    if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
-        sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
+    if not images_only:
+        if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
+            sdk_install_targets += ' meta-world-pkgdata:do_allpackagedata'
 
     return sdk_install_targets
 
@@ -280,7 +281,7 @@ python copy_buildsystem () {
             f.write('\n')
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
-    excluded_targets = d.getVar('SDK_TARGETS', True)
+    excluded_targets = get_sdk_install_targets(d, images_only=True)
     sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs([],
-- 
2.5.5


