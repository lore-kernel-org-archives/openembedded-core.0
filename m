Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB78F31E5F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:00:08 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136111.1775750397429971556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BTBslor+;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so1016149f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775750395; x=1776355195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAkI5fqpaKY1zaGioJXv0OHtWiZpIHL9nx/SOzd0ygg=;
        b=BTBslor+c5GaToATvW0kfUHMA0wBwToVGgzbJdIrRoehj4IImdIwVwPtd6Way/iiQG
         KqLFtmvFhTZmVCygaysz5pWrnRGPxSbazJTGgDZHh2MyfIs7Kio59uFMRx3vk6cDKLjW
         G93IEH1lgnADPX6eqHEfZZfkZGu56JOOFvnFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750395; x=1776355195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAkI5fqpaKY1zaGioJXv0OHtWiZpIHL9nx/SOzd0ygg=;
        b=tGq/D3osTO0QKvmfwrDPt7DUNZ9XMSicasMBOSk/f3wVTy2s8etWD0zNNuCLzJqj0J
         eK92Xo9Cc2u6X6HRsvAaH8SJm/bj208TSG98PPw5Ek1js85+6kIDZRCKiZP9Rxn02Bzl
         kccndJXlj4v/Mva3K6YbpYJg0GnJGTOAEbWGaGRU/5+E3AUMPbVdHLyR4YxvU2LETDKx
         iinARwf5lSk/CPR/MjvsKhBitO6R8tb1WK2u3//72w4qLG0h2NAmcF9nJ/VHBqKmgCNy
         rXmcEUlWECBf1TUy9OXHZSYtN75bC9vSeHjjq8an9aVTwDQnsi1E6stS5kcg0Z/3T/yB
         fiLg==
X-Gm-Message-State: AOJu0YxkIYWb8+dnfMiW7GGDvYVoNihPk9OuRJHZcQLa2K7cDumuhdJ2
	2Q3a/nwfN89lAYG+TEF62h//f1dLirSpZXO2pYDkAGjhmWL+0OssKIpJF2IRhSyU/WoTLZFDb03
	5bmot07E/a2/l
X-Gm-Gg: AeBDieuINCnylzYU3seH/zfkvUlnqueglQSxrU7H33O4VwIJuxdINKZP/r/sP8tA3eR
	1102DkPdE/uOPQQ+C6dkhHMkc4VwFnMylEmgmCl5y8QTY7P+5WVWfM/vhI+fFN+ToFxTJ/sw3yh
	1POfMi3lt4qY+5vsTX0aGwaCqTRch+jNJOpxFKxllvW3EOO+GiGhRDFfrIrq3H09sTLG0sEjKFf
	iE7URX5gxe/BU9fOH3fIsw5I9CLcGNvM5cc17EMWfG1OpfYqHbdHmRoDBgNIXi/ZYUi2hRtxf2v
	6A+gbPwCQ2AJNH9LqV6io6qq1qHvVT7FaP7Jb0wExcfTZ7OfQFPuVjEZKJ6qKOsZim6AM/H3MaE
	wdQHnTEjlpuer0tuuPXjqmQNN7cyJGQh4uNBPZsOIUYbG7ZckFP6mbP701oOqBq13XXlZkoPnTd
	G8L6FzMR0Um802l4M41bLDjDdXmkOgRnWjEtapBMZJT92D/DTyx08LW0NFpIARct9kshWfa3HEc
	o9M7yFS8SaHdmE4K4M4ekyftn+4kJUF5N/sQqs=
X-Received: by 2002:a05:6000:2c07:b0:43d:6e2:5529 with SMTP id ffacd0b85a97d-43d5a112524mr5823253f8f.11.1775750395359;
        Thu, 09 Apr 2026 08:59:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003cc57ca6ff0f11d4.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3cc5:7ca6:ff0f:11d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm69149364f8f.3.2026.04.09.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:59:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH 1/5] recipes: Default to https git protocol for YP/OE repos
Date: Thu,  9 Apr 2026 17:59:31 +0200
Message-ID: <20260409155935.2245789-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234927

From: Yoann Congal <yoann.congal@smile.fr>

This corresponds to the master
commit 139102a73d41 ("recipes: Default to https git protocol where possible").
But only for the git.yoctoproject.org and git.openembedded.org repos.
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                  | 2 +-
 meta/recipes-core/images/build-appliance-image_15.0.0.bb      | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                      | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb              | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                    | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb            | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb         | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb        | 2 +-
 .../xcursor-transparent-theme_git.bb                          | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb                  | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb              | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb              | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb            | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb            | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb                 | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb                 | 4 ++--
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb            | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb    | 2 +-
 .../recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb   | 2 +-
 meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb  | 2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb            | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb      | 2 +-
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb    | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb       | 2 +-
 26 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index f2eb8b1874e..63d3447875d 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 544fbea80fe..8595412e501 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -25,7 +25,7 @@ IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
 inherit core-image setuptools3
 
 SRCREV ?= "1aee6e9648661c1e6159127c2b6e4690576020f7"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=kirkstone \
+SRC_URI = "git://git.yoctoproject.org/poky;protocol=https;branch=kirkstone \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9532ed1534a..5420366d862 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "gdk-pixbuf-native"
 SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ee491984293..6a86196f41f 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
-SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d;protocol=https;branch=master"
 SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6ebe4f457ed..823d4f011be 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master \
+SRC_URI = "git://git.yoctoproject.org/pseudo;protocol=https;branch=master \
            file://fallback-passwd \
            file://fallback-group \
            "
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 5d94be52b4f..7db54c10988 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index b01b332a55b..f195ea233f6 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 81704beac46..ce20283e6e8 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=https;branch=master \
            file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 09fbc9b7983..1d04ad09746 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -10,7 +10,7 @@ SECTION = "x11/base"
 SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
 PV = "0.1.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 12f1cf516ee..3de1e7bae2a 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,7 @@ PV = "0.3+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 do_configure() {
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 94800aeacac..d0549dabe5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -17,8 +17,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 KBRANCH = "v5.18/standard/base"
 KMETA = "kernel-meta"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 772fc4e2ef2..b9f1605cf9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -14,8 +14,8 @@ python () {
 SRCREV_machine ?= "c8a23ffc90611d97d4e0d8b05e5aa30db4795e87"
 SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "5.10.234"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ea763ce9aa1..7c8369cc874 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -14,8 +14,8 @@ python () {
 SRCREV_machine ?= "46e4e1200a4fa889438a2cc62151bb7f1057421a"
 SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LINUX_VERSION ?= "5.15.201"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index a78839e32e6..db6f9182db8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -21,8 +21,8 @@ SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 56853f481fa..358e3bbed3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -19,8 +19,8 @@ SRCREV_meta ?= "b75d71b7f2455467f2260d514040ccb44d4bdda5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index db911b29524..74ae0db1a93 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -26,8 +26,8 @@ SRCREV_machine:qemumips64 ?= "4bae0f4714f4afc50c02ea884ec8ba6026d2ec16"
 SRCREV_machine ?= "0ef80b08429534f460a78de68ee5c6a05f722eb0"
 SRCREV_meta ?= "876ae2ac4c2844426ff953a696e455b44d953527"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.10.234"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 176d17e5736..0a770c81b76 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -35,8 +35,8 @@ SRCREV_machine:class-devupstream ?= "3330a8d33e086f76608bb4e80a3dc569d04a8814"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.15.201"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d951baf3610..9cb628c0ecc 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} = "settings-daemon"
 
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index b05a9c48ad4..95b525c5cd6 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;protocol=https;branch=master \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index b1724675bab..6243d16a522 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "libfakekey expat libxft"
 
 #SRCREV for 0.1.1
 SRCREV = "630d89068dc0a1e9199306d405cb32f892dfa4d3"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=matchbox-keyboard-0-1 \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 3dec68b9638..d43aeea07ab 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -23,7 +23,7 @@ RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
 RCONFLICTS:${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 802ffa971bf..74e543b0b53 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -11,7 +11,7 @@ SECTION = "x11/utils"
 
 #SRCREV tagged 0.2
 SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index bc4024736f4..3a69ff847e5 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index eea7025c8d4..1709ab460b7 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 
 # SRCREV tagged 0.3
 SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master"
+SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 4356930da0d..33625f928d5 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -9,7 +9,7 @@ SECTION = "x11"
 
 # SRCREV tagged 0.0.2
 SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;protocol=https;branch=master \
            file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 5a1d3299930..0dea9d67cab 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;protocol=https;branch=master \
 "
 
 S = "${WORKDIR}/git"

