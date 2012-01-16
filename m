Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RmpCt-0006HT-5D
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 17:14:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0GG7CM8013480
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 08:07:12 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Jan 2012 08:07:11 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 00:06:51 +0800
Message-ID: <b3698ef35970ededb25cbc8b12f4ef1dbdcb606d.1326729399.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326729399.git.zumeng.chen@windriver.com>
References: <cover.1326729399.git.zumeng.chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] lttng-modules: Update to 2.0
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

This patch intended to integrate the lttng-modules 2.0 package
containing the kernel tracer modules.
LTTng-modules 2.0 is currently in pre-release (-pre11), so we
have to update it when official released.

lttng-2.0 supports lttng-modules extra builds, which don't need
any patches on Linux kernel vs the previous version of lttng.
As described in README of lttng-modules-2.0, so far, it has been
tested in the latest kernel on x86 32/64-bit, and powerpc 32-bit,
, build tested on ARM. So does yocto kernel, the related tests
on qemux86 and qemuppc has been validated and a build test on
qemuarm passed too with this patcheset.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |   41 ++++++++++++++++++++
 .../lttng-2.0/lttng-modules_2.0.pre11.bb           |   27 +++++++++++++
 2 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
 create mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
new file mode 100644
index 0000000..aa24171
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+lttng-modules: replace KERNELDIR with KERNEL_SRC
+
+Since lttng-modules uses the default way of module.bbclass to
+build and install lttng-modules, we do this replacement for
+it as-is.
+
+Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
+---
+ Makefile |    7 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5ac13d7..25caad5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -38,17 +38,16 @@ obj-m += lib/
+ endif
+
+ else
+-	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
+ 	PWD := $(shell pwd)
+ 	CFLAGS = $(EXTCFLAGS)
+
+ default:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
+
+ modules_install:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
+
+ clean:
+-	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
++	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
+
+ endif
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
new file mode 100644
index 0000000..5d34c41
--- /dev/null
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
@@ -0,0 +1,27 @@
+SECTION = "devel"
+SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
+DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
+                    file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
+                    file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
+
+DEPENDS = virtual/kernel
+
+inherit module
+
+SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
+PV = "2.0.pre11+git${SRCREV}"
+PR = "r0"
+
+SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
+
+export INSTALL_MOD_DIR="kernel/lttng-modules"
+
+S = "${WORKDIR}/git"
+
+# Due to liburcu not building for MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
-- 
1.7.5.4



