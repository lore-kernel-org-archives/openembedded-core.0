Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1ShLxT-0008G4-KN
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:32:35 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KELdPO021106;
	Wed, 20 Jun 2012 07:21:40 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 20 Jun 2012 10:31:39 -0400
Message-Id: <7a9c38e16c797e1069a85ea7d487d05c0f235ba4.1340201997.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1340201997.git.bruce.ashfield@windriver.com>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340201997.git.bruce.ashfield@windriver.com>
References: <cover.1340201997.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: [PATCH 1/3] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Wed, 20 Jun 2012 14:32:36 -0000

The kernel source tree in the sysroot has all unecessary source
code removed. The existing use case is to support module building
out of the sysroot, but as more toolsa are moved into the kernel
tree itself there are new use cases for the kernel sysroot source.

To avoid putting dependencies on the kernel, and to be able to
individually build and package these tools out of the source tree,
we can save $kerndir/tools and $kernddir/lib from being removed.
This enables tools like perf to be built our of the kernel source
in the sysroot, without significantly increasing the amount of
source in the sysroot.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 116e10b..690de96 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -173,7 +173,7 @@ kernel_do_install() {
 	#
 	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
 	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
 	# As of Linux kernel version 3.0.1, the clean target removes
-- 
1.7.0.4



