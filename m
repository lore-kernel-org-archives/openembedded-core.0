Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGco-00025J-Pz
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2012 15:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154859733"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 15:02:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:02:13 -0700
Message-Id: <966be26ed8f5c76adc6872395a625f990fcfbb04.1334700068.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] self-hosted-image: remove BB_NO_NETWORK and update Poky SRCREV
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:51 -0000

Remove BB_NO_NETWORK because we can not guarentee that all
downloads will be available in the self-hosted image for
the possible targets being built.  If this image is run with
out networking, failures may be seen and BB_NO_NETWORK
should be set via the Hob

Update the Poky SRCREV so it has the latest set of fixes and
patches.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 46e7209..fbcdf4c 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r11"
+PR = "r12"
 
 IMAGE_FEATURES += "x11-mini package-management"
 
@@ -19,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV = "8691a588267472eb5a32b978a0eb9ddfd0c91733"
+SRCREV = "20ff9db92165e6d16897671d2b1d370661962712"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
 
 IMAGE_CMD_ext3_append () {
@@ -43,7 +43,6 @@ fakeroot do_populate_poky_src () {
 	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
 
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
-	echo "BB_NO_NETWORK = \"1\"" > ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
 	echo "export PSEUDO_PREFIX=/usr" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
-- 
1.7.7.6



