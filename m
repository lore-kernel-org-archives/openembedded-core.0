Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F59E743C9
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 21:57:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5056.1695938234410566481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 14:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bGUptfey;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4054496bde3so117166785e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1695938233; x=1696543033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc3a5KFqaJ6BAgnMcKUrj3ZsF5MIiSOY/a0ccS7pQ6s=;
        b=bGUptfey721GlVocTUY7ew4LZnch1kEkerQqeGbFhXNWyoKR4cS3VnKzIvuDyQWUMw
         Ny/c19VS+gJZMJwygihEcmaISd7gWmYC4xZE0Ivts4MOj70hQzHOuop29cDSQOgfnUo0
         UncqQfjjlFhGxv5yXOOqDghxBBRbXd1e1U9GGa+G2dsmKQfxNGmFIi8zRH8pau4EmOgy
         YcdqnMW51JjJWPmQ1NZmofidhGWwFvuQmO4AG+Is7WM6zdsQtYFrCPR01iSnd/Jc/oaR
         i/trb7O0ygpfzrUwJIxZMGYA95M1vHbTKvkAH4wKz1+yE0hoby051En7K4uskijYzCf7
         vNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695938233; x=1696543033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yc3a5KFqaJ6BAgnMcKUrj3ZsF5MIiSOY/a0ccS7pQ6s=;
        b=TgVkICGLofENhxUdW4J4X+Q3GanaW3qXyDLELslcDjmsnwY8PCOyVF5ZFJsDYnCn4k
         phHcWI5ipPgCwEGKCLcG7VBzgwfY+4AcIMbMZ6u95PSLkLDdP4q85tYLs+hOb6ha9jy4
         dm/XDWSenC4MBC9Kc7KKu5doZox+mwvtoQrlbEK9C1qTQ367McJEu5P0AchIlVOahJRq
         IVTnMM+edVC5A5u1I5ZZiQgczUOvErgVzYB6HtFSx8LxDYfY+o2/Kf3fbSjQR/6XIUki
         pAeXuYnMh+tcDIVuCrQkwgX9SpvLFW2Grzr4MCxP0ppGDgo5TPHj73bj2g45LqEgYiw/
         Asdw==
X-Gm-Message-State: AOJu0YzlMv8wMF7I2hC7B+dlX/BVgKu0cXKNRTkXNgqEQuiAUBqxpghA
	AzGFIgO+AQKPZgOv3VGt4KNb2Ip97+cRfsjWHBw=
X-Google-Smtp-Source: AGHT+IHZJDtz4VANWsrMa0VBClDewTGD8o69WSe05HuWVVBGLBu065ryWRCjxSNqZQw6PcA1G1zcsw==
X-Received: by 2002:adf:e8cc:0:b0:319:7a91:7107 with SMTP id k12-20020adfe8cc000000b003197a917107mr2287838wrn.48.1695938232540;
        Thu, 28 Sep 2023 14:57:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c25-20020adfa319000000b00324853fc8adsm2257044wrb.104.2023.09.28.14.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 14:57:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH 2/2] meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workarounds
Date: Thu, 28 Sep 2023 23:56:40 +0200
Message-Id: <20230928215640.2683961-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230928215640.2683961-1-yoann.congal@smile.fr>
References: <20230928215640.2683961-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 21:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188383

From: Fawzi KHABER <fawzi.khaber@smile.fr>

Remove superfluous DEV_PKG_DEPENDENCY = "" previously used to bypass
${PN}-dev package RDEPENDS on empty&non-built ${PN}. DEV_PKG_DEPENDENCY
applies RRECOMMENDS now, all workarounds are not needed anymore.

Related to [YOCTO #6839] and [YOCTO #8222]

Signed-off-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/recipes-connectivity/bind/bind_9.18.19.bb                | 1 -
 meta/recipes-core/musl/bsd-headers.bb                         | 1 -
 meta/recipes-core/musl/libssp-nonshared.bb                    | 1 -
 meta/recipes-core/newlib/newlib_git.bb                        | 3 ---
 meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 ----
 meta/recipes-devtools/python/python3_3.11.5.bb                | 1 -
 meta/recipes-graphics/mesa/libglu_9.0.3.bb                    | 3 ---
 meta/recipes-graphics/mesa/mesa.inc                           | 3 ---
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb        | 1 -
 meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb                | 1 -
 meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb          | 1 -
 meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb          | 3 +--
 meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb         | 3 +--
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 1 -
 meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb | 1 -
 16 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.19.bb b/meta/recipes-connectivity/bind/bind_9.18.19.bb
index 8124c5c591..01f5c9e852 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.19.bb
@@ -110,4 +110,3 @@ PACKAGE_BEFORE_PN += "${PN}-libs"
 FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 
-DEV_PKG_DEPENDENCY = ""
diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index 887a816031..8a2f4177a7 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -27,5 +27,4 @@ do_install() {
 #
 
 COMPATIBLE_HOST = ".*-musl.*"
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index 3faf8f00c3..982bcc47a5 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -31,5 +31,4 @@ do_install() {
 #
 COMPATIBLE_HOST = ".*-musl.*"
 RDEPENDS:${PN}-staticdev = ""
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/newlib/newlib_git.bb b/meta/recipes-core/newlib/newlib_git.bb
index fb922d65d1..a3687f5e67 100644
--- a/meta/recipes-core/newlib/newlib_git.bb
+++ b/meta/recipes-core/newlib/newlib_git.bb
@@ -15,6 +15,3 @@ do_install:append() {
 	# Remove original directory
 	rmdir ${D}${prefix}/${TARGET_SYS}
 }
-
-# No rpm package is actually created but -dev depends on it, avoid dnf error
-DEV_PKG_DEPENDENCY:libc-newlib = ""
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index d9084af51a..7e357af3b9 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -54,10 +54,6 @@ do_install:append:libc-newlib () {
 	fi
 }
 
-# No rpm package is actually created but -dev depends on it, avoid dnf error
-DEV_PKG_DEPENDENCY:libc-baremetal = ""
-DEV_PKG_DEPENDENCY:libc-newlib = ""
-
 BBCLASSEXTEND = "nativesdk"
 
 addtask multilib_install after do_install before do_package do_populate_sysroot
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 8e023c7dfb..f391a1ca14 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -441,7 +441,6 @@ RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zi
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-DEV_PKG_DEPENDENCY = ""
 RDEPENDS:${PN}-pydoc += "${PN}-io"
 
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
index 8151727c52..880a02d916 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
@@ -26,6 +26,3 @@ EXTRA_OEMESON = "-Dgl_provider=gl"
 
 # Requires libGL.so which is provided by mesa when x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-
-# Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
-DEV_PKG_DEPENDENCY = ""
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 559d445ae5..e897ce65c8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -213,9 +213,6 @@ FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
 CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
 CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 
-# Remove the mesa dependency on mesa-dev, as mesa is empty
-DEV_PKG_DEPENDENCY = ""
-
 # Khronos documentation says that include/GLES2/gl2ext.h can be used for
 # OpenGL ES 3 specification as well as for OpenGL ES 2.
 # There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
index 62384e6d2e..21eb27ee2d 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb
@@ -12,7 +12,6 @@ SRC_URI[sha256sum] = "59da566decceba7c2a7970a4a03b48d9905f1262ff94410a649224e33d
 
 inherit autotools
 
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
index 781382e516..ebff85d0f0 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb
@@ -16,7 +16,6 @@ SRC_URI += "file://multilibfix.patch"
 
 PE = "1"
 
-DEV_PKG_DEPENDENCY = ""
 
 inherit gettext
 
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
index 67c1e8d97d..e2a6223116 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb
@@ -25,7 +25,6 @@ FILES:${PN} = ""
 FILES:${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
 FILES:python-xcbgen = "${PYTHON_SITEPACKAGES_DIR}"
 
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
index 94d37c56bc..25ed5cdfec 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb
@@ -18,8 +18,7 @@ PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
 
 # Datadir only used to install pc files, $datadir/pkgconfig
 datadir="${libdir}"
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEV_PKG_DEPENDENCY = ""
+# ${PN} is empty so we need to tweak -dbg package dependencies
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
index cd4bc387a2..88edf1411e 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
@@ -13,8 +13,7 @@ SRC_URI += "file://0001-xorg-macros.m4.in-do-not-run-AC_CANONICAL_HOST-in-ma.pat
 
 SRC_URI[sha256sum] = "8daf36913d551a90fd1013cb078401375dabae021cb4713b9b256a70f00eeb74"
 
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEV_PKG_DEPENDENCY = ""
+# ${PN} is empty so we need to tweak -dbg package dependencies
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 3a8d32e785..33da025bf8 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -105,7 +105,6 @@ do_install_armmultilib () {
 
 BBCLASSEXTEND = "nativesdk"
 
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index a91680d497..2cff48c39c 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -13,7 +13,6 @@ S = "${WORKDIR}"
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
-DEV_PKG_DEPENDENCY = ""
 
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
index 00b6036502..38e854ab48 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
@@ -18,7 +18,6 @@ inherit autotools
 
 CFLAGS += "-fPIC -U__OPTIMIZE__"
 
-DEV_PKG_DEPENDENCY = ""
 RDEPENDS:${PN}-staticdev = ""
 
 do_install() {
-- 
2.30.2


