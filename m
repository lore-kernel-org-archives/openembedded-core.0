Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFECC4707B
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:59:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.19137.1704293947965177722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ikWalsYT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d87df95ddso26425425e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704293946; x=1704898746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x75EaXrjPfK8hd7DeKGciPlMXjT5CA65ckh+rvJZe+0=;
        b=ikWalsYTLJaabMLMykE1FSmAj4oVq33wdtb1Nr5ds1lpMwhmJKlWxsPpl5Z2r8hIIq
         wLIa/n6c0S7fDwkZfSR98RoIoTiCWjOjwb2EmvaKfrEFE1bAVzFiGCz4VScpBlDrjkKZ
         gCAGYZectfmgaW4gitQB1oOPurNjJ++tXW1bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293946; x=1704898746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x75EaXrjPfK8hd7DeKGciPlMXjT5CA65ckh+rvJZe+0=;
        b=XJhFKtcnx3jGS5bLRJ8IwsYhNFotynsziJoKdYh6Ns3abIhEBoSXLxfvsAk4qdXmyG
         vxXurb6M4JjYljFg+W3chTDw5S3jXJG1+abmzMFGcwQWeUo9WIsCvx6d7WK+Mzgak/nG
         R/1ZTQabz7eVzYg34FrljcDVAGwQH2Z7I5Tfa2dJgV3M7e1K0o7A0jNmO8Ya5Iq99lsf
         K4z2kbr2KB8hNi6hbt14yxtrqumY8NNzf8FN/SBiJneEuv+9rvAuZ2Rh66EQDDkMuITI
         ubhfbSSudlBXV5BYYKRlYWeppbdaDlt7XFhPITGJfQobf41iThI2/gLwDZIinbCFm5bs
         hlcQ==
X-Gm-Message-State: AOJu0Yxv3JSpsfys4WjnqSOOkxbhaAqV4qxO4HyCKpKLV9g+jf726zP8
	O4aZRzL2IAeoqa2xSAnwtWDb5WbQ7aeggBxWjyHY8NsG54s=
X-Google-Smtp-Source: AGHT+IH9CgiGnivSLIYs5Bo0E3pEk3vZEyUKw4w1OkH/o6iYC/xAV5S4FuuagFo1kcL49tsXR/FQog==
X-Received: by 2002:a7b:c84b:0:b0:40c:da89:75ec with SMTP id c11-20020a7bc84b000000b0040cda8975ecmr5388874wml.344.1704293946239;
        Wed, 03 Jan 2024 06:59:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a0e2:8719:e940:13c9])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d4612000000b003367bb8898dsm30992081wrq.66.2024.01.03.06.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] classes/recipes: Switch to use inherit_defer
Date: Wed,  3 Jan 2024 14:59:02 +0000
Message-Id: <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 14:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193291

Now that bitbake supports the use of inherit_defer, switch all conditional
(variable based) inherits to use this instead. This leads to more a more
deterministic user experience since there is no longer an immediate expansion
and later changes to the variables in question (e.g. a bbappend) are
accounted for.

This patch tries to ensure the behaviour before/after remains as unchanged
as it reasonably can, e.g. by always inherting populate_sdk_base. native
and nativesdk continue to need to be inherited last, hence being used
with inherit_defer in a handful of very specific cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb  | 2 +-
 meta/classes-recipe/baremetal-image.bbclass                  | 2 +-
 meta/classes-recipe/gnomebase.bbclass                        | 2 +-
 meta/classes-recipe/image.bbclass                            | 5 +++--
 meta/classes-recipe/image_types_wic.bbclass                  | 2 +-
 meta/classes-recipe/kernel.bbclass                           | 2 +-
 meta/classes-recipe/live-vm-common.bbclass                   | 4 ++--
 meta/classes-recipe/packagegroup.bbclass                     | 2 +-
 meta/classes-recipe/populate_sdk_base.bbclass                | 2 +-
 meta/classes/useradd.bbclass                                 | 2 +-
 meta/recipes-core/libxml/libxml2_2.11.5.bb                   | 2 +-
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb         | 3 ++-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb       | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc     | 2 +-
 meta/recipes-kernel/perf/perf.bb                             | 2 +-
 meta/recipes-kernel/systemtap/systemtap-native_git.bb        | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb               | 2 +-
 meta/recipes-support/gpgme/gpgme_1.23.2.bb                   | 3 ++-
 18 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
index 50cba9514bf..88c8998cf9e 100644
--- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
 
-inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
+inherit_defer ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
 include test_recipe.inc
 
 OVERLAYFS_WRITABLE_PATHS[mnt-overlay] += "/usr/share/my-application"
diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index 70791f999ac..b9a584351a1 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -110,7 +110,7 @@ CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
 # Handle inherits of any of the image classes we need
 IMAGE_CLASSES ??= ""
 IMGCLASSES = " ${IMAGE_CLASSES}"
-inherit ${IMGCLASSES}
+inherit_defer ${IMGCLASSES}
 # Set defaults to satisfy IMAGE_FEATURES check
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gnomebase.bbclass
index a12e9f31a95..09abb039909 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -28,7 +28,7 @@ FILES:${PN} += "${datadir}/application-registry  \
 FILES:${PN}-doc += "${datadir}/devhelp"
 
 GNOMEBASEBUILDCLASS ??= "meson"
-inherit ${GNOMEBASEBUILDCLASS} pkgconfig
+inherit_defer ${GNOMEBASEBUILDCLASS} pkgconfig
 
 do_install:append() {
 	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 6bdddc0134c..28be6c63623 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -14,14 +14,15 @@ ROOTFS_BOOTSTRAP_INSTALL = "run-postinsts"
 IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
 # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
 # in the non-Linux SDK_OS case, such as mingw32
-IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
+inherit populate_sdk_base
+IMGCLASSES += "${@['', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
 IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
 IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
 IMGCLASSES += "image_types_wic"
 IMGCLASSES += "rootfs-postcommands"
 IMGCLASSES += "image-postinst-intercepts"
 IMGCLASSES += "overlayfs-etc"
-inherit ${IMGCLASSES}
+inherit_defer ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 669606da75a..00620fdc9d1 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -38,7 +38,7 @@ WICVARS ?= "\
 	TARGET_SYS \
 "
 
-inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
+inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9ff37f5c38c..a76aaee5bac 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -171,7 +171,7 @@ set -e
 # image types.
 
 KERNEL_CLASSES ?= " kernel-uimage "
-inherit ${KERNEL_CLASSES}
+inherit_defer ${KERNEL_CLASSES}
 
 # Old style kernels may set ${S} = ${WORKDIR}/git for example
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
diff --git a/meta/classes-recipe/live-vm-common.bbclass b/meta/classes-recipe/live-vm-common.bbclass
index b619f3a4be0..d90cc67ebc3 100644
--- a/meta/classes-recipe/live-vm-common.bbclass
+++ b/meta/classes-recipe/live-vm-common.bbclass
@@ -68,8 +68,8 @@ efi_hddimg_populate() {
 	efi_populate $1
 }
 
-inherit ${EFI_CLASS}
-inherit ${PCBIOS_CLASS}
+inherit_defer ${EFI_CLASS}
+inherit_defer ${PCBIOS_CLASS}
 
 populate_kernel() {
 	dest=$1
diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-recipe/packagegroup.bbclass
index c2db6649045..cf6fc354a81 100644
--- a/meta/classes-recipe/packagegroup.bbclass
+++ b/meta/classes-recipe/packagegroup.bbclass
@@ -22,7 +22,7 @@ PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 
 LICENSE ?= "MIT"
 
-inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all', 'allarch', '')}
+inherit_defer ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED') == 'all', 'allarch', '')}
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8fadfef9422..81896d808f5 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -37,7 +37,7 @@ SDK_PACKAGE_ARCHS += "sdk-provides-dummy-${SDKPKGSUFFIX}"
 # List of locales to install, or "all" for all of them, or unset for none.
 SDKIMAGE_LINGUAS ?= "all"
 
-inherit rootfs_${IMAGE_PKGTYPE}
+inherit_defer rootfs_${IMAGE_PKGTYPE}
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0997b3da7a5..cb809b5dd74 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -268,4 +268,4 @@ fakeroot python populate_packages:prepend () {
 # Use the following to extend the useradd with custom functions
 USERADDEXTENSION ?= ""
 
-inherit ${USERADDEXTENSION}
+inherit_defer ${USERADDEXTENSION}
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.11.5.bb
index 319833f053e..44336c25e1c 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
 LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
 
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 11e31dcba3b..c1d3c250605 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -4,7 +4,8 @@
 
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
 
-inherit packagegroup nativesdk
+inherit packagegroup
+inherit_defer nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
index 873d5e7a14b..6455efd1bca 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.5.3.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG[crypto-libsodium] = "--with-crypto=libsodium,,libsodium"
 PACKAGECONFIG[crypto-libkcapi] = "--with-crypto=libkcapi,,libkcapi"
 
 inherit autotools-brokensep pkgconfig manpages
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3-base', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3-base', '', d)}
 
 CLEANBROKEN = "1"
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 8b3f19426bc..f3744922c0c 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -14,7 +14,7 @@ SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}${XORG_DRIVER_COMPRESSOR
 FILES:${PN} += " ${libdir}/xorg/modules/drivers/*.so"
 
 XORGBUILDCLASS ??= "autotools"
-inherit ${XORGBUILDCLASS} pkgconfig features_check
+inherit_defer ${XORGBUILDCLASS} pkgconfig features_check
 
 # depends on virtual/xserver
 REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 32882afdf4e..4f26813de02 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -54,7 +54,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
index 19cc1cf0f0a..2690b259c8b 100644
--- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
@@ -1,6 +1,6 @@
 
 require systemtap_git.bb
 
-inherit native
+inherit_defer native
 
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 0a1349e1280..68f5c764282 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod"
 
 inherit autotools gettext pkgconfig systemd
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
 # | ../git/elaborate.cxx:2601:21: error: storing the address of local variable 'sym' in '*s.systemtap_session::symbol_resolver' [-Werror=dangling-pointer=]
 CXXFLAGS += "-Wno-dangling-pointer"
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
index b29c182f365..d8807b3af26 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -54,7 +54,8 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-g13-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} python3native multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
+inherit_defer ${PYTHON_INHERIT} python3native
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.39.2


