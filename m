Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kd-0006Xw-Ec
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450519"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:38 -0700
Message-Id: <bac15cc98e136892d4c09f2470622965bd9dbbeb.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/21] cmake-nativesdk: remove gcc standard paths
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:47 -0000

From: Kang Kai <kai.kang@windriver.com>

Because of the gcc-crosssdk bug, cmake-nativesdk needs to search gcc
standard paths itself. Right now it was fixed, so remove the additional
CXXFLAG for cmake-nativesdk.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/cmake/cmake_2.8.5.bb |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 64e7574..4fa9562 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -4,7 +4,7 @@ inherit cmake
 
 DEPENDS += "curl expat zlib libarchive ncurses"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
@@ -33,12 +33,6 @@ EXTRA_OECMAKE=" \
     ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
-# FIXME: Hack due gcc-crosssdk not being able to detect those automatically
-CXXFLAGS_virtclass-nativesdk += " \
-   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
-   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
-   "
-
 FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
 FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
 
-- 
1.7.6



