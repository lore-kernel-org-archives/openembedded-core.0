Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFSLb-0001xK-BE
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 17:42:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 08:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127032552"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.20])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2012 08:32:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 16:32:51 +0100
Message-Id: <95c5864783433fb7a82a356c1e6132a9a56a1bf4.1333553396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] self-hosted-image: decrease reserved space to 0.5%
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
X-List-Received-Date: Wed, 04 Apr 2012 15:42:11 -0000

The default amount of reserved space for ext2/3 is 5% - this amounts to
about 2GB of a 40GB filesystem that the builder user can't make use of.
We don't need this much reserved so peg it back to 0.5% which should be
more than enough.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index d2faa66..17ae9ce 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r9"
+PR = "r10"
 
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
@@ -14,6 +14,8 @@ IMAGE_FEATURES += "x11-mini package-management"
 
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
 IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
+# We don't need to reserve much space for root, 0.5% is more than enough
+IMAGE_TUNE2FS_ext3 = "-m 0.5"
 
 # Do a quiet boot with limited console messages
 APPEND += "quiet"
-- 
1.7.5.4



