Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.15057.1629897670064968328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 06:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LFEsxyRe;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629897670;
  x=1661433670;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NAVBfvRo0SL/yvt/ScPG1/3mtLlQ/z7ud+jvJDDYm3Q=;
  b=LFEsxyReCaCuFCt6pEORqHUll/P+1mFH+rJyGPidzilzKSdiOAqRmaIY
   n/ER2rVFC/mqKiVK1SzLIBR4pn87LRpBijZBEqozFlLgFARwDDCM0eWwV
   nozhjFdLqx57hAnSG70zzOP2tCzE6PiCS8Rf1p1ZFpUzhw53tVg2LoolW
   TFc1/otI0I0WkQBVF/phZ/70S9rVw7QW0TQss1eCawBi/nKw5gzBQ7mEm
   AKny/6zsI3KYzP3K5a5la9fuAf6f2QWxJ/gTO6mKXFcIUVzlNsAqXWtFt
   UwuxXbpC6Qg23JR5zxUc9BbWwiEWWF+oPWdD1Oyl1psZEXURW8i7Z6eMW
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
Date: Wed, 25 Aug 2021 15:20:58 +0200
Message-ID: <20210825132058.9396-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was updated
with the 2.13.0 update (commit 5dad15af), but unfortunately it no
longer did what it was intended to do. There is also
0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch, which
was based on the former patch, but it too does not solve the problem.

Unify the two patches, and actually disable building of the kernel
module if CONFIG_TRACEPOINTS is not enabled, the way it was intended.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Unify
Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch and
0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch into
the latter, and use that both with and without devupstream.

 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 25 +++++++++----
 ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 37 -------------------
 .../lttng/lttng-modules_2.13.0.bb             | 10 ++---
 3 files changed, 21 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 6d81c81efe..76a5787c37 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 0287f5c32b9fd99078e71c22ca679343d18f1513 Mon Sep 17 00:00:00 2001
+From 878f89b6136ff7b870a19e04901cc6f316bbe10a Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
@@ -16,22 +16,31 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- src/Kbuild | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/Kbuild | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/src/Kbuild b/src/Kbuild
-index 7137874f..18a43b50 100644
+index 7137874..04eb5c9 100644
 --- a/src/Kbuild
 +++ b/src/Kbuild
-@@ -2,7 +2,7 @@
+@@ -2,10 +2,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
    ifeq ($(CONFIG_TRACEPOINTS),)
 -    $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
 +    $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
++    DISABLE_MODULE = y
    endif # CONFIG_TRACEPOINTS
  endif # ifdef CONFIG_LOCALVERSION
  
--- 
-2.19.1
-
++ifneq ($(DISABLE_MODULE),y)
++
+ TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
+ 
+ lttng_check_linux_version = $(shell pwd)/include/linux/version.h
+@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
+ obj-$(CONFIG_LTTNG) += probes/
+ obj-$(CONFIG_LTTNG) += lib/
+ obj-$(CONFIG_LTTNG) += tests/
++
++endif # DISABLE_MODULE
diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
deleted file mode 100644
index a852834344..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1b0e574d680101105a6c1e8931c78824f5a97a42 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Mon, 5 Sep 2016 17:08:56 +0000
-Subject: [PATCH] Makefile: Do not fail if CONFIG_TRACEPOINTS is not enabled
-Organization: O.S. Systems Software LTDA.
-
-The lttng-modules are being pulled by the tools-profile image feature,
-however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.
-
-This change makes the build do not fail when CONFIG_TRACEPOINTS is not
-available, allowing it to be kept being pulled by default.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-[bva: modified for lttng-modules 2.13+ context]
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- Makefile | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-Index: lttng-modules-2.13.0/Makefile
-===================================================================
---- lttng-modules-2.13.0.orig/Makefile
-+++ lttng-modules-2.13.0/Makefile
-@@ -7,6 +7,11 @@
- 
- obj-$(CONFIG_LTTNG) += src/
- 
-+  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
-+    ifneq ($(CONFIG_TRACEPOINTS),)
-+      $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
-+    endif # CONFIG_TRACEPOINTS
-+  endif # ifdef CONFIG_LOCALVERSION
- else # KERNELRELEASE
- 
- # This part of the Makefile is used when the 'make' command is runned in the
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
index b95d7ecaaf..109f5d6933 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.0.bb
@@ -9,9 +9,9 @@ inherit module
 
 include lttng-platforms.inc
 
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           "
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
+# Use :append here so that the patch is applied also when using devupstream
+SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
 SRC_URI[sha256sum] = "5ebf2b3cd128b3a1c8afaea1e98d5a6f7f0676fd524fcf72361c34d9dc603356"
 
@@ -34,9 +34,7 @@ python do_package:prepend() {
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13 \
-           file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-           "
+SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13"
 
 SRCREV:class-devupstream = "f982b51a98a29cb4aaf607cb9bbf2b509d8e6933"
 PV:class-devupstream = "2.13.0-rc2+git${SRCPV}"
