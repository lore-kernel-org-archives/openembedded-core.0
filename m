Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1963.1587540552987199050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 00:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03M7SqJ3007926
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 00:29:02 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 22 Apr 2020 00:28:41 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/2] linux-yocto: add more support for SDK
Date: Wed, 22 Apr 2020 15:28:38 +0800
Message-ID: <20200422072838.27867-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422072838.27867-1-Qi.Chen@windriver.com>
References: <20200422072838.27867-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

We need to `make scripts prepare` inside SDK. So add patch
to defect if we are insdie SDK environment, and if so change some
PKG_CONFIG_xxx settings so that we will use things from SDK's host
part.

The problem for `make scripts prepare` inside SDK is that the
hosts' environments are different. On some hosts, it happens to
succeed, and on some hosts, it fails. This is because the build mixes
host's part and SDK's host part.

We do such change to make sure only SDK's host part is involed in build.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...port-make-scripts-prepare-inside-SDK.patch | 46 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch

diff --git a/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch b/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch
new file mode 100644
index 0000000000..5e15d9c732
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/0001-Makefile-support-make-scripts-prepare-inside-SDK.patch
@@ -0,0 +1,46 @@
+From e7b37cbdbd0f7dbd3ba99e7db6916c2dc3acecc9 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 16 Apr 2020 10:06:24 +0000
+Subject: [PATCH] Makefile: support make scripts prepare inside SDK
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 2f140aa..af41dca 100644
+--- a/Makefile
++++ b/Makefile
+@@ -277,6 +277,17 @@ ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
+ 	endif
+ endif
+ 
++ifneq ($(SDKTARGETSYSROOT),)
++        ifneq ($(filter scripts prepare, $(MAKECMDGOALS)),)
++		PKG_CONFIG_SYSROOT_DIR = 
++		PKG_CONFIG_PATH = $(OECORE_NATIVE_SYSROOT)/usr/lib/pkgconfig:$(OECORE_NATIVE_SYSROOT)/usr/share/pkgconfig
++		export PKG_CONFIG_SYSROOT_DIR
++		export PKG_CONFIG_PATH
++$(info Changed PKG_CONFIG_SYSROOT_DIR to '$(PKG_CONFIG_SYSROOT_DIR)')
++$(info Changed PKG_CONFIG_PATH to '$(PKG_CONFIG_PATH)')
++        endif
++endif
++
+ ifneq ($(KBUILD_EXTMOD),)
+ 	may-sync-config :=
+ endif
+@@ -994,7 +1005,7 @@ mod_sign_cmd = true
+ endif
+ export mod_sign_cmd
+ 
+-HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
++HOST_LIBELF_LIBS = $(shell export PKG_CONFIG_PATH=$(PKG_CONFIG_PATH); export PKG_CONFIG_SYSROOT_DIR=$(PKG_CONFIG_SYSROOT_DIR); pkg-config libelf --libs 2>/dev/null || echo -lelf)
+ 
+ ifdef CONFIG_STACK_VALIDATION
+   has_libelf := $(call try-run,\
+-- 
+2.24.1
+
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 91df9c1cd5..551aa3def6 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -55,3 +55,6 @@ do_install_append(){
 
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES_append_qemuall=" features/kernel-sample/kernel-sample.scc"
+
+# Ensure `make scripts prepare` succeed inside SDK
+EXTRA_KERNEL_SRC_URI += "file://0001-Makefile-support-make-scripts-prepare-inside-SDK.patch"
-- 
2.17.1

