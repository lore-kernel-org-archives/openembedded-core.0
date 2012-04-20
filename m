Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH75-0005g2-IO
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167910"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:21 -0700
Message-Id: <2dfb28691320b467b573d0b9c407c436c17d2bb6.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/43] qemu: Backport a patch to solve SSE2 instruction emulation issues
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fix addresses various issues seen in qemux86-64 images:
 * scroll bars in matchbox-terminal not working
 * files not appearing in pcmanfm
 * warnings on the console from glib/gobject about invalid gdouble values

Its due to an emulation issue in qemu which the backported patch fixes.

[YOCTO #1906]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 2 files changed, 68 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
new file mode 100644
index 0000000..405d557
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
@@ -0,0 +1,66 @@
+From a4d1f142542935b90d2eb30f3aead4edcf455fe6 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sat, 7 Jan 2012 15:20:11 +0100
+Subject: [PATCH 1/1] target-i386: fix {min,max}{pd,ps,sd,ss} SSE2 instructions
+
+minpd, minps, minsd, minss and maxpd, maxps, maxsd, maxss SSE2
+instructions have been broken when switching target-i386 to softfloat.
+It's not possible to use comparison instructions on float types anymore
+to softfloat, so use the floatXX_lt function instead, as the
+float_XX_min and float_XX_max functions can't be used due to the Intel
+specific behaviour.
+
+As it implements the correct NaNs behaviour, let's remove the
+corresponding entry from the TODO.
+
+It fixes GDM screen display on Debian Lenny.
+
+Thanks to Peter Maydell and Jason Wessel for their analysis of the
+problem.
+
+Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+---
+ target-i386/TODO      |    1 -
+ target-i386/ops_sse.h |    9 +++++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+This fixes scrollbar issues in matchbox-terminal/vte on qemux86-64 and
+files not appearing in pcmanfm, as well as glib/gobject errors to do with gdoubles
+on the console [YOCTO #1906]
+
+Upstream-Status: Backport
+
+Index: qemu-0.15.1/target-i386/TODO
+===================================================================
+--- qemu-0.15.1.orig/target-i386/TODO	2011-10-12 16:41:43.000000000 +0000
++++ qemu-0.15.1/target-i386/TODO	2012-04-19 07:30:38.704073075 +0000
+@@ -15,7 +15,6 @@
+ - DRx register support
+ - CR0.AC emulation
+ - SSE alignment checks
+-- fix SSE min/max with nans
+ 
+ Optimizations/Features:
+ 
+Index: qemu-0.15.1/target-i386/ops_sse.h
+===================================================================
+--- qemu-0.15.1.orig/target-i386/ops_sse.h	2011-10-12 16:41:43.000000000 +0000
++++ qemu-0.15.1/target-i386/ops_sse.h	2012-04-19 07:30:38.712073076 +0000
+@@ -584,10 +584,15 @@
+ #define FPU_SUB(size, a, b) float ## size ## _sub(a, b, &env->sse_status)
+ #define FPU_MUL(size, a, b) float ## size ## _mul(a, b, &env->sse_status)
+ #define FPU_DIV(size, a, b) float ## size ## _div(a, b, &env->sse_status)
+-#define FPU_MIN(size, a, b) (a) < (b) ? (a) : (b)
+-#define FPU_MAX(size, a, b) (a) > (b) ? (a) : (b)
+ #define FPU_SQRT(size, a, b) float ## size ## _sqrt(b, &env->sse_status)
+ 
++/* Note that the choice of comparison op here is important to get the
++ * special cases right: for min and max Intel specifies that (-0,0),
++ * (NaN, anything) and (anything, NaN) return the second argument.
++ */
++#define FPU_MIN(size, a, b) float ## size ## _lt(a, b, &env->sse_status) ? (a) : (b)
++#define FPU_MAX(size, a, b) float ## size ## _lt(b, a, &env->sse_status) ? (a) : (b)
++
+ SSE_HELPER_S(add, FPU_ADD)
+ SSE_HELPER_S(sub, FPU_SUB)
+ SSE_HELPER_S(mul, FPU_MUL)
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index 05ea5f8..e90f339 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r5"
+PR = "r6"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
@@ -18,6 +18,7 @@ SRC_URI = "\
     file://fallback-to-safe-mmap_min_addr.patch \
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
+    file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
     "
 
 # Only use the GL passthrough patches for native/nativesdk versions
-- 
1.7.7.6



