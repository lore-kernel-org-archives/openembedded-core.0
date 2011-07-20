Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDG-0001ZS-Oy
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753286"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:08 -0700
Message-Id: <15ca725fc2980029e4711f5a5d7b9968f011240f.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 21/50] flac: fix build issues with e500v2 (gnuspe) toolchain
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:05 -0000

From: Kumar Gala <galak@kernel.crashing.org>

For a PPC target flac will try to build with altivec optimizations.
Altivec and SPE are mutually exclusive options.  Between flac's
configure choices and the ppce500v2 tune file options we'd end up with
a compile invocation with the following arguments:

-mabi=spe -mspe -mabi=altivec -maltivec

Which would cause the compile to fail due to the mutual exclusion.

Pulled in a patch from the debian SPE port that addresses this issue:

http://lists.alioth.debian.org/pipermail/pkg-multimedia-maintainers/2010-June/010212.html

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |   74 ++++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    5 +-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
new file mode 100644
index 0000000..8626336
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
@@ -0,0 +1,74 @@
+From f9b017c2c958d968cc5dfd36dc68fc8e5fb89a58 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Fri, 11 Jun 2010 09:48:58 +0200
+Subject: [PATCH] No AltiVec on SPE
+
+Consider *gnuspe which matches powerpc-unknown-linux-gnuspe where
+AltiVec is not available at all. This triplet uses SPE which is
+incompatible with AltiVec shares the same opcode range and can't be used
+at all.
+
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+---
+ configure.in            |    8 ++++++++
+ src/libFLAC/Makefile.am |   10 +++++++++-
+ 2 files changed, 17 insertions(+), 1 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index bfa6d8e..17b7c73 100644
+--- a/configure.in
++++ b/configure.in
+@@ -82,6 +82,14 @@ case "$host" in
+ 	*) OBJ_FORMAT=elf ;;
+ esac
+ AC_SUBST(OBJ_FORMAT)
++case "$host" in
++	*-gnuspe)
++		abi_spe=true
++		AC_DEFINE(FLAC__CPU_PPC_SPE)
++		AH_TEMPLATE(FLAC__CPU_PPC_SPE, [define if building for PowerPC with SPE ABI])
++		;;
++esac
++AM_CONDITIONAL(FLaC__CPU_PPC_SPE, test "x$abi_spe" = xtrue)
+ 
+ # only needed because of ntohl() usage, can get rid of after that's gone:
+ case "$host" in
+diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
+index cbfb0ac..5785372 100644
+--- a/src/libFLAC/Makefile.am
++++ b/src/libFLAC/Makefile.am
+@@ -40,8 +40,13 @@ if FLaC__SYS_DARWIN
+ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
+ else
+ # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
++CPUCFLAGS =
++if FLaC__CPU_PPC_SPE
++else
++CPUCFLAGS += -maltivec -mabi=altivec
++endif
+ #@@@ PPC optimizations temporarily disabled
+-CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
++CPUCFLAGS += -DFLAC__NO_ASM
+ endif
+ endif
+ 
+@@ -58,6 +63,8 @@ endif
+ if FLaC__CPU_PPC
+ ARCH_SUBDIRS = ppc
+ if FLaC__HAS_AS__TEMPORARILY_DISABLED
++if FLaC__CPU_PPC_SPE
++else
+ LOCAL_EXTRA_LIBADD = ppc/as/libFLAC-asm.la
+ LOCAL_EXTRA_LDFLAGS = "-Wl,-read_only_relocs,warning"
+ else
+@@ -68,6 +75,7 @@ endif
+ endif
+ endif
+ endif
++endif
+ 
+ libFLAC_la_LIBADD = $(LOCAL_EXTRA_LIBADD) @OGG_LIBS@
+ 
+-- 
+1.5.6.5
+
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 92bcec6..fc8e14f 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -14,12 +14,13 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
            file://disable-xmms-plugin.patch;patch=1 \
            file://flac-gcc43-fixes.patch;patch=1 \
-           file://xmms.m4"
+           file://xmms.m4 \
+           file://0001-No-AltiVec-on-SPE.patch"
 
 SRC_URI[md5sum] = "153c8b15a54da428d1f0fadc756c22c7"
 SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf"
-- 
1.7.3.4



