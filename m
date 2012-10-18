Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TOraH-0004WR-Es
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 17:00:29 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9IEl6an010584;
	Thu, 18 Oct 2012 07:47:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 18 Oct 2012 10:47:05 -0400
Message-Id: <7b8c12ae454f69996f935aef35cccc6d352b0964.1350571171.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1350571171.git.bruce.ashfield@windriver.com>
References: <cover.1350571171.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1350571171.git.bruce.ashfield@windriver.com>
References: <cover.1350571171.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kernel.bbclass: remove explicit version.h target
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
X-List-Received-Date: Thu, 18 Oct 2012 15:00:29 -0000

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

Note: it isn't clear why the explicit build of version.h was originally
required, but the prep phases of the kernel have changed significantly,
so it should no longer be required.

[YOCTO: #3293]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0df8f08..2163c1f 100644
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



