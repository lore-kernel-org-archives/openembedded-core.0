Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5510871B32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:04:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2TE4AF7001961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 29 Mar 2018 15:04:11 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f1Y9y-00034P-Pm; Thu, 29 Mar 2018 15:04:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 15:04:09 +0100
Message-Id: <1522332249-11760-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] make-mod-scripts/kernel-devsrc: Fix objtool issues
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
X-List-Received-Date: Thu, 29 Mar 2018 14:04:12 -0000

Kernels which use tools/objtool can now fail when building external modules
due to objtool being missing, the generated files can also cause problems
for kernel-devsrc.

Ensure objtool is generated in make-mod-scripts by also calling
"make prepare".

For devsrc, delete the generated binaries since they'd be native
binaries and unsuitable for the target.

The oqqa kernel module tests also need to have the additional "make prepare"
step added.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/kernelmodule.py                  | 2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb                   | 7 +++++++
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 11ad7b7..de1a5aa 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -28,7 +28,7 @@ class KernelModuleTest(OERuntimeTestCase):
     @OETestDepends(['gcc.GccCompileTest.test_gcc_compile'])
     def test_kernel_module(self):
         cmds = [
-            'cd /usr/src/kernel && make scripts',
+            'cd /usr/src/kernel && make scripts prepare',
             'cd /tmp && make',
             'cd /tmp && insmod hellomod.ko',
             'lsmod | grep hellomod',
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index c1b5b77..8bbfa23 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -69,6 +69,13 @@ do_install() {
                 cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
         fi
 
+        # Remove fixdep/objtool as they won't be target binaries
+        for i in fixdep objtool; do
+                if [ -e $kerneldir/tools/objtool/$i ]; then
+                        rm -rf $kerneldir/tools/objtool/$i
+                fi
+        done
+
         chown -R root:root ${D}
 }
 # Ensure we don't race against "make scripts" during cpio
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index d63701e..97c58c5 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -22,5 +22,6 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
+
 }
-- 
2.7.4


