Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TfeRD-0003Zx-OQ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 23:24:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2012 14:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,209,1355126400"; d="scan'208";a="228456697"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2012 14:10:07 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:10:50 -0800
Message-Id: <ac56f134f1049a4ab424fa754114b6a5f92a3c82.1354572637.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: scott.a.garman@intel.com
Subject: [PATCH][for-danny] kernel.bbclass: remove explicit version.h target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 22:24:32 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The compilation routine for the kernel has an explicit call to
build version.h, which works fine for most kernels, but the
location of it has recently changes.

commit d183e6f5 [UAPI: Move linux/version.h]
commit 10b63956 [UAPI: Plumb the UAPI Kbuilds into the user
                 header installation and checking]

moves the file to include/generated/linux/version.h and then to
include/generated/uapi/linux/version.h.

As a result kernel builds of 3.7 or bisection builds of intermediate
kernel commits will fail with:

  make[2]: *** No rule to make target `include/linux/version.h'.  Stop.

Making the explicit version.h build conditional on the version, or
via a file test would fix the problem, but it introduces some complexity
to the build.

Even without an explicit call to build version.h, it is always produced
by the kernel build, so it can simply be removed.

This extra make line was originally so that the kernel version could be
determined, so that then different instructions could be executed depending
on whether it was a 2.4 or 2.6 kernel. Since we no longer support 2.4, this
code is no longer needed.

[YOCTO: #3293]

(From OE-Core rev: 4cb20fa89e571ffbc448c579a758db0b9074acf4)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 36bc3c7..88ce561 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -85,7 +85,6 @@ KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.g
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
 		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
-- 
1.7.5.4



