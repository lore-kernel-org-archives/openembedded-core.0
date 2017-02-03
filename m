Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE8871E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 15:21:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 03 Feb 2017 07:21:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,329,1477983600"; d="scan'208";a="1090511130"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2017 07:20:42 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0D1B16A4082;
	Fri,  3 Feb 2017 07:19:41 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 16:58:15 +0200
Message-Id: <1486133895-18596-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest: wic: use wic-tools recipe to get STAGING_DIR
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
X-List-Received-Date: Fri, 03 Feb 2017 15:21:12 -0000

STAGING_DIR variable is used to get path to a boot dir.
It's better to use wic-tools recipe to it as it contains
all bootloader artifacts.

Modified test_build_artifacts and test_rootfs_artifacts to
use wic-tools target to get STAGING_DIR.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 39ec5a2..417ba3d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -212,9 +212,12 @@ class Wic(oeSelfTest):
     @testcase(1212)
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
-                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
-        bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        variables = (('STAGING_DATADIR', 'wic-tools'),
+                     ('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
+                     ('DEPLOY_DIR_IMAGE', 'core-image-minimal'),
+                     ('IMAGE_ROOTFS', 'core-image-minimal'))
+        bbvars = {var.lower(): get_bb_var(var, recipe) \
+                      for var, recipe in variables}
         bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create directdisk "
                         "-b %(staging_datadir)s "
@@ -318,9 +321,12 @@ class Wic(oeSelfTest):
     @testcase(1269)
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
-                      for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'))
-        bbvars['recipe_sysroot_native'] = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+        variables = (('STAGING_DATADIR', 'wic-tools'),
+                     ('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
+                     ('DEPLOY_DIR_IMAGE', 'core-image-minimal'),
+                     ('IMAGE_ROOTFS', 'core-image-minimal'))
+        bbvars = {var.lower(): get_bb_var(var, recipe) \
+                      for var, recipe in variables}
         bbvars['wks'] = "directdisk-multi-rootfs"
         bbvars['resultdir'] = self.resultdir
         status = runCmd("wic create %(wks)s "
-- 
2.1.4


