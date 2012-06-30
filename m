Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpR9-0003fQ-BP
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:37:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2012 21:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186844544"
Received: from unknown (HELO localhost) ([10.255.13.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2012 21:26:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, Saul Wold <sgw@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Kishore Bodke <kishore.k.bodke@intel.com>
Date: Fri, 29 Jun 2012 21:25:06 -0700
Message-Id: <444946729b775e1cb91ebb599f9aca4458bdf176.1341025161.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <2e2f72682e773f4f97db3181112e7eb569df09da.1341025161.git.dvhart@linux.intel.com>
References: <2e2f72682e773f4f97db3181112e7eb569df09da.1341025161.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341025161.git.dvhart@linux.intel.com>
References: <cover.1341025161.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/3] core-image*sdk: Add kernel-dev to sdk images
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
X-List-Received-Date: Sat, 30 Jun 2012 04:37:35 -0000

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
 3 files changed, 5 insertions(+), 1 deletion(-)

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
1.7.10.2



