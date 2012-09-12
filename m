Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBgC2-0001Yh-PX
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 08:12:59 +0200
Received: by obblz20 with SMTP id lz20so2111488obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LeXBHgJSCVpY7tpmSyg8IEB5OZS5dRSOawHTweM3DH4=;
	b=LyJ5t3dS580PqBpFuEXyHnMRz2wFHb6/LRCw2JiuNlyrdcz225z+LaEcYl7d+IcwUb
	H+X74M88QnNYpudis2jvSIPeigpZyhnU66mIlf4PU7k8xr7ZL/WtP5pun+kysIqXNcAV
	hK8AAj43s7+NLn/QKvCj54EwKgVUgI4A5QcZKqhcsycDOAeCgQ4q4TYhmGmCjd5kv0bk
	m3esCpWhusrvFVlbciOrm/hv7ls1+ikLfH+qIaMX+1lM7g6wIAmOEcqQSFAN2KtDn4Wo
	8ktLJ+wUhodMxIgLzCpMzymvTzcy8mThHqk+5Zd+VKDzoScHzTFfLC4vugKUQ/FG2nGx
	T8FA==
Received: by 10.60.29.40 with SMTP id g8mr20464871oeh.25.1347429626535;
	Tue, 11 Sep 2012 23:00:26 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id k8sm15262335oeh.9.2012.09.11.23.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 23:00:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 22:59:13 -0700
Message-Id: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2 1/3] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Wed, 12 Sep 2012 06:12:59 -0000

kernel compiler is not special and we currently have it so
we want to pass -march and -mtune options as CFLAGS to kernel
build so that compiler picks the right subarch flags when
compiling assembly files in particular. Otherwise defaults
are chosen which may not be right in many case e.g. when
compiling kernel for collie machine we should use arch=armv4
but it uses toolchain/as defaults which is armv5te

in some case e.g. thumb1 we know that kernel can not be compiled
in thumb1 mode so we can provide that information e.g. -marm
option through KERNEL_HOST_CC_ARCH variable as we do now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/kernel-arch.bbclass |   13 +++++++++++++
 meta/classes/kernel.bbclass      |   16 +---------------
 meta/classes/module-base.bbclass |   16 ----------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6446504..95a40f2 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -42,3 +42,16 @@ def map_uboot_arch(a, d):
 
 export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
 
+# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
+# specific options necessary for building the kernel and modules.
+TARGET_CC_KERNEL_ARCH ?= ""
+HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
+TARGET_LD_KERNEL_ARCH ?= ""
+HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
+TARGET_AR_KERNEL_ARCH ?= ""
+HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
+
+KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
+
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fdef1be..bcb6bd5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -37,20 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-KERNEL_CCSUFFIX ?= ""
-KERNEL_LDSUFFIX ?= ""
-
-# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
-# specific options necessary for building the kernel and modules.
-#FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
-TARGET_CC_KERNEL_ARCH ?= ""
-HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
-TARGET_LD_KERNEL_ARCH ?= ""
-HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
-
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
-
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
 KERNEL_IMAGEDEST = "boot"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9379bf8..f4ec2d4 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -7,22 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
-KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
-KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
-KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
-
-# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
-# specific options necessary for building the kernel and modules.
-TARGET_CC_KERNEL_ARCH ?= ""
-HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
-TARGET_LD_KERNEL_ARCH ?= ""
-HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
-TARGET_AR_KERNEL_ARCH ?= ""
-HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
-
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.9.5



