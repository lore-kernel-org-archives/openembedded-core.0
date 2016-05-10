Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 891B360043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 21:50:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 10 May 2016 14:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="803402675"
Received: from tzanussi-mobl.amr.corp.intel.com ([10.254.118.22])
	by orsmga003.jf.intel.com with ESMTP; 10 May 2016 14:50:06 -0700
Message-ID: <5732578D.8040203@linux.intel.com>
Date: Tue, 10 May 2016 16:50:05 -0500
From: Tom Zanussi <tom.zanussi@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: liezhi.yang@windriver.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH][jethro] Revert "kernel/kernel-arch: Explicitly mapping between, i386/x86_64 and x86 for kernel ARCH"
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
X-List-Received-Date: Tue, 10 May 2016 21:50:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This reverts commit a6f52930a68d8462e23486d51cdda715072dd752.

In addition to also causing the problem in [YOCTO #9579], this commit
was reverted in krogoth and master but wasn't reverted in jethro but
should be.  The original revert message was:

This reverts commit 8d310b24927d0f348fb431895f0583733db2aad0.

That commit completely breaks KBUILD_DEFCONFIG because it relies on
$ARCH to match between the target OE arch and the kernel subdirectory
containing the defconfigs. In the kernel all defconfigs for everything
x86-based (including x86_64) is stored in dir arch/x86/configs/

kernel-yocto.bbclass correctly searches for all the defconfigs inside
${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}

Commit 8d310b249 makes it search in wrong places and _only_ if you
define TARGET_ARCH = "athlon" will it search x86 which is nonsensical.

The commit further adds an if clause to hack the mungled kernel arches
back to their original values (ugh) in do_shared_workdir which is run
after do compile, but of course the build breaks before that in
do_kernel_metadata because of the KBUILD_DEFCONFIG mentioned above (so
that hack is useless).

Please fix that corner case bug in another way which does not completely
screw up the kernel arch mapping & defconfig logic. If 64bit configs are
generated in the kernel for 32bit machines because the host is asked,
then it it a bug in the kernel, it is of no use to hack around it in OE.

(From OE-Core rev: bc02a478a5d4a5de7b3943ed809d5c22711f5b1f)

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/classes/kernel-arch.bbclass |  4 +---
 meta/classes/kernel.bbclass      | 15 +++------------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index d8b180e..3ed5986 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -21,9 +21,7 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs', True).split()
 
-    if   re.match('i.86$', a):                  return 'i386'
-    elif re.match('x86.64$', a):                return 'x86_64'
-    elif re.match('athlon$', a):                return 'x86'
+    if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ee3e9a0..5e8b6cf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -309,18 +309,9 @@ do_shared_workdir () {
 		cp -fR include/generated/* $kerneldir/include/generated/
 	fi
 
-	# When ARCH is set to i386 or x86_64, we need to map ARCH to the real name of src
-	# dir (x86) under arch/ of kenrel tree, so that we can find correct source to copy.
-
-	if [ "${ARCH}" = "i386" ] || [ "${ARCH}" = "x86_64" ]; then
-		KERNEL_SRCARCH=x86
-	else
-		KERNEL_SRCARCH=${ARCH}
-	fi
-
-	if [ -d arch/${KERNEL_SRCARCH}/include/generated ]; then
-		mkdir -p $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
-		cp -fR arch/${KERNEL_SRCARCH}/include/generated/* $kerneldir/arch/${KERNEL_SRCARCH}/include/generated/
+	if [ -d arch/${ARCH}/include/generated ]; then
+		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
+		cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
 	fi
 }
 
-- 
1.9.3

