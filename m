Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.7104.1616377330378296391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gBS0rJLmuH1Xaac5ExJLhUtQ+oDz1hR21tzH6HubBw8qEd47Cy77YmgJqk1VWHW27oUZVJ+RDz
 cTW68CpkJw/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211708"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:10 -0700
IronPort-SDR: Oj651FpLWrAYGI9A6Ohtv3QBsfPEUqoNy8Zja6lMJWEBM5byIxWd7v7jSqFkgz6MzJg1ZuhLsC
 3XWLIL28rUAA==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295303"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:42:09 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/25] build-appliance-image: Drop kernel module handling
Date: Mon, 22 Mar 2021 09:41:27 +0800
Message-Id: <bb60d68c0cc8b2d1884e8d68966dffc563454c74.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

kernel-devsrc is a dependency of the image so we no longer need the symlink
creation code or the module-base inherit/dependency as it is included in
that recipe. The KERNEL_VERSION usage was broken anyway as the module
usage would have needed a:

do_image[depends] += "build-appliance-image:do_configure"

which wasn't present so it was indeterminate if KERNEL_VERSION was set
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a46b43bb67b2f87ec370480e50a2e2d111555b75)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index ce73592fd3..15cb45e7a4 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -22,7 +22,7 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "wic.vmdk"
 
-inherit core-image module-base setuptools3
+inherit core-image setuptools3
 
 SRCREV ?= "3bd4bf96cce57d3e9286f75c0f12c8b36d706a1c"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=gatesgarth \
@@ -61,12 +61,6 @@ fakeroot do_populate_poky_src () {
 	# Place the README_VirtualBox_Toaster file in builders home folder.
 	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
-	# Create a symlink, needed for out-of-tree kernel modules build
-	if [ ! -e ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build ]; then
-		rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-		lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-	fi
-
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
-- 
2.30.2

