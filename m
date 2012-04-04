Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFWdY-0002qR-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 22:17:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2012 13:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128736140"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.18])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2012 13:07:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 21:07:37 +0100
Message-Id: <f7de5b50bca5996190ca0c1c10e2b56f20f11e8d.1333569870.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333569870.git.paul.eggleton@linux.intel.com>
References: <cover.1333569870.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333569870.git.paul.eggleton@linux.intel.com>
References: <cover.1333569870.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] self-hosted-image: decrease reserved space to 0.5%
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
X-List-Received-Date: Wed, 04 Apr 2012 20:17:00 -0000

The default amount of reserved space for ext2/3 is 5% - this amounts to
about 2GB of a 40GB filesystem that the builder user can't make use of.
We don't need this much reserved so peg it back to 0.5% which should be
more than enough.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index d2faa66..84c5faf 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r9"
+PR = "r10"
 
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
@@ -25,6 +25,11 @@ inherit core-image
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



