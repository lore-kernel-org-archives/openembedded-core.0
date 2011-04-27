Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE7-0005K8-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:31:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 00:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203112"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:19 -0700
Message-Id: <bd0798120559a8aca726db8e962bbbafb80c2a54.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 16:59:22 +0800
Date: Wed, 27 Apr 2011  0:29:19 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 01/52] sat-solver: fix arch=all packages
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
X-List-Received-Date: Wed, 27 Apr 2011 07:31:59 -0000

From: Qing He <qing.he@intel.com>

add a new options to set noarch archs as all so platform independent
packages can be recognized and installed.

fixes [YOCTO #993]

Signed-off-by: Qing He <qing.he@intel.com>
---
 ...sat-solver_poky.patch => sat-solver_core.patch} |   27 +++++++++++++++++--
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   16 ++++++------
 2 files changed, 32 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/sat-solver/sat-solver/{sat-solver_poky.patch => sat-solver_core.patch} (81%)

diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
similarity index 81%
rename from meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
rename to meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
index b762bac..11bf5b0 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_core.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Fix "arch" integration with Poky.
 
 Add a missing "any" architecture type and update the semantics to use it.
@@ -5,8 +7,27 @@ Add a missing "any" architecture type and update the semantics to use it.
 Disable the built-in archpolicies structure, and replace it with one
 we generate in the recipe.
 
+Also add poky semantics option in CMake.
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Qing He <qing.he@intel.com>
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 443281e..4456a87 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -45,6 +45,11 @@ MESSAGE(STATUS "Building for Debian")
+ ADD_DEFINITIONS( -DDEBIAN -DDEBIAN_SEMANTICS)
+ ENDIF ( DEBIAN )
+ 
++IF ( OE_CORE )
++MESSAGE(STATUS "Building for OE core")
++ADD_DEFINITIONS( -DOE_CORE -DOE_CORE_SEMANTICS)
++ENDIF ( OE_CORE )
++
+ IF ( MULTI_SEMANTICS )
+ MESSAGE(STATUS "Enabling multi dist support")
+ ADD_DEFINITIONS( -DMULTI_SEMANTICS)
 diff --git a/src/knownid.h b/src/knownid.h
 index 7757ae0..4b8bee7 100644
 --- a/src/knownid.h
@@ -27,7 +48,7 @@ index 55c8677..3356ff8 100644
      }
  
    /* we allow changes to/from noarch */
-+#ifdef POKY_SEMANTICS
++#ifdef OE_CORE_SEMANTICS
 +  if (a1 == a2 || 
 +	a1 == ARCH_NOARCH || a2 == ARCH_NOARCH ||
 +	a1 == ARCH_ANY || a2 == ARCH_ANY ||
@@ -86,7 +107,7 @@ index 34a14a3..2d7cd70 100644
 -  0
 -};
 +/* Provide the const char *archpolicies structure */
-+#include "poky-arch.h"
++#include "core-arch.h"
  
  void
  pool_setarch(Pool *pool, const char *arch)
@@ -97,7 +118,7 @@ index 34a14a3..2d7cd70 100644
 -#ifndef DEBIAN_SEMANTICS
 -  id = ARCH_NOARCH;
 -#else
-+#if defined(DEBIAN_SEMANTICS) || defined(POKY_SEMANTICS)
++#if defined(DEBIAN_SEMANTICS) || defined(OE_CORE_SEMANTICS)
    id = ARCH_ALL;
 +#else
 +  id = ARCH_NOARCH;
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index a693776..2d4d299 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,19 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
            file://sat-solver_obsolete.patch \
            file://cmake.patch \
            file://db5.patch \
-           file://sat-solver_poky.patch \
+           file://sat-solver_core.patch \
           "
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5"
+EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5 -DOE_CORE=OE_CORE"
 
 inherit cmake pkgconfig
 
@@ -38,18 +38,18 @@ do_archgen () {
 		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
 	done
 
-	echo "/* Automatically generated by the sat-solver recipe */" > src/poky-arch.h
-	echo "const char *archpolicies[] = {" >> src/poky-arch.h
+	echo "/* Automatically generated by the sat-solver recipe */" > src/core-arch.h
+	echo "const char *archpolicies[] = {" >> src/core-arch.h
 
         set -- $INSTALL_PLATFORM_ARCHS
 
         save_IFS=$IFS
         IFS=:
-        while [ $# -gt 0 ]; do echo "  \"$1\",	"\""$*"\", >> src/poky-arch.h ; shift; done
+        while [ $# -gt 0 ]; do echo "  \"$1\",	"\""$*"\", >> src/core-arch.h ; shift; done
         IFS=$save_IFS
 
-	echo "  0" >> src/poky-arch.h
-	echo "};" >> src/poky-arch.h
+	echo "  0" >> src/core-arch.h
+	echo "};" >> src/core-arch.h
 }
 
 addtask archgen before do_configure after do_patch
-- 
1.7.1.1



