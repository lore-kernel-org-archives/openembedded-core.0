Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6590C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:35:56 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9965.1708598152154153907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Erk11WZz;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: andreaskleist@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so1281903a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708598150; x=1709202950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbqu6O75EvKfL/j526k3vuNdY9SAQHH1B9qvc7+XcDI=;
        b=Erk11WZzXp7xauDicor68bc0myYkXHUxvdgfebHoNr0IJRnSBJOC34lZw20s5Rq/kI
         0tlTEk8Z6b9BENOPx5nXZyauZuy4Fx7XVc6xpMSqxQoGWWt/DMD+vBDMhJTgygoBTbYD
         RtKQ1u4smfHu6+B0eoDKbAeR7iOFCkBf4IPxcOJIJSR9gCeYwvg48mMXntyk2JjgcKWd
         2wwGQXd7IZcNKzgrli3UOj7aBPcqTJ3Bqc/+a1Gv3/i19p/UUP2nF7XaUmxupWdz6/fn
         hZeQUrOLYDDluWkSLkiXUiL/BViSPNp8Pkobmx7L2TtXrDZaTdH9uicKADllGopxboJ2
         162w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708598150; x=1709202950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbqu6O75EvKfL/j526k3vuNdY9SAQHH1B9qvc7+XcDI=;
        b=WQt3je6oGUeb02lgNYF9EzH33M4cx25uAdnE1TQZV5kO9oug5RUSmb/K6dnsS89ylQ
         afT74SGghO6+7eU12l6Avg3VNcUunfOunI2IrhA5hJWiBpaEAmA6QPmra40H356Y/iLk
         hAV9SpKTj11R8+7dSFyBRYg9syhUZrjrkfFKhUhdiCZEXuljZtF16DChUerUhGs18xd8
         4ibctsI7NlHEI0uXYpbuUIqXbxGKsuJLAb1SWl3RNZi1vO6IMbQ7k7Gkij7cAu+8Ue+y
         pUiHO29ZPfahz/vvWVqCjmZ45EXzEuha3kDdY93fEBiST8g1BPBP64iAMT9Rj6u9UFE/
         IMjA==
X-Gm-Message-State: AOJu0YyEU0SVhJBdeLvc6I1CtIfNXQhK2EkbFYzaN1dbNCyKXDAGmpRG
	2OxMAfQ7LzOfWejf4OcPloO9NDWlVzzew9/p6OrBryTMW+rv0nH8hZY4GZG3
X-Google-Smtp-Source: AGHT+IHBeHD5aM41VKO6DfahixPBz/IQVicQcC7bi5ZWnfwBszMKUezg2XHd0HHiFVUiwWHztlm9gQ==
X-Received: by 2002:aa7:d7cc:0:b0:565:4b37:4578 with SMTP id e12-20020aa7d7cc000000b005654b374578mr260096eds.14.1708598150135;
        Thu, 22 Feb 2024 02:35:50 -0800 (PST)
Received: from localhost.localdomain (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm5382260edb.64.2024.02.22.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:35:49 -0800 (PST)
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: reatmon@ti.com
Subject: [kirkstone][PATCH 3/3] kernel: make LOCALVERSION consistent between recipes
Date: Thu, 22 Feb 2024 11:35:45 +0100
Message-ID: <20240222103545.2970387-4-andreaskleist@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222103545.2970387-1-andreaskleist@gmail.com>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The initial fix for localversion setting in 6.3+ broke older
recipes and also broke recipes setting localversion in a kernel
recipe, as make-mod-scripts (and other locations) can trigger
a regeneration of files and don't have access to the variable.

Moving the setting of this variable to the global namespace
doesn't make sense, so we follow the example of the kernel-abiversion
and save a kernel-localversion to the build artifacts.

Recipes that may regenerate scripts/dynamic files, must
depend on the do_shared_workedir of the kernel and use the helper
function to read the file storing the localversion.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

cherry-picked from master b378eec156998eea55ba61e59103cb34fab0d07c

Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 meta/classes/kernel-arch.bbclass                   |  8 --------
 meta/classes/kernel.bbclass                        | 14 ++++++++++++++
 meta/classes/kernelsrc.bbclass                     |  1 +
 meta/classes/linux-kernel-base.bbclass             | 11 +++++++++++
 meta/classes/module-base.bbclass                   |  1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb       |  3 +++
 6 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 0a79dea0af..62c8211621 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -65,11 +65,3 @@ KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DE
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 TOOLCHAIN ?= "gcc"
-
-# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
-# the local version. Having it empty means nothing will be added, and any
-# value will be appended to the local kernel version. This replaces the
-# use of .scmversion file for setting a localversion without using
-# the CONFIG_LOCALVERSION option.
-KERNEL_LOCALVERSION ??= ""
-export LOCALVERSION ?= "${KERNEL_LOCALVERSION}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 940f1a3cf4..96e41b5192 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -541,6 +541,7 @@ do_shared_workdir () {
 	#
 
 	echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-abiversion
+	echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-localversion
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
@@ -630,6 +631,19 @@ python check_oldest_kernel() {
 check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
 do_configure[prefuncs] += "check_oldest_kernel"
 
+KERNEL_LOCALVERSION ??= ""
+
+# 6.3+ requires the variable LOCALVERSION to be set to not get a "+" in
+# the local version. Having it empty means nothing will be added, and any
+# value will be appended to the local kernel version. This replaces the
+# use of .scmversion file for setting a localversion without using
+# the CONFIG_LOCALVERSION option.
+#
+# Note: This class saves the value of localversion to a file
+# so other recipes like make-mod-scripts can restore it via the
+# helper function get_kernellocalversion_file
+export LOCALVERSION="${KERNEL_LOCALVERSION}"
+
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index a951ba3325..a79bf18b09 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -5,6 +5,7 @@ do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
 inherit linux-kernel-base
 
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 73a6fe36d9..0e2a4a4abe 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -33,6 +33,17 @@ def get_kernelversion_file(p):
     except IOError:
         return None
 
+def get_kernellocalversion_file(p):
+    fn = p + '/kernel-localversion'
+
+    try:
+        with open(fn, 'r') as f:
+            return f.readlines()[0].strip()
+    except IOError:
+        return ""
+
+    return ""
+
 def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 27bd69ff33..5b2fde8144 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -14,6 +14,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
 
 export KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
+export LOCALVERSION = "${@oe.utils.read_file('${STAGING_KERNEL_BUILDDIR}/kernel-localversion')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 
 # kernel modules are generally machine specific
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index f6f47cfff5..8727d003f9 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -21,6 +21,9 @@ DEPENDS += "gmp-native"
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
+KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
+export LOCALVERSION="${KERNEL_LOCALVERSION}"
+
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
 #
-- 
2.43.2


