Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEm-0003VG-Qt
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375152"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:07 -0700
Message-Id: <4e2aaaffd6e6a9cf6f412bfc8e089a5dd4e6818c.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 05/14] cmake : Disable building ccmake.
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:13 -0000

From: Philip Balister <philip@balister.org>

ccmake fails to build due to an as-needed type error with -ltinfo. Disable
it for now since the build fails and cmake is what we need for target
sdk.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-devtools/cmake/cmake_2.8.5.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 4fa9562..8e04072 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -4,7 +4,7 @@ inherit cmake
 
 DEPENDS += "curl expat zlib libarchive ncurses"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
@@ -30,6 +30,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
     ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
-- 
1.7.6.2



