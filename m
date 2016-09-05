Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCB9772F9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 17:20:25 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x187so3402916vkx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 10:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=6UUHkNS2sR4gXt4iDTAqO5UIR1SjiLV7Mbu6LVRL0L8=;
	b=MtgM79qlD6LJMoClgw7H99GFWxYmH93qVV0FBaO2zzDJguvcIcNkrXyjjUQjl0tRRf
	/+5pYLAxG1Mo90k9dAqa5Um6uPTYtoD8Zeieh0pUOv2MnhyZPOFoa9Keu4u7Ec7C1Lyg
	o6NUrBNFnPjoAJr1I+z3j4/ToFMZsWTNwNRjAQ6UaPkabk6iK1QRpqdTl/IhmbTHpCM2
	eVdx55tV+1JT/wx94Ftjro4zJ+uULT72fcF4I+pCD8tV2HpZcM9+83C0iF2JGE4LcO38
	OYYAmC9WmIZ4Zrf+EpB5JHIFK4SDIKAQmIEjkgGkNiBVXnJVOB9/iKYzVrjAXVELbx+H
	XQ+g==
X-Gm-Message-State: AE9vXwOTFKojWOfcb8Jkj/ogcy3lnVTsIJUmhwnBbWun2ZSjYP+PCtONaWX0I9+72d1EBA==
X-Received: by 10.31.82.4 with SMTP id g4mr22555446vkb.77.1473096026023;
	Mon, 05 Sep 2016 10:20:26 -0700 (PDT)
Received: from localhost ([179.105.254.222]) by smtp.gmail.com with ESMTPSA id
	m190sm1820039vke.7.2016.09.05.10.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 10:20:25 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 05 Sep 2016 14:20:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  5 Sep 2016 14:20:20 -0300
Message-Id: <20160905172020.24035-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lttng-modules: Do not fail if CONFIG_TRACEPOINTS is not enabled
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
X-List-Received-Date: Mon, 05 Sep 2016 17:20:27 -0000

The lttng-modules are being pulled by the tools-profile image feature,
however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.

This change makes the build do not fail when CONFIG_TRACEPOINTS is not
available, allowing it to be kept being pulled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 49 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
new file mode 100644
index 0000000..6a91f32
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch
@@ -0,0 +1,49 @@
+From 1b0e574d680101105a6c1e8931c78824f5a97a42 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 5 Sep 2016 17:08:56 +0000
+Subject: [PATCH] Makefile: Do not fail if CONFIG_TRACEPOINTS is not enabled
+Organization: O.S. Systems Software LTDA.
+
+The lttng-modules are being pulled by the tools-profile image feature,
+however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.
+
+This change makes the build do not fail when CONFIG_TRACEPOINTS is not
+available, allowing it to be kept being pulled by default.
+
+Upstream-Status: Inapropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8602649..75550cc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -8,10 +8,7 @@ ifneq ($(KERNELRELEASE),)
+   # and defines the modules to be built.
+ 
+   ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
+-    ifeq ($(CONFIG_TRACEPOINTS),)
+-      $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
+-    endif # CONFIG_TRACEPOINTS
+-  endif # ifdef CONFIG_LOCALVERSION
++    ifneq ($(CONFIG_TRACEPOINTS),)
+ 
+   TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))
+ 
+@@ -94,6 +91,10 @@ ifneq ($(KERNELRELEASE),)
+   obj-$(CONFIG_LTTNG) += lib/
+   obj-$(CONFIG_LTTNG) += tests/
+ 
++    else
++      $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
++    endif # CONFIG_TRACEPOINTS
++  endif # ifdef CONFIG_LOCALVERSION
+ else # KERNELRELEASE
+ 
+ # This part of the Makefile is used when the 'make' command is runned in the
+-- 
+2.1.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 6d596a4..7014541 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -13,7 +13,8 @@ PV = "2.8.0+git${SRCPV}"
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-linux'
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.8"
+SRC_URI = "git://git.lttng.org/lttng-modules.git;branch=stable-2.8 \
+           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.9.3


