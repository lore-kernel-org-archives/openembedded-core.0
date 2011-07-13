Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qgvj7-0006Nr-IV
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 11:27:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2011 02:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,524,1304319600"; d="scan'208";a="25304828"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 02:23:29 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 13 Jul 2011 17:22:22 +0800
Message-Id: <dc66133d2105c598de3d85d5a7290add05b67b59.1310548638.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310548638.git.ke.yu@intel.com>
References: <cover.1310548638.git.ke.yu@intel.com>
In-Reply-To: <cover.1310548638.git.ke.yu@intel.com>
References: <cover.1310548638.git.ke.yu@intel.com>
Subject: [PATCH 1/2] sat-solver: fix for non /usr/lib libdir case
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
X-List-Received-Date: Wed, 13 Jul 2011 09:27:29 -0000

when libdir set to non /usr/lib like /usr/lib64, there is do_configure error:
"
-- Libraries will be installed in /usr/lib
CMake Error at /home/kyu3/sdb/lib64/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:91  (MESSAGE):
  Please install 'check' and 'check-devel' packages (missing: CHECK_LIBRARY)
Call Stack (most recent call first):
  /home/kyu3/sdb/lib64/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:252              (_FPHSA_FAILURE_MESSAGE)
  cmake/modules/FindCheck.cmake:17 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  CMakeLists.txt:35 (FIND_PACKAGE)
-- Configuring incomplete, errors occurred!
"

The reason is that cmake did not search /usr/lib64 for libcheck, thus report error

add ${libdir} to the CMAKE_SYSTEM_LIBRARY_PATH can fix this issue.

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/classes/cmake.bbclass                         |    4 ++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 672325e..5ac540c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -55,6 +55,10 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 
 # Use native cmake modules
 set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
+
+# add for non /usr/lib libdir, e.g. /usr/lib64
+LIST(APPEND CMAKE_SYSTEM_LIBRARY_PATH ${libdir})
+
 EOF
 }
 
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index c608bb7..9b212db 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcheck rpm zlib expat db"
 
 SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
-PR = "r10"
+PR = "r11"
 
 PARALLEL_MAKE=""
 
@@ -23,7 +23,9 @@ SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5 -DOE_CORE=OE_CORE"
+EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
+
+EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
 inherit cmake pkgconfig
 
-- 
1.7.0.4



