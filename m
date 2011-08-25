Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QwSoG-0003wV-OE
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 07:49:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P5iCrK012420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2011 22:44:12 -0700 (PDT)
Received: from localhost (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 22:44:12 -0700
Message-ID: <8f44e2ee6bcd10a3821953e37eb34b3665666eb3.1314242316.git.kai.kang@windriver.com>
In-Reply-To: <cover.1314242316.git.kai.kang@windriver.com>
References: <cover.1314242316.git.kai.kang@windriver.com>
Old-Date: Thu, 25 Aug 2011 10:55:40 +0800
Date: Thu, 25 Aug 2011 13:44:09 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.196]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] cmake-nativesdk: remove gcc standard paths
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
X-List-Received-Date: Thu, 25 Aug 2011 05:49:01 -0000
Content-Type: text/plain

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
1.7.5.1.300.gc565c



