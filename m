Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.12821.1629884486327575378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 02:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=UfEyv6cx;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629884486;
  x=1661420486;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YhskVmjy7sKvuXqF37lxNnY2zRmM1lt4ZWyDAqJ9C80=;
  b=UfEyv6cx/srfcIP5BeYCfj4VixP/gNI/ioMBjDzubxQwMnjL8iBh6vPQ
   kceyH+XzXF5a7Hi60qEivvLdjsuY/JSKjjhpa08yJCasQOo7gIZyoFgFx
   kQuA/KXjXdPh1LojEfCIV9LejRuhrdWL4bigGFCGZrZeT+Fvwi3vMuKI4
   Pw4lCa/6BHZf5lfufIuZpmLHrGnBdHZhJtEe7nY0JvUfeF7tHmDg0TPQp
   xOMYpiMmTqUgtp9Dpt07cf53dSUO/COLHIF6cYWa/uzR0OX5ldRvrH4N9
   el4gHz0jRU7G3pGKiTGE3q8IkFr/CLYG3r2pIA2QSNB1VAYhq1LXMRmcQ
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
Date: Wed, 25 Aug 2021 11:41:06 +0200
Message-ID: <20210825094106.11829-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was updated
with the 2.13.0 update (commit 5dad15af), but unfortunately it no longer
did what it was intended to do.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 42 +++++++++++--------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
index a852834344..4fb55270f5 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
@@ -1,8 +1,7 @@
-From 1b0e574d680101105a6c1e8931c78824f5a97a42 Mon Sep 17 00:00:00 2001
+From 885926e62f32a29b185dcfe738e61a2358a6b615 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Mon, 5 Sep 2016 17:08:56 +0000
 Subject: [PATCH] Makefile: Do not fail if CONFIG_TRACEPOINTS is not enabled
-Organization: O.S. Systems Software LTDA.
 
 The lttng-modules are being pulled by the tools-profile image feature,
 however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.
@@ -16,22 +15,31 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 [bva: modified for lttng-modules 2.13+ context]
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- Makefile | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
+ src/Kbuild | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
 
-Index: lttng-modules-2.13.0/Makefile
-===================================================================
---- lttng-modules-2.13.0.orig/Makefile
-+++ lttng-modules-2.13.0/Makefile
-@@ -7,6 +7,11 @@
+diff --git a/src/Kbuild b/src/Kbuild
+index 7137874..04eb5c9 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
+@@ -2,10 +2,13 @@
  
- obj-$(CONFIG_LTTNG) += src/
+ ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
+   ifeq ($(CONFIG_TRACEPOINTS),)
+-    $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
++    $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
++    DISABLE_MODULE = y
+   endif # CONFIG_TRACEPOINTS
+ endif # ifdef CONFIG_LOCALVERSION
  
-+  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
-+    ifneq ($(CONFIG_TRACEPOINTS),)
-+      $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
-+    endif # CONFIG_TRACEPOINTS
-+  endif # ifdef CONFIG_LOCALVERSION
- else # KERNELRELEASE
++ifneq ($(DISABLE_MODULE),y)
++
+ TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
- # This part of the Makefile is used when the 'make' command is runned in the
+ lttng_check_linux_version = $(shell pwd)/include/linux/version.h
+@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
+ obj-$(CONFIG_LTTNG) += probes/
+ obj-$(CONFIG_LTTNG) += lib/
+ obj-$(CONFIG_LTTNG) += tests/
++
++endif # DISABLE_MODULE
