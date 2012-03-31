Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKK-0005iQ-3p
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Mar 2012 23:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="135924196"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2012 23:53:12 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:21 +0800
Message-Id: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
Subject: [PATCH 1/5] nativesdk.bbclass: Set PACKAGE_ARCHS to SDK_PACKAGE_ARCHS.
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:20 -0000

This patch fixed the issue of reading incorrect pkgdata files. Previous
appending '-nativesdk' suffix to PACKAGE_ARCHS would result the
i686-nativesdk recipes reading in x86_64-nativesdk pkgdata files if the
MACHINE is set to qemux86-64.

Fixed bug [YOCTO #2203].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/nativesdk.bbclass |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 97c460c..9e20834 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -13,13 +13,7 @@ LIBCOVERRIDE = ""
 # Update PACKAGE_ARCH and PACKAGE_ARCHS
 #
 PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
-python () {
-    archs = d.getVar('PACKAGE_ARCHS', True).split()
-    sdkarchs = []
-    for arch in archs:
-        sdkarchs.append(arch + '-nativesdk')
-    d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
-}
+PACKAGE_ARCHS = "${SDK_PACKAGE_ARCHS}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"
-- 
1.7.0.4



