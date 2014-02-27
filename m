Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CBE7C6F273
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 11:50:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 03:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,554,1389772800"; d="scan'208";a="463380639"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 03:50:06 -0800
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 34C846A4083;
	Thu, 27 Feb 2014 03:49:56 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 15:53:16 +0200
Message-Id: <1393509196-26371-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] oe-selftest: Fix for test_rm_old_image
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
X-List-Received-Date: Thu, 27 Feb 2014 11:50:31 -0000

After recent changes in poky this test was not working as it should.
This commit fixes and improves the test logic.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index ef6579b..93b02cf 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -26,10 +26,16 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("core-image-minimal")
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
-        oldimgpath = os.path.realpath(os.path.join(deploydir, imagename + ".ext3"))
+        deploydir_files = os.listdir(deploydir)
+        track_original_files = []
+        for image_file in deploydir_files:
+            if imagename in image_file and os.path.islink(os.path.join(deploydir, image_file)):
+                track_original_files.append(os.path.realpath(os.path.join(deploydir, image_file)))
         self.append_config("RM_OLD_IMAGE = \"1\"")
-        bitbake("core-image-minimal")
-        self.assertFalse(os.path.exists(oldimgpath), msg="Old image path still exists: %s" % oldimgpath)
+        bitbake("-C rootfs core-image-minimal")
+        deploydir_files = os.listdir(deploydir)
+        remaining_not_expected = [path for path in track_original_files if os.path.basename(path) in deploydir_files]
+        self.assertFalse(remaining_not_expected, msg="\nThe following image files ware not removed: %s" % ', '.join(map(str, remaining_not_expected)))
 
     def test_ccache_tool(self):
         bitbake("ccache-native")
-- 
1.8.3.2


