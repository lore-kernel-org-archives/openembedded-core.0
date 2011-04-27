Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEq-0005TG-0g
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 00:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028709"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:30:14 -0700
Message-Id: <c4bf8e087fccc5aa134ce411011f3f631e486ebb.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 21:43:17 -0700
Date: Wed, 27 Apr 2011  0:30:14 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 52/52] qemu: Fix non-sdl/opengl build
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:44 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |   41 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    2 +
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    3 +-
 3 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
new file mode 100644
index 0000000..1f34f07
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
@@ -0,0 +1,41 @@
+diff -u -r qemu-0.14.0/Makefile.target qemu-0.14.0-fixed/Makefile.target
+--- qemu-0.14.0/Makefile.target 2011-04-26 21:22:17.627637741 -0700
++++ qemu-0.14.0-fixed/Makefile.target   2011-04-26 21:23:02.767637747 -0700
+@@ -82,8 +82,10 @@
+ libobj-$(TARGET_I386) += helper_opengl.o opengl_exec.o
+ libobj-$(TARGET_X86_64) += helper_opengl.o opengl_exec.o
+ else
++ifdef CONFIG_SDL
+ libobj-$(TARGET_I386) += dummygl.o
+ libobj-$(TARGET_X86_64) += dummygl.o
++endif
+ endif #CONFIG_LINUX_USER
+ libobj-$(TARGET_ARM) += dummygl.o
+ libobj-$(TARGET_MIPS) += dummygl.o
+Only in qemu-0.14.0-fixed: config.log
+diff -u -r qemu-0.14.0/target-i386/helper.h qemu-0.14.0-fixed/target-i386/helper.h
+--- qemu-0.14.0/target-i386/helper.h    2011-04-26 21:22:11.418637742 -0700
++++ qemu-0.14.0-fixed/target-i386/helper.h      2011-04-26 21:23:02.539637747 -0700
+@@ -217,6 +217,9 @@
+ DEF_HELPER_2(rcrq, tl, tl, tl)
+ #endif
+ 
++#ifdef CONFIG_SDL
+ DEF_HELPER_0(opengl, void)
++#endif
++
+ 
+ #include "def-helper.h"
+diff -u -r qemu-0.14.0/target-i386/translate.c qemu-0.14.0-fixed/target-i386/translate.c
+--- qemu-0.14.0/target-i386/translate.c 2011-04-26 21:22:21.600637743 -0700
++++ qemu-0.14.0-fixed/target-i386/translate.c   2011-04-26 21:23:02.538637747 -0700
+@@ -2659,7 +2659,7 @@
+ static void gen_interrupt(DisasContext *s, int intno,
+                           target_ulong cur_eip, target_ulong next_eip)
+ {
+-#if !defined(CONFIG_USER_ONLY)
++#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_SDL)
+     if (enable_gl && intno == 0x99) {
+         gen_helper_opengl();
+         return;
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 362e9f3..49bcf8e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -16,6 +16,8 @@ EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --di
 
 #EXTRA_OECONF += "--disable-sdl"
 
+COMPATIBLE_MACHINES = "qemux86 qemuppc"
+
 inherit autotools
 
 # For our gl powered QEMU you need libGL and SDL headers
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index e440759..f0a4bea 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r0"
+PR = "r1"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -25,6 +25,7 @@ SRC_URI = "\
     file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
     file://larger_default_ram_size.patch \
     file://qemugl-fix.patch \
+    file://opengl-sdl-fix.patch \
     "
 SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
 SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"
-- 
1.7.1.1



