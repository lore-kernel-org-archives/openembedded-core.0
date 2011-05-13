Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkdO-00020t-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 22:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; 
   d="scan'208";a="1664286"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 22:06:45 -0700
Message-Id: <a121494f9bdebb940e3f2f121040988be6dca592.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 16:55:04 -0700
Date: Thu, 12 May 2011 22:06:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 7/8] gcc: fix target gcc runtime issue
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
X-List-Received-Date: Fri, 13 May 2011 05:09:55 -0000

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
1.7.1.1



