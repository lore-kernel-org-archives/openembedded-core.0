Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 13B2F6FF60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 23:03:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Dec 2015 15:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="866223886"
Received: from chang-s2600cp.jf.intel.com ([10.54.31.69])
	by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2015 15:03:56 -0800
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Dec 2015 15:03:39 -0800
Message-Id: <1449183819-236473-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Explicitly map ARCH to 32 or 64 bit for Intel machines
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
X-List-Received-Date: Thu, 03 Dec 2015 23:03:56 -0000

For a bare-bone kernel recipe which specifies 32 bit x86 target,
a 64 bit .config will be generated from do_configure task when
building 32-bit qemux86, once all of these conditions are true:

() arch of host is x86_64
() kernel source tree used in build has commit ffee0de41 which
actually chooses i386 or x86_64 defconfig by asking host arch if
ARCH is "x86" (arch/x86/Makefile)
() bare-bone kernel recipe inherits directly from kernel without
other special treatment

Build will fail in this case because of the mismatched architecture
of kernel image after compiling.

The patch sets ARCH i386 or x86_64 explicitly to configure
task to avoid this host contamination.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 meta/classes/kernel-arch.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
1.9.1


