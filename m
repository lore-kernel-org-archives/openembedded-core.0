Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 12DE571A65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 16:49:44 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 12 May 2017 09:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,330,1491289200"; d="scan'208";a="99638334"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.129])
	by orsmga005.jf.intel.com with ESMTP; 12 May 2017 09:49:45 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 11:49:59 -0500
Message-Id: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] qemu: Upgrade to 2.8.1.1
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
X-List-Received-Date: Fri, 12 May 2017 16:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed patch target-ppc-fix-user-mode.patch [1] already on
upstream.

[1] http://git.qemu.org/?p=qemu.git;a=history;f=linux-user/main.c;
h=65a769cf797254a86a7cf589d69e67595a9e1adb;hb=refs/heads/stable-2.8

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../qemu/qemu/target-ppc-fix-user-mode.patch       | 48 ----------------------
 .../qemu/{qemu_2.8.0.bb => qemu_2.8.1.1.bb}        |  5 +--
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
 rename meta/recipes-devtools/qemu/{qemu_2.8.0.bb => qemu_2.8.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch b/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
deleted file mode 100644
index ba21e71..0000000
--- a/meta/recipes-devtools/qemu/qemu/target-ppc-fix-user-mode.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-[Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread
-
-From: Sam Bobroff
-Subject: [Qemu-ppc] [PATCH 1/1] target-ppc, tcg: fix usermode segfault with pthread_create()
-Date: Mon, 30 Jan 2017 16:08:07 +1100
-Programs run under qemu-ppc64 on an x86_64 host currently segfault
-if they use pthread_create() due to the adjustment made to the NIP in
-commit bd6fefe71cec5a0c7d2be4ac96307f25db56abf9.
-
-This patch changes cpu_loop() to set the NIP back to the
-pre-incremented value before calling do_syscall(), which causes the
-correct address to be used for the new thread and corrects the fault.
-
-Signed-off-by: Sam Bobroff <address@hidden>
-
-Upstream-Status: Backport
-
----
-
-linux-user/main.c | 4 +++-
-1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/main.c b/linux-user/main.c
-index 30049581ef..b5dee01541 100644
---- a/linux-user/main.c
-+++ b/linux-user/main.c
-@@ -1712,18 +1712,20 @@ void cpu_loop(CPUPPCState *env)
-              * in syscalls.
-              */
-             env->crf[0] &= ~0x1;
-+            env->nip += 4;
-             ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
-                              env->gpr[5], env->gpr[6], env->gpr[7],
-                              env->gpr[8], 0, 0);
-             if (ret == -TARGET_ERESTARTSYS) {
-+                env->nip -= 4;
-                 break;
-             }
-             if (ret == (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {
-+                env->nip -= 4;
-                 /* Returning from a successful sigreturn syscall.
-                    Avoid corrupting register state.  */
-                 break;
-             }
--            env->nip += 4;
-             if (ret > (target_ulong)(-515)) {
-                 env->crf[0] |= 0x1;
-                 ret = -ret;
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/qemu/qemu_2.8.0.bb
rename to meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
index 19d7e8f..d37dd49 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
@@ -19,7 +19,6 @@ SRC_URI += " \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
-            file://target-ppc-fix-user-mode.patch \
             file://glibc-2.25.patch \
 "
 
@@ -39,8 +38,8 @@ SRC_URI_append_class-native = " \
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
-SRC_URI[sha256sum] = "dafd5d7f649907b6b617b822692f4c82e60cf29bc0fc58bc2036219b591e5e62"
+SRC_URI[md5sum] = "a6a23a0c59fd0f8ec564b0fb89a79954"
+SRC_URI[sha256sum] = "f62ab18a1fb9ff5b4c81ed44becc945b11581eff777618141bdb787da55d3638"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.1.4


