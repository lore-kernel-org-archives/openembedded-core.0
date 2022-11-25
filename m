Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C1FC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 21:16:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.57033.1669410964440934201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 13:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vk7dk5dZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id z4so8481400wrr.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYq2Ss2O7Oi2ZC8KDPh/83udLqF4BP7TfgqFjgsTy0c=;
        b=Vk7dk5dZkSBASCpGvB109Kcaab6ybkOXcDgWNhBSrlQ41p89Ui1iz1cxR8fL8UA2k/
         e8gesNyDFW9CIh+7TCBxuu2VWX5enUn6bWxnHrg+bK0Gtu73njZf5BlwU8S//knGvXko
         hQE9EI4Eb/KMPak3ZVR4g9nFfigWILiu1C68uTNhClhdsY/1Z4pGEDWfyRmWa+D6Rhhz
         lAVVKU2HNxjUwkJrwJIszWYyRpFpO9pzINcGZ2gDOdxc9JckxVFVtEEFM5ZZpo+K1fff
         SYYKJs66SAgWt76IFX1cj8oiSC+b+Gei6U3FFEo06vjgWmeS7bMjR1kFBK00i+AOONBH
         nrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYq2Ss2O7Oi2ZC8KDPh/83udLqF4BP7TfgqFjgsTy0c=;
        b=WfMIkvrnJvSRuDGl/gvt3HUaggFPKJCMPvVdLduJB84BwIBsI7PiMeekly9Rn8r88X
         c+eofoBVit5ZQxBLqxfCgv10j1W9phv2tZog3EkJfIVptEJUi3KqGj+MYr+VQD10qayP
         ni2qwnZlQSGhf75H+/K96NDX9/OhMDySNZ/OGtc5Z0/+1DXB5h/JP6OF/gDfK/f5rEao
         xIeyB0nNuDXohbbMgmZ2Ak9JtJC+V2LfppPZDDPKtgV17LPcCQzL16PTrLTsAGUqa4RF
         eOoNzhbdjDdSU15mjJQeZQe6tyw+CdYewiy8w8vXJWhDwdkZ2Ei2g2F8xSEuVKdzX+7G
         J5qw==
X-Gm-Message-State: ANoB5pkOgCQqt8QueGvBzoD8kzLWQBq9evE0MOSWuT4EaI+KMo/PfQO8
	7GQXr01pS8jLcLXRk2qzGeEef/s43V0=
X-Google-Smtp-Source: AA0mqf7lMb32QWCcULBE8XY2j0UmFN++0JfkoJQULjtWSWVz3NtVcn7RKj05WAAvjN2/y96Foa6N6g==
X-Received: by 2002:adf:ee48:0:b0:242:65d:c3f7 with SMTP id w8-20020adfee48000000b00242065dc3f7mr3432475wro.571.1669410962892;
        Fri, 25 Nov 2022 13:16:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c5441000000b003b4cba4ef71sm10068863wmi.41.2022.11.25.13.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 13:16:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] qemu-helper: depend on unfs3 and pseudo directly
Date: Fri, 25 Nov 2022 22:15:56 +0100
Message-Id: <20221125211558.20985-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 21:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173785

Dependencies of runqemu belong in qemu-helper; in particular
there is no reason to scatter unfs3 all over the place, and then
require separate steps to make it available (e.g. 'meta-ide-support').

With this, startng runqemu with a nfs mount starts to 'just work'
after building an image.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb           | 2 +-
 meta/recipes-core/meta/meta-ide-support.bb                | 2 +-
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb      | 1 -
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb   | 2 +-
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb      | 2 +-
 scripts/runqemu-export-rootfs                             | 8 ++------
 scripts/runqemu-extract-sdk                               | 2 +-
 7 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 0df681ac73..618b596e4d 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extensible SDK toolchain meta-recipe"
 DESCRIPTION = "Meta-recipe for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native"
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native"
 
 do_populate_sysroot[deptask] = "do_populate_sysroot"
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 7f349f673d..dd11b5673c 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -2,7 +2,7 @@ SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 
-DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
+DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
 PR = "r3"
 RM_WORK_EXCLUDE += "${PN}"
 
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 9166a0851f..84ee1e3fa1 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -16,7 +16,6 @@ RDEPENDS:${PN} = "\
     nativesdk-qemu \
     nativesdk-qemu-helper \
     nativesdk-pseudo \
-    nativesdk-unfs3 \
     nativesdk-opkg \
     nativesdk-libtool \
     nativesdk-autoconf \
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index abba7fe159..2a5bcfb909 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPL-2.0-only"
-RDEPENDS:${PN} = "nativesdk-qemu \
+RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index e297586bbb..6053b71717 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -25,5 +25,5 @@ do_install() {
 	install qemu-oe-bridge-helper ${D}${bindir}/
 }
 
-DEPENDS += "qemu-system-native"
+DEPENDS += "qemu-system-native unfs3-native pseudo-native"
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index c1fff7fcb3..6a8acd0d5a 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -34,16 +34,12 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 	echo "Did you forget to source your build environment setup script?"
 	exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT meta-ide-support
+. $SYSROOT_SETUP_SCRIPT qemu-helper-native
 
 if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
 	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
-	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
-		echo "Have you run 'bitbake meta-ide-support'?"
-	else
-		echo "This shouldn't happen - something is missing from your toolchain installation"
-	fi
+	echo "This shouldn't happen - something is missing from your toolchain installation"
 	exit 1
 fi
 
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 9bc0c07fb8..db05da25f2 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -25,7 +25,7 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 	echo "Did you forget to source your build system environment setup script?"
 	exit 1
 fi
-. $SYSROOT_SETUP_SCRIPT meta-ide-support
+. $SYSROOT_SETUP_SCRIPT qemu-helper-native
 PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
 
 ROOTFS_TARBALL=$1
-- 
2.30.2


