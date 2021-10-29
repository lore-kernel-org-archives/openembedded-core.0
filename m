Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7B9C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 12:58:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.4874.1635512304148700919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIOCIj2V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z14so16046139wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AierxgfplYMgQ++N0sTk74s/fZ/BnbbzxUxaDQZW2s=;
        b=FIOCIj2VsbrKzlgjjCRcmj3GIqSsiySfcv59CnUcI+18V4HureqjBbaw60AVSk+22+
         KpLkZBPEGbSqPiZgPU1kdBeXIhRZMyaWOVZ7gNKM8VmO4Wv9jOpLmUaCX1DM7T1I8RMo
         xfUslF/IlONh6S2fh7JFsBwglzenKlV1oJ208=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AierxgfplYMgQ++N0sTk74s/fZ/BnbbzxUxaDQZW2s=;
        b=640P11oQB6B9VLbyjbyOt7msfW+Yb7zr3eJ8YZOQuvhshjySRmPzXLCYnKyhKayEam
         wxz2/Sx+8EA8J8YaCCJUaG3JLsy9DogzTXl4Wqdp6kEq71GPgcpyh8AQwx5KluFoawLh
         /He57RLjFD21g4jDnDwENapWtv6yoA6r+Z4zynhUPubM8Rvnr1qOrbpcDz90TadxeEu0
         OZADK/laPEatGVVmqDYHFhf7Kg1tA9z4tEttkWRGGtBJJcdU62bE04++gCrJnQ0Wtzqo
         esoDggQtvcnt5/UeT0BkXac3HXcuXcJnpGjUgaXuSbDXJcOS736fJCR7Ie7/sgNyvTp2
         cgkw==
X-Gm-Message-State: AOAM532X8UfSZ2vVODlbhzlvfumyfrXBXLooU2TBKolrrTxatrSsZ9bk
	n8iyE68sCdib/wcuDTUi2yOaiQrYhvegRA==
X-Google-Smtp-Source: 
 ABdhPJxfkY8RgQceNyye6S0oINAB2cuZjYMTLLwQbDB622jc6IJpSpHPEr53ZK7fotCykRCqc/K+kw==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr14230799wrd.16.1635512301414;
        Fri, 29 Oct 2021 05:58:21 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 u2sm5465252wrr.35.2021.10.29.05.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 05:58:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] meta: Add explict branch to git SRC_URIs
Date: Fri, 29 Oct 2021 13:58:19 +0100
Message-Id: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 12:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157623

There is uncertainty about the default branch name in git going forward.
To try and cover the different possible outcomes, add branch names to all
git:// and gitsm:// SRC_URI entries.

This update was made with the script added to contrib in this patch which
aims to help others convert other layers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../devtool/devtool-upgrade-test2_git.bb      |  2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |  2 +-
 .../git-submodule-test/git-submodule-test.bb  |  2 +-
 meta/classes/devupstream.bbclass              |  2 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |  2 +-
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |  2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |  2 +-
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb  |  2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 .../connman/connman-gnome_0.7.bb              |  2 +-
 .../libnss-mdns/libnss-mdns_0.15.1.bb         |  2 +-
 .../mobile-broadband-provider-info_git.bb     |  2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
 meta/recipes-core/fts/fts_1.2.7.bb            |  2 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |  2 +-
 .../initscripts/init-system-helpers_1.60.bb   |  2 +-
 meta/recipes-core/musl/libucontext_git.bb     |  2 +-
 meta/recipes-core/musl/musl-obstack.bb        |  2 +-
 meta/recipes-core/musl/musl-utils.bb          |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 meta/recipes-core/ncurses/ncurses.inc         |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           |  2 +-
 .../btrfs-tools/btrfs-tools_5.14.2.bb         |  2 +-
 .../createrepo-c/createrepo-c_0.17.7.bb       |  2 +-
 meta/recipes-devtools/distcc/distcc_3.4.bb    |  2 +-
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 .../erofs-utils/erofs-utils_1.3.bb            |  2 +-
 meta/recipes-devtools/file/file_5.41.bb       |  2 +-
 meta/recipes-devtools/glide/glide_0.13.3.bb   |  2 +-
 .../gnu-config/gnu-config_git.bb              |  2 +-
 .../libcomps/libcomps_0.1.18.bb               |  2 +-
 .../librepo/librepo_1.14.2.bb                 |  2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  2 +-
 .../patchelf/patchelf_0.13.bb                 |  2 +-
 .../squashfs-tools/squashfs-tools_git.bb      |  2 +-
 .../systemd-bootchart_234.bb                  |  2 +-
 .../tcf-agent/tcf-agent_git.bb                |  2 +-
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  2 +-
 .../rust-hello-world/rust-hello-world_git.bb  |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
 .../go-examples/go-helloworld_0.1.bb          |  2 +-
 .../iputils/iputils_20210722.bb               |  2 +-
 .../recipes-extended/libaio/libaio_0.3.112.bb |  2 +-
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |  2 +-
 .../libsolv/libsolv_0.7.20.bb                 |  2 +-
 meta/recipes-extended/lsof/lsof_4.94.0.bb     |  2 +-
 meta/recipes-extended/ltp/ltp_20210927.bb     |  2 +-
 .../net-tools/net-tools_2.10.bb               |  2 +-
 meta/recipes-extended/procps/procps_3.3.17.bb |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.4.bb   |  2 +-
 .../rpcsvc-proto/rpcsvc-proto.bb              |  2 +-
 .../stress-ng/stress-ng_0.13.00.bb            |  2 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |  2 +-
 meta/recipes-gnome/libhandy/libhandy_1.4.0.bb |  2 +-
 meta/recipes-gnome/libportal/libportal_0.4.bb |  2 +-
 .../glslang/glslang_11.6.0.bb                 |  2 +-
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  2 +-
 .../libfakekey/libfakekey_git.bb              |  2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |  2 +-
 .../spir/spirv-headers_1.5.4.bb               |  2 +-
 .../spir/spirv-tools_2021.3.bb                |  2 +-
 .../vulkan/vulkan-loader_1.2.191.0.bb         |  2 +-
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 .../vulkan/vulkan-tools_1.2.191.0.bb          |  2 +-
 meta/recipes-graphics/waffle/waffle_1.7.0.bb  |  2 +-
 .../xorg-driver/xf86-video-intel_git.bb       |  2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  2 +-
 meta/recipes-kernel/dtc/dtc.inc               |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod.inc             |  2 +-
 meta/recipes-kernel/powertop/powertop_2.14.bb |  2 +-
 .../systemtap/systemtap_git.inc               |  2 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
 .../matchbox-config-gtk_0.2.bb                |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |  2 +-
 .../matchbox-terminal_0.2.bb                  |  2 +-
 .../matchbox-theme-sato_0.2.bb                |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 .../bmap-tools/bmap-tools_3.6.bb              |  2 +-
 .../boost/boost-build-native_4.4.1.bb         |  2 +-
 .../ca-certificates_20211016.bb               |  2 +-
 .../dos2unix/dos2unix_7.4.2.bb                |  2 +-
 .../gnome-desktop-testing_2021.1.bb           |  2 +-
 .../libjitterentropy_3.3.0.bb                 |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  2 +-
 .../recipes-support/p11-kit/p11-kit_0.24.0.bb |  2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |  2 +-
 .../rng-tools/rng-tools_6.14.bb               |  2 +-
 .../shared-mime-info/shared-mime-info_git.bb  |  2 +-
 meta/recipes-support/vim/vim.inc              |  2 +-
 scripts/contrib/convert-srcuri.py             | 63 +++++++++++++++++++
 101 files changed, 163 insertions(+), 100 deletions(-)
 create mode 100755 scripts/contrib/convert-srcuri.py

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 07b83276fb9..8a27e3a7910 100644
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
index 32ec4b14fa6..fbe90d6c6b9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.upgraded
@@ -10,7 +10,7 @@ DEPENDS = "dbus"
 SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+SRC_URI = "git://git.yoctoproject.org/dbus-wait;branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
index 9429564df43..cc5d7eae5a6 100644
--- a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
+++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test"
+SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test;branch=master"
 SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
diff --git a/meta/classes/devupstream.bbclass b/meta/classes/devupstream.bbclass
index dc9a9472b1c..facc46f3af8 100644
--- a/meta/classes/devupstream.bbclass
+++ b/meta/classes/devupstream.bbclass
@@ -4,7 +4,7 @@
 #
 # Usage:
 # BBCLASSEXTEND = "devupstream:target"
-# SRC_URI:class-devupstream = "git://git.example.com/example"
+# SRC_URI:class-devupstream = "git://git.example.com/example;branch=master"
 # SRCREV:class-devupstream = "abcdef"
 #
 # If the first entry in SRC_URI is a git: URL then S is rewritten to
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 790f2f7a8c4..d9c4b4e5ada 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -657,7 +657,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
 CPAN_MIRROR = "https://search.cpan.org/CPAN"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
-GNOME_GIT = "git://gitlab.gnome.org/GNOME"
+GNOME_GIT = "git://gitlab.gnome.org/GNOME;branch=master"
 GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 9aa91e59c13..be14272e635 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -99,7 +99,7 @@ class Dependencies(OESelftestTestCase):
 
             r = """
             LICENSE="CLOSED"
-            SRC_URI="git://example.com/repo"
+            SRC_URI="git://example.com/repo;branch=master"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 5d6f200a736..e9dfa0770e7 100644
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
index b11f1539a2d..6340020cef0 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index ce14bc48aa5..6906e5362d7 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
 SRCREV = "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index e41a4b50960..5a3fc17ad18 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
 
-SRC_URI = "git://git.denx.de/u-boot.git \
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 55c687968fe..eb6d1f71813 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;branch=master \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
            file://images/ \
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
index e455a60bd5e..cfe474d72e1 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.15.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 
-SRC_URI = "git://github.com/lathiat/nss-mdns \
+SRC_URI = "git://github.com/lathiat/nss-mdns;branch=master \
            "
 
 SRCREV = "4b3cfe818bf72d99a02b8ca8b8813cb2d6b40633"
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 837490f15f8..4246f4dcbd3 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -8,7 +8,7 @@ SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
 PV = "20210805"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 677768d35a3..b39f7523c0d 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index ea820cb0c34..f907a35a909 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 SRCREV = "0bde52df588e8969879a2cae51c3a4774ec62472"
 
-SRC_URI = "git://github.com/pullmoll/musl-fts.git"
+SRC_URI = "git://github.com/pullmoll/musl-fts.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 281df7ecda8..6dac7f0c7a0 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.34"
 SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
 SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index 1d01701b8f5..48a7b8fb135 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -7,7 +7,7 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://99_network \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
index 165f37c070c..46952e46851 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.60.bb
@@ -17,7 +17,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
 SRCREV = "dbd9197569c0935029acd5c9b02b84c68fd937ee"
-SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index d8ae8242c5b..1a8d1c4b210 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -10,7 +10,7 @@ DEPENDS = ""
 
 PV = "1.1+${SRCPV}"
 SRCREV = "335ee864ef6f4a5d4b525453fd9dbfb3507cfecc"
-SRC_URI = "git://github.com/kaniini/libucontext \
+SRC_URI = "git://github.com/kaniini/libucontext;branch=master \
            file://0001-meson-Add-option-to-pass-cpu.patch \
            "
 
diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 3003935fe5a..37480474960 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 
 PV = "1.1"
 SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
-SRC_URI = "git://github.com/pullmoll/musl-obstack"
+SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 4f99d4324f3..fa49d1da04b 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -11,7 +11,7 @@ SECTION = "utils"
 PV = "20170421"
 
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
-SRC_URI = "git://github.com/boltlinux/musl-utils"
+SRC_URI = "git://github.com/boltlinux/musl-utils;branch=master"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 06b0e060d01..a2f96f1dbe2 100644
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
index cbb12ca2757..64cce329aaa 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -13,7 +13,7 @@ BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
-SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https"
+SRC_URI = "git://salsa.debian.org/debian/ncurses.git;protocol=https;branch=master"
 
 EXTRA_AUTORECONF = "-I m4"
 
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 28f385b7ba5..09038266b65 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,7 +10,7 @@ SRCREV = "fdbd111d6bab2fbbae62a041123fc6b644aa97aa"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index da716674c3d..daee5c224b4 100644
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
index c24613b74ef..6ef5298a3bd 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -90,7 +90,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRC_URI = "git://github.com/xrmx/bootchart.git \
+SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
index 3270527b57e..ba4ad0f438d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.14.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "lzo util-linux zlib"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
index 739a2dcf7d9..97405988559 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/rpm-software-management/createrepo_c/wiki"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
+SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index 7adf8a8ff62..c1cce24d115 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS:${PN}-server = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
            file://default \
            file://distcc \
            file://distcc.service \
diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
index b7273d40515..4ad7e21c24d 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.10.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
                     "
 
-SRC_URI = "git://github.com/rpm-software-management/dnf.git \
+SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index bcffa77db9f..a030fa6fa82 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
index d07d5c4360c..77cce2fdafa 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
 SRCREV = "2cd522105ea771ec30b269cd4c57e2265a4d6349"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.41.bb
index 9cc83085d0b..36a9ebd9bf9 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.41.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git;branch=master"
 
 SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index e943dc1762a..1a694458169 100644
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
index 34b425031fd..794e39546c0 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "805517123cbfe33d17c989a18e78c5789fab0437"
 PV = "20210722+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git \
+SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 8fe43ed0c81..94108d3a7fd 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pu
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
+SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master \
            file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.2.bb b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
index e7f8c08e03e..777b4476819 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 057ae806a18..20045723755 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -14,7 +14,7 @@ RDEPENDS:mtd-utils-tests += "bash"
 PV = "2.1.3"
 
 SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.13.bb b/meta/recipes-devtools/patchelf/patchelf_0.13.bb
index 1b0561b8bac..b24c74a1492 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.13.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.13.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPLv3"
 
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
 SRCREV = "a949ff23315bbb5863627c4655fe216ecbf341a2"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index c78f4467114..24ac893d1e7 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.5"
 SRCREV = "0496d7c3de3e09da37ba492081c86159806ebb07"
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
            file://0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch \
            "
 
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index 30dbbcc05ca..71c2ba6d7c0 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
+SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https;branch=master \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
            file://no_lto.patch \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e67eccc75ce..d6d563d8e79 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "2735e3d6b7eccb05ab232825c618c837d27a5010"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 2bc7a9230b5..7a5d2738515 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -14,7 +14,7 @@ DEPENDS:append:class-nativesdk = " flex-nativesdk"
 ASNEEDED = ""
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
+SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
index 3ebd9cc661e..1d91109b51f 100644
--- a/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
@@ -1,6 +1,6 @@
 inherit cargo
 
-SRC_URI = "git://github.com/meta-rust/rust-hello-world.git;protocol=https"
+SRC_URI = "git://github.com/meta-rust/rust-hello-world.git;protocol=https;branch=master"
 SRCREV="e0fa23f1a3cb1eb1407165bd2fc36d2f6e6ad728"
 LIC_FILES_CHKSUM="file://COPYRIGHT;md5=e6b2207ac3740d2d01141c49208c2147"
 
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 296bc68d412..ab630129225 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e
 "
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
-           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index aeff482f3ba..6e2687a0831 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://golang.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://${GO_IMPORT}"
+SRC_URI = "git://${GO_IMPORT};branch=master"
 SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
index e1940b77b5a..c92bc830bc9 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils \
+SRC_URI = "git://github.com/iputils/iputils;branch=master \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
            file://0001-meson-Make-tests-optional.patch \
            "
diff --git a/meta/recipes-extended/libaio/libaio_0.3.112.bb b/meta/recipes-extended/libaio/libaio_0.3.112.bb
index b3606474a54..3892f3244e1 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.112.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.112.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https \
+SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 53be67fe859..6194d901776 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -14,7 +14,7 @@ PV = "2.0.0"
 
 SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
 
-SRC_URI = "git://github.com/thkukuk/libnsl \
+SRC_URI = "git://github.com/thkukuk/libnsl;branch=master \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 34103428e91..bc2e292f40f 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -17,7 +17,7 @@ PV = "3.1+git${SRCPV}"
 
 SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
 
-SRC_URI = "git://github.com/thkukuk/libnss_nis \
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
index d4d65389658..6861def5331 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.20.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master \
 "
 
 SRCREV = "f618e6aae1d44be633b2ab91d4fd4f4f974f4d40"
diff --git a/meta/recipes-extended/lsof/lsof_4.94.0.bb b/meta/recipes-extended/lsof/lsof_4.94.0.bb
index 9659fa8246a..9145c2d8ea2 100644
--- a/meta/recipes-extended/lsof/lsof_4.94.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.94.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
 # the most commonly used alternative.
 
-SRC_URI = "git://github.com/lsof-org/lsof \
+SRC_URI = "git://github.com/lsof-org/lsof;branch=master \
            file://lsof-remove-host-information.patch \
           "
 
diff --git a/meta/recipes-extended/ltp/ltp_20210927.bb b/meta/recipes-extended/ltp/ltp_20210927.bb
index 359a00132e5..534dffdd266 100644
--- a/meta/recipes-extended/ltp/ltp_20210927.bb
+++ b/meta/recipes-extended/ltp/ltp_20210927.bb
@@ -24,7 +24,7 @@ CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "12beeda351b5d758a729aaf695b836ccc9eb5304"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
+SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0002-lib-fix-MemAvailable-parsing.patch \
            file://0003-lapi-rtnetlink.h-Fix-include-guards.patch \
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 00caccd4b80..eb5881356c3 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
 SRCREV = "80d7b95067f1f22fece9537dea6dff53081f4886"
-SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
+SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index 64a2d154b6a..9366ec99aa6 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -12,7 +12,7 @@ DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
+SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://sysctl.conf \
            file://0001-w.c-correct-musl-builds.patch \
            file://0002-proc-escape.c-add-missing-include.patch \
diff --git a/meta/recipes-extended/psmisc/psmisc_23.4.bb b/meta/recipes-extended/psmisc/psmisc_23.4.bb
index 894443f4ef6..89fe8a709c3 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.4.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.4.bb
@@ -2,7 +2,7 @@ require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
 SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index 678632a8142..81bd40bf612 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -19,7 +19,7 @@ PV = "1.4.2"
 
 SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
-SRC_URI = "git://github.com/thkukuk/${BPN} \
+SRC_URI = "git://github.com/thkukuk/${BPN};branch=master \
            file://0001-Use-cross-compiled-rpcgen.patch \
           "
 
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index 5889569e507..f01e7b24334 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index da051c119f9..e64494e54ed 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55c5fdf02cfcca3fc9621b6f2ceae10f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https \
+SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
            file://xinetd.init \
            file://xinetd.default \
            file://xinetd.service \
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
index 39ee2aab861..1f032284e50 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master"
 SRCREV = "f8626427acebfa08b2b4ee1166d51e416d3d7407"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-gnome/libportal/libportal_0.4.bb b/meta/recipes-gnome/libportal/libportal_0.4.bb
index 03e681f58c1..58173026888 100644
--- a/meta/recipes-gnome/libportal/libportal_0.4.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.4.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://github.com/flatpak/libportal/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https"
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
 SRCREV = "f68764e288ede516d902b131cc4fadded3804059"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/glslang/glslang_11.6.0.bb b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
index c39be55d5fa..e2388a1a579 100644
--- a/meta/recipes-graphics/glslang/glslang_11.6.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.6.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
 SRCREV = "2fb89a0072ae7316af1c856f22663fde4928128a"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 7d912e4e4cd..bb2f9564d2e 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -12,7 +12,7 @@ inherit meson pkgconfig
 SRCREV = "203def046b466fb2da67f9f15552d84e1c0b41f2"
 PV = "1.26"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master \
            file://0001-lib-meson.build-fix-meson-0.60-compatibility.patch \
            "
 
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index ab6f5ac9ed2..33ea6fe5a9a 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index 1a31677978c..06bd682823f 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
index 95a0604aeea..f452ea032a3 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 # SRCREV tagged 1.2.2
 SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
            file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 8f8206d15ce..6c978ce51a3 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
 SRCREV = "6cae8216a6ea19ff3f237af01e54378c1ff81fcd"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
diff --git a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
index 62330f285df..d369d3c3906 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2021.3.bb
@@ -8,7 +8,7 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "1fbed83c8aab8517d821fcb4164c08567951938f"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
index 898a7902968..db8d871616e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master \
            "
 SRCREV = "7d7cdaa17bc8c349102cfee1d5062d6b7185c172"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index c5ead194820..4827e3a22c6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
index 5350b6edf18..636877bf26a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master"
 SRCREV = "f4974ccd170cf2338c0582f607af5d8dfc3dac51"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index 846cd0d818c..6284af30760 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=master \
            file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
            "
 SRCREV = "905c6c10f2483adf0cbfa024e2d3c2ed541fb300"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 1d8077a6007..21dc8880ec1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,7 +13,7 @@ SRCREV = "f66d39544bb8339130c96d282a80f87ca1606caf"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
            file://0001-Sync-i915_pciids-upto-8717c6b7414f.patch \
            file://0001-i810-Avoid-duplicate-definition-of-I810PatternROP.patch \
 "
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d00b1bd0bec..b108676df4e 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,7 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ae2c3089119..e4a7922ad17 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -8,7 +8,7 @@ API is compatible with OpenBSD's cryptodev userspace API (/dev/crypto)."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master \
            "
 SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index bfdc9f86399..b8a6b34f0cf 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -5,7 +5,7 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD-2-Clause"
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
            file://make_install.patch \
            file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch \
            "
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e967f485c17..ef035aed238 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -14,7 +14,7 @@ PV = "0.2+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index c2d550acafa..d527887b787 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -19,7 +19,7 @@ SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
 # Lookout for PV bump too when SRCREV is changed
 PV = "29"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
            "
diff --git a/meta/recipes-kernel/powertop/powertop_2.14.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
index 3a7c3ba31eb..b46e5e80415 100644
--- a/meta/recipes-kernel/powertop/powertop_2.14.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -6,7 +6,7 @@ DEPENDS = "ncurses libnl pciutils autoconf-archive"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
+SRC_URI = "git://github.com/fenrus75/powertop;protocol=https;branch=master \
            file://0001-wakeup_xxx.h-include-limits.h.patch \
            file://0001-src-fix-compatibility-with-ncurses-6.3.patch \
            "
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index b6ff98f0f24..25546f7cb2d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "7f6992539fb22c93c21ac30c94508bf655d496a7"
 PV = "4.5"
 
-SRC_URI = "git://sourceware.org/git/systemtap.git \
+SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index f19d03896bb..034e19dc7ae 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git${SRCPV}"
-SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git"
+SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master"
 SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d5fe9b5dcea..8f3151bfc92 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} = "settings-daemon"
 
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index 79ccb0391b0..c85f0440b1a 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 
 # SRCREV tagged 2.2
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index c6de14e34eb..49f9fdbb36c 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -23,7 +23,7 @@ RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
 RCONFLICTS:${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN} \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 9f00281ddec..e2e81c2905d 100644
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
index 7a043d34476..bc4024736f4 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index b2913b4ed5c..7fd9272bf48 100644
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
index 742364f699c..77ecd3fe9fd 100644
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
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
index c830a927760..37cec138427 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/${BPN}"
+SRC_URI = "git://github.com/intel/${BPN};branch=master"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/boost/boost-build-native_4.4.1.bb b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
index 2de05369a82..de566eeb827 100644
--- a/meta/recipes-support/boost/boost-build-native_4.4.1.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.4.1.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
 SRCREV = "76da80f33187a3d9e5336157cdfae12ce82e37eb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+){2,}))"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 0bb192cf0d7..dbee7dc6166 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -16,7 +16,7 @@ PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
 
-SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
index 15d097ebedc..509a0a0ddcb 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
@@ -8,7 +8,7 @@ SECTION = "support"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8a7c3499a1142df819e727253cd53a12"
 
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "72596f0ae21faa25a07a872d4843bc885475115d"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index 10200f539f5..8cd27e9075e 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http \
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http;branch=master \
            file://0001-fix-non-literal-format-string-issue-with-clang.patch \
           "
 SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
index dae2fb1791a..ec6bc057283 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master"
 SRCREV = "418c1e64231255aec2167cbb20aab62a0863415d"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 7b1b14d1d54..66e826304f8 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e
 SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
 PV = "2.0.14"
 
-SRC_URI = "git://github.com/numactl/numactl \
+SRC_URI = "git://github.com/numactl/numactl;branch=master \
            file://Fix-the-test-output-format.patch \
            file://Makefile \
            file://run-ptest \
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
index 9cac87ed324..d8330f460c2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master"
 SRCREV = "34826623f58399b24c21f1788e2cdaea34521b7b"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 23ab48ba2b5..72922d84535 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.14.bb b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
index 6b79a3b040b..72d1e3f3dbd 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.14.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.14.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "sysfsutils openssl"
 
-SRC_URI = "git://github.com/nhorman/rng-tools.git \
+SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master \
            file://init \
            file://default \
            file://rngd.service \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index b2b830cc1f2..2dca36a7df5 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
 SRCREV = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"
 PV = "2.1"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index db1e9caf4d4..616b38b28b9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=a19edd7ec70d573a005d9e509375a99a"
 
-SRC_URI = "git://github.com/vim/vim.git \
+SRC_URI = "git://github.com/vim/vim.git;branch=master \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
diff --git a/scripts/contrib/convert-srcuri.py b/scripts/contrib/convert-srcuri.py
new file mode 100755
index 00000000000..4bf9e3013d3
--- /dev/null
+++ b/scripts/contrib/convert-srcuri.py
@@ -0,0 +1,63 @@
+#!/usr/bin/env python3
+#
+# Conversion script to update SRC_URI to add branch to git urls
+#
+# Copyright (C) 2021 Richard Purdie
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import re
+import os
+import sys
+import tempfile
+import shutil
+import mimetypes
+
+if len(sys.argv) < 2:
+    print("Please specify a directory to run the conversion script against.")
+    sys.exit(1)
+
+def processfile(fn):
+    print("processing file '%s'" % fn)
+    try:
+        fh, abs_path = tempfile.mkstemp()
+        modified = False
+        with os.fdopen(fh, 'w') as new_file:
+            with open(fn, "r") as old_file:
+                for line in old_file:
+                    if ("git://" in line or "gitsm://" in line) and "branch=" not in line and "MIRROR" not in line and ".*" not in line:
+                        if line.endswith('"\n'):
+                            line = line.replace('"\n', ';branch=master"\n')
+                        elif line.endswith(" \\\n"):
+                            line = line.replace(' \\\n', ';branch=master \\\n')
+                        modified = True
+                    new_file.write(line)
+        if modified:
+            shutil.copymode(fn, abs_path)
+            os.remove(fn)
+            shutil.move(abs_path, fn)
+    except UnicodeDecodeError:
+        pass
+
+ourname = os.path.basename(sys.argv[0])
+ourversion = "0.1"
+
+if os.path.isfile(sys.argv[1]):
+    processfile(sys.argv[1])
+    sys.exit(0)
+
+for targetdir in sys.argv[1:]:
+    print("processing directory '%s'" % targetdir)
+    for root, dirs, files in os.walk(targetdir):
+        for name in files:
+            if name == ourname:
+                continue
+            fn = os.path.join(root, name)
+            if os.path.islink(fn):
+                continue
+            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
+                continue
+            processfile(fn)
+
+print("All files processed with version %s" % ourversion)
-- 
2.32.0


