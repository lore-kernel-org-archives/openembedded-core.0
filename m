Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKK-0005iR-VF
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2012 23:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148113535"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2012 23:53:14 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:22 +0800
Message-Id: <43e3087a95b5731877a4a81d74c030f5c81903d6.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
References: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
Subject: [PATCH 2/5] crosssdk.bbclass: Set TUNE_PKGARCH to SDK_PKGARCH.
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:21 -0000

The TUNE_PKGARCH of crosssdk should be set to SDK_ARCH, not the one
from target machine's configuration.

Fixed bug [YOCTO #2206]

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/crosssdk.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 83753b4..67df236 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -1,6 +1,11 @@
 inherit cross
 
 PACKAGE_ARCH = "${SDK_ARCH}"
+python () {
+	# set TUNE_PKGARCH to SDK_ARCH
+	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH', True))
+}
+
 STAGING_DIR_TARGET = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
-- 
1.7.0.4



