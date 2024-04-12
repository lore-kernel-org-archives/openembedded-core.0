Return-Path: <nayakksanjay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F334C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 06:05:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.40458.1712901945449182546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 23:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=muQlmVWC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: nayakksanjay@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ecec796323so616418b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 23:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712901945; x=1713506745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvjSQmmX/vYim8R3sGLTaRxL23act0JnnZCD5BnnYq0=;
        b=muQlmVWCKGkJRG2qddqDw/7aERGrVzcWztwZUqkXUV67zDEE+dAmNHE6thebaQsqTs
         cub2fnrYqvdVTcdMC+KPAvDTtRHIPvsK5r+B4/N+yybYqbkctG7vT0JViqqE9iTCN8QW
         l87YYXpDTJ4c9kiIi000XNNGVSQDj7Zbanq2KWBlqbTOumVO09locfeS8jy9EedxHWE3
         bfQlxbTOTS8Zm/G0GhDcpO0o++/jtkgWkCDd5kZbn3eZHUtNY2Iji6ldxhrIu3HjO2oj
         Y17QHXnCNDJd4Q2X+GOUNBqQR3Dv+kF/+eTP45yvAFclXjKe3hZUJh+5Jlpcpq9rcb9v
         HHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712901945; x=1713506745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvjSQmmX/vYim8R3sGLTaRxL23act0JnnZCD5BnnYq0=;
        b=fyb3tErw08Be7OlkSRzAzbEJlranQXGkX3DU6GGDfM8rKcr5DyLNctPEM46W5GBC4Q
         erNtfcb1nRAFVN91v3NmJLKEMtTHKLrYxu9LewYls8BZa/6z2uiZDFMlmqagRhG0H9kb
         4EujFmuueEhZ816auSCNjznr5+vGt0MG6tIGBoK5yQa/yjCyQiSiSlAFKtO3ppwB7K9B
         mu0hQYWKzQkjcNRBOa03LQXzTPHsWPNVzmkVfFQilJD3mVAX7HJArQWNFdr9Md/HgbA5
         3YORWHyB9VsqEMu8rJW+Gs+lY49N2Gp2OhUZh+gYCpmRExCDGs9BfLejGf0BIlHAgW8X
         zAGg==
X-Gm-Message-State: AOJu0YxuUMNHXvpec9IVb7R/uRsaENQYCacQgtvWyHckLsUduWOXtmEX
	VAT6b/6Si5Cfd+t3Cj8wSFt8wnpFr1OYf/FYpT6LqXWSy4ZmKn5dTe2QSA==
X-Google-Smtp-Source: AGHT+IELKodyisg/pc9BKIktaygH6w86puSSi232+Lj8TCO0H9nvfHMMkmJOuBNnTU+oCSp65EUWbg==
X-Received: by 2002:a05:6a00:a8c:b0:6ec:f28b:659f with SMTP id b12-20020a056a000a8c00b006ecf28b659fmr1881494pfl.3.1712901944476;
        Thu, 11 Apr 2024 23:05:44 -0700 (PDT)
Received: from ubuntu.lan ([2409:40f2:2093:e4df:e6fc:aa01:76ba:88cc])
        by smtp.gmail.com with ESMTPSA id g5-20020a056a0023c500b006e6be006637sm2133066pfc.135.2024.04.11.23.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:05:44 -0700 (PDT)
From: K Sanjay Nayak <nayakksanjay@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: K Sanjay Nayak <nayakksanjay@gmail.com>
Subject: [PATCH] Replaced :append with += in multiple recipe files under meta layer.
Date: Fri, 12 Apr 2024 11:35:36 +0530
Message-Id: <20240412060536.34983-1-nayakksanjay@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 06:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198154

Fixes [YOCTO #2951]

Conditional operator is preferred over the append operation,
hence modified multiple recipes under the meta-layer.

Reported-by : Christopher Larson <kergoth@gmail.com>
Signed-off-by: K Sanjay Nayak <nayakksanjay@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb                          | 2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb                | 2 +-
 meta/recipes-core/sysvinit/sysvinit_3.04.bb                     | 2 +-
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 meta/recipes-extended/less/less_643.bb                          | 2 +-
 meta/recipes-gnome/librsvg/librsvg_2.57.1.bb                    | 2 +-
 meta/recipes-graphics/waffle/waffle_1.7.2.bb                    | 2 +-
 meta/recipes-support/libgpg-error/libgpg-error_1.48.bb          | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb         | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 9857e8e036..4cd1c696f4 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -4,7 +4,7 @@ require conf/image-uefi.conf
 
 GRUBPLATFORM = "efi"
 
-DEPENDS:append = " grub-native"
+DEPENDS += " grub-native"
 RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
 
 SRC_URI += " \
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e61ac554f3..2ad4d0b0b0 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -42,7 +42,7 @@ SRC_URI:append:armeb = " file://alignment.sh"
 
 KERNEL_VERSION = ""
 
-DEPENDS:append = " update-rc.d-native"
+DEPENDS += " update-rc.d-native"
 PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
index 6a612468f3..2dee7bc3ce 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2
 S = "${WORKDIR}/sysvinit-${PV}"
 
 inherit update-alternatives features_check
-DEPENDS:append = " update-rc.d-native base-passwd virtual/crypt"
+DEPENDS += " update-rc.d-native base-passwd virtual/crypt"
 do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
 
 PACKAGECONFIG[psplash-text-updates] = ",,"
diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 6832ccc541..f66581cca3 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -25,7 +25,7 @@ inherit baremetal-image
 
 
 # startup code for x86 uses NASM syntax
-DEPENDS:qemux86:append = " nasm-native"
+DEPENDS:qemux86 += " nasm-native"
 
 # These parameters are app specific for this example
 # This will be translated automatically to the architecture and
diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_643.bb
index 67834bdd58..5c17571768 100644
--- a/meta/recipes-extended/less/less_643.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -55,7 +55,7 @@ do_install_ptest () {
         cp -r ${S}/lesstest/lt ${D}${PTEST_PATH}
 }
 
-RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd locale-base-en-us"
+RDEPENDS:${PN}-ptest += " perl-module-getopt-std perl-module-cwd locale-base-en-us"
 
 ALTERNATIVE:${PN} = "less"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
index 4b52d4062b..b774fe8c47 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
@@ -30,7 +30,7 @@ UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
 # for cargo to be happy
-BASEDEPENDS:append = " cargo-native"
+BASEDEPENDS += " cargo-native"
 
 export RUST_BACKTRACE = "full"
 export RUSTFLAGS
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.2.bb b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
index cb917d8894..84f2f70ab2 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-DEPENDS:append = " python3"
+DEPENDS += " python3"
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
index 9f2b49209d..b268d5b9c1 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
@@ -26,7 +26,7 @@ BINCONFIG = "${bindir}/gpg-error-config"
 
 inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
 
-RDEPENDS:${PN}-ptest:append = " make bash"
+RDEPENDS:${PN}-ptest += " make bash"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
 
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
index e6668da01f..30838cb3a6 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
@@ -31,7 +31,7 @@ do_install () {
 RDEPENDS:${PN}:append:libc-glibc = " libgcc"
 
 # pstree is called by ptest-runner-collect-system-data
-RDEPENDS:${PN}:append = " pstree"
+RDEPENDS:${PN} += " pstree"
 
 # Create a non-root user that test suites can use easily
 inherit useradd
-- 
2.34.1


