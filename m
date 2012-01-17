Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b6-0006ye-7B
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633105"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:39 -0800
Message-Id: <00e89ff42d81fb94de8e4257ffcbbe910403ed67.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 54/62] lttng-tools: Update to 2.0-pre16
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:52 -0000

From: Zumeng Chen <zumeng.chen@windriver.com>

This patch intended to integrate the Linux trace toolkit, which
is a suite of tools designed to extract program execution details
from the Linux operating system and interpret them.

lttng-tools 2.0 is currently in pre-release(-pre16), so we have to
update it when official released.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 ++++++++++++++++++
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++++++++
 2 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch b/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
new file mode 100644
index 0000000..73253d1
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Pending
+
+Fix compiling error on powerpc and arm
+
+For powerpc and arm, some MAP_ are defined asm/mman.h,
+so including it in header.
+
+Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
+---
+ common/runas.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/common/runas.c b/common/runas.c
+index f612ccc..62a2791 100644
+--- a/common/runas.c
++++ b/common/runas.c
+@@ -29,6 +29,7 @@
+ #include <fcntl.h>
+ #include <sched.h>
+ #include <sys/mman.h>
++#include <asm/mman.h>
+
+ #include <lttngerr.h>
+
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
new file mode 100644
index 0000000..fdebc0e
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
@@ -0,0 +1,30 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit Control"
+DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
+to extract program execution details from the Linux operating system \
+and interpret them."
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab682a4729389c3f11913d758affe98e \
+                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+
+DEPENDS = "liburcu popt lttng-ust"
+
+SRCREV = "9beed4cb465347c778e4f982c330cef78f2628b7"
+PV = "v2.0.pre16+git${SRCREV}"
+PR = "r0"
+
+SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git\
+           file://lttng-tools-fix-compiling-error-for-powerpc-arm.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+export KERNELDIR="${STAGING_KERNEL_DIR}"
+
+# Due to liburcu not building for MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-- 
1.7.6.5



