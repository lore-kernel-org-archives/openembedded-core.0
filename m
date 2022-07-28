Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F02C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 11:41:27 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.31318.1659008485433104791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dxQe1fq6;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id b11so2655524eju.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PCBLTrsib/ul/7XtdGzRw+heDLitDbNn/KoLV6CZI6g=;
        b=dxQe1fq6Nd3nOBQsjI5Eo4Wtgd0z4xWqdIvylqBuYzfC1+ViraIkrarobacmCMD19f
         MY4ZQ5KkbjiXrg3p1MXSr+p3fS2tL76juQpwXxdYbvhQzJ2VY3HnOvQ30Dw7Cuon+N8t
         95vgiMrr5e5ikKKG0UeBIz8jUth8YnXTgBHwQHlSIb/fIlIl1g42IHK668AEW6guU1Tn
         xox1PQdLXeTfHOgkNx6HtI7OD32lymay7etWhHftMsf8F2HkpqG5P6j7fc2/nPxobf1e
         t9gRZFNHUW5o/PX42LGoFRWbqpWlbZ00pfDcn8E5j11aHQlddITvqsySgjgInxHK0DZo
         N8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PCBLTrsib/ul/7XtdGzRw+heDLitDbNn/KoLV6CZI6g=;
        b=n3ydMlKDDu4KnMpx3nnHnH4jKUCc22YTsFp7sbi196a0cHC7Ki72QoC4wWwOXN8kvp
         azNZ57eTqI87Kjh3xtUIsKfoayv30mIOZ89muZxeHFj/id1CmVw0McW3YZEwD0aBGk1t
         Y1v583kfa4W5ulePEABZ89gxEXh1tP2r4JvIhPu7xE2EHU74vfYtDLx1m5EkDCS57zgp
         U/0Eh9MUNCbnb8Pqv8K8LyrGjDhySSWTVl2teAaUiy/Q6GaVOqpNxSjqPcDnCGDf8RlU
         HmDSzdmxJH4wln3Vr41wmx4jRsrB57X4HGS6jtSETriIcswgJzR/Am/Z2QQPVYbPMMjw
         mB4w==
X-Gm-Message-State: AJIora9f+6ERnXGNIogQuw7KJoFMUFEomH8yKPF2gUzzxaIYcTv2wfon
	R8B12YZwloUM26/VHN0kyN+zd4R4Ge8=
X-Google-Smtp-Source: 
 AGRyM1v+xfHHHM+Q+ash1V/2cqZkE/53DYl7sPA/PdRz2wP3RzXhbv1qBochb53MaJsYuDX0YRDnRw==
X-Received: by 2002:a17:907:60cf:b0:72f:267e:eb8e with SMTP id
 hv15-20020a17090760cf00b0072f267eeb8emr21297202ejc.544.1659008483928;
        Thu, 28 Jul 2022 04:41:23 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 lz7-20020a170906fb0700b0072aa009aa68sm333836ejb.36.2022.07.28.04.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:41:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: petr.vorel@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] bitbake.conf: change TOOLCHAIN_OPTIONS not to start with
 space
Date: Thu, 28 Jul 2022 13:40:46 +0200
Message-Id: <20220728114046.3529197-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
References: <20220728114046.3529197-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 11:41:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168602

* it was introduced this way in 2007:
  https://git.openembedded.org/openembedded-core/commit/?id=0138501213f140198abdead3ffa6b3ba80462c98
  but now there are quite a few places which use it after a space (which doesn't hurt):
  meta/classes/cmake.bbclass:OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
  meta/classes/cmake.bbclass:OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
  meta/classes/cmake.bbclass:OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
  meta/classes/cmake.bbclass:OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
  meta/classes/kernel-yocto.bbclass:  CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
  meta/recipes-bsp/u-boot/u-boot.inc:EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
  meta/recipes-devtools/diffstat/diffstat_1.64.bb:LDFLAGS += "${TOOLCHAIN_OPTIONS}"
  meta/recipes-devtools/go/go-runtime.inc:GO_EXTLDFLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
  meta/recipes-extended/wget/wget.inc:EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_CC:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_LD:append:aarch64 = " ${TOOLCHAIN_OPTIONS}"
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_CC:append:nios2 = " ${TOOLCHAIN_OPTIONS}"
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_LD:append:nios2 = " ${TOOLCHAIN_OPTIONS}"
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_CC:append:arc = " ${TOOLCHAIN_OPTIONS}"
  meta/recipes-kernel/linux/linux-yocto.inc:KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"

  not using space now seems a bit strange to me (noticed when trying to prepend
  something to TOOLCHAIN_OPTIONS)

* it made more sense when default TOOLCHAIN_OPTIONS were empty, but
  since 2010 it's almost always used to set --sysroot:
  https://git.openembedded.org/openembedded-core/commit/?id=6124cccddfc202124fa76bb677ad3e06f0fefc70

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/cross-canadian.bbclass            |  2 +-
 meta/classes/go.bbclass                        |  2 +-
 meta/conf/bitbake.conf                         | 12 ++++++------
 meta/recipes-devtools/go/go-runtime.inc        |  2 +-
 meta/recipes-extended/ltp/ltp_20220527.bb      |  2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index a0e9d23836..686646357c 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -104,7 +104,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 STAGING_DIR_HOST = "${RECIPE_SYSROOT}"
 
-TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+TOOLCHAIN_OPTIONS = "--sysroot=${RECIPE_SYSROOT}"
 
 PATH:append = ":${TMPDIR}/sysroots/${HOST_ARCH}/${bindir_cross}"
 PKGHIST_DIR = "${TMPDIR}/pkghistory/${HOST_ARCH}-${SDKPKGSUFFIX}${HOST_VENDOR}-${HOST_OS}/"
diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cd2daed70b..c6b38bd294 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -40,7 +40,7 @@ GO_RPATH_LINK = "${@'-Wl,-rpath-link=${STAGING_DIR_TARGET}${libdir}/go/pkg/${TAR
 GO_RPATH = "${@'-r ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
-GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
+GO_EXTLDFLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c2ebf333e..27478b1107 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -547,14 +547,14 @@ HOSTTOOLS_NONFATAL += "git-lfs"
 
 CCACHE ??= ""
 
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
+TOOLCHAIN_OPTIONS = "--sysroot=${STAGING_DIR_TARGET}"
 
-export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+export CPP = "${HOST_PREFIX}gcc -E ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 LINKER = "ld"
-export LD = "${HOST_PREFIX}${LINKER}${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+export LD = "${HOST_PREFIX}${LINKER} ${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
 export CCLD = "${CC}"
 export AR = "${HOST_PREFIX}gcc-ar"
 export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e18339cddb..d1846707cc 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -14,7 +14,7 @@ export CGO_CXXFLAGS = "${CXXFLAGS}"
 export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
 export GOCACHE = "${B}/.cache"
 
-GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
+GO_EXTLDFLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
 GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
index b0f4ea6021..aa64385846 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220527.bb
@@ -54,7 +54,7 @@ LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-
 # it fails with gold also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
 # work around this by forcing .bfd linked in LD when ld-is-gold is in DISTRO_FEATURES
-KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
+KVM_LD = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '${HOST_PREFIX}ld.bfd ${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index dd14f8df6f..a2f85b1fe9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -108,7 +108,7 @@ EXTRA_OECONF = " \
     --arch=${TARGET_ARCH} \
     --target-os='linux' \
     --enable-cross-compile \
-    --extra-cflags='${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}' \
+    --extra-cflags='${CFLAGS} ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}' \
     --extra-ldflags='${LDFLAGS}' \
     --sysroot='${STAGING_DIR_TARGET}' \
     ${EXTRA_FFCONF} \

