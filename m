Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJv-00056y-41
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:28:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055180"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:32 +0300
Message-Id: <139c4d91a878a21cc31478ab862df9293a836e28.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/8] directfb: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 04 Jul 2012 18:28:59 -0000

Removed two backported patches that already exist in the current
version and fixed a compilation issue when zlib is used.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |    4 ++-
 .../directfb/fix-compilation-with-zlib.patch       |   29 ++++++++++++++++++++
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ------------------
 ...ibdirect-remove-include-of-linux-config.h.patch |   29 --------------------
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 ----------------
 meta/recipes-graphics/directfb/directfb_1.6.1.bb   |   23 ++++++++++++++++
 6 files changed, 55 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 3fd6161..a164717 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 HOMEPAGE = "http://directfb.org"
 DEPENDS = "jpeg libpng freetype zlib tslib"
 
-SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.5/DirectFB-${PV}.tar.gz \
+INC_PR = "r0"
+
+SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
            file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
            file://configurefix.patch"
 
diff --git a/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch b/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
new file mode 100644
index 0000000..8b99b4e
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+From 1d6d597050fc24769e9df2693f754bdc824a8b78 Mon Sep 17 00:00:00 2001
+From: Laurentiu Palcu <laurentiu.palcu@intel.com>
+Date: Tue, 3 Jul 2012 16:06:10 +0300
+Subject: [PATCH] fix compilation with zlib
+
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+---
+ src/core/surface.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/core/surface.c b/src/core/surface.c
+index 50434a2..52f50ab 100644
+--- a/src/core/surface.c
++++ b/src/core/surface.c
+@@ -49,6 +49,9 @@
+ #include <gfx/convert.h>
+ #include <gfx/util.h>
+ 
++#ifdef USE_ZLIB
++#include <zlib.h>
++#endif
+ 
+ D_DEBUG_DOMAIN( Core_Surface, "Core/Surface", "DirectFB Core Surface" );
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch b/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
deleted file mode 100644
index 277189b..0000000
--- a/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 54f775dfc516115c4d654d250189f431a82d1d42 Mon Sep 17 00:00:00 2001
-From: Denis Oliver Kropp <dok@directfb.org>
-Date: Sun, 27 May 2012 11:40:31 +0200
-Subject: [PATCH] libdirect: Use ARM assembler for atomic operations only if
- ARCH_ARMv7 is defined.
-
-Upstream-Status: backport from 1.6.0-pre1
----
- lib/direct/atomic.h |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/direct/atomic.h b/lib/direct/atomic.h
-index fe7664f..74d8d18 100644
---- a/lib/direct/atomic.h
-+++ b/lib/direct/atomic.h
-@@ -183,7 +183,7 @@
- #endif
- 
- 
--#if defined(ARCH_ARM) && !defined(ARCH_IWMMXT)
-+#if defined(ARCH_ARMv7) && !defined(ARCH_IWMMXT)
- 
- static inline int _D__atomic_cmpxchg(volatile int *ptr, int old, int _new)
- {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
deleted file mode 100644
index 6c014ca..0000000
--- a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: backport from 1.6.0-pre1
-
-From cd575a84f10d90759e069f5f2e6092251a1b84bd Mon Sep 17 00:00:00 2001
-From: Sven Neumann <s.neumann@raumfeld.com>
-Date: Fri, 23 Sep 2011 10:00:02 +0200
-Subject: [PATCH] libdirect: remove include of <linux/config.h>
-
-That header has been removed from the Linux kernel with 2.6.19
-and it should not have been needed anyway.
----
- lib/direct/ppcasm_memcpy_cachable.S |    2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/lib/direct/ppcasm_memcpy_cachable.S b/lib/direct/ppcasm_memcpy_cachable.S
-index 920dea2..c1ef4fa 100644
---- a/lib/direct/ppcasm_memcpy_cachable.S
-+++ b/lib/direct/ppcasm_memcpy_cachable.S
-@@ -34,8 +34,6 @@
- 
- #define __ASSEMBLY__
- 
--#include <linux/config.h>
--
- #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
- #define L1_CACHE_LINE_SIZE       16
- #define LG_L1_CACHE_LINE_SIZE     4 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/directfb/directfb_1.5.3.bb b/meta/recipes-graphics/directfb/directfb_1.5.3.bb
deleted file mode 100644
index 9f527e1..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.5.3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require directfb.inc
-
-RV = "1.5-0"
-PR = "r0"
-
-DEPENDS += "sysfsutils"
-
-SRC_URI += "file://libdirect-Use-ARM-assembler-for-atomic-operations-on.patch \
-            file://libdirect-remove-include-of-linux-config.h.patch"
-
-EXTRA_OECONF = "\
-  --enable-freetype=yes \
-  --enable-zlib \
-  --with-gfxdrivers=none \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-"
-
-LEAD_SONAME = "libdirectfb-1.5.so.0"
-
-SRC_URI[md5sum] = "54a9ec931c8e3c82adb924194e65120e"
-SRC_URI[sha256sum] = "e57575e8bb5f6452db6d5d54d78e3a460bc08bf50b1fa10d0250936dbe2251f0"
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.1.bb b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
new file mode 100644
index 0000000..cafc21f
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
@@ -0,0 +1,23 @@
+require directfb.inc
+
+RV = "1.6-0"
+PR = "${INC_PR}.0"
+
+DEPENDS += "sysfsutils"
+
+SRC_URI += "file://fix-compilation-with-zlib.patch"
+
+EXTRA_OECONF = "\
+  --enable-freetype=yes \
+  --enable-zlib \
+  --with-gfxdrivers=none \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
+"
+
+LEAD_SONAME = "libdirectfb-1.6.so.0"
+
+SRC_URI[md5sum] = "76d3066e75664aa79204af545f2f3c65"
+SRC_URI[sha256sum] = "f47575ea35dd8a30e548c04bf52d8565756d0bed45d1cf9f8afac1cf9b521c45"
+
-- 
1.7.9.5



