Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27947C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 23:31:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5032.1677195097855194602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 15:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=l7Km/t1N;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id i11so6099790wrp.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 15:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N4fKwM9foPQWYManfxu342gqC8KYrOQfGec0ZiRlDE=;
        b=l7Km/t1N8BCJECAGtwSFlBIAeEpCTafyRe7W183WBuxwY5RBEuJzosvgxsy1l2r8r9
         45qpRjVLT5B1h10xReW6QlHSJ10DbtBGAXSy/UG6ZNdFN8fiHsVudGTuMSFqyrB8Z65V
         OsYHm67f4rPvgodYWK07XNCXGIdXaNC29Q4FHY4lCQQaDGHHO3zlRzU7VfscPgIJO7oO
         Ue8VgmlFNotz0jIZGa67OEcdz3A7ft0aIQnFJP7IjXmRVHSGPzNnpjXiv5x+idp1HlGD
         8KDV9akng9FiBf9fUSff8QgNyGnpbNnGuBh4Sv97nvn0SLhUqNUUaH04NlLmUpfUcA5G
         mNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N4fKwM9foPQWYManfxu342gqC8KYrOQfGec0ZiRlDE=;
        b=K+jfvgKhnFj0NWlJoimXXEUysm3PjQwtn4oQ26oDxtKdD5MMNbmXWVdejHlrSk3ofk
         /GpLmLQnAL5pZdWiMvCjecIzJNosJzJO1WwwBcHxz40pPyM4rbYUxHHqKrtQVVY8ANP+
         887b4oe/U4tEdzFnohGvJGNI40GI+j/XnH+ojaw1qAxCDI3C9y1457/tzsweje3huIOC
         dZvPjyA/AoMLhRKLAPFPCObEhcThYO/5+JPdEg22Tg0cT6lSsAR3oYIOxR8o0vEk5Gqo
         K3ALOS1VSnWdbJDzaRQilfOcqhbGGaMWJceIWOE0PYcRHL3xPbQ0RWOWp8g68RRQ1GT/
         W/fg==
X-Gm-Message-State: AO0yUKXaRRVaU+c5PbYlWZtZBOt3ZoAzTojWFTdawkcNnI0IuCW652V/
	D/iDcpbJVERVMDCoyoyWJn4G2zsmWXjT8MHS
X-Google-Smtp-Source: AK7set9AUxJNcnkJT6p11BJGBs2XS362kIFqjhWc8gRML0KZEuxOznEdIdjtoxX12pQMCiNg9Kw/DQ==
X-Received: by 2002:a05:6000:1244:b0:2c7:faf:af28 with SMTP id j4-20020a056000124400b002c70fafaf28mr3728352wrx.43.1677195096016;
        Thu, 23 Feb 2023 15:31:36 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id i18-20020adfe492000000b002c56287bd2csm11899277wrm.114.2023.02.23.15.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 15:31:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH 2/2] meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workarounds
Date: Fri, 24 Feb 2023 00:29:41 +0100
Message-Id: <20230223232939.3932270-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230223232939.3932270-1-yoann.congal@smile.fr>
References: <20230223232939.3932270-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177642

From: Fawzi KHABER <fawzi.khaber@smile.fr>

Remove superfluous DEV_PKG_DEPENDENCY = "" previously used to bypass
${PN}-dev package RDEPENDS on empty&non-built ${PN}. DEV_PKG_DEPENDENCY
applies RRECOMMENDS now, all workarounds are not needed anymore.

Related to [YOCTO #6839]

Signed-off-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 meta/recipes-connectivity/bind/bind_9.18.11.bb                | 1 -
 meta/recipes-core/musl/bsd-headers.bb                         | 1 -
 meta/recipes-core/musl/libssp-nonshared.bb                    | 1 -
 meta/recipes-core/newlib/newlib_git.bb                        | 3 ---
 meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 ----
 meta/recipes-devtools/python/python3_3.11.2.bb                | 1 -
 meta/recipes-graphics/mesa/libglu_9.0.2.bb                    | 3 ---
 meta/recipes-graphics/mesa/mesa.inc                           | 3 ---
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb        | 1 -
 meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb                | 1 -
 meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb          | 1 -
 meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb          | 3 +--
 meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb         | 3 +--
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 1 -
 meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb | 1 -
 16 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.18.11.bb
index 55a06eae5f..b2e8e615c9 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.11.bb
@@ -111,4 +111,3 @@ FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
 FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 FILES:${PN}-staticdev += "${libdir}/*.la"
 
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
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
index 43c147ca6d..52a75faf7d 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -430,7 +430,6 @@ RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc t
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-DEV_PKG_DEPENDENCY = ""
 RDEPENDS:${PN}-pydoc += "${PN}-io"
 
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.2.bb b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
index 525d631611..30d6034cee 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
@@ -25,6 +25,3 @@ inherit autotools pkgconfig features_check
 
 # Requires libGL.so which is provided by mesa when x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-
-# Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
-DEV_PKG_DEPENDENCY = ""
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0a3dc1dd62..ba9c84557a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -187,9 +187,6 @@ FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
 CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
 CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 
-# Remove the mesa dependency on mesa-dev, as mesa is empty
-DEV_PKG_DEPENDENCY = ""
-
 # Khronos documentation says that include/GLES2/gl2ext.h can be used for
 # OpenGL ES 3 specification as well as for OpenGL ES 2.
 # There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
index 7bf702076d..0cd906063b 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
@@ -13,7 +13,6 @@ SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78
 
 inherit autotools
 
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index cd5aedb59d..430ddecb8b 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -18,7 +18,6 @@ SRC_URI += "file://multilibfix.patch"
 
 PE = "1"
 
-DEV_PKG_DEPENDENCY = ""
 
 inherit gettext
 
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index 4e4472a9c1..7b6e441877 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -24,7 +24,6 @@ FILES:${PN} = ""
 FILES:${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
 FILES:python-xcbgen = "${PYTHON_SITEPACKAGES_DIR}"
 
-DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
index a1cd66c744..990d1288fe 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb
@@ -18,8 +18,7 @@ PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
 
 # Datadir only used to install pc files, $datadir/pkgconfig
 datadir="${libdir}"
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEV_PKG_DEPENDENCY = ""
+# ${PN} is empty so we need to tweak -dbg package dependencies
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
index 60495ad0c8..1729ce6f58 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb
@@ -11,8 +11,7 @@ PE = "1"
 
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
index 38282e58f1..a4bf1b375b 100644
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


