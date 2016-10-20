Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EA08771B4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 16:55:22 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 20 Oct 2016 09:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,371,1473145200"; d="scan'208";a="21844935"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 20 Oct 2016 09:55:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 09:54:23 -0700
Message-Id: <1476982463-22359-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com
Subject: [PATCH] build-appliance-image: add /sbin to PATH
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
X-List-Received-Date: Thu, 20 Oct 2016 16:55:24 -0000

runqemu script fails with an error when executed in Build Appliance.

Typical use case:

$ bitbake core-image-minimal
$ runqemu qemux86

Observed error:

    runqemu - ERROR - In order for this script to dynamically infer paths
         ...snip...
         runqemu-ifup, runqemu-ifdown or ip not found

The error is caused by the fact that "ip" is located in /sbin, however /sbin is
not in user's ("builder") PATH. To fix this we add /sbin to PATH.
The simplest place to do this is in user's .bashrc.

[YOCTO#10434]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f935782..b5720b3 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -63,6 +63,9 @@ fakeroot do_populate_poky_src () {
 	# Also save (for reference only) the actual SRCREV used to create this image
 	echo "export BA_SRCREV=${SRCREV}" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "export PATH=$PATH:/sbin" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+
 	echo "# If working behind a proxy and using the provided oe-git-proxy script" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "# you need to set ALL_PROXY based on your proxy settings." >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "# Example ALL_PROXY values:" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-- 
2.7.4


