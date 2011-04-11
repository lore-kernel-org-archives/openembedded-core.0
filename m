Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Q95sE-0005qi-U5
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2011 03:25:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Apr 2011 18:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,336,1299484800"; d="scan'208";a="677398702"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2011 18:21:45 -0700
Message-Id: <4d6dd4ddbbcea1c13330c6e09537a1ac2332c9e0.1302485033.git.ke.yu@intel.com>
In-Reply-To: <cover.1302485033.git.ke.yu@intel.com>
References: <cover.1302485033.git.ke.yu@intel.com>
Old-Date: Sat, 9 Apr 2011 22:27:12 +0800
Date: Mon, 11 Apr 2011  9:28:56 +0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 9/9] xkbcomp: upgrade from 1.2.0 to 1.2.1
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
X-List-Received-Date: Mon, 11 Apr 2011 01:25:03 -0000

From: Yu Ke <ke.yu@intel.com>

- Also remove the cross compiling patch, since it is already included
 in 1.2.1 release

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../xorg-app/xkbcomp/cross-compile-fix.patch       |   35 --------------------
 .../{xkbcomp_1.2.0.bb => xkbcomp_1.2.1.bb}         |    5 +--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.2.0.bb => xkbcomp_1.2.1.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch b/meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch
deleted file mode 100644
index ca65345..0000000
--- a/meta/recipes-graphics/xorg-app/xkbcomp/cross-compile-fix.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-commit cc55d8f5ab021861308b071aab9c03016be15187
-Author: Gaetan Nadon <memsize@videotron.ca>
-Date:   Sun Oct 31 20:35:24 2010 -0400
-
-    config: replace AC_CHECK_FILE with test -f as it fails to cross-compile
-    
-    Testing for the presence of xkbparse.c is legitimate as this is a build
-    file, but the Autoconf macro assumes it is testing on the host system
-    and fails.
-    
-    Tested-by: Abdoulaye Walsimou Gaye <awg@embtoolkit.org>
-    Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
-
-diff --git a/configure.ac b/configure.ac
-index c69230b..8e6bd6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,11 +34,14 @@ XORG_DEFAULT_OPTIONS
- 
- AM_CONFIG_HEADER(config.h)
- 
-+# If both the C file and YACC are missing, the package cannot be build.
- AC_PROG_YACC
- AC_PATH_PROG([YACC_INST], $YACC)
--AC_CHECK_FILE([$srcdir/xkbparse.c], [],
--              [test -z "$YACC_INST" && AC_MSG_ERROR([yacc not found - unable to compile xkbparse.y])])
--
-+if test ! -f "$srcdir/xkbparse.c"; then
-+   if test -z "$YACC_INST"; then
-+      AC_MSG_ERROR([yacc not found - unable to compile xkbparse.y])
-+   fi
-+fi
- 
- AC_CHECK_FUNCS([strdup strcasecmp])
- 
diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.0.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.2.0.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb
index f574690..0cf334a 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.2.1.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08436e4f4476964e2e2dd7e7e41e076a"
 
 DEPENDS += "libxkbfile"
 
-SRC_URI += "file://cross-compile-fix.patch"
+SRC_URI[md5sum] = "885b4d8a7c8c7afb3312d31934cb3549"
+SRC_URI[sha256sum] = "b7612527914402d091424a93bc16f0d4d8778b4a874171f3f3dc681c690e65eb"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "0f55995cd8da9b2d88553e1a2e17cd0a"
-SRC_URI[sha256sum] = "2c64aa414755e764ca548ae5c93e95f7b5bbd5e01bca16bf226fd32bfae77ea4"
-- 
1.7.0.4



