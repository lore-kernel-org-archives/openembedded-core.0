Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C06C04AAA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 15:39:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.43129.1695224337236921096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 08:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RLk/7+/v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-403004a96a4so77457935e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695224335; x=1695829135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YgYAPbeDtarJd4AArTKQ4pgVv8hgwNUJ/3bs3dkglZM=;
        b=RLk/7+/v6rMFESyX+/3eYdwo92axIkVBppwaKgPOLhaLGAyw/FpUUOjZi2X2VR/SBc
         UbxIuCDoI1rKIeZS4gNlv+fXwKMbOh9l5js3tJ1cpzwTVr43aaxfJeDG7UrBWayr3oTN
         jl1mTg11jbPd9P9+KAeD0PcdWiZprLB0V773s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224335; x=1695829135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgYAPbeDtarJd4AArTKQ4pgVv8hgwNUJ/3bs3dkglZM=;
        b=M3EPlKI3UsGSUBCxyu17ABH9L2MyfJI0EOOwOJyGdN4nvAK5f2V4uF41bIqvQ6KgJR
         EWghQJbn2cEvM6ZzFerZsgeQS4CzW6CCjAFevKyoyzo5rOdsYqQCTkqRVM2UNRMbWOmE
         pK417xJ2kTKavYmdfYhCCveP6azMAjWnqORlx9V+OHCXmcYfLBmwLA4ff9VIGjtYIUyg
         JJ8DtNokxmmT8N0OIeP+o+d2cqfhmKlXMo3xRILkAxnq12aVtzihQ6lKu53AqBIUMlpJ
         uYmjzPctqL0CL/KlwMmcX/PXK1vpYacLsyzTrIXWOJPbU36606oh+pf1m5yrMJap3Tle
         5+3Q==
X-Gm-Message-State: AOJu0YylYeb+a7ok+L2HTnXRie8NcvuL3+FYfwKgyTM6MOkAqT3nKxlM
	p6v08soXVvyuFNMAEg2IoDlM818dsah8+a1yhxk=
X-Google-Smtp-Source: AGHT+IGq6XC5x6Gpe/q1UkU0SDKyH2MjmxhVHPSfbXw+9Wlj27K68Z6/VQBrxaP3bcxUc9n/W0srqw==
X-Received: by 2002:a05:600c:22da:b0:3fe:173e:4a34 with SMTP id 26-20020a05600c22da00b003fe173e4a34mr2622735wmg.40.1695224334162;
        Wed, 20 Sep 2023 08:38:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id x1-20020a1c7c01000000b00402d34ea099sm2269688wmc.29.2023.09.20.08.38.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:38:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] recipes: Drop remaining PR values from recipes
Date: Wed, 20 Sep 2023 16:38:52 +0100
Message-Id: <20230920153853.1060224-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187932

We've been removing PR values from recipes at upgrade time for a while. In general
anyone maintaining a binary distro would end up having to curate these themselves
so the values in OE-Core aren't really that useful anymore. In many ways it makes
sense to clear out the remaining ones (which are mostly for 'config' recipes that
are unlikely to increase in PV) and leave a clean slate for anyone implementing
a binary distro config.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb          | 1 -
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb  | 1 -
 meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb        | 1 -
 meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb            | 1 -
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb        | 1 -
 meta/recipes-bsp/alsa-state/alsa-state.bb                        | 1 -
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                    | 1 -
 meta/recipes-bsp/keymaps/keymaps_1.0.bb                          | 1 -
 meta/recipes-bsp/libacpi/libacpi_0.2.bb                          | 1 -
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                          | 1 -
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                      | 1 -
 meta/recipes-bsp/setserial/setserial_2.17.bb                     | 1 -
 meta/recipes-bsp/usbinit/usbinit.bb                              | 1 -
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                             | 1 -
 meta/recipes-connectivity/connman/connman-conf.bb                | 1 -
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb           | 1 -
 meta/recipes-core/base-files/base-files_3.0.14.bb                | 1 -
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                     | 1 -
 meta/recipes-core/glibc/ldconfig-native_2.12.1.bb                | 1 -
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb             | 1 -
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb            | 1 -
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb       | 1 -
 meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb  | 1 -
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb       | 1 -
 .../recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 1 -
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb    | 1 -
 .../initrdscripts/initramfs-module-install-efi_1.0.bb            | 1 -
 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb  | 1 -
 .../initrdscripts/initramfs-module-setup-live_1.0.bb             | 1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb                 | 1 -
 meta/recipes-core/meta/meta-environment.bb                       | 1 -
 meta/recipes-core/meta/meta-ide-support.bb                       | 1 -
 meta/recipes-core/meta/meta-toolchain.bb                         | 1 -
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb        | 1 -
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 -
 meta/recipes-core/packagegroups/packagegroup-base.bb             | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb        | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb         | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb         | 1 -
 .../recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb | 1 -
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb     | 1 -
 meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb | 1 -
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 -
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 -
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb      | 1 -
 meta/recipes-core/systemd/systemd-compat-units.bb                | 1 -
 meta/recipes-core/systemd/systemd-machine-units_1.0.bb           | 1 -
 meta/recipes-core/systemd/systemd-serialgetty.bb                 | 1 -
 meta/recipes-core/systemd/systemd-systemctl-native.bb            | 1 -
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb           | 1 -
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb            | 1 -
 meta/recipes-devtools/devel-config/nfs-export-root.bb            | 1 -
 meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb   | 1 -
 meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb               | 1 -
 meta/recipes-devtools/perl/liberror-perl_0.17029.bb              | 1 -
 meta/recipes-devtools/perl/libxml-perl_0.08.bb                   | 1 -
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb          | 1 -
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb             | 1 -
 meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb         | 1 -
 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb              | 1 -
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb             | 1 -
 meta/recipes-extended/mingetty/mingetty_1.08.bb                  | 1 -
 .../packagegroups/packagegroup-core-full-cmdline.bb              | 1 -
 meta/recipes-extended/shadow/shadow-securetty_4.6.bb             | 1 -
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb               | 1 -
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb           | 1 -
 meta/recipes-extended/unzip/unzip_6.0.bb                         | 1 -
 meta/recipes-extended/watchdog/watchdog_5.16.bb                  | 1 -
 meta/recipes-extended/which/which_2.21.bb                        | 1 -
 meta/recipes-extended/zip/zip_3.0.bb                             | 1 -
 meta/recipes-graphics/builder/builder_0.1.bb                     | 1 -
 meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb   | 1 -
 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb       | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb  | 1 -
 .../recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 1 -
 .../packagegroups/packagegroup-core-x11-xserver.bb               | 1 -
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb     | 1 -
 .../startup-notification/startup-notification_0.12.bb            | 1 -
 meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb       | 1 -
 meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb        | 1 -
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 -
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 1 -
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb            | 1 -
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb    | 1 -
 meta/recipes-graphics/xrestop/xrestop_0.4.bb                     | 1 -
 meta/recipes-kernel/linux/linux-dummy.bb                         | 1 -
 meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb | 1 -
 meta/recipes-kernel/perf/perf.bb                                 | 1 -
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb                   | 1 -
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb             | 1 -
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb     | 1 -
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb    | 1 -
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb           | 1 -
 meta/recipes-support/db/db_5.3.28.bb                             | 1 -
 95 files changed, 95 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index fee5bee7398..cc18a33532b 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -12,7 +12,6 @@ RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
 SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756e81fbc"
 
-PR = "r5"
 
 S = "${WORKDIR}/pv-${PV}"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 2558a22ce57..86ed0831221 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -9,7 +9,6 @@ DEPENDS = "dbus"
 # Note: this is intentionally not the latest version in the original .bb
 SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git"
-PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
index c5037a4912b..1a140a532f9 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
@@ -5,7 +5,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
                     file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
 
-PR = "r2"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/ed/ed-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
diff --git a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
index a1ad2e87d43..1fcbbdd65e1 100644
--- a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
+++ b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "X11 Pixmap library"
 LICENSE = "X-BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext"
-PR = "r2"
 PE = "1"
 
 XORG_PN = "libXpm"
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index d7a5a95bac1..8437a5a7745 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Example recipe for using inherit useradd"
 DESCRIPTION = "This recipe serves as an example for using features from useradd.bbclass"
 SECTION = "examples"
-PR = "r1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 27b2eccbe42..bd7f610f465 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = " \
     file://alsa-state-init;beginline=3;endline=4;md5=3ff7ecbf534d7d503941abe8e268ef50 \
 "
 PV = "0.2.0"
-PR = "r5"
 
 SRC_URI = "\
   file://asound.conf \
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index ea1fa4c754b..1eaf30746b0 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -5,7 +5,6 @@ build system cannot obtain from other sources such as the kernel."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r45"
 
 SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"
diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 84d09cb965d..3d5d127820d 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -7,7 +7,6 @@ RDEPENDS:${PN} = "kbd"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://keymap.sh;beginline=5;endline=5;md5=829e563511c9a1d6d41f17a7a4989d6a"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r31"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 6d4be76baba..6aae34b3100 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -5,7 +5,6 @@ SECTION = "base"
 HOMEPAGE = "http://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
-PR = "r6"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index a34fb4eb036..63edcbd8643 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://src/lrz.c;beginline=1;endline=10;md5=5276956373ff7d8758837f6399a1045f"
 SECTION = "console/network"
 DEPENDS = ""
-PR = "r6"
 
 SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://autotools-update.patch \
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 2c3ade99347..c7b95e57b0c 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -6,7 +6,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/pm-pmu.c;beginline=1;endline=22;md5=3c1ddbc54e735fb4a0386e14c78a3147"
 
-PR = "r1"
 
 SRC_URI = "http://pm-utils.freedesktop.org/releases/pm-utils-${PV}.tar.gz"
 
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 8e4bb62b9fb..98ab45145ff 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -5,7 +5,6 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
-PR = "r3"
 
 DEPENDS += "groff-native"
 
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index ffaca4b58d9..3a50b835c24 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -7,7 +7,6 @@ HOMEPAGE = "http://linux-sunxi.org/USB_Gadget/Ethernet"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r3"
 
 SRC_URI = "file://usb-gether \
            file://COPYING.GPL"
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index b4fe362f8e3..6151f0a7e2b 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -7,7 +7,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
 RRECOMMENDS:${PN} = "kernel-module-uvesafb"
-PR = "r2"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 7959ed8e501..a1a0e08faae 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,7 +4,6 @@ network interface inside qemu machines."
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r2"
 
 SRC_URI = "file://main.conf \
           "
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 8a6c297cb0d..099c58bfc71 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -3,7 +3,6 @@ SECTION = "console/network"
 DESCRIPTION = "PPP dail-in provides a point to point protocol (PPP), so that other computers can dial up to it and access connected networks."
 DEPENDS = "ppp"
 RDEPENDS:${PN} = "ppp"
-PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 0d38657c620..6ba3971e32d 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Miscellaneous files for the base system"
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
-PR = "r90"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 # Removed all license related tasks in this recipe as license.bbclass 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 09ba515a61e..1cdf07d03d1 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -9,7 +9,6 @@ DEPENDS = "dbus"
 
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git"
-PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
index e867ceb3ec3..4db67c3ad48 100644
--- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
@@ -18,7 +18,6 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
            file://add-riscv-support.patch \
 "
 
-PR = "r2"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"
 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index d39323db2f5..409b1c04033 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "http://packages.debian.org/ifupdown"
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r7"
 
 inherit update-rc.d
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index ab460ac797a..198459f2b20 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-boot.sh"
 
-PR = "r2"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 4e76e200266..39ea51ccbd2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-PR = "r4"
 
 inherit allarch
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
index 59a530506a9..847dbc0472c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
@@ -5,7 +5,6 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "busybox-mdev"
 SRC_URI = "file://init-live.sh"
 
-PR = "r12"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 8f56d7ab90e..b3b991b8fd8 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,7 +5,6 @@ DEPENDS = "virtual/kernel"
 RDEPENDS:${PN} = "udev udev-extraconf"
 SRC_URI = "file://init-live.sh"
 
-PR = "r12"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index ecbd567d6ca..e10faadfbe8 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
 
-PR = "r1"
 
 RDEPENDS:${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 674d49ecdf9..9046d06c02c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r9"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index fb194845554..b7499644f0c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 RDEPENDS:${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
 
-PR = "r4"
 
 SRC_URI = "file://init-install-efi.sh"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 0fc2c004c49..11db7124af9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -9,7 +9,6 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*)-(linux.*|free
 COMPATIBLE_HOST:armv7a = 'null'
 COMPATIBLE_HOST:armv7ve = 'null'
 
-PR = "r1"
 
 SRC_URI = "file://init-install.sh"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index d8ce024b831..48a779e9aaf 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS:${PN} = "initramfs-framework-base udev-extraconf"
 
-PR = "r4"
 
 inherit allarch
 
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 4dc477bb8d6..4b34c6a67ff 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://functions;beginline=7;endline=7;md5=829e563511c9a1d6d41f17a7a4989d6a"
-PR = "r155"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 7118fb2aefc..65436bc3e68 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Package of environment files for SDK"
 LICENSE = "MIT"
-PR = "r8"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 7f349f673da..d85aa120c08 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Meta package for ensuring the build directory contains all approp
 LICENSE = "MIT"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
-PR = "r3"
 RM_WORK_EXCLUDE += "${PN}"
 
 inherit toolchain-scripts nopackages deploy testsdk
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index b02b0665e62..260e03934ec 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
-PR = "r7"
 
 inherit populate_sdk
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 4909401c5af..bb4e746237b 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -36,7 +36,6 @@ DUMMYPROVIDES = "\
     /usr/bin/perl \
     "
 
-PR = "r2"
 
 require dummy-sdk-package.inc
 
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 9166a0851f2..11e31dcba3b 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
-PR = "r12"
 
 inherit packagegroup nativesdk
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index eeb26ca5880..83907ca2066 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
-PR = "r83"
 
 #
 # packages which content depend on MACHINE_FEATURES need to be MACHINE_ARCH
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index a7bad81023d..d96d2f5fff0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
-PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 35beb3fc055..b8a73175e8a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "NFS package groups"
-PR = "r2"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 104f3549d59..84e1a41d9a0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "Software development tools"
-PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index d06c6a56095..206292ace40 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Dropbear SSH client/server"
-PR = "r1"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 846df12bc71..392403f21b1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -1,5 +1,4 @@
 SUMMARY = "OpenSSH SSH client/server"
-PR = "r1"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 5ebcbcec829..06fdda90c74 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Target packages for the standalone SDK"
-PR = "r8"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
index c75850aa648..56ff1d2b069 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
 inherit packagegroup
 
-PR = "r3"
 
 MTRACE = ""
 MTRACE:libc-glibc = "libc-mtrace"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 6330200d2f0..62c22a35ab8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Profiling tools"
 
-PR = "r3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1fee1c925db..34af40a43f9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Testing tools/applications"
 
-PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index dd000fda49d..ae34a8a90b3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
-PR = "r13"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 75b1045728a..253bc9fcf1e 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -2,7 +2,6 @@ SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 LICENSE = "MIT"
 
-PR = "r29"
 
 PACKAGE_WRITE_DEPS += "systemd-systemctl-native"
 
diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
index 7e59e86f9be..8df7ff7cf1d 100644
--- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r19"
 
 inherit systemd features_check
 REQUIRED_DISTRO_FEATURES += "usrmerge"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index c2c67e6fe08..44a93ac6849 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r5"
 
 SERIAL_CONSOLES ?= "115200;ttyS0"
 SERIAL_TERM ?= "linux"
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index fadc8433d8c..54283bcba13 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,7 +3,6 @@ SUMMARY = "Wrapper for enabling systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r6"
 
 inherit native
 
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 7aad2e2bf2e..b1f9cb4caa6 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,6 @@ SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r10"
 
 SRC_URI = "file://inittab \
            file://start_getty"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index cce2f57363f..4d8ce4c7414 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -99,7 +99,6 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
 S = "${WORKDIR}/git"
 SRCREV = "868a2afab9da34f32c007d773b77253c93104636"
 
-PR = "r1"
 
 inherit systemd update-rc.d python3native update-alternatives
 
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index 0aaec36b414..5e69962d7c7 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Enables NFS access from any host to the entire filesystem (for de
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r1"
 
 SRC_URI = "file://exports"
 
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index b716b0245b5..1826c7a40ee 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -7,7 +7,6 @@ SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://icecc-create-env;beginline=2;endline=5;md5=ae1df3d6a058bfda40b66094c5f6065f"
 
-PR = "r2"
 
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
index dc17de2e8e6..dfd66a11689 100644
--- a/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-arch-config_1.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Architecture-dependent configuration for opkg"
 HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r1"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index 9585dfc2c61..e54bb11ccd3 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
@@ -9,7 +9,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
-PR = "r1"
 
 DEPENDS += "perl"
 
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 1b03e63a824..89acb64ef51 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://search.cpan.org/dist/libxml-perl/"
 SUMMARY = "Collection of Perl modules for working with XML"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-PR = "r3"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
 
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index b100659a8c7..5d407842014 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -4,7 +4,6 @@ RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
                   nativesdk-python3-shell nativesdk-python3-fcntl nativesdk-python3-logging \
                 "
 
-PR = "r9"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/scripts/runqemu;beginline=5;endline=10;md5=ac2b489a58739c7628a2604698db5e7f"
 
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 4d64ea4b93e..1dfce0e4c7b 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Helper utilities needed by the runqemu script"
 LICENSE = "GPL-2.0-only"
 RDEPENDS:${PN} = "qemu-system-native"
-PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/qemu-oe-bridge-helper.c;endline=4;md5=ae00a3bab86f2caaa8462eacda77f4d7"
 
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index db353d607b4..72ba8c02270 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Runs postinstall scripts on first boot of the target device"
 DESCRIPTION = "${SUMMARY}"
 SECTION = "devel"
-PR = "r10"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
index 44423b7aa87..f27ad830d32 100644
--- a/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
+++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=384ed0e2e0b2dac094e51fbf93fdcbe0 \
 "
 
-PR = "r1"
 
 SRC_URI = " \
 	git://github.com/lu-zero/cargo-c.git;branch=master;protocol=https \
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 56049015927..1931bfb3c05 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -28,7 +28,6 @@ SRC_URI[md5sum] = "2b31c78f087f99179feb357da312d7ec"
 SRC_URI[sha256sum] = "4441a5d593f85bb6e8d578cf6653fb4ec30f9e8f4a2315a3d8f2d0a8b3fadf94"
 
 # remove at next version upgrade or when output changes
-PR = "r1"
 
 RECIPE_NO_UPDATE_REASON = "6.04-pre3 is broken"
 UPSTREAM_CHECK_URI = "https://www.zytor.com/pub/syslinux/"
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 7a16c652998..aa5a989df2c 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -3,7 +3,6 @@ SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 DESCRIPTION = "This is a small Linux console getty that is started on the Linux text console, asks for a login name and then tranfers over to login directory. Is extended to allow automatic login and starting any app."
 LICENSE = "GPL-2.0-only"
-PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index b66617fbf61..e9531fa8381 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -4,7 +4,6 @@
 
 SUMMARY = "Standard full-featured Linux system"
 DESCRIPTION = "Package group bringing in packages needed for a more traditional full-featured Linux system"
-PR = "r6"
 
 inherit packagegroup
 
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
index c78f888cf40..fe51ea18744 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.6.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r3"
 
 SRC_URI = "file://securetty"
 
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 6580bd91664..00ab58b38cf 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;endline=1;md5=ceddfb61608e4
 
 DEPENDS = "base-passwd"
 
-PR = "r3"
 
 # The sole purpose of this recipe is to provide the /etc/login.defs
 # file for the target sysroot - needed so the shadow-native utilities
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 8137d257c82..c655da1199e 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -6,7 +6,6 @@ SECTION = "console/network"
 
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r10"
 
 DEPENDS += "libnsl2"
 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index a53663d086c..27076d5d9be 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -5,7 +5,6 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz \
 	file://avoid-strip.patch \
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 6031dcaa164..5325ccafdad 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -21,7 +21,6 @@ SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a
 
 # Can be dropped when the output next changes, avoids failures after
 # reproducibility issues
-PR = "r1"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index c8a50735b1a..77861370e5b 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -13,7 +13,6 @@ DEPENDS     = "cwautomacros-native"
 
 inherit autotools texinfo update-alternatives
 
-PR = "r3"
 
 EXTRA_OECONF = "--disable-iberty"
 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 3425e8eb7be..70df5ab8728 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -6,7 +6,6 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
-PR = "r2"
 
 S = "${WORKDIR}/zip30"
 
diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 1700015dede..52c9351f93f 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,6 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r6"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_session.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index 1a16ed43747..d1f0a67d841 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -12,7 +12,6 @@ RCONFLICTS:${PN} = "matchbox-common"
 SRC_URI = "file://matchbox-session"
 S = "${WORKDIR}"
 
-PR = "r4"
 
 inherit update-alternatives
 
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 12c72edb79d..ba81d0b17ab 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Simple session manager for X, that provides just the right boiler
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
-PR = "r4"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
index 0ce91ca9403..dd302c89e78 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Basic Weston compositor setup"
 DESCRIPTION = "Packages required to set up a basic working Weston session"
-PR = "r1"
 
 inherit packagegroup features_check
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
index 0185c93354c..db6242af335 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Basic X11 session"
 DESCRIPTION = "Packages required to set up a basic working X11 session"
-PR = "r1"
 
 inherit packagegroup features_check
 # rdepends on matchbox-wm
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
index b1087859311..ebc1330055c 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
@@ -3,7 +3,6 @@
 #
 
 SUMMARY = "X11 display server"
-PR = "r40"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 9ca058b38bd..91db7ed33bd 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2011 Intel Corporation
 #
 
-PR = "r40"
 
 inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index efd426f8c47..aa18881a12e 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a2ae2cd47d6d2f238410f5364dfbc0f2 \
                     file://libsn/sn-common.h;endline=23;md5=6d05bc0ebdcf5513a6e77cb26e8cd7e2 \
                     file://test/test-boilerplate.h;endline=23;md5=923e706b2a70586176eead261cc5bb98"
 
-PR = "r2"
 
 SECTION = "libs"
 
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index d3d1cfde60c..0fc075a4680 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -8,7 +8,6 @@ but is visibly different than normal and bold, and reasonably pleasing."
 SECTION = "x11/fonts"
 LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
-PR = "r8"
 
 inherit allarch fontcache
 
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 3cc8e9ed4d8..671c0a290e8 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Simple Xserver Init Script (no dm)"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r31"
 
 SRC_URI = "file://xserver-nodm \
            file://Xserver \
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index b77c940dde9..5c9742fb205 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -5,7 +5,6 @@ BUGTRACKER = "https://github.com/tias/xinput_calibrator/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r7"
 
 SRC_URI = "file://pointercal.xinput"
 S = "${WORKDIR}"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 05f07c190e9..7b49668f92c 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi libxrandr"
 
 PV = "0.7.5+git"
-PR = "r6"
 
 inherit autotools pkgconfig features_check
 # depends on virtual/libx11
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index babde4b0998..d32ef774472 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -13,7 +13,6 @@ SRC_URI = "file://misc"
 SOURCE_DATE_EPOCH = "1613559011"
 
 PE = "1"
-PR = "r4"
 
 inherit allarch features_check
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index f82a6960e6c..03f14cef2bd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r33"
 
 SRC_URI = "file://xorg.conf"
 
diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
index 0b5ab506e34..a6b6c4238db 100644
--- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
+++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://xrestop.c;endline=18;md5=730876c30f0d8a928676bcd1242a3b35"
 
 SECTION = "x11/utils"
-PR = "r3"
 
 DEPENDS = "libxres libxext virtual/libx11 ncurses"
 
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 7c46f80d8d4..2396f46202b 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -28,7 +28,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 COMPATIBLE_HOST = ".*-linux"
 
-PR = "r1"
 
 SRC_URI = "file://COPYING.GPL"
 S = "${WORKDIR}"
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 8f4fdd76bfb..b630a402ff5 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://modutils.sh;beginline=3;endline=3;md5=b2dccaa94b3629a08bfb4f983cad6f89"
 SRC_URI = "file://modutils.sh"
 
-PR = "r7"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e22a1bebb26..675acfaf260 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -9,7 +9,6 @@ HOMEPAGE = "https://perf.wiki.kernel.org/index.php/Main_Page"
 
 LICENSE = "GPL-2.0-only"
 
-PR = "r9"
 
 PACKAGECONFIG ??= "python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index f6bca4e730a..7a3b4a43c8d 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -7,7 +7,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
 SECTION = "libs"
-PR = "r4"
 
 inherit autotools
 
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 178e1a9240f..11674af379f 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -7,7 +7,6 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf91718f59eb6a83d06dc7bcaf411132"
 DEPENDS = "libogg"
 
-PR = "r1"
 
 SRC_URI = "http://downloads.xiph.org/releases/theora/libtheora-${PV}.tar.bz2 \
            file://no-docs.patch"
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 49bf30ee5ea..90734b6bd09 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be6
 
 SECTION = "x11"
 RDEPENDS:${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop matchbox-session gconf"
-PR = "r30"
 
 # This package is architecture specific because the session script is modified
 # based on the machine architecture.
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 6866a4d7380..3f735e072b2 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Sato desktop"
 DESCRIPTION = "Packagegroups provide a convenient mechanism of bundling a collection of packages."
 HOMEPAGE = "https://www.yoctoproject.org/"
-PR = "r33"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index 4bb896fc7bb..766f574b259 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://shutdown.desktop"
 
-PR = "r1"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index c5427f54eb0..a99d5cea62d 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -18,7 +18,6 @@ RCONFLICTS:${PN} = "db3"
 CVE_PRODUCT = "oracle_berkeley_db berkeley_db"
 CVE_VERSION = "11.2.${PV}"
 
-PR = "r1"
 PE = "1"
 
 SRC_URI = "https://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-- 
2.39.2


