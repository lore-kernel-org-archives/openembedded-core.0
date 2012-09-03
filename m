Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8H-0004vF-Ct
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497153"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:21 +0100
Message-Id: <08ec8450f98949bbf57fc5c33394fc63a661a9da.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/28] classes/core-image: remove SSHSERVER_IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:54 -0000

This variable was added in the very same commit that added a mechanism
that makes it obsolete: if you have dropbear and you want openssh, you
just add ssh-server-openssh to your IMAGE_FEATURES and it will replace
dropbear via IMAGE_FEATURES_REPLACES_.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                 |    3 +--
 meta/recipes-sato/images/core-image-sato-sdk.bb |    4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 52836d2..f401313 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -64,8 +64,7 @@ IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
 ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games package-management"
-SSHSERVER_IMAGE_FEATURES ??= "ssh-server-dropbear"
-SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSERVER_IMAGE_FEATURES}"
+SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server-dropbear"
 
 inherit image
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 689315b..18ed0cd 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -3,9 +3,7 @@ core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs \
-	tools-debug tools-profile tools-testapps debug-tweaks"
-
-SSHSERVER_IMAGE_FEATURES = "ssh-server-openssh"
+	tools-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
 
 LICENSE = "MIT"
 
-- 
1.7.9.5



