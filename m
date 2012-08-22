Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4FPt-0004wW-5v
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:12:33 +0200
Received: by daks35 with SMTP id s35so946956dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0oqJ9v3TKCKg8yEVqEDH70qabxdeS6ANQOUkLFajKAw=;
	b=elXNH+0BY/ERnsy/uEpSmfYkr5wDxwvEPhPDFVa7GrXAOD437A0Ydu5wisSgbg7DFy
	mCzpSCt53EhMiaNVTSTaBldfP1ESxqjh5eWOldRLqAbAvk4Wjb/rt98eDXYPV34g+msp
	m1SCxZxiMlZqrlnxF6aqRoF7BcjpQfFSec/rkPz+14JiHUO/mcKUlnYtB/QNew4beDLE
	G8YZpY3lLPH3kThFzyyMDGz6Rnghw5vqKPx0NncaQTJ8bTn2YgCPxU8fsvmEbsqUKaId
	c01TnJWGoGdMPZoT+rfFoxFMWvYcE9ak4mpWL9GLTZb+njrWIDoTyiQPm5lbpLF1HayY
	zBYw==
Received: by 10.68.218.101 with SMTP id pf5mr54310245pbc.60.1345658427272;
	Wed, 22 Aug 2012 11:00:27 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pn4sm4142276pbb.50.2012.08.22.11.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 11:00:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2012 10:59:49 -0700
Message-Id: <1345658390-19692-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Wed, 22 Aug 2012 18:12:33 -0000

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
 meta/classes/kernel.bbclass      |    9 +++------
 meta/classes/module-base.bbclass |    9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f34e632..766f345 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native update-modules"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -37,9 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
-KERNEL_CCSUFFIX ?= ""
-KERNEL_LDSUFFIX ?= ""
-
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
 #FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
@@ -48,8 +45,8 @@ HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
 TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
+KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
 
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9379bf8..72a0bff 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -7,9 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
-KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
-KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
-KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
 
 # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
 # specific options necessary for building the kernel and modules.
@@ -20,9 +17,9 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
+KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
 
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.9.5



