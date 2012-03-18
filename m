Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S9903-0004Fq-Us
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 06:49:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Mar 2012 22:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120250386"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by azsmga001.ch.intel.com with ESMTP; 17 Mar 2012 22:41:00 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Sun, 18 Mar 2012 13:41:24 +0800
Message-Id: <401c27ba4e7f8b5bc0da084cd48d1738157c894b.1332049148.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1332049148.git.dexuan.cui@intel.com>
References: <cover.1332049148.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1332049148.git.dexuan.cui@intel.com>
References: <cover.1332049148.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] self-hosted-image: pre-populate the builder user with poky source
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Mar 2012 05:49:52 -0000

[YOCTO #2065]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index d56c2cb..7f5173a 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r5"
+PR = "r6"
 
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
@@ -21,3 +21,24 @@ APPEND += "quiet"
 IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
+
+SRCREV = "26a46938d3ea1821e7bec4fa6cc8379babad238b"
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
+
+fakeroot do_populate_poky_src () {
+    # Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
+    # will become invalid in the target.
+    rm -rf ${WORKDIR}/git/.git
+    rm -f ${WORKDIR}/git/.gitignore
+
+    cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+    chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
+}
+
+IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
+
+python do_get_poky_src () {
+    bb.build.exec_func('base_do_fetch', d)
+    bb.build.exec_func('base_do_unpack', d)
+}
+addtask do_get_poky_src before do_rootfs
-- 
1.7.6



