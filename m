Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SENVf-0008GO-E8
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 18:20:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Apr 2012 09:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136280131"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2012 09:09:54 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2012 00:10:10 +0800
Message-Id: <9297f6eddc4fc0e5e7faf75205dda31decf55553.1333295123.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333295122.git.dexuan.cui@intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
Subject: [PATCH 2/5] self-hosted-image: improve do_populate_poky_src
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
X-List-Received-Date: Sun, 01 Apr 2012 16:20:07 -0000

1) remove the assumption ${DL_DIR} ends with downloads/.
Thanks Paul Eggleton for pointing this out.

2) remove downloads/git2_* tarballs to speed up the rootfs creation.
This is ok since we still have the git2/.
Thanks Richard Purdie for suggesting this.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 5aa670d..e962f30 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r6"
+PR = "r7"
 
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
@@ -37,7 +37,12 @@ fakeroot do_populate_poky_src () {
 	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
 
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
-	cp -Rp ${DL_DIR} ${IMAGE_ROOTFS}/home/builder/poky/build
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
+	cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+
+	# Remove the git2_* tarballs -- this is ok since we still have the git2/.
+	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
+
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "BB_NO_NETWORK = \"1\"" > ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
-- 
1.7.6



