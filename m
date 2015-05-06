Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 895FD73D98
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:21:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2015 08:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="567210793"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 06 May 2015 08:21:48 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 18:21:46 +0300
Message-Id: <30001fca72d63d0e608219e475245894a69ae278.1430925667.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430925667.git.cristian.iorga@intel.com>
References: <cover.1430925667.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430925667.git.cristian.iorga@intel.com>
References: <cover.1430925667.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] qemu: upgrade to 2.3.0
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
X-List-Received-Date: Wed, 06 May 2015 15:21:52 -0000

Qemu-Arm-versatilepb-Add-memory-size-checking.patch
brought up to date;
37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch removed,
integrated upstream;
glx enable config option changed to opengl enable,
update accordingly.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 22 ++++----
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch | 59 ----------------------
 .../qemu/{qemu_2.2.0.bb => qemu_2.3.0.bb}          |  5 +-
 4 files changed, 15 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
 rename meta/recipes-devtools/qemu/{qemu_2.2.0.bb => qemu_2.3.0.bb} (76%)

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
index b0c2ea5..1a6cf51 100644
--- a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -18,27 +18,29 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Update it when upgrade qemu to 2.2.0
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
 ---
- hw/arm/versatilepb.c |    6 ++++++
- 1 file changed, 6 insertions(+)
+ hw/arm/versatilepb.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
-index b48d84c..ad2cd5a 100644
+index 6c69f4e..9278d90 100644
 --- a/hw/arm/versatilepb.c
 +++ b/hw/arm/versatilepb.c
-@@ -198,6 +198,12 @@ static void versatile_init(MachineState *machine, int board_id)
-         fprintf(stderr, "Unable to find CPU definition\n");
+@@ -204,6 +204,13 @@ static void versatile_init(MachineState *machine, int board_id)
          exit(1);
      }
-+    if (ram_size > (256 << 20)) {
+
++    if (machine->ram_size > (256 << 20)) {
 +        fprintf(stderr,
 +                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
 +                ((unsigned int)ram_size / (1 << 20)));
 +        exit(1);
 +    }
-     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size,
-                            &error_abort);
-     vmstate_register_ram_global(ram);
++
+     cpuobj = object_new(object_class_get_name(cpu_oc));
+
+     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
 -- 
-1.7.10.4
+2.1.0
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4225db7..4274b25 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -115,7 +115,7 @@ PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,mesa"
+PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 
diff --git a/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch b/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
deleted file mode 100644
index 8609e3f..0000000
--- a/meta/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Without this patch, x86_64 images would show invalid EDSCA key errors
-with sshd from openssh (but not dropbear) during init. 
-
-This would cause problems with operation with some distros where EDSCA 
-keys were mandatory. The issue was present in qemu 2.2.1 and not in 
-2.3.0-rc0, bisected to this commit which was then backported.
-
-From 37ed3bf1ee07bb1a26adca0df8718f601f231c0b Mon Sep 17 00:00:00 2001
-From: Richard Henderson <rth@twiddle.net>
-Date: Fri, 20 Feb 2015 11:13:50 -0800
-Subject: [PATCH] tcg: Complete handling of ALWAYS and NEVER
-
-Missing from movcond
-
-Signed-off-by: Richard Henderson <rth@twiddle.net>
----
- tcg/tcg-op.c |   22 +++++++++++++++++-----
- 1 files changed, 17 insertions(+), 5 deletions(-)
-
-Upstream-Status: Backport
-RP 2015/3/24
-
-Index: qemu-2.2.0/tcg/tcg-op.h
-===================================================================
---- qemu-2.2.0.orig/tcg/tcg-op.h
-+++ qemu-2.2.0/tcg/tcg-op.h
-@@ -2186,7 +2186,11 @@ static inline void tcg_gen_movcond_i32(T
-                                        TCGv_i32 c1, TCGv_i32 c2,
-                                        TCGv_i32 v1, TCGv_i32 v2)
- {
--    if (TCG_TARGET_HAS_movcond_i32) {
-+    if (cond == TCG_COND_ALWAYS) {
-+        tcg_gen_mov_i32(ret, v1);
-+    } else if (cond == TCG_COND_NEVER) {
-+        tcg_gen_mov_i32(ret, v2);
-+    } else if (TCG_TARGET_HAS_movcond_i32) {
-         tcg_gen_op6i_i32(INDEX_op_movcond_i32, ret, c1, c2, v1, v2, cond);
-     } else {
-         TCGv_i32 t0 = tcg_temp_new_i32();
-@@ -2205,6 +2209,11 @@ static inline void tcg_gen_movcond_i64(T
-                                        TCGv_i64 c1, TCGv_i64 c2,
-                                        TCGv_i64 v1, TCGv_i64 v2)
- {
-+    if (cond == TCG_COND_ALWAYS) {
-+        tcg_gen_mov_i64(ret, v1);
-+    } else if (cond == TCG_COND_NEVER) {
-+        tcg_gen_mov_i64(ret, v2);
-+    } else {
- #if TCG_TARGET_REG_BITS == 32
-     TCGv_i32 t0 = tcg_temp_new_i32();
-     TCGv_i32 t1 = tcg_temp_new_i32();
-@@ -2246,6 +2255,7 @@ static inline void tcg_gen_movcond_i64(T
-         tcg_temp_free_i64(t1);
-     }
- #endif
-+    }
- }
- 
- static inline void tcg_gen_add2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
similarity index 76%
rename from meta/recipes-devtools/qemu/qemu_2.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.3.0.bb
index 757de89..25c5e4d 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-SRC_URI[sha256sum] = "b68c9b6c7c694f5489b5a6bffe993cd976ffbb78e7d178eb3bc016caf460039c"
+SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
+SRC_URI[sha256sum] = "b6bab7f763d5be73e7cb5ee7d4c8365b7a8df2972c52fa5ded18893bd8281588"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
2.1.0


