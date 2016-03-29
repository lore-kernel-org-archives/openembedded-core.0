Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 76B1660722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 10:58:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Mar 2016 03:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,410,1455004800"; d="scan'208";a="920898179"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2016 03:58:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id E406A6A4002;
	Tue, 29 Mar 2016 04:45:52 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 11:38:17 +0300
Message-Id: <1459240697-11343-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] oe-selftest: generate .env only in test_image_env
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
X-List-Received-Date: Tue, 29 Mar 2016 10:58:13 -0000

Most of wic functionality doesn't depend on .wicenv file,
so it's better to generate it only in test_image_env
test case where it's used.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 3829de2..56ce8c8 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -50,7 +50,7 @@ class Wic(oeSelfTest):
         if not Wic.image_is_ready:
             bitbake('syslinux syslinux-native parted-native gptfdisk-native '
                     'dosfstools-native mtools-native')
-            bitbake('core-image-minimal -c do_rootfs_wicenv')
+            bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
         rmtree(self.resultdir, ignore_errors=True)
@@ -199,6 +199,7 @@ class Wic(oeSelfTest):
     def test_image_env(self):
         """Test generation of <image>.env files."""
         image = 'core-image-minimal'
+        self.assertEqual(0, bitbake('%s -c do_rootfs_wicenv' % image).status)
         stdir = get_bb_var('STAGING_DIR_TARGET', image)
         imgdatadir = os.path.join(stdir, 'imgdata')
 
-- 
2.1.4


