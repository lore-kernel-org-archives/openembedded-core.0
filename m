Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RmpCt-0006Eh-4R
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 17:14:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0GG7BnX020736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 08:07:11 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Jan 2012 08:07:10 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 00:06:50 +0800
Message-ID: <4da82b6980a0eec9afb7ea916e458bf5f43a498d.1326729399.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326729399.git.zumeng.chen@windriver.com>
References: <cover.1326729399.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] lttng-tools: Update to 2.0-pre16
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
X-List-Received-Date: Mon, 16 Jan 2012 16:15:03 -0000
Content-Type: text/plain

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
1.7.5.4



