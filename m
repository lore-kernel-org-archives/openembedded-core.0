Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF9506E85E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 13:29:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 06:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,957,1392192000"; d="scan'208";a="521453573"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 06:29:40 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 16:33:09 +0300
Message-Id: <fa553997e0ccc362df851177508ec414f6a84e25.1401715767.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1401715767.git.cristian.iorga@intel.com>
References: <cover.1401715767.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1401715767.git.cristian.iorga@intel.com>
References: <cover.1401715767.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] qemu: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 02 Jun 2014 13:29:40 -0000

- switched to ${BP} variable.
- updated download link;
- fxrstorssefix.patch no longer needed, superseded;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-devtools/qemu/qemu/fxrstorssefix.patch | 31 ----------------------
 .../qemu/{qemu_1.7.0.bb => qemu_2.0.0.bb}          |  9 +++----
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fxrstorssefix.patch
 rename meta/recipes-devtools/qemu/{qemu_1.7.0.bb => qemu_2.0.0.bb} (70%)

diff --git a/meta/recipes-devtools/qemu/qemu/fxrstorssefix.patch b/meta/recipes-devtools/qemu/qemu/fxrstorssefix.patch
deleted file mode 100644
index 59ab0f5..0000000
--- a/meta/recipes-devtools/qemu/qemu/fxrstorssefix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-When we restore the mxcsr resgister with FXRSTOR, we need to update the various SSE
-flag files by calling update_sse_status() else we're using the flags from some other
-process with interesting results.
-
-The code isn't ordered to make this easy hence the function declaration.
-
-Upstream-Status: Pending
-
-RP 2013/9/30
-
-Index: qemu-1.5.0/target-i386/fpu_helper.c
-===================================================================
---- qemu-1.5.0.orig/target-i386/fpu_helper.c	2013-09-30 18:46:39.283377648 +0000
-+++ qemu-1.5.0/target-i386/fpu_helper.c	2013-09-30 18:46:56.895377232 +0000
-@@ -1149,6 +1149,8 @@
-     }
- }
- 
-+static void update_sse_status(CPUX86State *env);
-+
- void helper_fxrstor(CPUX86State *env, target_ulong ptr, int data64)
- {
-     int i, fpus, fptag, nb_xmm_regs;
-@@ -1180,6 +1182,7 @@
-     if (env->cr[4] & CR4_OSFXSR_MASK) {
-         /* XXX: finish it */
-         env->mxcsr = cpu_ldl_data(env, ptr + 0x18);
-+        update_sse_status(env);
-         /* cpu_ldl_data(env, ptr + 0x1c); */
-         if (env->hflags & HF_CS64_MASK) {
-             nb_xmm_regs = 16;
diff --git a/meta/recipes-devtools/qemu/qemu_1.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.0.0.bb
similarity index 70%
rename from meta/recipes-devtools/qemu/qemu_1.7.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.0.0.bb
index b776ccc..b8ce624 100644
--- a/meta/recipes-devtools/qemu/qemu_1.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.0.0.bb
@@ -3,13 +3,12 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://fxrstorssefix.patch \
-            file://qemu-enlarge-env-entry-size.patch \
+SRC_URI += "file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch"
 
-SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
-SRC_URI[sha256sum] = "31f333a85f2d14c605a77679904a9668eaeb1b6dc7da53a1665230f46bc21314"
+SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
+SRC_URI[md5sum] = "2790f44fd76da5de5024b4aafeb594c2"
+SRC_URI[sha256sum] = "60cc1aa0cad39cec891f970bed60ca8a484f071adad4943123599ac223543a3b"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
1.9.1


