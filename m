Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E562370034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 22:16:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2016 15:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,560,1473145200"; d="scan'208";a="25327870"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga004.jf.intel.com with ESMTP; 28 Oct 2016 15:16:12 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 15:14:56 -0700
Message-Id: <1477692896-5783-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] build-appliance-image: Fix incorrect PATH
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
X-List-Received-Date: Fri, 28 Oct 2016 22:16:12 -0000

When modifying the PATH variable in .bashrc, double quote characters
were used, resulting in expanding the variable $PATH with the value of
PATH of the system building the Build Appliance.

The original intent was to enter an un-expanded (literal) $PATH.
In order to that, one must use single quotes instead of double quotes.

[YOCTO#10434] [YOCTO#10504]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 9d898b4..5bb6555 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -63,7 +63,7 @@ fakeroot do_populate_poky_src () {
 	# Also save (for reference only) the actual SRCREV used to create this image
 	echo "export BA_SRCREV=${SRCREV}" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-	echo "export PATH=$PATH:/sbin" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo 'export PATH=$PATH:/sbin' >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
 	echo "# If working behind a proxy and using the provided oe-git-proxy script" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-- 
2.7.4


