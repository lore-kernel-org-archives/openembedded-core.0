Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RddcA-0005NT-Da
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233784"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:31 -0800
Message-Id: <43526148d6cbc1876411e9a3c085195d45cfb5a5.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/26] zypper: add patch from libxml2
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
X-List-Received-Date: Thu, 22 Dec 2011 08:03:00 -0000

Due to Augaes adding the libxml2 requirement.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../zypper/zypper/cmake_libxml2.patch              |   28 ++++++++++++++++++++
 meta/recipes-extended/zypper/zypper_git.bb         |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/zypper/zypper/cmake_libxml2.patch

diff --git a/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch b/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
new file mode 100644
index 0000000..8cda7a4
--- /dev/null
+++ b/meta/recipes-extended/zypper/zypper/cmake_libxml2.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: git/CMakeLists.txt
+===================================================================
+--- git.orig/CMakeLists.txt	2011-12-20 15:13:59.851209493 -0800
++++ git/CMakeLists.txt	2011-12-20 15:14:51.167211302 -0800
+@@ -25,6 +25,9 @@
+ PKG_CHECK_MODULES(RPM REQUIRED rpm)
+ INCLUDE_DIRECTORIES( ${RPM_INCLUDE_DIRS} )
+ 
++PKG_CHECK_MODULES(LIBXML REQUIRED libxml-2.0)
++INCLUDE_DIRECTORIES( ${LIBXML_INCLUDE_DIRS} )
++
+ FIND_PACKAGE( Zypp REQUIRED )
+ IF( ZYPP_FOUND )
+   INCLUDE_DIRECTORIES(${ZYPP_INCLUDE_DIR})
+@@ -70,6 +73,9 @@
+ INCLUDE(CTest)
+ ENABLE_TESTING()
+ 
++# New Augeas requires libxml now
++PKG_CHECK_MODULES(LIBXML REQUIRED libxml-2.0)
++INCLUDE_DIRECTORIES( ${LIBXML_INCLUDE_DIRS} )
+ 
+ # documentation too important to be hidden in doc:
+ INSTALL(
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 4f4fc4d..e5963be 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,13 +5,14 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-PR = "r6"
+PR = "r1"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
 
 SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://cmake.patch \
+           file://cmake_libxml2.patch \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
           "
-- 
1.7.6.4



