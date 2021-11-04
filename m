Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C71C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:07:23 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.12117.1636034842418291937
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I0y3Kq48;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e65so5506742pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FGivUpkwDiLcNOaLECRfC5eSfgotb2MS/RDNstpJUrc=;
        b=I0y3Kq48HoHplTwOhjCDz/fJZHghKpPDSn/XU+ygcozOirdfCMgQrnsSQ6pjGlLoyq
         1LIb1a7nsQd4XoQANcWEdM6HKUFN2DYk4DPi1ijHCGsT7D70l2yHGVEfQBz4g5pwbz1k
         h5PESER1upY720EPDeQxfO4cXJwp4UCWoD7UZBsyQ6QeDNuRBMq8Bd0vayUVFISRwhzi
         faS61y6dwmcTQwZ72O+lP89vuSBMa1L/ZIsG40d7nVvcjbKdn4jnXJpMBZgDrPeIAe5O
         YPvv+z/n3nWYnj+8i62aqsvir8gl2ul/Kvj+QESCxI48FXyWjKitIdQoXpxIh9gHM9D1
         yIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FGivUpkwDiLcNOaLECRfC5eSfgotb2MS/RDNstpJUrc=;
        b=bPsbq+KVvlbDmpILzTyG3rjP0QY4KhW2l0rRAz1I/A1UuP1dun2Ye0L2l3JXOoaI84
         XW1EGaqtOwn2ZxVEIVHDb20RJXc0U+4+dniFSo/hC4952I1H7LAoNPkMrONoyhBpcNw1
         VPR19B5tTlCn4SQkLdU0OLqI9eekEmyHxxz4LcdaYq3NOQb+rA4gamN+qEBPuthw/DBf
         B2PAOpBOc/Gflx7N6fM4iNo5FIXObFwaZpua76h3L8R5/0KOfVHkis5xEDMrGpmsOCQj
         TkQuVshvgB5IbiEsSUeos1k5qMmaJLx+irFulIHjCrynGoQt1GajwHY5iHre+VfHxkAT
         +yRg==
X-Gm-Message-State: AOAM532FTDiCGUWNXVlMbOTiz6WbFgkFvXcmmuvhB9tnvm5+fU3MUnV3
	ROr92y5yYe+/znGtBEmWTef4fId7NdmFjOZOe6o=
X-Google-Smtp-Source: 
 ABdhPJyOG4B3U0qa3IqwOQCAIcccBn217XJDpGkvT0nA82FOSmhyyQmTgrfwvfMxFPmDAhrWfrafYA==
X-Received: by 2002:a05:6a00:812:b0:47e:4c65:2a77 with SMTP id
 m18-20020a056a00081200b0047e4c652a77mr50225654pfk.51.1636034840024;
        Thu, 04 Nov 2021 07:07:20 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m22sm4973291pfo.71.2021.11.04.07.07.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:07:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] meta: Add explict branch to git SRC_URIs,
 handle github url changes
Date: Thu,  4 Nov 2021 04:06:48 -1000
Message-Id: 
 <827a805349f9732b2a5fa9184dc7922af36de327.1636034660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636034660.git.steve@sakoman.com>
References: <cover.1636034660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157847

This update was made with the convert-scruri.py script in scripts/contrib

This script handles two emerging issues:

    1. There is uncertainty about the default branch name in git going forward.
    To try and cover the different possible outcomes, add branch names to all
    git:// and gitsm:// SRC_URI entries.

    2. Github are dropping support for git:// protocol fetching, so remap github
     urls as needed. For more details see:

    https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-test/devtool/devtool-upgrade-test2_git.bb       | 2 +-
 .../devtool/devtool-upgrade-test2_git.bb.upgraded           | 2 +-
 meta/classes/devupstream.bbclass                            | 2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb                | 2 +-
 meta/recipes-bsp/efivar/efivar_37.bb                        | 2 +-
 meta/recipes-bsp/opensbi/opensbi_0.6.bb                     | 2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb                | 2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc                   | 2 +-
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb      | 2 +-
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb | 2 +-
 .../mobile-broadband-provider-info_git.bb                   | 2 +-
 meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb     | 2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                | 2 +-
 meta/recipes-core/expat/expat_2.2.9.bb                      | 2 +-
 meta/recipes-core/fts/fts_1.2.7.bb                          | 2 +-
 meta/recipes-core/glibc/cross-localedef-native_2.31.bb      | 2 +-
 meta/recipes-core/glibc/glibc-version.inc                   | 2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb               | 2 +-
 meta/recipes-core/libxcrypt/libxcrypt.inc                   | 2 +-
 meta/recipes-core/musl/libucontext_git.bb                   | 2 +-
 meta/recipes-core/musl/musl-obstack.bb                      | 2 +-
 meta/recipes-core/musl/musl-utils.bb                        | 2 +-
 meta/recipes-core/musl/musl_git.bb                          | 2 +-
 meta/recipes-core/ncurses/ncurses.inc                       | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                    | 2 +-
 meta/recipes-core/systemd/systemd.inc                       | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb            | 2 +-
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb       | 2 +-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb      | 2 +-
 meta/recipes-devtools/build-compare/build-compare_git.bb    | 2 +-
 meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb   | 2 +-
 meta/recipes-devtools/distcc/distcc_3.3.3.bb                | 2 +-
 meta/recipes-devtools/dnf/dnf_4.2.2.bb                      | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc               | 2 +-
 meta/recipes-devtools/file/file_5.38.bb                     | 2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb                 | 2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb          | 2 +-
 meta/recipes-devtools/go/go-dep_0.5.4.bb                    | 2 +-
 meta/recipes-devtools/libcomps/libcomps_0.1.15.bb           | 2 +-
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb               | 2 +-
 meta/recipes-devtools/librepo/librepo_1.11.2.bb             | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb                      | 2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb                  | 2 +-
 meta/recipes-devtools/ninja/ninja_1.10.0.bb                 | 2 +-
 meta/recipes-devtools/patchelf/patchelf_0.10.bb             | 2 +-
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb                   | 2 +-
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb  | 2 +-
 .../systemd-bootchart/systemd-bootchart_233.bb              | 2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb            | 2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb                    | 2 +-
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb      | 2 +-
 meta/recipes-extended/iputils/iputils_s20190709.bb          | 2 +-
 meta/recipes-extended/libaio/libaio_0.3.111.bb              | 2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb                 | 2 +-
 meta/recipes-extended/libnss-nis/libnss-nis.bb              | 2 +-
 meta/recipes-extended/libsolv/libsolv_0.7.10.bb             | 2 +-
 meta/recipes-extended/ltp/ltp_20200120.bb                   | 2 +-
 meta/recipes-extended/procps/procps_3.3.16.bb               | 2 +-
 meta/recipes-extended/psmisc/psmisc_23.3.bb                 | 2 +-
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb          | 2 +-
 meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb        | 2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc                 | 2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb               | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb          | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb       | 2 +-
 meta/recipes-graphics/libva/libva-utils_2.6.0.bb            | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb      | 2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb                    | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                  | 2 +-
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb  | 2 +-
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb                | 2 +-
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb            | 6 +++---
 meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb    | 2 +-
 meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb     | 2 +-
 meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb      | 2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb              | 2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb   | 2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb                | 2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc                 | 2 +-
 meta/recipes-kernel/dtc/dtc.inc                             | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb     | 2 +-
 meta/recipes-kernel/kmod/kmod.inc                           | 2 +-
 meta/recipes-kernel/powertop/powertop_2.10.bb               | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc             | 2 +-
 meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb    | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb                    | 2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb                    | 2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb          | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb  | 2 +-
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb | 2 +-
 .../recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb | 2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb          | 2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb                    | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb    | 2 +-
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb  | 2 +-
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb           | 2 +-
 .../ca-certificates/ca-certificates_20211016.bb             | 2 +-
 meta/recipes-support/dos2unix/dos2unix_7.4.1.bb             | 2 +-
 .../gnome-desktop-testing/gnome-desktop-testing_2018.1.bb   | 2 +-
 .../libjitterentropy/libjitterentropy_2.2.0.bb              | 2 +-
 meta/recipes-support/lz4/lz4_1.9.2.bb                       | 2 +-
 meta/recipes-support/p11-kit/p11-kit_0.23.22.bb             | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb     | 2 +-
 meta/recipes-support/rng-tools/rng-tools_6.9.bb             | 2 +-
 .../shared-mime-info/shared-mime-info_git.bb                | 2 +-
 meta/recipes-support/vim/vim.inc                            | 2 +-
 106 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 07b83276fb..8a27e3a791 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -11,7 +11,7 @@ SRCREV = "1a3e1343761b30750bed70e0fd688f6d3c7b3717"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
index 32ec4b14fa..fbe90d6c6b 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index 7780c5482c..97e137cb40 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -4,7 +4,7 @@
 #
 # Usage:
 # BBCLASSEXTEND = "devupstream:target"
-# SRC_URI_class-devupstream = "git://git.example.com/example"
+# SRC_URI_class-devupstream = "git://git.example.com/example;branch=master"
 # SRCREV_class-devupstream = "abcdef"
 #
 # If the first entry in SRC_URI is a git: URL then S is rewritten to
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 5d6f200a73..e9dfa0770e 100644
--- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -10,7 +10,7 @@ DEPENDS = "efivar popt"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https;branch=master \
            file://0001-remove-extra-decl.patch \
            file://97668ae0bce776a36ea2001dea63d376be8274ac.patch \
           "
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index 5bf121ff6e..fa1fe1ecdf 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.6.bb b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
index d8910c0ff1..972d8de17d 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.6.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
@@ -9,7 +9,7 @@ require opensbi-payloads.inc
 inherit autotools-brokensep deploy
 
 SRCREV = "ac5e821d50be631f26274765a59bc1b444ffd862"
-SRC_URI = "git://github.com/riscv/opensbi.git \
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
 
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
index 613e3161fb..8234b86162 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
 SRCREV = "824551ac77bab1d0f7ae34d7a7c77b155240e754"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 198ed52c7c..a001190292 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
-SRC_URI = "git://git.denx.de/u-boot.git \
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
            file://remove-redundant-yyloc-global.patch \
            file://CVE-2020-8432.patch \
            file://CVE-2020-10648-1.patch \
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 778bf50191..24593d6258 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master;protocol=https \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
            file://images/* \
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
index 9a83898e52..5213b28345 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 
-SRC_URI = "git://github.com/lathiat/nss-mdns \
+SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master;protocol=https \
            "
 
 SRCREV = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index f170cf4650..b4cbc1a76c 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -8,7 +8,7 @@ SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
 PV = "20201225"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
index 67959576e8..f482bd297f 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.82.bb
@@ -11,7 +11,7 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=master \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 677768d35a..b39f7523c0 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index cd38df91d9..a2df7ac492 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
-SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https \
+SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2013-0340.patch \
            file://libtool-tag.patch \
          "
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index ea820cb0c3..d3b0f31eda 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb b/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
index 24de55d929..9aa24eccfe 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
@@ -20,7 +20,7 @@ inherit autotools
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
-           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
+           git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef;protocol=https \
            \
            file://0001-localedef-Add-hardlink-resolver-to-build.patch;patchdir=localedef \
            \
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index aac0d9b3bf..dd6f0039c7 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.31+git${SRCPV}"
 SRCREV_glibc ?= "4f0a61f75385c9a5879cbe7202042e88f692a3c8"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index 16807eb675..c3681defdc 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -7,7 +7,7 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://99_network \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 2d2a0b03e3..b6bf48ba79 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
 SRCREV = "823437d015cd4ab4d100ed205f218681b03ae45c"
 SRCBRANCH ?= "develop"
 
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index ec988f1920..71beb80083 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -10,7 +10,7 @@ DEPENDS = ""
 
 PV = "0.10+${SRCPV}"
 SRCREV = "19fa1bbfc26efb92147b5e85cc0ca02a0e837561"
-SRC_URI = "git://github.com/kaniini/libucontext \
+SRC_URI = "git://github.com/kaniini/libucontext;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 3003935fe5..74de48c2cd 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.1"
 SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
-SRC_URI = "git://github.com/pullmoll/musl-obstack"
+SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index dd0ce33061..c30509469c 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PV = "20170421"
 
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
-SRC_URI = "git://github.com/boltlinux/musl-utils"
+SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 82379fd1c5..cbb56f4769 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,7 +12,7 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/musl \
+SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 7f1834f0dc..ee0b15ecf0 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 22c71f099b..b2947c2114 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,7 +10,7 @@ SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3165d13f03..8b5260bb0d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -16,6 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "3ceaa81c61b654ebf562464d142675bd4d57d7b6"
 SRCBRANCH = "v244-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index da716674c3..daee5c224b 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
-SRC_URI = "git://git.yoctoproject.org/update-rc.d"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
 SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 6571c19938..d7827939ca 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRC_URI = "git://github.com/xrmx/bootchart.git \
+SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
index 4112cf484f..be61916cc6 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.4.1.bb
@@ -15,7 +15,7 @@ DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "3fc2326d3474a5e4df2449f5e3043f7298501334"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index b0560cc277..6afa9a0d68 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/openSUSE/build-compare"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/openSUSE/build-compare.git \
+SRC_URI = "git://github.com/openSUSE/build-compare.git;branch=master;protocol=https \
            file://Ignore-DWARF-sections.patch;striplevel=1 \
            "
 
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
index c6a53ffece..3c403a4077 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.15.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
index 9a36cfe525..2a74a068f1 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN}-server = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master;protocol=https \
            file://fix-gnome.patch \
            file://separatebuilddir.patch \
            file://default \
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index 7831e1ac5a..1b00ae945e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
 
-SRC_URI = "git://github.com/rpm-software-management/dnf.git \
+SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 009f5ed807..45fb9720ee 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
index 2d62ead10b..b19bf03986 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS_class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
 SRCREV = "ec41083645689a787cdd00cb3b5bf578aa79e46c"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index 6eb87df7c3..21773d91f9 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
 
 GO_IMPORT = "github.com/Masterminds/glide"
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};branch=master"
 SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 7299a1d4a4..df8947e425 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "5256817ace8493502ec88501a19e4051c2e220b0"
 PV = "20200117+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git \
+SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/go/go-dep_0.5.4.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
index 0da2c6607c..e29e53433e 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.4.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
 
 GO_IMPORT = "github.com/golang/dep"
-SRC_URI = "git://${GO_IMPORT} \
+SRC_URI = "git://${GO_IMPORT};branch=master \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
            file://0001-bolt_riscv64-Add-support-for-riscv64.patch;patchdir=src/github.com/golang/dep \
           "
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
index 58d2dee897..d9e712f74a 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
            file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index cc7f2be564..fb7fc80758 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "This library provides a high level package-manager. It's core lib
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/libdnf \
+SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=master;protocol=https \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
diff --git a/meta/recipes-devtools/librepo/librepo_1.11.2.bb b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
index a299514340..73a58f75e3 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            file://CVE-2020-14352.patch \
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 534e2c685f..de92cef1a4 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -30,7 +30,7 @@ LLVM_DIR = "llvm${LLVM_RELEASE}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
 SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index d8355bbad3..fa42770ee4 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -14,7 +14,7 @@ RDEPENDS_mtd-utils-tests += "bash"
 PV = "2.1.3"
 
 SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
 
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
index c02b876c02..ae3f3f1ea8 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "re2c-native ninja-native"
 
 SRCREV = "ed7f67040b370189d989adbd60ff8ea29957231f"
 
-SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
+SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index b64eaf3c21..2bf3108f88 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPLv3"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
            file://fix-phdrs.patch \
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index ab9f0e8e29..c39a5208e5 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
+SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x;protocol=https \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wit.patch \
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 083e597b03..5d754b20b3 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
            file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
            file://CVE-2021-40153.patch;striplevel=2 \
 "
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
index aafe7c72a0..e1233ffde0 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
 "
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 60faf481c5..b671956cc8 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index b1882defa2..d1b3fb8f57 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -14,7 +14,7 @@ DEPENDS_append_class-nativesdk = " flex-nativesdk"
 ASNEEDED = ""
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
+SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index ab70ea98a3..7d0f74186e 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://golang.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};branch=master"
 SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index b33b913817..a715d0a37b 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils \
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
            file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
diff --git a/meta/recipes-extended/libaio/libaio_0.3.111.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
index 8e1cd349a0..309ae53bfb 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.111.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https \
+SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://00_arches.patch \
            file://destdir.patch \
            file://libaio_fix_for_mips_syscalls.patch \
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 28c84af7ad..cbb38674b9 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -14,7 +14,7 @@ PV = "1.2.0+git${SRCPV}"
 
 SRCREV = "4a062cf4180d99371198951e4ea5b4550efd58a3"
 
-SRC_URI = "git://github.com/thkukuk/libnsl \
+SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index a1d914e871..984cc98fc2 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -17,7 +17,7 @@ PV = "3.1+git${SRCPV}"
 
 SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
-SRC_URI = "git://github.com/thkukuk/libnss_nis \
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index eadf04aa5a..2c2aedc32c 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://CVE-2021-3200.patch \
 "
 
diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
index 6633755a20..505b7b14fc 100644
--- a/meta/recipes-extended/ltp/ltp_20200120.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -29,7 +29,7 @@ CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "4079aaf264d0e9ead042b59d1c5f4e643620d0d5"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
            file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 2810ebd285..3a8289b359 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -12,7 +12,7 @@ DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
+SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            "
 SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
diff --git a/meta/recipes-extended/psmisc/psmisc_23.3.bb b/meta/recipes-extended/psmisc/psmisc_23.3.bb
index e569f1074b..36e6775f9e 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.3.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.3.bb
@@ -2,7 +2,7 @@ require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
 SRCREV = "78bde849041e6c914a2a517ebe1255b86dc98772"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index cb5b288c48..0f8a6f74f8 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4+git${SRCPV}"
 
 SRCREV = "9bc3b5b785723cfff459b0c01b39d87d4bed975c"
 
-SRC_URI = "git://github.com/thkukuk/${BPN} \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master;protocol=https \
            file://0001-Use-cross-compiled-rpcgen.patch \
           "
 
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
index 0533a0e19b..cf94e0275b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 8899daa1b0..e45b256bbe 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
            file://sysklogd \
            file://0001-fix-one-rarely-reproduced-parallel-build-problem.patch \
            "
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index da81867115..765a34e842 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -13,7 +13,7 @@ PR = "r2"
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "xinetd-(?P<pver>(?!20030122).+)"
 
-SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https \
+SRC_URI = "git://github.com/xinetd-org/xinetd.git;protocol=https;branch=master \
       file://xinetd.init \
       file://xinetd.conf \
       file://xinetd.default \
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index ab6f5ac9ed..33ea6fe5a9 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index 1a31677978..06bd682823 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
index 03b38027a1..f14ed0f52b 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.6.0.bb
@@ -14,7 +14,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.6-branch;protocol=https"
 SRCREV = "8ea1eba433dcbceb0e5dcb54b8e3f984987f7a17"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index a08eb252ce..3ea67d09d6 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
            file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index 58a6997ffe..88101b5dcc 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -7,7 +7,7 @@ PV = "1.4.7+git${SRCPV}"
 # Exclude x.99.x versions from upstream checks
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>^\d+(\.(?!99)\d+)+)"
 
-SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4 \
+SRC_URI = "git://github.com/clutter-project/mx.git;branch=mx-1.4;protocol=https \
 	   file://fix-test-includes.patch \
 	  "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 4229412554..b84d53f87c 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=master \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            "
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
index 1046b8504f..772db5bbaf 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm mesa libepoxy"
 SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
-SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
            file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 5a8c62e64d..295ac12fc5 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
+SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release;protocol=https \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index c94e768b52..b212814759 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=dcf473723faabf17baa9b5f2207599d0 \
 SRCREV_glm = "1ad55c5016339b83b7eec98c31007e0aee57d2bf"
 SRCREV_gli = "7da5f50931225e9819a26d5cb323c5f42da50bcd"
 
-SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
-           git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm \
-           git://github.com/g-truc/gli;destsuffix=git/external/gli;name=gli \
+SRC_URI = "git://github.com/SaschaWillems/Vulkan.git;branch=master;protocol=https \
+           git://github.com/g-truc/glm;destsuffix=git/external/glm;name=glm;branch=master;protocol=https \
+           git://github.com/g-truc/gli;destsuffix=git/external/gli;name=gli;branch=master;protocol=https \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
index b9658d3afa..c58a801e03 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.1.126"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.1.126;protocol=https"
 
 SRCREV = "5bc459e2921304c32568b73edaac8d6df5f98b84"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
index 504cf85a2b..c8352bf31d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.1.126.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.1.126"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.1.126;protocol=https"
 SRCREV = "4adad4ff705fa76f9edb2d37cb57e593decb60ed"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
index 8eef1bca73..ec65f11952 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.1.126"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.1.126;protocol=https"
 SRCREV = "09695dfc5dbe54f869aeaff8db93bb7bb6a220e0"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index d2a16643fe..e524b82dd6 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRCREV = "18ec53f1cada39f905614ebfaffed5c7754ecf46"
-SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput \
+SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput;protocol=https \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 553840ddb8..685362ef15 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "f66d39544bb8339130c96d282a80f87ca1606caf"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel"
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7ccc022b93..2110bc75fa 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,7 @@ SRCREV = "cca113f2fe0759b91fd6a0e10fdcda2c28f18a7e"
 
 PV = "1.2.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git \
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
            file://ldflags.patch \
            file://CVE-2018-10689.patch \
            file://make-btt-scripts-python3-ready.patch \
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index cf9b9b7207..f02619cabe 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -8,7 +8,7 @@ API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
 SRCREV = "a87053bee5680878c295b7d23cf0d7065576ac2b"
 
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 5da6c24fbf..461ab8fbd3 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -5,7 +5,7 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
            file://make_install.patch \
            file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
            "
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 3f76af424b..82d678e509 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -14,7 +14,7 @@ PV = "0.2+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index bb678c6900..631b50658a 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -18,7 +18,7 @@ SRCREV = "58133a96c894c043e48c74ddf0bfe8db90bac62f"
 # Lookout for PV bump too when SRCREV is changed
 PV = "26"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://0001-build-Stop-using-dolt.patch \
            file://avoid_parallel_tests.patch \
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index ffa3b4685c..dcbba2fd5c 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -6,7 +6,7 @@ DEPENDS = "ncurses libnl pciutils autoconf-archive"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
+SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
            file://0001-wakeup_xxx.h-include-limits.h.patch \
            file://0002-configure.ac-ax_add_fortify_source.patch \
            file://0003-configure-Use-AX_REQUIRE_DEFINED.patch \
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 116e83fe0f..af55f15fd4 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "044a0640985ef007c0b2fb6eaf660d9d51800cda"
 PV = "4.2"
 
-SRC_URI = "git://sourceware.org/git/systemtap.git \
+SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
index af79a6f952..6494013e3f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 glib-2.0-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https;branch=master \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 39429a8809..6789646833 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "nasm-native"
 
-SRC_URI = "git://github.com/mirror/x264;branch=stable \
+SRC_URI = "git://github.com/mirror/x264;branch=stable;protocol=https \
            file://don-t-default-to-cortex-a9-with-neon.patch \
            file://Fix-X32-build-by-disabling-asm.patch \
            "
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 85c2c500ea..4d5d299d47 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git${SRCPV}"
-SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git"
+SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
 SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index 547e851c15..5733a36b12 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} = "settings-daemon"
 
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index cc51f47b63..2a2eb24f57 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
            file://vfolders/* \
            "
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index c659964a2b..54fe578cd3 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -23,7 +23,7 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 9f00281dde..e2e81c2905 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -11,7 +11,7 @@ SECTION = "x11/utils"
 
 #SRCREV tagged 0.2
 SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index 7a043d3447..bc4024736f 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index befe4a53f4..2edc9ada2e 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxt"
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=master \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index 2b1f513f1c..7e7612253d 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 
 # SRCREV tagged 0.3
 SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI = "git://git.yoctoproject.org/screenshot"
+SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index d01177f9b9..19c4a73dc3 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -9,7 +9,7 @@ SECTION = "x11"
 
 # SRCREV tagged 0.0.2
 SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master \
            file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index 986f0124e2..97b88ec033 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN}"
+SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
 
 SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 214bad4ae3..a54d6b458a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -16,7 +16,7 @@ PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
 
-SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
index 1623285fd0..ea34e4c7a3 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
@@ -8,7 +8,7 @@ SECTION = "support"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0c977b18f0a384d03597a517d7d03e32"
 
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "0490f0723b1a0851b17343f6164915f3474b5197"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
index e5c69c0c46..19f32e8d1f 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http"
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http;branch=master"
 SRCREV = "4decade67b29ad170fcf3de148e41695fc459f48"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
index 710ef0172d..841edc6829 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a95aadbdfae7ed812bb2b7b86eb5981c \
                     file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https \
            file://0001-Makefile-cleanup-install-for-rebuilds.patch \
            file://0001-Make-man-pages-reproducible.patch"
 SRCREV = "933a44f33ed3d6612f7cfaa7ad1207c8da4886ba"
diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 546bed39b0..0c4a0ac807 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=dev;protocol=https \
            file://run-ptest \
            file://CVE-2021-3520.patch \
            "
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index 623afccb5e..5f1b73ee16 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -10,7 +10,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23;protocol=https"
 SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 7290dc90e5..3401b7b39e 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
index b8c6f022f3..58b58fbb3c 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils"
 
 SRC_URI = "\
-    git://github.com/nhorman/rng-tools.git \
+    git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
     file://0001-rngd_jitter-fix-O_NONBLOCK-setting-for-entropy-pipe.patch \
     file://0002-rngd_jitter-initialize-AES-key-before-setting-the-en.patch \
     file://0003-rngd_jitter-always-read-from-entropy-pipe-before-set.patch \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 6b3ebf1cdc..05c7d32965 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
 SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
 PV = "1.15"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fc4e205b74..dc7c37a93c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
 
-SRC_URI = "git://github.com/vim/vim.git \
+SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
-- 
2.25.1


