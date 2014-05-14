Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 984F066101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 21:38:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2014 14:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1054,1389772800"; d="scan'208";a="540534926"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.149])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2014 14:38:22 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 14:36:41 -0700
Message-Id: <50a2c132892ea8660f03f8cde3265599f79f2dd8.1400103108.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1400103108.git.max.eliaser@intel.com>
References: <cover.1400103108.git.max.eliaser@intel.com>
Subject: [PATCH 1/3] Allow texinfo, texinfo-native recipes to build w/o host system's Texinfo utils
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
X-List-Received-Date: Wed, 14 May 2014 21:38:54 -0000

This is necessary for the eventual removal of Yocto's current dependency on
the host system's Texinfo utilities.

The Texinfo suite's build system actually already has a self-bootstrap system
it uses when cross-compiling or when Texinfo binaries aren't already
available. This had been suppressed with patches, but this commit removes
those patches and alters the recipe to make the bootstrapping work properly.

This adds no real overhead for the texinfo-native recipe, but it does mean
that the target architecture recipe actually builds some native binaries
before building the cross-compiled ones. I find this extra overhead
acceptable, since I doubt too many people using Yocto are shipping
images with cross-compiled versions of the Texinfo utilities.

The removal of these patches also allows us to make the target arch texinfo
recipe no longer depend on texinfo-native, since we're going back to using the
built-in bootstrapping process as the Texinfo upstream maintainers intended.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../texinfo/texinfo/disable-native-tools.patch     | 43 ----------------------
 .../texinfo/texinfo/use_host_makedoc.patch         | 17 ---------
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |  8 +---
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch

diff --git a/meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch b/meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
deleted file mode 100644
index ab6f165..0000000
--- a/meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-We already DEPEND on the native texinfo being present before building so
-there isn't any need to try and build the required native texinfo binaries
-before cross-compiling. This simplifies the recipe somewhat!
-
-Upstream-Status: Inappropriate oe specific
-
-Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
-Index: texinfo-4.13/configure.ac
-===================================================================
---- texinfo-4.13.orig/configure.ac
-+++ texinfo-4.13/configure.ac
-@@ -100,29 +100,7 @@ AC_CANONICAL_BUILD
- # $native_tools is also added to SUBDIRS in the main Makefile.am,
- # so that make compiles the native tools first.
- #
--if test "$cross_compiling" = no; then
--  native_tools=
--else
--  native_tools=tools
--  test -d "$native_tools" || mkdir "$native_tools"
--  confdir=`(cd "$srcdir";pwd)`
--  # Make sure the secondary configure won't fail with
--  # "error: source directory already configured".
--  rm -f config.status
--  AC_MSG_NOTICE([[Doing configure of native tools (${build}).]])
--  cd "$native_tools" || exit 1
--  # Run secondary configure in alternate environment or
--  # it gets the wrong CC etc.
--  # env -i gives this build host configure a clean environment;
--  # consequently, we have to re-initialize $PATH.
--  env -i CC="$BUILD_CC" AR="$BUILD_AR" RANLIB="$BUILD_RANLIB" \
--      PATH="$PATH" \
--      tools_only=1 \
--    ${confdir}/configure --build=${build} --host=${build} \
--                         --disable-rpath --disable-nls
--  cd .. || exit 1
--  AC_MSG_NOTICE([[Continuing with main configure (${host}).]])
--fi
-+native_tools=
- AC_SUBST(native_tools)
- AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
- 
diff --git a/meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch b/meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch
deleted file mode 100644
index 5b7f32d..0000000
--- a/meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [cross build specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: texinfo-5.1/info/Makefile.am
-===================================================================
---- texinfo-5.1.orig/info/Makefile.am
-+++ texinfo-5.1/info/Makefile.am
-@@ -76,7 +76,7 @@ cmd_sources = $(srcdir)/session.c $(srcd
- # more than once.
- funs.h: makedoc$(EXEEXT) $(cmd_sources)
- 	rm -f $(generated_sources)
--	$(top_builddir)/$(native_tools)/info/makedoc $(cmd_sources)
-+	makedoc $(cmd_sources)
- 
- # The following hack is necessary to hint make before the automatic
- # dependencies are built.
diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index c1ccaa7..53e7e4f 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -7,19 +7,14 @@ SECTION = "console/utils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "zlib ncurses texinfo-native"
+DEPENDS = "zlib ncurses"
 DEPENDS_class-native = "zlib-native ncurses-native"
 
-TARGET_PATCH = "file://use_host_makedoc.patch"
-TARGET_PATCH_class-native = ""
-
 SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://texinfo-4.12-zlib.patch \
            file://texinfo-4.13a-powerpc.patch \
-           file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
-           ${TARGET_PATCH} \
           "
 
 SRC_URI[md5sum] = "1b8f98b80a8e6c50422125e07522e8db"
@@ -33,6 +28,7 @@ inherit gettext autotools
 do_compile_prepend() {
 	if [ -d tools ];then
 		oe_runmake -C tools/gnulib/lib
+		oe_runmake -C tools/info/ makedoc # TODO: Investigate whether this is an upstream bug
 	fi
 }
 
-- 
1.8.3.2


