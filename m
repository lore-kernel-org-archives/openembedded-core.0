Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E15C54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2018.1709071059355202192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=imAKZsIr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da202aa138so3279517b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071059; x=1709675859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEN34Aq4/RmjvB5BgI4SL3eS0vyDmOwBzDCzXRGjNng=;
        b=imAKZsIr1cHHx38/jt3GJLHjLhN46KNsPydpKGeaSU1aWDWwKjXVdc36duNloMddXE
         eNarsMqKnpzltTtRf7HSPevNGBAicBL/o+mr7x1KeVSQe9S4IV8bpWz++kRZpJl6hf1o
         WuLMISW1QW/rs/72r0nU3/bLrV4j8m2yrwHiQ+l29Gua477cvV4FqyMttnGbxO6Zw/KN
         6TBvv7h/1Syc1mBVoohaTqEn9HbDecW845oynUFAwzFoBa/hkB9F0zsaVxRVgsXuqrCi
         YxZuhDqL2NUMMJmLg8tA4NMGuXIuULa/kLgu7gr1NdQdPdI0bM85KY8pz7Heb0q76slh
         I8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071059; x=1709675859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEN34Aq4/RmjvB5BgI4SL3eS0vyDmOwBzDCzXRGjNng=;
        b=XwrBa4c8unupuzXrCnnL69OjQ7DHg+Mmt3Dh4qZM+xHIOuarLv1RB/lPr3FP/gnjBS
         Jm4B8geUl9EDyhc0DyYTA6dl1svuu4KeYSeIruHJaGzgcZmEj2foaQMcOJI7fV6TC5Ib
         UQvWBaZg46HcvaxPLq1GZD9SIpBO4fkYN+BpktQoZq1789L1IrRZi6nqtnY6y8HVsG6e
         j1W+0PNG4jyo3JZV+kxyYZysGXzxvLvP8YOuJTmGlmmH5Osm3+2bPx+8R9Ny4zizhPkO
         c0JI6eFqmYllRasZpe3QWOk9VPRtIYRgw0StDvgxIm0Gz9Ztghuzva7BUUxkq5QepYJQ
         fADg==
X-Gm-Message-State: AOJu0YwUSKzFCf5jtDbbsTCOfYL3RCGYbSsHUchwmwjKeIOa853TQSHb
	4fZrE7PLMp2gK3tCGK2IeNvxoCFHKf56JAfoCzNMmksvahuemfTwqRuKQo1n9HN8TwnAF1cLnW5
	6HiA=
X-Google-Smtp-Source: AGHT+IHRcPC5yTL424JuN6fE6oN9dNdxAt7jMbQhZwKvkHWZdxQ1+5HCXY2GCpmsY5LUjLhdmPffsg==
X-Received: by 2002:a05:6a00:9083:b0:6e5:3b95:de38 with SMTP id jo3-20020a056a00908300b006e53b95de38mr7594472pfb.12.1709071058575;
        Tue, 27 Feb 2024 13:57:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] kernel: make LOCALVERSION consistent between recipes
Date: Tue, 27 Feb 2024 11:57:03 -1000
Message-Id: <cca0971a7d92d823cc0c2b16cf14a7b2ed8ecb61.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196315

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
Acked-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


