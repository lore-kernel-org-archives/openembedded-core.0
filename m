Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87EDC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:49:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.42780.1738853354773710070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CXWCh8sH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38daf14018eso744336f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 06:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738853353; x=1739458153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ3XIeCBYQMmZX4mcH/tsdHjfkzGGdnXiKU6nUCYPro=;
        b=CXWCh8sHmIBMdVOZGq28QrFa/qCDOfzG/BlGzzvtwW9tyxPK72eazG2u2jjMI96PaF
         hLhfnH36Gypqd+c3QM4Dnn/Qq9MOva8G1Z1ZksjKn+kDD2cpMjsFkpwv3ZieiFZLGBdP
         OJGuoOQYg6W4shtpS4TKXRYFPlGmAr0SrYP1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853353; x=1739458153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ3XIeCBYQMmZX4mcH/tsdHjfkzGGdnXiKU6nUCYPro=;
        b=GQzv7KhtiUZnU4eo8V1MUlsHc/aheuZ0YZrfLGlpxzeqjOQUpjdCdfl2ISvdsYJPTn
         ii7jew9nbpAilogKVWNPyaIONwO59sPrVu6+f44BmBLZGDbbaFsRaq8aBiNFhK4NUtlz
         AAjoia+ytO0LVJ53ScVIhen4pzxiQBn2vfFqe5P/V8jiSyZ8b2yH/RMqe0/2MFME0xQn
         gjY48sbhzLjq3F/6sN/MUYe2YmB0o7Wiz3J1LyMoAJnxGCEa1sWcNWTRDoKzUvSY1bmB
         8nldfP9RdgDJAqEuulihI3pjWwHCwpz5shO4N5/efa5pZOJFOJ4OHBm6ZkPm6ocGnLCE
         itZA==
X-Gm-Message-State: AOJu0YwPKNKch2SIMeb5mYDIGNOS3YdGZGOgSu9tRN2i6LYo09pS2Dod
	xbYFw+I+N2tIvlNHHc8VaRDZbaAPikh/bUJccNCGQvnLtDYZVv0LH6t18tCmY6FWjcpzB+GSOk8
	F
X-Gm-Gg: ASbGncsfsuKrv45KCmkpW1+s7Fw79RrFFyzHeAirnpeGNK1WaFNh7VHB7H6xhBnTq0f
	HM9QRiLGV6aBBqMBCVftKddq7eBoHEkaZJpL23gAPqDEGPh9368IW/YEu8DBPrNdc+5YXjTT5RT
	00Uqslbc4e69/g8SO4kHfOlu8qJ09O4IF1+4ii7roYf3krunk07k5aYW6w3YvJ6BVJU92QzR5uV
	1ZwWPwCWsaeoQYq8Awi13Oi4Q2u2DMxgV2A70rYGHOq5CaK/dZoX5WVfsZFwkg8nPtfIXBKN18G
	C8uQ3Zc1IRGPCtwF2cwd5fZlCcUxDe8D1ohf+roq9NYi
X-Google-Smtp-Source: AGHT+IHQM+Rbsq01O3wUJtEjU72KLrX6EQD8nGqwebxQvDMBMDpfMzhUZPIcSLL+TP+fruW25+1+7w==
X-Received: by 2002:a5d:64a1:0:b0:386:42a6:21f2 with SMTP id ffacd0b85a97d-38db48b42d5mr6136536f8f.10.1738853352482;
        Thu, 06 Feb 2025 06:49:12 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b5a2:dd41:ad93:d97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93374csm59784645e9.8.2025.02.06.06.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:49:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: Drop ld-is-gold support
Date: Thu,  6 Feb 2025 14:49:11 +0000
Message-ID: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210940

Gold hasn't seen development in some time and is being dropped from binutils
releases. Drop the small number of special cases for it we were carrying.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc            |  6 +-----
 meta/recipes-devtools/binutils/binutils.inc   | 20 +------------------
 .../recipes-devtools/rust/libstd-rs_1.81.0.bb |  5 -----
 meta/recipes-devtools/rust/rust_1.81.0.bb     |  5 -----
 meta/recipes-extended/ltp/ltp_20240930.bb     |  9 ++++-----
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb  |  4 ----
 meta/recipes-sato/webkit/webkitgtk_2.46.5.bb  |  9 +++------
 .../libunwind/libunwind_1.6.2.bb              |  2 +-
 8 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3270c22e8d4..9464736b841 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -10,7 +10,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kerne
 DEPENDS += "swig-native"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} V=1'
-EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)} ${DEBUG_PREFIX_MAP}"'
+EXTRA_OEMAKE += 'CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}"'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
 EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
 
@@ -35,10 +35,6 @@ require u-boot-configure.inc
 
 UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"
 do_compile () {
-    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-        sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
-    fi
-
     unset LDFLAGS
     unset CFLAGS
     unset CPPFLAGS
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 81443105f69..00b13012585 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -56,12 +56,6 @@ GPROFNG_ALTS:x86 = "${GPROFNGS}"
 GPROFNG_ALTS:x86-64 = "${GPROFNGS}"
 GPROFNG_ALTS:aarch64 = "${GPROFNGS}"
 
-LDGOLD_ALTS ?= "ld.gold dwp"
-LDGOLD_ALTS:riscv64 = ""
-LDGOLD_ALTS:riscv32 = ""
-LDGOLD_ALTS:loongarch64 = ""
-LDGOLD_ALTS:libc-glibc:mipsarch = ""
-
 USE_ALTERNATIVES_FOR = " \
 	addr2line \
 	ar \
@@ -72,7 +66,6 @@ USE_ALTERNATIVES_FOR = " \
 	${GPROFNG_ALTS} \
 	ld \
 	ld.bfd \
-	${LDGOLD_ALTS} \
 	nm \
 	objcopy \
 	objdump \
@@ -104,7 +97,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-libdecnumber \
                 --disable-readline \
                 --disable-sim \
-                ${LDGOLD} \
+                --disable-gold \
                 ${EXTRA_TARGETS} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
@@ -112,12 +105,6 @@ EXTRA_TARGETS = ""
 EXTRA_TARGETS:x86-64 = " --enable-targets=x86_64-pe,x86_64-pep "
 EXTRA_TARGETS:class-native = ""
 
-LDGOLD:class-native = ""
-LDGOLD:class-crosssdk = ""
-LDGOLD:libc-glibc:mipsarch = ""
-LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
-
-
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
@@ -204,8 +191,3 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE:${PN}:class-target = "${USE_ALTERNATIVES_FOR}"
-
-python () {
-    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d) and bb.utils.contains_any('TARGET_ARCH', 'riscv32 riscv64 loongarch64', True, False, d):
-        bb.fatal("Gold linker does not _yet_ support RISC-V and LoongArch architecture please remove ld-is-gold from DISTRO_FEATURES")
-}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
index 14161714f2b..06a2889b92c 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
@@ -48,8 +48,3 @@ do_install () {
 }
 
 BBCLASSEXTEND = "nativesdk"
-
-# Since 1.70.0 upgrade this fails to build with gold:
-# http://errors.yoctoproject.org/Errors/Details/708194/
-# ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
-LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devtools/rust/rust_1.81.0.bb
index 1038c275f6d..c4f8ee7108f 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -377,8 +377,3 @@ RUSTLIB_DEP:class-nativesdk = ""
 INSANE_SKIP:${PN} = "staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# Since 1.70.0 upgrade this fails to build with gold:
-# http://errors.yoctoproject.org/Errors/Details/708196/
-# ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
-LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-extended/ltp/ltp_20240930.bb
index 3fe8772ea71..0760170c7b0 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20240930.bb
@@ -36,19 +36,18 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-# Version 20220527 added KVM test infrastructure which currently fails to build with gold due to
+# Version 20220527 added KVM test infrastructure which currently fails to build with lld due to
 # SORT_NONE in linker script which isn't supported by gold:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
-LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fuse-ld=bfd', '', d)}"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fuse-ld=bfd', '', d)}"
 
 # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
-# it fails with gold also a bit later when trying to use *-payload.bin
+# it fails with lld also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
-# work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+# work around this by forcing .bfd linked in LD when ld-is-lld is in DISTRO_FEATURES
+KVM_LD = "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
index 1c72d503d3c..c8f226ff3ae 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
@@ -142,10 +142,6 @@ EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
-# gold crashes on x86, another solution is to --disable-asm but thats more hacky
-# ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-
-LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd ', '', d)}"
 
 EXTRA_OEMAKE = "V=1"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
index d8b91d66c71..8c6ffdc8a73 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
@@ -118,12 +118,9 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
 
-EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
-
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
-EXTRA_OECMAKE:append:riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+# JIT does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF"
+EXTRA_OECMAKE:append:riscv64 = " -DENABLE_JIT=OFF"
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
index c7b1604b611..b2e7ec77190 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = "--enable-static"
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
-LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+LDFLAGS += "-Wl,-z,relro,-z,now"
 
 SECURITY_LDFLAGS:append:libc-musl = " -lssp_nonshared"
 CACHED_CONFIGUREVARS:append:libc-musl = " LDFLAGS='${LDFLAGS} -lucontext'"

