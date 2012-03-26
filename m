Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SC3qn-0003s4-Iu
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:56:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2012 23:47:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133089927"
Received: from unknown (HELO localhost.localdomain) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2012 23:47:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:47:04 -0700
Message-Id: <5df41aac833e3aabd32d7c2d96702f55bde131ca.1332744104.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
Subject: [Build App RFC 1/5] self-hosted-image: pre-populate the builder user with poky source
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
X-List-Received-Date: Mon, 26 Mar 2012 06:56:21 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

This patch installs the poky source into the /home/builder/poky/ of the
self-hosted-image.
This makes the user of self-hosted-image easier to start a build.

I think the recent poky master is stable enough, so I specify
a commit number by SRCREV -- we may want to update this number before
releasing 1.2.

This patch fixes [YOCTO #2065]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

Added code for supporting target based pseudo
fixed indentation

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   41 +++++++++++++++++++++++-
 1 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index d56c2cb..5aa670d 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r5"
+PR = "r6"
 
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
@@ -13,7 +13,10 @@ CORE_IMAGE_EXTRA_INSTALL = "\
 IMAGE_FEATURES += "x11-mini package-management"
 
 # Ensure there's enough space to do a core-image-minimal build, with rm_work enabled
-IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
+IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
+#IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
+#IMAGE_ROOTFS_EXTRA_SPACE = "20971520"
+#IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
 
 # Do a quiet boot with limited console messages
 APPEND += "quiet"
@@ -21,3 +24,37 @@ APPEND += "quiet"
 IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
+
+SRCREV = "26a46938d3ea1821e7bec4fa6cc8379babad238b"
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
+
+fakeroot do_populate_poky_src () {
+	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
+	# will become invalid in the target.
+	rm -rf ${WORKDIR}/git/.git
+	rm -f ${WORKDIR}/git/.gitignore
+
+	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
+	cp -Rp ${DL_DIR} ${IMAGE_ROOTFS}/home/builder/poky/build
+	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
+	echo "BB_NO_NETWORK = \"1\"" > ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
+	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
+        mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
+        echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+        echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+        echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+
+        chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
+
+	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
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
1.7.7.6



