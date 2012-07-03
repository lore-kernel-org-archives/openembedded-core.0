Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPr-0006tU-6Y
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158050"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:33 -0700
Message-Id: <337428316de3612a8e1efa70b3a4ba7cb6e058d2.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/17] core-image*sdk: Add kernel-dev to sdk images
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
X-List-Received-Date: Tue, 03 Jul 2012 07:20:55 -0000

From: Darren Hart <dvhart@linux.intel.com>

While sdk images already have dev-pkgs included, the kernel-dev package
is special and does not get installed. Add kernel-dev explicitly to the
*sdk image recipes.

Note: We have to be careful with "IMAGE_INSTALL +=" as it must appear
after "inherit core-image" which makes an "IMAGE_INSTALL ?=" assignment.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Jessica Zhang <jessica.zhang@intel.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    1 +
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 +++
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 32a5077..047d66b 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -10,6 +10,7 @@ IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
     task-core-basic \
     task-core-lsb \
+    kernel-dev \
     "
 
 inherit core-image
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 6ec2d00..29512e3 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -11,6 +11,6 @@ DEPENDS = "linux-yocto-rt"
 IMAGE_FEATURES += "dev-pkgs tools-sdk"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL += "rt-tests"
+IMAGE_INSTALL += "rt-tests kernel-dev"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index eed1698..75ed64f 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -11,3 +11,6 @@ EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 LICENSE = "MIT"
 
 inherit core-image
+
+IMAGE_INSTALL += "kernel-dev"
+
-- 
1.7.7.6



