Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SnB0k-0001Hy-N4
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 18:04:03 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66Fqql3025960;
	Fri, 6 Jul 2012 08:52:53 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  6 Jul 2012 11:52:41 -0400
Message-Id: <1341589961-14331-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1341589961-14331-1-git-send-email-bruce.ashfield@windriver.com>
References: <1341589961-14331-1-git-send-email-bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH] kernel.bbclass: add non-santized kernel provides
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 16:04:03 -0000

If the kernel version string uses characters or symbols that
need to be santized for the package name, we can end up with a
mismatch between module requirements and what the kernel
provides.

The kernel version is pulled from utsrelease.h, which contains
the exact string that was passed to the kernel build, not
one that is santized, this can result in:

 echo "CONFIG_LOCALVERSION="\"MYVER+snapshot_standard\" >> ${B}/.config

 <build>

 % rpm -qp kernel-module-uvesafb-3.4-r0.qemux86.rpm --requires
update-modules
kernel-3.4.3-MYVER+snapshot_standard
 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

At rootfs assembly time, we'll have a dependency issue with the kernel
providing the santizied string and the modules requiring the utsrelease.h
string.

To not break existing use cases, we can add a second provides to the
kernel packaging with the unsantized version string, and allowing the
kernel module packaging to be unchanged.

   RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"

 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-MYVER+snapshot_standard
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 44461bc..81c334b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -257,6 +257,7 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.5.4



