Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5904C73FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 19:02:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 12 May 2015 12:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,416,1427785200"; d="scan'208";a="724841139"
Received: from jrmenon-mobl4.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.200.222])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2015 12:02:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 12 May 2015 12:02:46 -0700
Message-Id: <1431457366-24611-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [master/fido][PATCH] lttng-modules: Update to stable version 2.6.1
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
X-List-Received-Date: Tue, 12 May 2015 19:02:47 -0000

This fixes a build issue with the 3.19.5 kernel where the regmap prototypes
have changed. The patch is rebased do to changes in the new version of the
Makefile.

[YOCTO #7737]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch | 31 +++++++++++++---------
 ...tng-modules_2.6.0.bb => lttng-modules_2.6.1.bb} |  2 +-
 2 files changed, 19 insertions(+), 14 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.6.0.bb => lttng-modules_2.6.1.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
index bbfa38a..ccc6c54 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
@@ -7,41 +7,46 @@ build and install lttng-modules, we do this replacement for
 it as-is.
 
 Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
+[sgw - rebased for 2.6.1]
+Signed-off-by: Saul wold <sgw@linux.intel.com>
 
 Index: git/Makefile
 ===================================================================
 --- git.orig/Makefile
 +++ git/Makefile
-@@ -62,19 +62,19 @@ obj-m += lib/
+@@ -68,19 +68,19 @@ obj-m += lib/
  endif # CONFIG_TRACEPOINTS
  
  else # KERNELRELEASE
 -	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
+-	PWD := $(shell pwd)
+-	CFLAGS = $(EXTCFLAGS)
+-
 +	KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
- 	PWD := $(shell pwd)
- 	CFLAGS = $(EXTCFLAGS)
- 
++ 	PWD := $(shell pwd)
++ 	CFLAGS = $(EXTCFLAGS)
++ 
  default:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
+-	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) modules
++	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules
  
  modules_install:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
+-	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install
++	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules_install
  
  clean:
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
+-	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) clean
++	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
  
  %.i: %.c
--	$(MAKE) -C $(KERNELDIR) M=$(PWD) $@
-+	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) $@
+-	LTTNG_KERNELDIR=$(KERNELDIR) $(MAKE) -C $(KERNELDIR) M=$(PWD) $@
++	LTTNG_KERNELDIR=$(KERNEL_SRC) $(MAKE) -C $(KERNEL_SRC) M=$(PWD) $@
  endif # KERNELRELEASE
 Index: git/probes/Makefile
 ===================================================================
 --- git.orig/probes/Makefile
 +++ git/probes/Makefile
-@@ -231,18 +231,18 @@ endif
+@@ -267,18 +267,18 @@ endif
  endif
  
  else
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
index 4cf01ca..9c08e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.6.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.6.1.bb
@@ -11,7 +11,7 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 inherit module
 
-SRCREV = "1b2a5429de815c95643df2eadf91253909708728"
+SRCREV = "62080b2248fd8ec4111ffc379d0bc5eaf0a5c16d"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
 
-- 
2.1.0


