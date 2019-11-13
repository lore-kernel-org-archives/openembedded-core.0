Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2251C6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:29:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 00:29:46 -0800
X-IronPort-AV: E=Sophos;i="5.68,299,1569308400"; d="scan'208";a="198374745"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.170.196])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 00:29:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 16:29:37 +0800
Message-Id: <20191113082937.18018-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libsdl2: fix race when building in parallel
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
X-List-Received-Date: Wed, 13 Nov 2019 08:29:46 -0000
Content-Transfer-Encoding: 8bit

Fixes a race where it tries to build version res file in build directory
before it has even been created. Prevents intermittent errors on
autobuilder when building for mingw:

| /bin/bash ../SDL2-2.0.10/build-scripts/updaterev.sh
| /bin/bash ../SDL2-2.0.10/build-scripts/mkinstalldirs build
| mkdir -p -- build
| x86_64-pokysdk-mingw32-windres --include-dir=/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-nativesdk-mingw32-pokysdk-mingw32/nativesdk-libsdl2/2.0.10-r0/recipe-sysroot/opt/poky/3.0/sysroots/x86_64-pokysdk-mingw32/us
| /include ../SDL2-2.0.10/src/main/windows/version.rc build/version.o
| x86_64-pokysdk-mingw32-windres: build/version.o: No such file or directory
| Makefile:692: recipe for target 'build/version.o' failed
| make: *** [build/version.o] Error 1
| make: *** Waiting for unfinished jobs....
| touch build/.created
| WARNING: exit code 1 from a shell command.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...for-build-dir-when-building-version-.patch | 53 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.10.bb                 |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
new file mode 100644
index 0000000000..b383bd6548
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
@@ -0,0 +1,53 @@
+# HG changeset patch
+# User Anuj Mittal <am.devel@gmail.com>
+# Date 1573631462 -10800
+# Node ID 1fb1880d5edfc7c5a370846e13f90b260263627c
+# Parent  007002587d5d34d781c2b628c05e992e0ac5f52d
+configure: check for build dir when building version res (fix bug #4858)
+Fixes a race where we try to build version res file in build directory
+before it has even been created. Prevents errors like:
+
+/bin/bash ../SDL2-2.0.10/build-scripts/updaterev.sh
+/bin/bash ../SDL2-2.0.10/build-scripts/mkinstalldirs build
+mkdir -p -- build
+x86_64-pokysdk-mingw32-windres --include-dir=/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-nativesdk-mingw32-pokysdk-mingw32/nativesdk-libsdl2/2.0.10-r0/recipe-sysroot/opt/poky/3.0/sysroots/x86_64-pokysdk-mingw32/usr/include ../SDL2-2.0.10/src/main/windows/version.rc build/version.o
+x86_64-pokysdk-mingw32-windres: build/version.o: No such file or directory
+Makefile:692: recipe for target 'build/version.o' failed
+make: *** [build/version.o] Error 1
+make: *** Waiting for unfinished jobs....
+touch build/.created
+WARNING: exit code 1 from a shell command.
+
+Extension of fix:
+https://hg.libsdl.org/SDL/rev/99d8b18acf8a
+
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <am.devel@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff -r 007002587d5d -r 1fb1880d5edf configure
+--- a/configure	Tue Nov 12 17:24:37 2019 -0500
++++ b/configure	Wed Nov 13 10:51:02 2019 +0300
+@@ -25493,7 +25493,7 @@
+ VERSION_DEPENDS=`echo $VERSION_SOURCES`
+ VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[^ ]*/\([^ ]*\)\.rc,$(objects)/\1.o,g'`
+ VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([^ ]*\\)/\\([^ ]*\\)\\.rc,\\\\
+-\\$(objects)/\\2.o: \\1/\\2.rc\\\\
++\\$(objects)/\\2.o: \\1/\\2.rc \\$(objects)/.created\\\\
+ 	\\$(WINDRES) \\$< \\$@,g"`
+ 
+ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
+diff -r 007002587d5d -r 1fb1880d5edf configure.ac
+--- a/configure.ac	Tue Nov 12 17:24:37 2019 -0500
++++ b/configure.ac	Wed Nov 13 10:51:02 2019 +0300
+@@ -4177,7 +4177,7 @@
+ VERSION_DEPENDS=`echo $VERSION_SOURCES`
+ VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.rc,$(objects)/\1.o,g'`
+ VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.rc,\\\\
+-\\$(objects)/\\2.o: \\1/\\2.rc\\\\
++\\$(objects)/\\2.o: \\1/\\2.rc \\$(objects)/.created\\\\
+ 	\\$(WINDRES) \\$< \\$@,g"`
+ 
+ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index cdc8650e17..ab514f0533 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -15,6 +15,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
+           file://0001-configure-check-for-build-dir-when-building-version-.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.21.0


