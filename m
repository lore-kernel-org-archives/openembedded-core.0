Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 87FFB6D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 03:56:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2014 19:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,791,1384329600"; d="scan'208";a="478852006"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2014 19:56:40 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 20:02:44 -0800
Message-Id: <62909ce827461785e4f3f2ceaec04d08c7b47f17.1391659364.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] linux-yocto: Use PACKAGE_ARCH in build dir
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
X-List-Received-Date: Thu, 06 Feb 2014 03:56:55 -0000

The current linux-yocto build dir (B) includes MACHINE. This has been
appropriate as kernels are typically built machine-specific. We have
recently introduced an intel-common type kernel which can be shared
across multiple machines sharing a common base (intel-core2-32,
intel-corei7-64). In these cases, the kernel is built for a something
more generic than MACHINE, and the current mechanism results in
something like this when building for MACHINE=sys940x (using intel-common):

tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-sys940x-noemgd-standard-build

Note the descrepancy between core2-32-intel-common and
linux-sys940x-noemgd-standard-build. This becomes counterintuitive at
the very least when switching to another machine and attempting to reuse
this build. This patch swaps MACHINE for PACKAGE_ARCH (which is
typically MACHINE_ARCH for linux-yocto), resulting in the following
build path:

tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-core2-32-intel-common-standard-build

The impact to existing MACHINEs is a replace of - with _ if MACHINE
contains one or more - charachters.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 2bee042..4ed3188 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -31,7 +31,7 @@ inherit kernel
 inherit kernel-yocto
 require linux-dtb.inc
 
-B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
+B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
 do_install_append(){
 	if [ -n "${KMETA}" ]; then
-- 
1.7.9.5


