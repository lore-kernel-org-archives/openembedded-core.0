Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPK-0000E6-GW
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115468"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:19 -0700
Message-Id: <1e0e8f9000508a0c1d1c40d4aa6317fc385a2177.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 40/45] lttng-tools: updated to 2.0.1
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
X-List-Received-Date: Fri, 25 May 2012 06:53:55 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Removed patch for ARM compilation, as it seems that the upstream fixed
the ARM compilation problem in a slightly different way (tested by compiling
lttng-tools for MACHINE=qemuarm)

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 --------------------
 ...tng-tools_2.0-pre16.bb => lttng-tools_2.0.1.bb} |   12 +++++---
 2 files changed, 7 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0-pre16.bb => lttng-tools_2.0.1.bb} (70%)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch b/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
deleted file mode 100644
index 73253d1..0000000
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-Fix compiling error on powerpc and arm
-
-For powerpc and arm, some MAP_ are defined asm/mman.h,
-so including it in header.
-
-Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
----
- common/runas.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/common/runas.c b/common/runas.c
-index f612ccc..62a2791 100644
---- a/common/runas.c
-+++ b/common/runas.c
-@@ -29,6 +29,7 @@
- #include <fcntl.h>
- #include <sched.h>
- #include <sys/mman.h>
-+#include <asm/mman.h>
-
- #include <lttngerr.h>
-
--- 
-1.7.5.4
-
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
similarity index 70%
rename from meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
index d3a6a30..e7f1016 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
@@ -5,18 +5,17 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ab682a4729389c3f11913d758affe98e \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng2-ust"
 
-SRCREV = "9beed4cb465347c778e4f982c330cef78f2628b7"
-PV = "v2.0.pre16+git${SRCREV}"
+SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
+PV = "v2.0.1+git${SRCREV}"
 PR = "r0"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git\
-           file://lttng-tools-fix-compiling-error-for-powerpc-arm.patch"
+SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
@@ -24,6 +23,9 @@ inherit autotools
 
 export KERNELDIR="${STAGING_KERNEL_DIR}"
 
+FILES_${PN} += "${libdir}/lttng/libexec/*"
+FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
+
 # Due to liburcu not building for MIPS currently this recipe needs to
 # be limited also.
 # So here let us first suppport x86/arm/powerpc platforms now.
-- 
1.7.7.6



