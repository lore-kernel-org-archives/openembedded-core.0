Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RlBBk-0004Zf-FM
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 04:18:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0C3BLad019852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 19:11:21 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 11 Jan 2012 19:11:21 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2012 11:11:01 +0800
Message-ID: <6466944f4fff355f13da46c47fc22a907f6eda60.1326337436.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326337436.git.zumeng.chen@windriver.com>
References: <cover.1326337436.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] lttng-tools: Integrated from git repo.
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
X-List-Received-Date: Thu, 12 Jan 2012 03:18:52 -0000
Content-Type: text/plain

This patch intended to integrate the Linux trace toolkit, which
is a suite of tools designed to extract program execution details
from the Linux operating system and interpret them.

lttng-tools 2.0 is currently in pre-release(-pre16), so we have to
update it when official released.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   28 ++++++++++++++++++
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |   30 ++++++++++++++++++++
 2 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
new file mode 100644
index 0000000..f8e144f
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
@@ -0,0 +1,28 @@
+From 5d8d75ab0c7f9e0009d90a2e5ad6475034a5c859 Mon Sep 17 00:00:00 2001
+From: Zumeng Chen <zumeng.chen@windriver.com>
+Date: Tue, 10 Jan 2012 12:41:45 +0800
+Subject: [PATCH 1/1] Fix compiling error on powerpc and arm
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
index 0000000..cde57f7
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
@@ -0,0 +1,30 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit Control"
+DESCRIPTION = "The Linux trace toolkit is a suite of tools designed \
+to extract program execution details from the Linux operating system \
+and interpret them."
+
+LICENSE = "GPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab682a4729389c3f11913d758affe98e \
+                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+
+DEPENDS = "liburcu popt lttng-ust"
+
+SRCREV = "f2ca2e251d8f49b0dbbcca529dd61b3562c1147f"
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



