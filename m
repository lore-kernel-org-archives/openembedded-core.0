Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934BACCA47C
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 09:45:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.28511.1656236710898312073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OQ7nR444;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 l126-20020a1c2584000000b0039c1a10507fso3893383wml.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6o8xb8js0R7ZP8xQHJCQcJzIB1Gfgstc8TMF4Gh7aDg=;
        b=OQ7nR444XBejc94F9Gkch1KsBAIYV8Q32q1Wizo+a3e0Mgesbo/yBYAhkOjaULkxK4
         ZrfyKL5wRRJkrZWRxUNLdaXu6qOqr0e1pvk3w4DEzsAXcc26qk0sAj3JZroV2LFFwXF4
         00Xg35JCgcPgVY+1FSv4xssGgSwEg27e5ob4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6o8xb8js0R7ZP8xQHJCQcJzIB1Gfgstc8TMF4Gh7aDg=;
        b=g7rS5ENqWYA9DUrbade3T9CIPrUS9RXkBtbgvBklToGuU//ikovOYs/a82Zjy3/CLx
         ywiMIiC7qeUIcznr2pEdbMwV1L96w25mPNNMr+IyBfDyyFngfiM3Y+i7vr81crTqCtdA
         7RSiWcBq257r4O9ZzEdKoCcOgBsOEY582wkSGfgC0DJ9d4jFUduo7GMIlitHjrp0SjWh
         XEud26oqqo9pVYe1oYJblBtPAdhDfzjiOUE42Rd1ruGgNg/6ZmotxbykE1yAvQiyKGt9
         lhqDOFE2rYeSAUfY72Dke5Vh7Ax9QPGWAbh/hPtXApn7LwdECAgmZSEWbspG36u2CyBo
         rAmw==
X-Gm-Message-State: AJIora+Foddvh5oHKQi2BuSkI8xRe8+AHYIgMcKRmfcGqUMASmgdFh3S
	nGHiN4IjNbhYSdupzYTGVH0ItGGE1Ply1w==
X-Google-Smtp-Source: 
 AGRyM1vgWudjobEVybO3E9GW6+dt7fVKGoIHovc0Ag1ZGMemutHRSSwN4mF/rqtE3oz34gdWeH0Hgw==
X-Received: by 2002:a05:600c:19d4:b0:39c:7ec6:c7cc with SMTP id
 u20-20020a05600c19d400b0039c7ec6c7ccmr13281157wmq.141.1656236709088;
        Sun, 26 Jun 2022 02:45:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm7305018wru.47.2022.06.26.02.45.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 02:45:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] bitbake.conf/recipes: Introduce add DEV_PKG_DEPENDENCY to
 change RDEPENDS:${PN}-dev
Date: Sun, 26 Jun 2022 10:45:04 +0100
Message-Id: <20220626094506.352336-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
References: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 09:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167304

There is a pattern that several recipes need to break the dependency of ${PN}-dev
on ${PN}, most often as ${PN} may be be empty. Add a new variable to parameterise
this and allow it to be changed more easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                                        | 3 ++-
 meta/recipes-connectivity/avahi/avahi_0.8.bb                  | 4 ++--
 meta/recipes-connectivity/bind/bind_9.18.4.bb                 | 2 +-
 meta/recipes-core/glibc/glibc-package.inc                     | 2 +-
 meta/recipes-core/musl/bsd-headers.bb                         | 2 +-
 meta/recipes-core/musl/libssp-nonshared.bb                    | 2 +-
 meta/recipes-core/newlib/newlib_4.2.0.bb                      | 2 +-
 meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 ++--
 meta/recipes-devtools/python/python3_3.10.5.bb                | 2 +-
 meta/recipes-graphics/mesa/libglu_9.0.2.bb                    | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb        | 2 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb                | 2 +-
 meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb            | 2 +-
 meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb          | 2 +-
 meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb         | 2 +-
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 2 +-
 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb   | 2 +-
 19 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2a3cf6f8aa4..40a893fe1c6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -349,7 +349,8 @@ FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/cmake ${datadir}/cmake"
 SECTION:${PN}-dev = "devel"
 ALLOW_EMPTY:${PN}-dev = "1"
-RDEPENDS:${PN}-dev = "${PN} (= ${EXTENDPKGV})"
+DEV_PKG_DEPENDENCY = "${PN} (= ${EXTENDPKGV})"
+RDEPENDS:${PN}-dev = "${DEV_PKG_DEPENDENCY}"
 
 FILES:${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
 SECTION:${PN}-staticdev = "devel"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 9bb5e5861ed..a2efe7e80ab 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -147,8 +147,8 @@ FILES:libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES:libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
 FILES:avahi-utils = "${bindir}/avahi-* ${bindir}/b* ${datadir}/applications/b*"
 
-RDEPENDS:${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV})"
-RDEPENDS:${PN}-dev += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
+DEV_PKG_DEPENDENCY = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV})"
+DEV_PKG_DEPENDENCY += "${@["", " libavahi-client (= ${EXTENDPKGV})"][bb.utils.contains('PACKAGECONFIG', 'dbus', 1, 0, d)]}"
 RDEPENDS:${PN}-dnsconfd = "${PN}-daemon"
 
 RRECOMMENDS:avahi-daemon:append:libc-glibc = " libnss-mdns"
diff --git a/meta/recipes-connectivity/bind/bind_9.18.4.bb b/meta/recipes-connectivity/bind/bind_9.18.4.bb
index 5af20221296..c68816c06ec 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.4.bb
@@ -123,5 +123,5 @@ PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-
 FILES:python3-bind = "${sbindir}/dnssec-coverage ${sbindir}/dnssec-checkds \
                 ${sbindir}/dnssec-keymgr ${PYTHON_SITEPACKAGES_DIR}"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RDEPENDS:python3-bind = "python3-core python3-ply"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 7f9e7503a1c..278e1b7cc12 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -40,7 +40,7 @@ FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
-RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
+DEV_PKG_DEPENDENCY = "linux-libc-headers-dev"
 FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index cf8af0da3cd..887a8160313 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -27,5 +27,5 @@ do_install() {
 #
 
 COMPATIBLE_HOST = ".*-musl.*"
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-core/musl/libssp-nonshared.bb
index 748dacf3126..3faf8f00c3c 100644
--- a/meta/recipes-core/musl/libssp-nonshared.bb
+++ b/meta/recipes-core/musl/libssp-nonshared.bb
@@ -31,5 +31,5 @@ do_install() {
 #
 COMPATIBLE_HOST = ".*-musl.*"
 RDEPENDS:${PN}-staticdev = ""
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-staticdev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/newlib/newlib_4.2.0.bb b/meta/recipes-core/newlib/newlib_4.2.0.bb
index 0542c596bad..fb922d65d1d 100644
--- a/meta/recipes-core/newlib/newlib_4.2.0.bb
+++ b/meta/recipes-core/newlib/newlib_4.2.0.bb
@@ -17,4 +17,4 @@ do_install:append() {
 }
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
-RDEPENDS:${PN}-dev:libc-newlib = ""
+DEV_PKG_DEPENDENCY:libc-newlib = ""
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index d48dc8b8230..fbeb43d7186 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -52,8 +52,8 @@ do_install:append:libc-newlib () {
 }
 
 # No rpm package is actually created but -dev depends on it, avoid dnf error
-RDEPENDS:${PN}-dev:libc-baremetal = ""
-RDEPENDS:${PN}-dev:libc-newlib = ""
+DEV_PKG_DEPENDENCY:libc-baremetal = ""
+DEV_PKG_DEPENDENCY:libc-newlib = ""
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta/recipes-devtools/python/python3_3.10.5.bb b/meta/recipes-devtools/python/python3_3.10.5.bb
index 599a1884b42..b237c487358 100644
--- a/meta/recipes-devtools/python/python3_3.10.5.bb
+++ b/meta/recipes-devtools/python/python3_3.10.5.bb
@@ -416,7 +416,7 @@ RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc t
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RDEPENDS:${PN}-pydoc += "${PN}-io"
 
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.2.bb b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
index 64fa82e5a80..0d27dd116b0 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.2.bb
@@ -25,4 +25,4 @@ inherit autotools pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 # Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 83705fc34df..bb39e2f369c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -183,7 +183,7 @@ CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
 CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 
 # Remove the mesa dependency on mesa-dev, as mesa is empty
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 
 # Khronos documentation says that include/GLES2/gl2ext.h can be used for
 # OpenGL ES 3 specification as well as for OpenGL ES 2.
diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
index b398e8b626c..7bf702076d7 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78
 
 inherit autotools
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
index 08773c8ccc5..83f11769f5a 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb
@@ -16,7 +16,7 @@ SRC_URI += "file://multilibfix.patch"
 
 PE = "1"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 
 inherit gettext
 
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
index f050ed366cf..070fb624558 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
@@ -22,7 +22,7 @@ FILES:${PN} = ""
 FILES:${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
 FILES:python-xcbgen = "${PYTHON_SITEPACKAGES_DIR}"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
index 7786318476c..a1e852b9eb1 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb
@@ -19,7 +19,7 @@ PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
 # Datadir only used to install pc files, $datadir/pkgconfig
 datadir="${libdir}"
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
index 0164256eb46..13d8ce22dfe 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb
@@ -13,7 +13,7 @@ SRC_URI[md5sum] = "66cb74d4a0120a06e32c3b01c29417d8"
 SRC_URI[sha256sum] = "624bb6c3a4613d18114a7e3849a3d70f2d7af9dc6eabeaba98060d87e3aef35b"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 47f09952de6..71778bb4e36 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -103,7 +103,7 @@ do_install_armmultilib () {
 
 BBCLASSEXTEND = "nativesdk"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 0e420a25d91..9afd6714f0d 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}"
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index e7599d69d62..8d8122612a2 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -20,7 +20,7 @@ inherit autotools
 
 CFLAGS += "-fPIC -U__OPTIMIZE__"
 
-RDEPENDS:${PN}-dev = ""
+DEV_PKG_DEPENDENCY = ""
 RDEPENDS:${PN}-staticdev = ""
 
 do_install() {
-- 
2.34.1


