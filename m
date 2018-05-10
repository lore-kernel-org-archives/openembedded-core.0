Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E65E574F89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 06:20:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4A6JqcE014674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2018 23:20:29 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 May 2018 23:20:04 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2018 23:20:04 -0700
Message-ID: <20180510062004.8627-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: Set -fno-PIC on aarch64
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
X-List-Received-Date: Thu, 10 May 2018 06:20:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

As seen in GCC's gcc/config/aarch64/aarch64.c, -fPIC with large
code model is unsupported.  This fixes the "sorry, unimplemented"
errors when building with compilers defaulting to -fPIC.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...rm64-Set-fno-PIC-along-with-mcmodel-large.patch | 33 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch
new file mode 100644
index 0000000000..786fc0ce41
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch
@@ -0,0 +1,33 @@
+From a12dfe9be05f9dee96c7637a20c01e05711c563c Mon Sep 17 00:00:00 2001
+From: David Michael <david.michael@coreos.com>
+Date: Sun, 7 Jan 11:26:57 2018 -0500
+Subject: [PATCH] arm64: Set -fno-PIC along with -mcmodel=large
+
+As seen in GCC's gcc/config/aarch64/aarch64.c, -fPIC with large
+code model is unsupported.  This fixes the "sorry, unimplemented"
+errors when building with compilers defaulting to -fPIC.
+
+Upstream-Status: Backport
+
+Signed-off-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: David Michael <david.michael@coreos.com>
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ purgatory/arch/arm64/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
+index 636abea..80068ca 100644
+--- a/purgatory/arch/arm64/Makefile
++++ b/purgatory/arch/arm64/Makefile
+@@ -1,6 +1,7 @@
+ 
+ arm64_PURGATORY_EXTRA_CFLAGS = \
+ 	-mcmodel=large \
++	-fno-PIC \
+ 	-fno-stack-protector \
+ 	-fno-asynchronous-unwind-tables \
+ 	-Wundef \
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
index ebb4832684..bd87b371c2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://kexec-x32.patch \
            file://0001-Disable-PIE-during-link.patch \
+           file://0001-arm64-Set-fno-PIC-along-with-mcmodel-large.patch \
          "
 
 SRC_URI[md5sum] = "5198968de79b5ded96f97f3c2ea9637b"
-- 
2.11.0


