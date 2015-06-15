Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5414565C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:37:25 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Z4ZGA-0007XG-68 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Jun 2015 11:37:26 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 15 Jun 2015 11:37:25 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2015 13:37:24 -0500
Message-ID: <1434393444-4959-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] lttng-modules: drop makefile patch
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
X-List-Received-Date: Mon, 15 Jun 2015 18:37:30 -0000
Content-Type: text/plain

The lttng-modules Makefile allows us to specify the kernel we're
building against via the KERNELDIR variable on the build command line.
Use that and drop the patch (which tends to need updating whenever the
upstream Makefile changes).

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch | 71 ----------------------
 meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb   |  6 +-
 2 files changed, 2 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
deleted file mode 100644
index ccc6c54f8122..000000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-lttng-modules: replace KERNELDIR with KERNEL_SRC
-
-Since lttng-modules uses the default way of module.bbclass to
-build and install lttng-modules, we do this replacement for
-it as-is.
-
-Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
-[sgw - rebased for 2.6.1]
-Signed-off-by: Saul wold <sgw@linux.intel.com>
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -68,19 +68,19 @@ obj-m += lib/
- endif # CONFIG_TRACEPOINTS
- 
- else # KERNELRELEASE
--	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
--	PWD := $(shell pwd)
--	CFLAGS = $(EXTCFLAGS)
--
-+	KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
-+ 	PWD := $(shell pwd)
-+ 	CFLAGS = $(EXTCFLAGS)
-+ 
- default:
--	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) modules
-+	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
- 
- modules_install:
--	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
-+	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
- 
- clean:
--	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) clean
-+	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
- 
- %.i: %.c
--	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) $@
-+	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) $@
- endif # KERNELRELEASE
-Index: git/probes/Makefile
-===================================================================
---- git.orig/probes/Makefile
-+++ git/probes/Makefile
-@@ -267,18 +267,18 @@ endif
- endif
- 
- else
--	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
-+	KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
- 	PWD := $(shell pwd)
- 	CFLAGS = $(EXTCFLAGS)
- 
- default:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
- 
- modules_install:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
- 	/sbin/depmod -a
- 
- clean:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
- 
- endif
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
index be09a82f823e..5bde7ec2132e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
@@ -12,13 +12,11 @@ SRCREV = "62080b2248fd8ec4111ffc379d0bc5eaf0a5c16d"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.6 \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           "
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.6"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
-export KERNEL_SRC="${STAGING_KERNEL_DIR}"
 
+EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.0


