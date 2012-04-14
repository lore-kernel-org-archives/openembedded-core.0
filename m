Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIz0b-0001NX-5j
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 11:11:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Apr 2012 01:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130842078"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2012 01:59:09 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 01:59:08 -0700
Message-Id: <9957a9b1e7f5d3756656ca77a4e310f2400d92db.1334390876.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
References: <b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334390876.git.nitin.a.kamble@intel.com>
References: <cover.1334390876.git.nitin.a.kamble@intel.com>
Subject: [v2 4/4] grub-1.99: fix configure error
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
X-List-Received-Date: Sat, 14 Apr 2012 09:11:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit deals with this configure error.

configure:20306: checking whether `ccache i586-poky-linux-gcc  -m32
-march=core2 -msse3 -mtune=generic -mfpmath=sse
--sysroot=/builddisk/build/build0/tmp/sysroots/emenlow' generates calls
to `__enable_execute_stack()'
configure:20320: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3
-mtune=generic -mfpmath=sse
--sysroot=/builddisk/build/build0/tmp/sysroots/emenlow -O2 -pipe -g
-feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith
-Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1
-falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2
-mno-3dnow -mfpmath=387 -fno-dwarf2-cfi-asm -m32 -fno-stack-protector
-mno-stack-arg-probe -Werror -Wno-trampolines -falign-loops=1 -S
conftest.c
conftest.c:308:6: error: no previous prototype for 'g'
[-Werror=missing-prototypes]
cc1: all warnings being treated as errors
configure:20323: $? = 1
configure:20327: error: ccache i586-poky-linux-gcc  -m32    -march=core2
-msse3 -mtune=generic -mfpmath=sse
--sysroot=/builddisk/build/build0/tmp/sysroots/emenlow failed to produce
assembly code

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../grub-1.99-fix-enable_execute_stack-check.patch |   27 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    3 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    4 ++-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch b/meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
new file mode 100644
index 0000000..9d7272b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending
+
+
+This patch avoids this configure failure
+
+configure:20306: checking whether `ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow' generates calls to `__enable_execute_stack()'
+configure:20320: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387 -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -Wno-trampolines -falign-loops=1 -S conftest.c
+conftest.c:308:6: error: no previous prototype for 'g' [-Werror=missing-prototypes]
+cc1: all warnings being treated as errors
+configure:20323: $? = 1
+configure:20327: error: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow failed to produce assembly code
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/13
+
+Index: grub-1.99/acinclude.m4
+===================================================================
+--- grub-1.99.orig/acinclude.m4
++++ grub-1.99/acinclude.m4
+@@ -317,6 +317,7 @@ dnl Check if the C compiler generates ca
+ AC_DEFUN([grub_CHECK_ENABLE_EXECUTE_STACK],[
+ AC_MSG_CHECKING([whether `$CC' generates calls to `__enable_execute_stack()'])
+ AC_LANG_CONFTEST([[
++void g (int);
+ void f (int (*p) (void));
+ void g (int i)
+ {
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 30e9c74..20dcdb9 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r8"
+PR = "r9"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -28,6 +28,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
 	file://grub-1.99-gcc-4.7.0.patch \
 	file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
 	file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
+        file://grub-1.99-fix-enable_execute_stack-check.patch \
 	"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index b08fa56..143b1e8 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -12,14 +12,16 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
+          file://grub-1.99_fix_for_automake_1.11.2.patch \
           file://grub-1.99-fpmath-sse-387-fix.patch \
           file://grub-1.99-gcc-4.7.0.patch \
           file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
           file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
+          file://grub-1.99-fix-enable_execute_stack-check.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-- 
1.7.7



