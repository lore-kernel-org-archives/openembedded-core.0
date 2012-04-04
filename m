Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFRkO-0001U1-Gt
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 17:03:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2012 07:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128625970"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2012 07:54:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 07:54:32 -0700
Message-Id: <1333551272-31780-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] self-hosted-image: Increase space for build and allow builder user sudo access
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
X-List-Received-Date: Wed, 04 Apr 2012 15:03:44 -0000

We need to have about 40G to do a full sato build even with rm_work enabled
Add sudo priveleges inorder to allow the builder user to setup the tap/tun
devices needed by runqemu

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 2822189..1db6a7a 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,15 +4,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r8"
+PR = "r9"
 
 IMAGE_FEATURES += "x11-mini package-management"
 
-# Ensure there's enough space to do a core-image-minimal build, with rm_work enabled
-IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
-#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
-#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
-#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
+# Ensure there's enough space to do a core-image-sato build, with rm_work enabled
+IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
 # Do a quiet boot with limited console messages
 APPEND += "quiet"
@@ -50,6 +47,9 @@ fakeroot do_populate_poky_src () {
 	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
 
 	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
+
+	# Allow builder to use sudo to setup tap/tun
+	echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
-- 
1.7.7.6



