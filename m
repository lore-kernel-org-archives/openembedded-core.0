Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SaQPZ-0006HU-1d
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 13:52:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2012 04:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106677863"
Received: from unknown (HELO lpalcu-laptop.ger.corp.intel.com)
	([10.252.120.35])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 04:41:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2012 14:41:24 +0300
Message-Id: <1338550885-4165-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
References: <1338550885-4165-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] directfb: upgrade to 1.5.3
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
X-List-Received-Date: Fri, 01 Jun 2012 11:52:57 -0000

Also, backported a couple of patches from upstream that fix some
compilations issues for ARM and PPC.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |    2 +-
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ++++++++++++++++++++
 ...ibdirect-remove-include-of-linux-config.h.patch |   27 ++++++++++++++++++++
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |   20 ---------------
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 +++++++++++++++++
 5 files changed, 78 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 create mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.4.15.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 515d19f..3fd6161 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 HOMEPAGE = "http://directfb.org"
 DEPENDS = "jpeg libpng freetype zlib tslib"
 
-SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
+SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.5/DirectFB-${PV}.tar.gz \
            file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
            file://configurefix.patch"
 
diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch b/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
new file mode 100644
index 0000000..277189b
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
@@ -0,0 +1,27 @@
+From 54f775dfc516115c4d654d250189f431a82d1d42 Mon Sep 17 00:00:00 2001
+From: Denis Oliver Kropp <dok@directfb.org>
+Date: Sun, 27 May 2012 11:40:31 +0200
+Subject: [PATCH] libdirect: Use ARM assembler for atomic operations only if
+ ARCH_ARMv7 is defined.
+
+Upstream-Status: backport from 1.6.0-pre1
+---
+ lib/direct/atomic.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/direct/atomic.h b/lib/direct/atomic.h
+index fe7664f..74d8d18 100644
+--- a/lib/direct/atomic.h
++++ b/lib/direct/atomic.h
+@@ -183,7 +183,7 @@
+ #endif
+ 
+ 
+-#if defined(ARCH_ARM) && !defined(ARCH_IWMMXT)
++#if defined(ARCH_ARMv7) && !defined(ARCH_IWMMXT)
+ 
+ static inline int _D__atomic_cmpxchg(volatile int *ptr, int old, int _new)
+ {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
new file mode 100644
index 0000000..eeb7738
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
@@ -0,0 +1,27 @@
+From cd575a84f10d90759e069f5f2e6092251a1b84bd Mon Sep 17 00:00:00 2001
+From: Sven Neumann <s.neumann@raumfeld.com>
+Date: Fri, 23 Sep 2011 10:00:02 +0200
+Subject: [PATCH] libdirect: remove include of <linux/config.h>
+
+That header has been removed from the Linux kernel with 2.6.19
+and it should not have been needed anyway.
+---
+ lib/direct/ppcasm_memcpy_cachable.S |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/direct/ppcasm_memcpy_cachable.S b/lib/direct/ppcasm_memcpy_cachable.S
+index 920dea2..c1ef4fa 100644
+--- a/lib/direct/ppcasm_memcpy_cachable.S
++++ b/lib/direct/ppcasm_memcpy_cachable.S
+@@ -34,8 +34,6 @@
+ 
+ #define __ASSEMBLY__
+ 
+-#include <linux/config.h>
+-
+ #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
+ #define L1_CACHE_LINE_SIZE       16
+ #define LG_L1_CACHE_LINE_SIZE     4 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/directfb/directfb_1.4.15.bb b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
deleted file mode 100644
index 98d6b82..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.4.15.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require directfb.inc
-
-RV = "1.4-6"
-PR = "r2"
-
-DEPENDS += "sysfsutils"
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
-LEAD_SONAME = "libdirectfb-1.4.so.6"
-
-SRC_URI[md5sum] = "9b2b90b81d7ded2a4a5caa22daeb81ef"
-SRC_URI[sha256sum] = "a40e640b53da9b2b155d98bf8cb1d173b01418c04b176768307adebefa0b78a8"
diff --git a/meta/recipes-graphics/directfb/directfb_1.5.3.bb b/meta/recipes-graphics/directfb/directfb_1.5.3.bb
new file mode 100644
index 0000000..9f527e1
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb_1.5.3.bb
@@ -0,0 +1,23 @@
+require directfb.inc
+
+RV = "1.5-0"
+PR = "r0"
+
+DEPENDS += "sysfsutils"
+
+SRC_URI += "file://libdirect-Use-ARM-assembler-for-atomic-operations-on.patch \
+            file://libdirect-remove-include-of-linux-config.h.patch"
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
+LEAD_SONAME = "libdirectfb-1.5.so.0"
+
+SRC_URI[md5sum] = "54a9ec931c8e3c82adb924194e65120e"
+SRC_URI[sha256sum] = "e57575e8bb5f6452db6d5d54d78e3a460bc08bf50b1fa10d0250936dbe2251f0"
-- 
1.7.9.5



