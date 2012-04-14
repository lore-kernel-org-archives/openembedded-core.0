Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIz0R-0001NX-I9
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 11:11:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Apr 2012 01:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130842073"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2012 01:59:09 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 01:59:06 -0700
Message-Id: <098821261d32d11c7ad22ad6824e0f891acb1c44.1334390876.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
References: <b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334390876.git.nitin.a.kamble@intel.com>
References: <cover.1334390876.git.nitin.a.kamble@intel.com>
Subject: [v2 2/4] grub-1.99: use gcc-cross for building the target binaries
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
X-List-Received-Date: Sat, 14 Apr 2012 09:11:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

It was using distro gcc to build binaries for target. This got detected
on fedora 17 alpha, on which it hit an gcc-4.7 issue.

This Fixes Bug: [Yocto #2291]

More information in the patch header

Thanks to Saul Wold for suggesting to remove the --target parameter from
EXTRA_OECONF var.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../grub/files/grub-1.99-fpmath-sse-387-fix.patch  |   37 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    5 ++-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    5 ++-
 3 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch b/meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch
new file mode 100644
index 0000000..bea5944
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch
@@ -0,0 +1,37 @@
+Upstream-Status: pending
+
+This patch fixes this configure issue for grub when -mfpmath=sse is in the gcc parameters.
+
+configure:20574: i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/usr/local/dev/yocto/grubtest2/build/tmp/sysroots/emenlow -o conftest -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -nostdlib -Wl,--defsym,___main=0x8100  -Wall -W -I$(top_srcdir)/include -I$(top_builddir)/include  -DGRUB_MACHINE_PCBIOS=1 -DGRUB_MACHINE=I386_PC -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
+conftest.c:1:0: error: SSE instruction set disabled, using 387 arithmetics [-Werror]
+cc1: all warnings being treated as errors
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/13
+
+Index: grub-1.99/configure.ac
+===================================================================
+--- grub-1.99.orig/configure.ac
++++ grub-1.99/configure.ac
+@@ -378,7 +378,7 @@ if test "x$target_cpu" = xi386; then
+ 
+   # Some toolchains enable these features by default, but they need
+   # registers that aren't set up properly in GRUB.
+-  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow"
++  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387"
+ fi
+ 
+ # By default, GCC 4.4 generates .eh_frame sections containing unwind
+Index: grub-1.99/configure
+===================================================================
+--- grub-1.99.orig/configure
++++ grub-1.99/configure
+@@ -19991,7 +19991,7 @@ $as_echo "$grub_cv_cc_falign_loop" >&6;
+ 
+   # Some toolchains enable these features by default, but they need
+   # registers that aren't set up properly in GRUB.
+-  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow"
++  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387"
+ fi
+ 
+ # By default, GCC 4.4 generates .eh_frame sections containing unwind
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 93e9290..4f8a4bc 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,14 +16,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r6"
+PR = "r7"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
 PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-	file://grub-1.99_fix_for_automake_1.11.2.patch"
+	file://grub-1.99_fix_for_automake_1.11.2.patch \
+	file://grub-1.99-fpmath-sse-387-fix.patch"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
 SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index ac66e83..e61147f 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -12,10 +12,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r3"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
+          file://grub-1.99-fpmath-sse-387-fix.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
@@ -26,7 +27,7 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 inherit autotools
 inherit gettext
 
-EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --target=${TARGET_ARCH} --program-prefix="""
+EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="""
 
 do_configure() {
     oe_runconf
-- 
1.7.7



