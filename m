Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id BCB07738AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 6647A1EE0827;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wzWs8+0419zn; Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 259C51EE081A;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:25 +0200
Message-Id: <d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 4/8] [linux-yocto] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 07:25:41 -0000

The KConfig infrastructure hardwires the compiler name to gcc, which breaks
the BUILD_CC feature. This is needed even when cross compiling because
make *config rely on the kconfig infrastructure
---
 meta/recipes-kernel/linux/linux-yocto.inc                                                             |  4 ++++
 meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 98a48ec..63c1531 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -58,3 +58,7 @@ do_install_append(){
 addtask kernel_link_images after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
 addtask kernel_configcheck after do_configure before do_compile
+
+SRC_URI_append = " file://0001-Allow-overriding-host-compiler-name-from-environment.patch"
+export HOSTCC = "${BUILD_CC}"
+export HOSTCXX = "${BUILD_CXX}"
diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
new file mode 100644
index 0000000..6fcfbc8
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
@@ -0,0 +1,32 @@
+From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
+Date: Tue, 16 Aug 2016 22:39:29 +0200
+Subject: [PATCH] Allow overriding host-compiler name from environment
+ variables
+
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 70dea02..1f0d2d2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -295,10 +295,10 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+ 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
+ 	  else echo sh; fi ; fi)
+ 
+-HOSTCC       = gcc
+-HOSTCXX      = g++
+-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
+-HOSTCXXFLAGS = -O2
++HOSTCC       ?= gcc
++HOSTCXX      ?= g++
++HOSTCFLAGS   ?= -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
++HOSTCXXFLAGS ?= -O2
+ 
+ ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
+ HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
+-- 
+2.8.1
+
-- 
git-series 0.8.9

