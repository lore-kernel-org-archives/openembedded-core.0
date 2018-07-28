Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCDB6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 08:49:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2018 01:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,413,1526367600"; d="scan'208";a="76263270"
Received: from kaovince-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.166.184])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2018 01:49:53 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 16:49:49 +0800
Message-Id: <20180728084950.13242-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH 1/2] make-mod-scripts/kernel-devsrc: Fix objtool issues
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
X-List-Received-Date: Sat, 28 Jul 2018 08:49:54 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Kernels which use tools/objtool can now fail when building external modules
due to objtool being missing, the generated files can also cause problems
for kernel-devsrc.

Ensure objtool is generated in make-mod-scripts by also calling
"make prepare".

For devsrc, delete the generated binaries since they'd be native
binaries and unsuitable for the target.

The oeqa kernel module tests also need to have the additional "make prepare"
step added.

(From OE-Core rev: 52fd2993784b4218f5df4f343e7da45d964df305)

Fixes [YOCTO #12860]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Tweaked to add "make prepare" to module-base.bbclass instead of
make-mod-scripts.bb]
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/module-base.bbclass            | 2 +-
 meta/lib/oeqa/runtime/cases/kernelmodule.py | 2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb  | 7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 6fe77c01b7..64729770c7 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -23,5 +23,5 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare
 }
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 11ad7b7f01..de1a5aa445 100644
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
index c1b5b7786d..8bbfa23e4b 100644
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
-- 
2.17.1


