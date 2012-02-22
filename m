Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05y1-0007bD-FU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312589"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:50 -0800
Message-Id: <ef352f3fbf408916c17da50453111af298d5ce56.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 07/10] gcc: remove the 64bithack patch
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:27 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

and bump PR

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc             |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch |   68 ---------------------
 2 files changed, 1 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index ece378d..3ef240b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r22"
+PR = "r23"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -59,7 +59,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
            file://gcc-poison-system-directories.patch \
            file://gcc-poison-dir-extend.patch \
            file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-	   file://64bithack.patch \
 	   file://optional_libstdc.patch \
 	   file://disable_relax_pic_calls_flag.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
deleted file mode 100644
index d35753a..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-GCC has internal multilib handling code but it assumes a very specific rigid directory
-layout. The build system implementation of multilib layout is very generic and allows
-complete customisation of the library directories.
-
-This patch is a partial solution to allow any custom directories to be passed into gcc
-and handled correctly. It forces gcc to use the base_libdir (which is the current 
-directory, "."). We need to do this for each multilib that is configured as we don't
-know which compiler options may be being passed into the compiler. Since we have a compiler
-per mulitlib at this point that isn't an issue.
-
-The one problem is the target compiler is only going to work for the default multlilib at
-this point. Ideally we'd figure out which multilibs were being enabled with which paths
-and be able to patch these entries with a complete set of correct paths but this we
-don't have such code at this point. This is something the target gcc recipe should do 
-and override these platform defaults in its build config.
-
-RP 15/8/11
-
-Index: gcc-4_6-branch/gcc/config/i386/t-linux64
-===================================================================
---- gcc-4_6-branch.orig/gcc/config/i386/t-linux64	2011-06-23 15:15:29.000000000 +0100
-+++ gcc-4_6-branch/gcc/config/i386/t-linux64	2011-08-15 13:09:03.772415848 +0100
-@@ -24,8 +24,8 @@
- # MULTILIB_OSDIRNAMES according to what is found on the target.
- 
- MULTILIB_OPTIONS = m64/m32
--MULTILIB_DIRNAMES = 64 32 
--MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
-+MULTILIB_DIRNAMES = . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
- 
- LIBGCC = stmp-multilib
- INSTALL_LIBGCC = install-multilib
-Index: gcc-4_6-branch/gcc/config/mips/t-linux64
-===================================================================
---- gcc-4_6-branch.orig/gcc/config/mips/t-linux64	2011-08-15 13:06:13.732415763 +0100
-+++ gcc-4_6-branch/gcc/config/mips/t-linux64	2011-08-15 13:09:11.452419446 +0100
-@@ -17,8 +17,8 @@
- # <http://www.gnu.org/licenses/>.
- 
- MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
--MULTILIB_DIRNAMES = n32 32 64
--MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
-+MULTILIB_DIRNAMES = . . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
- 
- EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
- 
-Index: gcc-4_6-branch/gcc/config/rs6000/t-linux64
-===================================================================
---- gcc-4_6-branch.orig/gcc/config/rs6000/t-linux64	2011-08-15 13:06:25.272415822 +0100
-+++ gcc-4_6-branch/gcc/config/rs6000/t-linux64	2011-08-15 13:09:21.062415878 +0100
-@@ -32,11 +32,11 @@
- # MULTILIB_OSDIRNAMES according to what is found on the target.
- 
- MULTILIB_OPTIONS        = m64/m32 msoft-float
--MULTILIB_DIRNAMES       = 64 32 nof
-+MULTILIB_DIRNAMES       = . . .
- MULTILIB_EXTRA_OPTS     = fPIC mstrict-align
- MULTILIB_EXCEPTIONS     = m64/msoft-float
- MULTILIB_EXCLUSIONS     = m64/!m32/msoft-float
--MULTILIB_OSDIRNAMES	= ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib) nof
-+MULTILIB_OSDIRNAMES	= ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
- MULTILIB_MATCHES        = $(MULTILIB_MATCHES_FLOAT)
- 
- softfp_wrap_start := '\#ifndef __powerpc64__'
-- 
1.7.6.4



