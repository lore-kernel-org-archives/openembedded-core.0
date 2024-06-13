Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E6C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 20:21:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.2756.1718310118126269807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 13:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIHtFppy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35f0aeff7a8so1248110f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 13:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718310116; x=1718914916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmT+970PNrE89LEuRYLTC3gdQ46EFK2iG8AkmBDhWfc=;
        b=FIHtFppyNjrNKxykka9b7ZAOn5xDX3UjMLoRMAciZSiiaum6rteeVOuoNzF72i0Ucr
         8ghzTm7dnDIeYMs+vDAEKl1gbKqmCie23r6hLQDDfAIiXi1nTOMFSzvYuRdngBjKrUr3
         6uXus5bkK8dyG6xw3tm0OlLM1s6iboTm7LK28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718310116; x=1718914916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmT+970PNrE89LEuRYLTC3gdQ46EFK2iG8AkmBDhWfc=;
        b=mhZ5uukKKwTIsIGO8lsK3WvBfHEfEe8RX082SQXPVrPzrSjpA05nJ40BjuofesSuMt
         zE9D0YwJkUxiNHaUll2cE2FF+/Z21BxUaGZshIXH6D957JQwsdMoArVBZdqPcByzzeDT
         Bb0NJwesd8KjQCx7kXrWoqkARft2pgr0IQGRDMxmnMSaZBYOFsgGcP4fci/qKwAYhzXx
         zbHByXp4jeB95P3PqyR5ZYV8CGUj2v2TqahSvLFJoxBXkbmbI3zonc7dRVt9ZRSF/ljG
         jvsiAil3FBo2XyO9hObBZdslVLc2xi3TzqV/q12JAbxl9LvHwUh9ujm7eyFWMYiOK7QT
         SP/g==
X-Gm-Message-State: AOJu0YykH3n2RfaxFM7ZtdkzmmbV7vZPsMk/OSh5BUX1LXx21vv9tquK
	nGd1LNrhaqEQOY2lASMhNxvftn/82q+mcbOBtyFBsH0VPw+dN7ps6D8F0Y2UUQv2tlE20twM5GS
	e
X-Google-Smtp-Source: AGHT+IEmL9DznhTNB+dDbdnmVvYoA4xpjM7XD/FT9gV83PqsgMH+2AxAVRoVkfQBIe6OC+6oARjp2A==
X-Received: by 2002:a5d:6051:0:b0:35f:20d9:5bcc with SMTP id ffacd0b85a97d-3607a7e2102mr471622f8f.52.1718310115607;
        Thu, 13 Jun 2024 13:21:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6937:7920:d:ef6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f2271sm2579805f8f.85.2024.06.13.13.21.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:21:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] native/nativesdk: Stop overriding unprefixed *FLAGS variables
Date: Thu, 13 Jun 2024 21:21:52 +0100
Message-ID: <20240613202152.1032014-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 20:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200637

We're currently encouraging an "arms race" with the FLAGS variables since
a recipe might want to set a specific flag for all variants but to do so,
+= won't work due to the assignment in the native/nativesdk class files. This
means recipes are using append.

Since the default variables are constructed out of TARGET_XXX variables and
we redefine these, there is no need to re-define the un-prefixed variables. If
we drop that, the += appends and similar work and recipes don't have to resort
to append.

Change the classes and cleanup a number of recipes to adapt to the change. This
change will result in some flags appearing to some native/nativesdk variants
but that is probably what was originally expected anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass                     | 5 -----
 meta/classes-recipe/nativesdk.bbclass                  | 5 -----
 meta/recipes-connectivity/bind/bind_9.18.27.bb         | 2 +-
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb | 2 +-
 meta/recipes-core/systemd/systemd-boot_255.6.bb        | 4 ++--
 meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb   | 2 +-
 meta/recipes-devtools/python/python3-maturin_1.6.0.bb  | 2 +-
 meta/recipes-devtools/python/python3_3.12.4.bb         | 2 +-
 meta/recipes-devtools/qemu/qemu-native.inc             | 2 +-
 meta/recipes-devtools/rust/libstd-rs_1.75.0.bb         | 2 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb              | 2 +-
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb   | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb             | 2 +-
 meta/recipes-extended/ltp/ltp_20240524.bb              | 4 ++--
 meta/recipes-extended/pam/libpam_1.6.1.bb              | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.14.4.bb                 | 2 +-
 meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb         | 2 +-
 meta/recipes-kernel/powertop/powertop_2.15.bb          | 2 +-
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc        | 2 +-
 meta/recipes-support/sqlite/sqlite3.inc                | 6 +++---
 20 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 84a3ec65da0..d9651a7f22d 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -40,11 +40,6 @@ HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_LD_ARCH = "${BUILD_LD_ARCH}"
 HOST_AS_ARCH = "${BUILD_AS_ARCH}"
 
-CPPFLAGS = "${BUILD_CPPFLAGS}"
-CFLAGS = "${BUILD_CFLAGS}"
-CXXFLAGS = "${BUILD_CXXFLAGS}"
-LDFLAGS = "${BUILD_LDFLAGS}"
-
 STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
 STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
 
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index de6debda93c..b0634de5829 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -66,11 +66,6 @@ TARGET_FPU = ""
 EXTRA_OECONF_GCC_FLOAT = ""
 TUNE_FEATURES = ""
 
-CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
-CFLAGS = "${BUILDSDK_CFLAGS}"
-CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
-LDFLAGS = "${BUILDSDK_LDFLAGS}"
-
 # Change to place files in SDKPATH
 base_prefix = "${SDKPATHNATIVE}"
 prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
diff --git a/meta/recipes-connectivity/bind/bind_9.18.27.bb b/meta/recipes-connectivity/bind/bind_9.18.27.bb
index 98b8bb5513a..0d22bace6f3 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.27.bb
@@ -44,7 +44,7 @@ EXTRA_OECONF = " --disable-auto-validation \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
-LDFLAGS:append = " -lz"
+LDFLAGS += "-lz"
 
 # dhcp needs .la so keep them
 REMOVE_LIBTOOL_LA = "0"
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index af7a74a5fb0..9aa8bc4eabf 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -62,7 +62,7 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
                "
 
-LDFLAGS:append = " -lsqlite3 -levent"
+LDFLAGS += "-lsqlite3 -levent"
 
 PACKAGECONFIG ??= "tcp-wrappers \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
diff --git a/meta/recipes-core/systemd/systemd-boot_255.6.bb b/meta/recipes-core/systemd/systemd-boot_255.6.bb
index 4ee25ee72f8..9a6d8e9d6e3 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.6.bb
@@ -8,10 +8,10 @@ DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native
 inherit meson pkgconfig gettext
 inherit deploy
 
-LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
+LDFLAGS =+ "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
-LDFLAGS:append = " -fuse-ld=${EFI_LD}"
+LDFLAGS += "-fuse-ld=${EFI_LD}"
 
 do_write_config[vardeps] += "EFI_LD"
 do_write_config:append() {
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
index deb5cbdee3d..9bed5ee148e 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "python3-cffi-native"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
 SRC_URI[sha256sum] = "2ee15dd749f5952fe3f0430d0ff6b74082e159c50332a1413d51b5689cf06623"
 
diff --git a/meta/recipes-devtools/python/python3-maturin_1.6.0.bb b/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
index 1d62671bb90..ea8cf468ff0 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.6.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "b955025c24c8babc808db49e0ff90db8b4b1320dcc16b14eb261328417
 
 S = "${WORKDIR}/maturin-${PV}"
 
-CFLAGS:append = " -fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
 DEPENDS += "\
     python3-setuptools-rust-native \
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 64cd5d0bc07..901f88b079e 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -118,7 +118,7 @@ ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', '_tkinter', d)}
 EOF
 }
 
-CPPFLAGS:append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
+CPPFLAGS += "-I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 
 # COMPILEALL_OPTS= ensures that .pyc are not compiled in parallel
 # This was found to lock up builds, break reproducibility, and produce strange file ownership
diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index 891dc5e2a10..d074d7d1818 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -4,4 +4,4 @@ inherit_defer native
 
 EXTRA_OEMAKE:append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
-LDFLAGS:append = " -fuse-ld=bfd"
+LDFLAGS += "-fuse-ld=bfd"
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
index d2bf266f9dd..5fc6fb97bb2 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
@@ -50,4 +50,4 @@ BBCLASSEXTEND = "nativesdk"
 # Since 1.70.0 upgrade this fails to build with gold:
 # http://errors.yoctoproject.org/Errors/Details/708194/
 # ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index c66c14cc5a5..bb10c852b4d 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -365,4 +365,4 @@ BBCLASSEXTEND = "native nativesdk"
 # Since 1.70.0 upgrade this fails to build with gold:
 # http://errors.yoctoproject.org/Errors/Details/708196/
 # ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index c8e7f25d2b0..d75aa95c1fd 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -48,7 +48,7 @@ TARGET_LDFLAGS = ""
 SECURITY_LDFLAGS = ""
 LDFLAGS_SECTION_REMOVAL = ""
 
-CFLAGS:append = " -DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration"
+CFLAGS += "-DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration"
 
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 7d7ab3856b4..adb6ded5812 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -36,7 +36,7 @@ UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
 
 PACKAGES =+ "libbz2"
 
-CFLAGS:append = " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
+CFLAGS += "-fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OFFSET_BITS=64"
 
 inherit autotools update-alternatives ptest relative_symlinks
 
diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-extended/ltp/ltp_20240524.bb
index 7105154712f..6b46723478d 100644
--- a/meta/recipes-extended/ltp/ltp_20240524.bb
+++ b/meta/recipes-extended/ltp/ltp_20240524.bb
@@ -39,8 +39,8 @@ inherit autotools-brokensep pkgconfig
 # SORT_NONE in linker script which isn't supported by gold:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=bfd', '', d)}"
 
 # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
index 9f2106ea730..b9ef564f564 100644
--- a/meta/recipes-extended/pam/libpam_1.6.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.6.1.bb
@@ -37,7 +37,7 @@ EXTRA_OECONF = "--includedir=${includedir}/security \
                 --disable-doc \
 		--disable-prelude"
 
-CFLAGS:append = " -fPIC "
+CFLAGS += "-fPIC "
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
index cda0552f7cf..fdeb5eb1ec7 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
@@ -78,7 +78,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled, vulkan-loader vulka
 
 # Disable int-conversion warning as error until [1] is fixed
 # [1] https://gitlab.gnome.org/GNOME/gtk/-/issues/6033
-CFLAGS:append = " -Wno-error=int-conversion"
+CFLAGS += "-Wno-error=int-conversion"
 
 LIBV = "4.0.0"
 
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index d6c75d75801..a50ba8fcdf1 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -28,7 +28,7 @@ FILES:${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
 FILES:${PN} += "${libdir}/babeltrace2/plugins/*.so"
 
 ASNEEDED = ""
-LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', '-fuse-ld=bfd ', '', d)}"
 
 # coreutils since we need full mktemp
 RDEPENDS:${PN}-ptest += "bash gawk python3 make grep coreutils findutils"
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-kernel/powertop/powertop_2.15.bb
index 65c6d0fcd37..ec81d546a86 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -13,7 +13,7 @@ SRCREV = "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
 
 S = "${WORKDIR}/git"
 
-LDFLAGS:append = " -pthread"
+LDFLAGS += "-pthread"
 
 inherit autotools gettext pkgconfig bash-completion
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 95cc140e9ea..5193eebb0bc 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -19,7 +19,7 @@ PROVIDES = "virtual/x-terminal-emulator"
 ALTERNATIVE:${PN} = "x-terminal-emulator"
 ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
 
-CFLAGS:append = " -fpermissive"
+CFLAGS += "-fpermissive"
 
 EXTRA_OECONF = "--enable-xim \
 		--with-term=rxvt --enable-keepscrolling \
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 9a0de085533..d093ec5859e 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -45,14 +45,14 @@ EXTRA_OECONF = " \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
-CFLAGS:append = " -DUSE_PREAD"
+CFLAGS += "-DUSE_PREAD"
 
 # Provide column meta-data API
-CFLAGS:append = " -DSQLITE_ENABLE_COLUMN_METADATA"
+CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 
 # Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
 # huristics, which are not always correct
-CFLAGS:append = " ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
+CFLAGS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 

