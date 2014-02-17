Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7667F6E904
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:59:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Feb 2014 06:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,861,1384329600"; d="scan'208";a="482948893"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2014 06:59:28 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 98AB26A4083;
	Mon, 17 Feb 2014 06:59:19 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 17:09:13 +0100
Message-Id: <1392653353-3395-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] oe-selftest: Fixed "test_rm_old_image" that was outdated
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
X-List-Received-Date: Mon, 17 Feb 2014 14:59:29 -0000

This test used the old format of IMAGE_LINK_NAME that used to contain DATETIME information.
Now it uses IMAGE_LINK_NAME and DATETIME variables to determine the path to the image.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index ef6579b..9a22c06 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -26,7 +26,8 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("core-image-minimal")
         deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
         imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
-        oldimgpath = os.path.realpath(os.path.join(deploydir, imagename + ".ext3"))
+        datetime = get_bb_var("DATETIME", target="core-image-minimal")
+        oldimgpath = os.path.realpath(os.path.join(deploydir, imagename + '-' + datetime + ".rootfs.ext3"))
         self.append_config("RM_OLD_IMAGE = \"1\"")
         bitbake("core-image-minimal")
         self.assertFalse(os.path.exists(oldimgpath), msg="Old image path still exists: %s" % oldimgpath)
-- 
1.7.9.5


