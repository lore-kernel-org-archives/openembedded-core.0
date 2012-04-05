Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFr03-0007vZ-LH
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 20:01:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 10:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85766028"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.33])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 10:51:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 18:51:05 +0100
Message-Id: <684cc5a674151ccbe1214dc27a79db62c0e8218e.1333648154.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] self-hosted-image: decrease reserved space to 0.5%
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
X-List-Received-Date: Thu, 05 Apr 2012 18:01:36 -0000

The default amount of reserved space for ext2/3 is 5% - this amounts to
about 2GB of a 40GB filesystem that the builder user can't make use of.
We don't need this much reserved so peg it back to 0.5% which should be
more than enough.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index d8f4162..2a21967 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r9"
+PR = "r10"
 
 IMAGE_FEATURES += "x11-mini package-management"
 
@@ -21,6 +21,11 @@ inherit core-image
 SRCREV = "8691a588267472eb5a32b978a0eb9ddfd0c91733"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git"
 
+IMAGE_CMD_ext3_append () {
+	# We don't need to reserve much space for root, 0.5% is more than enough
+	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
+}
+
 fakeroot do_populate_poky_src () {
 	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
 	# will become invalid in the target.
-- 
1.7.5.4



