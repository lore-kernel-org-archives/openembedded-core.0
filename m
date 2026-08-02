Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0665AC55175
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21190.1785666562346361668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MzKA70jG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso7087305e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666561; x=1786271361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NvoBsYNIPj5yGqfAQnWsYtQqlTCm8ld/O85sEsSpjHk=;
        b=MzKA70jG6Vt9gJRJcUMsK5Jucu4YisOJuqfzCx2QNKLyqSQ1riADNThdxeN6WOlG4q
         RqiX3NZnQ/zlomKgIhkgZf3YqcGWfkLneDg8ZT8E95qFM2GSe/096T4onScCVAqSjf9F
         6h3QiywmnARrRQmNtp/7z8URGNNBH/fH8uaKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666561; x=1786271361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NvoBsYNIPj5yGqfAQnWsYtQqlTCm8ld/O85sEsSpjHk=;
        b=nzbMUvUWBmrRuFcRlpYRCwyA8f4eGIs47g3lyUundx4ECwRqC3jfdnotQrHrsQh2yK
         LinYSjymOnFdJ5eZF4OPz8RpQxsu3PXGx5uWRYf19+J+/BnEDKTAgtCWLvArcZaj3JYl
         3cnUxC5VidoLBtrrcDVufOuJgmcpbBKI5aH2rLwyNu7AMBXH9DP816m/XXo/BtyFO4MN
         58uAlVdjMNLJglBR52dDUJLJ2FZa6Mtgm+YhlxsIBpVmixOqFWM/uf2SoZpspkiWr6jw
         nuTJjyJU66cMzwSqA7Mr0rptlg6Uw9Qcwl597xQCnYhbdC3jRVS5uhiILLCuoQQToghS
         mX+A==
X-Gm-Message-State: AOJu0YyLHRIKRboOs0xulzOugQld15f5S7GlWmUPhK5nkET30Ts6PA6d
	Y+J0bi3p6HrwMiFsXlrGHR/KGpfcAjyeeb+aI0fbi9MSCxWm8MLH/Z++ZYUZCYpAXvAd6UpICrJ
	Ov9PCRMg=
X-Gm-Gg: AR+sD104StTRvcT0wirQZyZTly+rNNI2NoZl8ZI3OAV/OndGfXEcDBiccC0oyrTqQxC
	rQkX24KNbRoVPc6M5hmEerR3iEQ3CebQ+v1NBtVhMCxjJx1XO920aBvMbdkw7xC65gjgyPf5iML
	CtX+CGqNiJQhR+eRkBNeXDy0GCodgY4jrAvzH1bADz+V18KeP/DB0j6lXDICt/Eqk+EMRP9/sXm
	/aEqi0fSpLC+8EZbmjclKt/mjwZXNt7OJaPOwoU+1NJOliwOcLHtilF+2yZzYRmbWrd9mdJhN1h
	A/PZmvaVsaHSYeNqiOqsyn7vVJOlnmXxKe6YvEohsrAw22jRrmPZ2I1usaLzHdbRLW/EJOOnJRu
	0TsFzheKbVQOaAJN8vUhvI8YweuswtBNQJfF5H3YjMtIUtVLul1znNO6vWJiRsD+4EFOyfLp6oV
	yaqiDflq65VAiGXwQr7yySJNSvsPhQ3lyishEEGL107VuBlGX8l7XKW9ipsGh1H2yiegVHRCml/
	K/eueOoF6mKASiMXQ==
X-Received: by 2002:a05:600c:c8c:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4980c6564d5mr109007185e9.13.1785666560495;
        Sun, 02 Aug 2026 03:29:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/25] linux-kernel-base: Fold remainder into kernel-arch and drop
Date: Sun,  2 Aug 2026 11:28:48 +0100
Message-ID: <20260802102854.3952760-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242544

The remaining usages can all work from kernel-arch so fold the class into
there and drop linux-kernel-base since the name is an outlier anyway.

Clean up some of the kernel class inherits to be in the same line
to make it cleare which uses what.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-arch.bbclass              |  4 ++++
 meta/classes-recipe/kernel.bbclass                   | 12 +++---------
 meta/classes-recipe/kernelsrc.bbclass                |  2 --
 meta/classes-recipe/linux-kernel-base.bbclass        | 10 ----------
 .../make-mod-scripts/make-mod-scripts_1.0.bb         |  3 +--
 meta/recipes-kernel/perf/perf.bb                     |  2 +-
 6 files changed, 9 insertions(+), 24 deletions(-)
 delete mode 100644 meta/classes-recipe/linux-kernel-base.bbclass

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index eb598d98b6e..26b8a1a67f9 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -34,3 +34,7 @@ KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${TARGET_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
 KERNEL_TOOLCHAIN ?= "gcc"
 TOOLCHAIN = "${KERNEL_TOOLCHAIN}"
+
+export KBUILD_BUILD_VERSION = "1"
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 28460ce1cb9..a82bdf7ecba 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -4,7 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split features_check
+inherit kernel-arch kernel-module-split kernel-devicetree kernel-artifact-names
+inherit features_check  deploy cml1 pkgconfig
 
 ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 
@@ -215,8 +216,6 @@ python do_symlink_kernsrc () {
 # do_configure on do_symlink_kernsrc.
 addtask symlink_kernsrc before do_patch do_configure after do_unpack
 
-inherit kernel-arch deploy
-
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
@@ -675,8 +674,6 @@ kernel_do_configure() {
 	${KERNEL_CONFIG_COMMAND}
 }
 
-inherit cml1 pkgconfig
-
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
@@ -789,8 +786,6 @@ do_sizecheck[dirs] = "${B}"
 
 addtask sizecheck before do_install after do_strip
 
-inherit kernel-artifact-names
-
 kernel_do_deploy() {
 	deployDir="${DEPLOYDIR}"
 	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
@@ -915,5 +910,4 @@ do_create_spdx:append() {
 }
 do_create_spdx[depends] += "virtual/kernel:do_configure"
 
-# Add using Device Tree support
-inherit kernel-devicetree
+
diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
index b105fc15990..fa204a007a3 100644
--- a/meta/classes-recipe/kernelsrc.bbclass
+++ b/meta/classes-recipe/kernelsrc.bbclass
@@ -13,8 +13,6 @@ do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@oe.kernel.get_version_file("${STAGING_KERNEL_BUILDDIR}")}"
 LOCAL_VERSION = "${@oe.kernel.get_localversion_file("${STAGING_KERNEL_BUILDDIR}")}"
 
-inherit linux-kernel-base
-
 # The final packages get the kernel version instead of the default 1.0
 python do_package:prepend() {
     d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
deleted file mode 100644
index 566b2c96ba7..00000000000
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ /dev/null
@@ -1,10 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-export KBUILD_BUILD_VERSION = "1"
-export KBUILD_BUILD_USER ?= "oe-user"
-export KBUILD_BUILD_HOST ?= "oe-host"
-
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 6e64918f5b5..18768c1ec4a 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit kernel-arch linux-kernel-base
-inherit pkgconfig
+inherit kernel-arch pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 5fa98a0d94b..25852f8a22a 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -56,7 +56,7 @@ do_configure[depends] += "virtual/kernel:do_shared_workdir"
 
 PROVIDES = "virtual/perf"
 
-inherit linux-kernel-base kernel-arch manpages pkgconfig
+inherit kernel-arch manpages pkgconfig
 
 ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 

