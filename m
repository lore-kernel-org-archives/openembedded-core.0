Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD15738AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 97C9E1EE0828;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kfUJm-WB7c33; Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 576F11EE04C7;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:26 +0200
Message-Id: <b86b4b20c396d99c96592d5df5439af7bb6ec536.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 5/8] [linux-libc-headers] allow overriding compiler name in KConfig
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
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc                                                             |  7 ++++++-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 92acf8a..18bd080 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -46,7 +46,9 @@ inherit kernel-arch
 
 KORG_ARCHIVE_COMPRESSION ?= "xz"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION} \
+           file://0001-Allow-overriding-host-compiler-name-from-environment.patch \
+           "
 
 S = "${WORKDIR}/linux-${PV}"
 
@@ -77,3 +79,6 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
+
+export HOSTCC="${BUILD_CC}"
+export HOSTCXX="${BUILD_CXX}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
new file mode 100644
index 0000000..6fcfbc8
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
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

