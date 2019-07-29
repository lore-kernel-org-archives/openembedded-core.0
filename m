Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2D00A7D41E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 03:20:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 20:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="173059325"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2019 20:20:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 11:20:25 +0800
Message-Id: <1564370426-60448-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] libsdl2: upgrade 2.0.9 -> 2.0.10
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
X-List-Received-Date: Mon, 29 Jul 2019 03:20:29 -0000

License-Update: Change in Copyright Year.

Refresh the patch to apply on configure.ac instead of .in.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsdl2/libsdl2/more-gen-depends.patch         | 37 +++++++++++++++-------
 .../{libsdl2_2.0.9.bb => libsdl2_2.0.10.bb}        |  6 ++--
 2 files changed, 28 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.9.bb => libsdl2_2.0.10.bb} (93%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
index 29076bf..8ca52eb 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
+++ b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
@@ -1,3 +1,8 @@
+From e0f4b6d18ce6f025c78773e909b9c395ad833c7a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 29 Jul 2019 08:38:32 +0800
+Subject: [PATCH] configure: fix dependencies
+
 Many source files include e.g. wayland-protocols.h which should be found in the
 sysroot but SDL wants to build its own headers from the XML definitions.
 
@@ -14,34 +19,42 @@ the primary objects.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+[Moved to configure.ac]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/configure.in b/data/poky-tmp/master/work/corei7-64-poky-linux/libsdl2/2.0.8-r0/SDL2-2.0.8/configure.in
-index 1c7e79338..ba07a4a4e 100644
---- a/configure.in
-+++ b/data/poky-tmp/master/work/corei7-64-poky-linux/libsdl2/2.0.8-r0/SDL2-2.0.8/configure.in
-@@ -4011,7 +4011,7 @@ DEPENDS=`echo $SOURCES | tr ' ' '\n'`
+diff --git a/configure.ac b/configure.ac
+index 9e782c6..997915a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4061,7 +4061,7 @@ DEPENDS=`echo $SOURCES | tr ' ' '\n'`
  for EXT in asm cc m c S; do
      OBJECTS=`echo "$OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.'$EXT',$(objects)/\1.lo,g'`
      DEPENDS=`echo "$DEPENDS" | sed "s,^\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.$EXT\\$,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.$EXT\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(GEN_OBJECTS)\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created\\\\
++\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
  	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
  done
  
-@@ -4028,14 +4028,14 @@ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
+@@ -4078,14 +4078,14 @@ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
  SDLMAIN_DEPENDS=`echo $SDLMAIN_SOURCES`
  SDLMAIN_OBJECTS=`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
  SDLMAIN_DEPENDS=`echo "$SDLMAIN_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.c\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c \\$(GEN_OBJECTS)\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
++\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
  	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
  
  SDLTEST_OBJECTS=`echo $SDLTEST_SOURCES`
  SDLTEST_DEPENDS=`echo $SDLTEST_SOURCES`
  SDLTEST_OBJECTS=`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
  SDLTEST_DEPENDS=`echo "$SDLTEST_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.c\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c\\\\ \\$(GEN_OBJECTS)\\\\
+-\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
++\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
  	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
  
  # Set runtime shared library paths as needed
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
similarity index 93%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index a0a0b15..3a0654b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=02ee26814dd044bd7838ae24e05b880f"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=504a9454ceb89fd75a2583473b11409e"
 
 PROVIDES = "virtual/libsdl2"
 
@@ -18,8 +18,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "f2ecfba915c54f7200f504d8b48a5dfe"
-SRC_URI[sha256sum] = "255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54b324b1"
+SRC_URI[md5sum] = "5a2114f2a6f348bdab5bf52b994811db"
+SRC_URI[sha256sum] = "b4656c13a1f0d0023ae2f4a9cf08ec92fffb464e0f24238337784159b8b91d57"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
-- 
2.7.4


