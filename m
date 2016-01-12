Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEF86FEE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 21:54:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 13:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,285,1449561600"; d="scan'208";a="891875875"
Received: from chang-s2600cp.jf.intel.com ([10.54.31.19])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2016 13:54:20 -0800
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 13:53:56 -0800
Message-Id: <1452635636-23327-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] Explicitly mapping between i386/x86_64 and x86 for kernel ARCH
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
X-List-Received-Date: Tue, 12 Jan 2016 21:54:36 -0000

For a bare-bone kernel recipe which specifies 32 bit x86 target,
a 64 bit .config will be generated from do_configure task when
building 32-bit qemux86, once all of these conditions are true:

() arch of host is x86_64
() kernel source tree used in build has commit ffee0de41 which
actually chooses i386 or x86_64 defconfig by asking host when
ARCH is "x86" (arch/x86/Makefile)
() bare-bone kernel recipe inherits directly from kernel without
other special treatments.

Build will fail because of the mismatched kernel architecture.

The patch sets ARCH i386 or x86_64 explicitly to configure
task to avoid this host contamination. Kernel artifact is also
changed so that it can map i386 and x64 back to arch/x86 when
needed.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---

The old V1 broke lttng-modules building in the last submission. This V2 updates
kernel artifact to fix it. Considering there are multiple references of ARCH
in poky, a better test coverage is suggested before merging it to mainline, even
I have done some build tests prior to submission.

 meta/classes/kernel-arch.bbclass |  4 +++-
 meta/classes/kernel.bbclass      | 15 ++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 3ed5986..d8b180e 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -21,7 +21,9 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs', True).split()
 
-    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    if   re.match('i.86$', a):                  return 'i386'
+    elif re.match('x86.64$', a):                return 'x86_64'
+    elif re.match('athlon$', a):                return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 997376d..5c3287b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -317,9 +317,18 @@ do_shared_workdir () {
 		cp -fR include/generated/* $kerneldir/include/generated/
 	fi
 
-	if [ -d arch/${ARCH}/include/generated ]; then
-		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
-		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
+	# When ARCH is set to i386 or x86_64, we need to map ARCH to the real name of src
+	# dir (x86) under arch/ of kenrel tree, so that we can find correct source to copy.
+
+	if [ "${ARCH}" = "i386" ] || [ "${ARCH}" = "x86_64" ]; then
+		KERNEL_SRCARCH=x86
+	else
+		KERNEL_SRCARCH=${ARCH}
+	fi
+
+	if [ -d arch/${KERNEL_SRCARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
+		cp -fR arch/${KERNEL_SRCARCH}/include/generated/* $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
 	fi
 }
 
-- 
1.9.1


