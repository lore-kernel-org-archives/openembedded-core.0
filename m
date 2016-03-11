Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 026DE65C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:13:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Mar 2016 04:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="931715572"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2016 04:13:40 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 12:13:32 +0000
Message-Id: <1457698412-11233-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457698412-11233-1-git-send-email-joshua.g.lock@intel.com>
References: <1457698412-11233-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] build-appliance: make the inclusion of downloaded sources optional
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
X-List-Received-Date: Fri, 11 Mar 2016 12:13:40 -0000

Including the entirety of DL_DIR in the generated build appliance
image adds a significant amount of space and makes the build
appliance image more awkward to distribute. Add a configuration
option to make the inclusion of sources option and default to
disabling this functionality.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/images/build-appliance-image_14.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index 8f9ce1b..61f69f4 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
           "
+BA_INCLUDE_SOURCES ??= "0"
 
 IMAGE_CMD_ext4_append () {
 	# We don't need to reserve much space for root, 0.5% is more than enough
@@ -42,7 +43,9 @@ fakeroot do_populate_poky_src () {
 
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
-	cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+	if [ ${BA_INCLUDE_SOURCES} != 0 ]; then
+		cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+	fi
 
 	# Remove the git2_* tarballs -- this is ok since we still have the git2/.
 	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
-- 
2.5.0


