Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 73E7871979
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:05:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 Sep 2016 06:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,378,1470726000"; d="scan'208";a="1034671550"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.185])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2016 06:05:59 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 14:05:51 +0100
Message-Id: <1474549551-15435-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474549551-15435-1-git-send-email-joshua.g.lock@intel.com>
References: <1474549551-15435-1-git-send-email-joshua.g.lock@intel.com>
Subject: [PATCH 2/2] buildtools-tarball: improve stamp independence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2016 13:06:00 -0000

buildtools-tarball shouldn't be regenerated when MACHINE changes,
nor should variants for other SDKMACHINE be removed from the deploy
directory when SDKMACHINE changes.

Remove target architecture dependencies so that deploy artefacts
can overlap.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 2e738e6..da18c09 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -28,10 +28,13 @@ TOOLCHAIN_HOST_TASK ?= "\
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 PACKAGE_ARCH = "${SDK_ARCH}"
+PACKAGE_ARCHS = ""
+TARGET_ARCH = "none"
+TARGET_OS = "none"
 
 SDK_PACKAGE_ARCHS += "buildtools-dummy-${SDKPKGSUFFIX}"
 
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
 SDK_TITLE = "Build tools"
 
@@ -41,10 +44,18 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit meta
 inherit populate_sdk
-inherit toolchain-scripts
+inherit toolchain-scripts-base
+inherit nopackages
+
+deltask install
+deltask package
+deltask packagedata
+deltask populate_sysroot
 
 do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
 
+REAL_MULTIMACH_TARGET_SYS = "none"
+
 create_sdk_files_append () {
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config-*
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
-- 
2.7.4


