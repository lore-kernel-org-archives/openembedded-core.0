Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tum0O-0001KR-Cf
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 16:31:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2013 07:16:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="246401822"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2013 07:15:59 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2013 17:16:37 +0200
Message-Id: <d7913fce4255120d96b22ce854b30b6d231d30aa.1358175955.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358175955.git.constantinx.musca@intel.com>
References: <cover.1358175955.git.constantinx.musca@intel.com>
Subject: [PATCH v2 2/6] gcc: remove the 64bithack patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2013 15:31:24 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc             |  1 -
 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch | 63 -----------------------
 2 files changed, 64 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 08a0103..2fad764 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -50,7 +50,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
            file://gcc-poison-system-directories.patch \
            file://gcc-poison-dir-extend.patch \
            file://gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-	   file://64bithack.patch \
 	   file://optional_libstdc.patch \
 	   file://disable_relax_pic_calls_flag.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
deleted file mode 100644
index f475669..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.7/64bithack.patch
+++ /dev/null
@@ -1,63 +0,0 @@
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
-Index: trunk/gcc/config/i386/t-linux64
-===================================================================
---- trunk.orig/gcc/config/i386/t-linux64	2012-02-22 09:44:48.000000000 -0800
-+++ trunk/gcc/config/i386/t-linux64	2012-02-22 12:31:01.836462957 -0800
-@@ -33,7 +33,6 @@
- #
- comma=,
- MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
--MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTIONS)))
--MULTILIB_OSDIRNAMES = m64=../lib64
--MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
--MULTILIB_OSDIRNAMES+= mx32=../libx32
-+MULTILIB_DIRNAMES = . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
-+
-Index: trunk/gcc/config/mips/t-linux64
-===================================================================
---- trunk.orig/gcc/config/mips/t-linux64	2012-02-22 09:44:58.000000000 -0800
-+++ trunk/gcc/config/mips/t-linux64	2012-02-22 12:32:01.132465823 -0800
-@@ -17,5 +17,5 @@
- # <http://www.gnu.org/licenses/>.
- 
- MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
--MULTILIB_DIRNAMES = n32 32 64
--MULTILIB_OSDIRNAMES = ../lib32 ../lib ../lib64
-+MULTILIB_DIRNAMES = . . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
-Index: trunk/gcc/config/rs6000/t-linux64
-===================================================================
---- trunk.orig/gcc/config/rs6000/t-linux64	2012-02-22 09:44:54.000000000 -0800
-+++ trunk/gcc/config/rs6000/t-linux64	2012-02-22 12:28:17.960454968 -0800
-@@ -27,9 +27,9 @@
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
-- 
1.7.11.7



