Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B34236A451
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006813"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:34 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:22 +0300
Message-Id: <a06016c6ef9e33fded9b99e0744bf7016804937e.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/7] core-image-minimal: do not remove packaging files in the rootfs postprocess
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
X-List-Received-Date: Thu, 23 May 2013 13:15:33 -0000

Since the removal of PM's meta-data was moved in image.bbclass, after
rootfs_*_do_rootfs() runs, there's no need to remove the files in rootfs
postprocess stage. Also, if the meta-data is removed then there's no way
we can save the postinstalls to /etc/(deb|ipk)-postinsts later.

For RPM, it doesn't really matter since the postinstalls are saved to
/etc/rpm-postinsts as soon as the postinstall fails.

[YOCTO #4484]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/images/core-image-minimal.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 0d2613e..0b56cc8 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -10,5 +10,3 @@ inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
 
-# remove not needed ipkg informations
-ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
1.7.9.5


