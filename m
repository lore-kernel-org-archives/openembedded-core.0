Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QtXdF-0004lM-Ri
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 06:21:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2011 21:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,237,1312182000"; d="scan'208";a="42161105"
Received: from unknown (HELO localhost) ([10.255.13.238])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2011 21:16:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 21:16:53 -0700
Message-Id: <42c1991f83d5faf339628d449c54cb492ffb6344.1313554368.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313554368.git.dvhart@linux.intel.com>
References: <cover.1313554368.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] kernel: restore crtsavres.o to enable building external modules on powerpc
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
X-List-Received-Date: Wed, 17 Aug 2011 04:21:34 -0000

Fixes [YOCTO #1276]

As of Linux kernel version 3.0.1, and much earlier, the make clean target
removes arch/powerpc/lib/crtsavres.o. As this object is present in
KBUILD_LDFLAGS_MODULE, it is required to build external modules, and should
therefor not be removed by make clean.

While I do not advocate fixing buggy kernels in the generic kernel classes,
we should probably account for this one in kernel.bbclass as it affects
such a long list of kernel versions.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Bruce Ashfield <bruce.ashfield@windriver.com>
CC: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/kernel.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7dc9cc6..386b05e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -159,6 +159,13 @@ kernel_do_install() {
 	find $kerneldir -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
 	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
 
+	# As of Linux kernel version 3.0.1, the clean target removes
+	# arch/powerpc/lib/crtsavres.o which is present in
+	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
+	if [ ${ARCH} = "powerpc" ]; then
+		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
+	fi
+
 	# Remove the following binaries which cause strip errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-- 
1.7.6



