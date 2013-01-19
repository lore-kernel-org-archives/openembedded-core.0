Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwhKF-0006tx-MO
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 23:55:48 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so4908204obb.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lk2b028LYmn6sgmAB7JyWf/F8jwCHIPoNuh5GSw4s5Q=;
	b=msPa4V9JV66FkoKxoaS3zkG4xcjL+iTuqk3ZaNVRvYy+Rak3iuLXT7b1pxzmSZ7DZx
	A2cL6dxAJ9ohiHMDF0D37QvKSgbV+FKQ3pBjMa+nVt46j3PSv2cF91KWMEuvDACarvCl
	nbQCkGbhuB1jTI/e0eXPhE0DbPuAM8/ChzlMY0yrxzg4gYBrQQrUK1S4ssCD6i666Ryj
	IbDkdOYmSUlrGFjudLMxTWYu4rWiKMXu3fNdQx81ybntHrWAPj1vElw22B3fCSJFZSQN
	FT4LO0Sw3d2pzBhxi0Z2pPDG9dHVpt7VcEHh57YwYjycYySp+fGqsW32aQLppWg9kwQt
	1cJg==
X-Received: by 10.60.171.38 with SMTP id ar6mr10383151oec.1.1358635220791;
	Sat, 19 Jan 2013 14:40:20 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id 7sm6936441obu.4.2013.01.19.14.40.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:40:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 14:40:03 -0800
Message-Id: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1358634922.git.raj.khem@gmail.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Sat, 19 Jan 2013 22:55:49 -0000

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
index b3b78b6..a51e82b 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -43,3 +43,16 @@ def map_uboot_arch(a, d):
 
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
index d459569..e2a582b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native"
 
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
index 210c47c..cfee50a 100644
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



