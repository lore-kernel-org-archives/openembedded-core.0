Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30CBE75C81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:52:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="516462890"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2015 01:52:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E29316A4005;
	Tue, 30 Jun 2015 01:52:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:35 +0300
Message-Id: <1435654312-18177-4-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 03/20] wic: Test rootfs plugin using rootfs paths
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
X-List-Received-Date: Tue, 30 Jun 2015 08:52:48 -0000

Added testcase to create multi-rootfs images using rootfs plugin
with paths to rootfs directories in wic command line.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3cfc2ff..0c503ef 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -143,3 +143,20 @@ class Wic(oeSelfTest):
                                    "--rootfs rootfs2=core-image-minimal" \
                                    % wks).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
+
+    def test17_rootfs_artifacts(self):
+        """Test usage of rootfs plugin with rootfs paths"""
+        vars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
+                        for var in ('STAGING_DATADIR', 'DEPLOY_DIR_IMAGE',
+                                    'STAGING_DIR_NATIVE', 'IMAGE_ROOTFS'))
+        vars['wks'] = "directdisk-multi-rootfs"
+        status = runCmd("wic create %(wks)s "
+                        "-b %(staging_datadir)s "
+                        "-k %(deploy_dir_image)s "
+                        "-n %(staging_dir_native)s "
+                        "--rootfs-dir rootfs1=%(image_rootfs)s "
+                        "--rootfs-dir rootfs2=%(image_rootfs)s" \
+                        % vars).status
+        self.assertEqual(0, status)
+        self.assertEqual(1, len(glob(self.resultdir + \
+                                     "%(wks)s-*.direct" % vars)))
-- 
2.1.4


