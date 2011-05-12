Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QKd5h-0004yY-9J
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 23:06:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 14:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,360,1301900400"; 
   d="scan'208";a="975240"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 14:03:45 -0700
Message-Id: <dbb2239a51f4e8cde972cabf7cfc3c7b99028f34.1305234110.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305234110.git.nitin.a.kamble@intel.com>
References: <cover.1305234110.git.nitin.a.kamble@intel.com>
Old-Date: Wed, 11 May 2011 16:55:04 -0700
Date: Thu, 12 May 2011 14:03:45 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] gcc: fix target gcc runtime issue
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
X-List-Received-Date: Thu, 12 May 2011 21:06:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The liblto_plugin.so file is not packages for the target recipe causing this
gcc failure on the target.

gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc          |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc_4.3.3.bb           |    2 +-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb           |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb  |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index 2c30d43..fb5c70d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -7,7 +7,7 @@ require gcc-common.inc
 
 require gcc-4_6-branch-backports.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index e7f1b80..afbcf0d 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -12,6 +12,7 @@ FILES_${PN} = "\
   ${bindir}/${TARGET_PREFIX}gcc \
   ${bindir}/${TARGET_PREFIX}gccbug \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
diff --git a/meta/recipes-devtools/gcc/gcc_4.3.3.bb b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
index f0471d4..ba6e7b2 100644
--- a/meta/recipes-devtools/gcc/gcc_4.3.3.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.3.3.bb
@@ -1,4 +1,4 @@
-PR = "r11"
+PR = "r12"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index a193b38..e04f443 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index cc7540a..2df12ef 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r3"
+PR = "r4"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.7.3.4



