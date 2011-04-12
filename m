Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Q9RGY-0007Hc-PL
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 02:15:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2011 17:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="627051293"
Received: from yocto-build8.sh.intel.com (HELO localhost) ([10.239.48.1])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2011 17:13:20 -0700
Message-Id: <0323ebf6b38d0ba0d1e955c4a3aca7f96ff3e803.1302565606.git.lei.mei@intel.com>
In-Reply-To: <cover.1302565606.git.lei.mei@intel.com>
References: <cover.1302565606.git.lei.mei@intel.com>
Old-Date: Wed, 6 Apr 2011 16:12:17 +0800
Date: Tue, 12 Apr 2011  8:11:00 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemu: Fix the qemu GL application start failure.
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
X-List-Received-Date: Tue, 12 Apr 2011 00:15:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Some turn-on macro/variable are re-arranged, buffer pointer is extended to
support 32/64b combination of target/host.

[YOCTO #688] fixed.

Signed-off-by:  Zhai Edwin <edwin.zhai@intel.com>
---
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |   70 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    1 +
 meta/recipes-sato/pimlico/dates_git.bb             |    2 +
 3 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch

diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
new file mode 100644
index 0000000..c395b60
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
@@ -0,0 +1,70 @@
+This patch fix GL application start failure on qemu 0.14.0.
+
+Some turn-on macro/variable are re-arranged, buffer pointer is extended to
+support 32/64b combination of target/host.
+
+This is not perfect fix, and we need consider other GL alternatives in future.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Index: qemu-0.14.0/target-i386/opengl_func.h
+===================================================================
+--- qemu-0.14.0.orig/target-i386/opengl_func.h	2011-04-08 16:43:46.000000000 +0800
++++ qemu-0.14.0/target-i386/opengl_func.h	2011-04-08 16:45:55.000000000 +0800
+@@ -26,8 +26,9 @@
+ #include "mesa_glext.h"
+ 
+ /* Argument list are internally of a type that can hold a target pointer
+- * or a host pointer.  */
+-typedef target_phys_addr_t arg_t;
++ * or a host pointer. If 32b target runs on 64b host, it should be big enough
++ * to hold host pointer */
++typedef long unsigned int arg_t;
+ 
+ enum {
+     TYPE_NONE,
+Index: qemu-0.14.0/target-i386/translate.c
+===================================================================
+--- qemu-0.14.0.orig/target-i386/translate.c	2011-04-08 16:19:15.000000000 +0800
++++ qemu-0.14.0/target-i386/translate.c	2011-04-08 16:22:03.000000000 +0800
+@@ -2652,17 +2652,19 @@
+     s->is_jmp = DISAS_TB_JUMP;
+ }
+ 
+-int enable_gl = 0;
++extern int enable_gl;
+ 
+ /* an interrupt is different from an exception because of the
+    privilege checks */
+ static void gen_interrupt(DisasContext *s, int intno,
+                           target_ulong cur_eip, target_ulong next_eip)
+ {
++#if !defined(CONFIG_USER_ONLY)
+     if (enable_gl && intno == 0x99) {
+         gen_helper_opengl();
+         return;
+     }
++#endif
+ 
+     if (s->cc_op != CC_OP_DYNAMIC)
+         gen_op_set_cc_op(s->cc_op);
+Index: qemu-0.14.0/vl.c
+===================================================================
+--- qemu-0.14.0.orig/vl.c	2011-04-08 16:11:43.000000000 +0800
++++ qemu-0.14.0/vl.c	2011-04-08 16:20:05.000000000 +0800
+@@ -229,7 +229,7 @@
+ unsigned int nb_prom_envs = 0;
+ const char *prom_envs[MAX_PROM_ENVS];
+ int boot_menu;
+-extern int enable_gl;
++int enable_gl = 0;
+ 
+ typedef struct FWBootEntry FWBootEntry;
+ 
+@@ -1909,6 +1909,7 @@
+     return popt;
+ }
+ 
++#define TARGET_OPENGL_OK
+ int main(int argc, char **argv, char **envp)
+ {
+     const char *gdbstub_dev = NULL;
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index d8535b2..e440759 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://spice-qxl-locking-fix-for-qemu-kvm.patch \
     file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
     file://larger_default_ram_size.patch \
+    file://qemugl-fix.patch \
     "
 SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
 SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"
diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
index f0a12f8..2823594 100644
--- a/meta/recipes-sato/pimlico/dates_git.bb
+++ b/meta/recipes-sato/pimlico/dates_git.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
 	   file://make-382.patch \
 	   file://dso_linking_change_build_fix.patch"
+
+RDEPENDS_${PN} = "mesa-demos"
-- 
1.7.1



