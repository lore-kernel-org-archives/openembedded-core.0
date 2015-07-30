Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31948764A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:27:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 07:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="616054394"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 07:27:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:27:26 +0300
Message-Id: <00fc2d31154f4d4281e2179dca034dd4dc651db2.1438265949.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/21] classes/cmake: add arch conversion routine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 14:27:18 -0000

cmake expects target architecture strings in the format of uname(2),
which do not always match TARGET_ARCH (e.g. powerpc vs ppc).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/cmake.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index c174246..ae3cc02 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -30,12 +30,22 @@ OECMAKE_EXTRA_ROOT_PATH ?= ""
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
+# CMake expects target architectures in the format of uname(2),
+# which do not always match TARGET_ARCH, so all the necessary
+# conversions should happen here.
+def map_target_arch_to_uname_arch(target_arch):
+    if target_arch == "powerpc":
+        return "ppc"
+    if target_arch == "powerpc64":
+        return "ppc64"
+    return target_arch
+
 cmake_do_generate_toolchain_file() {
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
 set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
-set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
+set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH', True))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
-- 
2.1.4


