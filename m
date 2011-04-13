Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Q9wVX-0006DH-4b
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Apr 2011 11:37:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Apr 2011 02:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,203,1301900400"; d="scan'208";a="908946497"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2011 02:34:06 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Q9wLM-0004mj-TB; Wed, 13 Apr 2011 17:26:36 +0800
Message-Id: <e97fe275402062a86c56f70560b9660786d07db7.1302686656.git.qing.he@intel.com>
In-Reply-To: <cover.1302686656.git.qing.he@intel.com>
References: <cover.1302686656.git.qing.he@intel.com>
Old-Date: Wed, 13 Apr 2011 16:59:22 +0800
Date: Wed, 13 Apr 2011 17:26:36 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 1/2] sat-solver: fix arch=all packages
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
X-List-Received-Date: Wed, 13 Apr 2011 09:37:13 -0000

From: Qing He <qing.he@intel.com>

add a new options to set noarch archs as all so platform independent
packages can be recognized and installed.

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../sat-solver/sat-solver/sat-solver_poky.patch    |   19 +++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
index b762bac..e055545 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch
@@ -5,8 +5,27 @@ Add a missing "any" architecture type and update the semantics to use it.
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
++IF ( POKY )
++MESSAGE(STATUS "Building for Poky")
++ADD_DEFINITIONS( -DPOKY -DPOKY_SEMANTICS)
++ENDIF ( POKY )
++
+ IF ( MULTI_SEMANTICS )
+ MESSAGE(STATUS "Enabling multi dist support")
+ ADD_DEFINITIONS( -DMULTI_SEMANTICS)
 diff --git a/src/knownid.h b/src/knownid.h
 index 7757ae0..4b8bee7 100644
 --- a/src/knownid.h
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index a693776..0d5a5e6 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
@@ -19,7 +19,7 @@ SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5"
+EXTRA_OECMAKE += "-DLIB=lib -DRPM5=RPM5 -DPOKY=POKY"
 
 inherit cmake pkgconfig
 
-- 
1.7.0



