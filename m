Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TyG2Q-0003tn-SO
	for Openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 07:12:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 21:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,527,1355126400"; d="scan'208";a="251573117"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2013 21:56:12 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Jan 2013 21:56:10 -0800
Message-Id: <8b7ff0fd9be25fe9937a97ceebb01d41f440841f.1359005591.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <5d5324f0b338872221a92884543df7e46bae012c.1359005591.git.nitin.a.kamble@intel.com>
References: <5d5324f0b338872221a92884543df7e46bae012c.1359005591.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1359005591.git.nitin.a.kamble@intel.com>
References: <cover.1359005591.git.nitin.a.kamble@intel.com>
Subject: [RFC 2/3] core-image-lsb-sdk/dev: Inherit the base image instead of duplicating
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
X-List-Received-Date: Thu, 24 Jan 2013 06:12:18 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/images/core-image-lsb-dev.bb |   12 +++---------
 meta/recipes-extended/images/core-image-lsb-sdk.bb |   14 ++++----------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 013efb9..d2dc9e2 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -1,13 +1,7 @@
+require core-image-lsb.bb
+
 DESCRIPTION = "Basic image without X support suitable for development work. It \
 can be used for customization and implementations that conform to Linux \
 Standard Base (LSB)."
 
-IMAGE_FEATURES += "splash dev-pkgs ssh-server-openssh"
-
-IMAGE_INSTALL = "\
-    ${CORE_IMAGE_BASE_INSTALL} \
-    packagegroup-core-basic \
-    packagegroup-core-lsb \
-    "
-
-inherit core-image
+IMAGE_FEATURES += "dev-pkgs"
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index abddb76..da8c250 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -1,16 +1,10 @@
+require core-image-lsb.bb
+
 DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
 (LSB) implementations. It includes the full meta-toolchain, plus development \
 headers and libraries to form a standalone SDK."
 
-IMAGE_FEATURES += "splash tools-sdk dev-pkgs ssh-server-openssh \
-	tools-debug tools-profile tools-testapps debug-tweaks"
-
+IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL = "\
-    ${CORE_IMAGE_BASE_INSTALL} \
-    packagegroup-core-basic \
-    packagegroup-core-lsb \
-    kernel-dev \
-    "
+IMAGE_INSTALL += "kernel-dev"
 
-inherit core-image
-- 
1.7.3.4



