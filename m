Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf2-0004F2-T2
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163402"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:24 -0700
Message-Id: <add9e4e30e0b1e0f93479b43ce61953efb90985d.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/27] cmake.bbclass, perlnative.bbclass: arrange for cmake to find perl-native
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:33 -0000

From: Phil Blundell <philb@gnu.org>

When CMake is looking for perl, it only searches in the specific directories
that it's told about and ignores ${PATH}.  If perlnative is in use, ensure
that the appropriate installation path is added to the list of places that
cmake will look for perl, otherwise it won't ever be found.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/cmake.bbclass      |    3 ++-
 meta/classes/perlnative.bbclass |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 89a154f..ab23bed 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -25,6 +25,7 @@ OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
 
 OECMAKE_RPATH ?= ""
+OECMAKE_PERLNATIVE_DIR ??= ""
 
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
@@ -41,7 +42,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} )
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR})
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
index 522344d..2211b72 100644
--- a/meta/classes/perlnative.bbclass
+++ b/meta/classes/perlnative.bbclass
@@ -1,2 +1,3 @@
 PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
 DEPENDS += "perl-native"
+OECMAKE_PERLNATIVE_DIR = "${STAGING_BINDIR_NATIVE}/perl-native"
-- 
1.7.6



