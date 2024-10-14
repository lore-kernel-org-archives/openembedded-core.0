Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0E6D16257
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:27:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.53776.1728908863908902426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgfDwtGq;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539983beb19so4497499e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728908862; x=1729513662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFCHe5niW8uIBMTob4pIyDrP9anxXUMqeJ/0Lzq58ss=;
        b=cgfDwtGqlzWECRxZigrIkQGOWTt3BCvvXFjR81yC1txi3aA43J88Fk601vwR8PlR3y
         QWkI70KGunHMb2w5VGxggoQT3kIxZLn2uMAJZxvmj51QijE7CcAg2QoFCFKvDbWVIRsf
         Tej0wvq9ulgDwh2QBUEC86Vo5zrnjAdXCsQk2/6smx6rU3L/8lII3v31gzQtFpa6KbTB
         Ytg/C6J0tULA7ckpDw3yov7yeZtz0BbuExVgiZS8tOPOeXIl5cl0Q0HBmvmvhffX9/Ox
         hmauZI2LC0Zs9/LYouhbEAJfZl3F6KhpQXVWh3Ynb0W77pmv3oN2J5pz+6abfXbeciMD
         SciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908862; x=1729513662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFCHe5niW8uIBMTob4pIyDrP9anxXUMqeJ/0Lzq58ss=;
        b=RQ9qpvIqGDyF3Owt8gR2lVe6cSPOGeEZITVWmAv3pfl6l6nadYecprq3rWTOF49M6p
         YAEkLUA0/eazuWY+KDRw/lnsfXLDmvbadrJpDf51rWuUVhH2xUofdeHCaK8y3nttkovS
         p+V/VMPYGlrNYZllxcXcstEBvv4dnhgZowmALD1WAp1vTfAb6gX+b52zZBxau7bcORLv
         9FhRw+TdYrsK+KHEMw3g2Q1jegBwsKdbO3FFM4RTE57B9IY7j+0IzQ+SYuoN43VF0wP6
         0q1i5VG5qFmG1/kku8fYmulAvx4HN1T+HVM/OyFla8313itvwgxs5nnJfv11q8BvCBUG
         vCbA==
X-Gm-Message-State: AOJu0YzFOa2GKo0PBP28M9bvsbG4CARhAhbgT/MeiynT3pcVOGhSlaXO
	0fDggA/QdSK5QJuDYr9MAnvR7iqH7Fz25FXTpRbPbBS05EaYB8hLicNuDw==
X-Google-Smtp-Source: AGHT+IEg1N5qiueh+yh8ljBnonQjICe/AqWTAXi4MYn1HUvUvDPTA1//wsAuN16vu1eV+130el6U6Q==
X-Received: by 2002:a05:6512:114f:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-539da586e45mr5043698e87.42.1728908861427;
        Mon, 14 Oct 2024 05:27:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260aefsm4873230a12.65.2024.10.14.05.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:27:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] meta: use explicit uri for all sourceforge upstream version checks
Date: Mon, 14 Oct 2024 14:27:32 +0200
Message-Id: <20241014122732.2288752-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014122732.2288752-1-alex.kanavin@gmail.com>
References: <20241014122732.2288752-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205765

From: Alexander Kanavin <alex@linutronix.de>

Previously the check for some recipes relied on sourceforge redirecting from
downloads.sourceforge.net (SRC_URI is set to that) into the actual project page.

Sourceforge does this for interactive browsers, but not for wget.

With the check no longer mimicking a browser, and being truthful
about coming from wget we need to explicitly fetch
the project page in all cases, which is what this commit does.
(many recipes already set this explicitly and don't need to be tweaked)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/sourceforge-releases.bbclass            | 2 ++
 meta/recipes-bsp/acpid/acpid.inc                            | 5 +++--
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb                  | 2 ++
 meta/recipes-bsp/setserial/setserial_2.17.bb                | 2 +-
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb      | 2 +-
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb | 5 ++++-
 meta/recipes-extended/hdparm/hdparm_9.65.bb                 | 1 +
 meta/recipes-extended/mingetty/mingetty_1.08.bb             | 2 +-
 meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb              | 2 +-
 meta/recipes-multimedia/lame/lame_3.100.bb                  | 2 +-
 meta/recipes-support/libfm/libfm-extra_1.3.2.bb             | 5 +++--
 meta/recipes-support/libfm/libfm_1.3.2.bb                   | 5 +++--
 meta/recipes-support/libpcre/libpcre_8.45.bb                | 5 +++--
 13 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes-recipe/sourceforge-releases.bbclass

diff --git a/meta/classes-recipe/sourceforge-releases.bbclass b/meta/classes-recipe/sourceforge-releases.bbclass
new file mode 100644
index 00000000000..0b5e5d07119
--- /dev/null
+++ b/meta/classes-recipe/sourceforge-releases.bbclass
@@ -0,0 +1,2 @@
+SOURCEFORGE_PROJECT ?= "${BPN}"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/${SOURCEFORGE_PROJECT}/files/"
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index 3d6f75f90f8..ba954563b67 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -10,7 +10,8 @@ BUGTRACKER = "http://sourceforge.net/p/acpid2/tickets/?source=navbar"
 SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
+SOURCEFORGE_PROJECT = "acpid2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/acpid-${PV}.tar.xz \
            file://init \
            file://acpid.service \
            file://0001-Replace-stat64-with-stat.patch \
@@ -18,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/acpid2/acpid-${PV}.tar.xz \
 
 CVE_PRODUCT = "acpid2"
 
-inherit autotools update-rc.d systemd
+inherit autotools update-rc.d systemd sourceforge-releases
 
 INITSCRIPT_NAME = "acpid"
 INITSCRIPT_PARAMS = "defaults"
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
index a56a85bdeff..8257190568f 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
@@ -18,6 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            "
 SRC_URI[sha256sum] = "7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c"
 
+inherit sourceforge-releases
+
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*|riscv64.*)-linux"
 COMPATIBLE_HOST:armv4 = 'null'
 
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 98ab45145ff..3241b21f82e 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356a
 
 DEPENDS += "groff-native"
 
-inherit autotools-brokensep
+inherit autotools-brokensep sourceforge-releases
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://add_stdlib.patch \
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 9dc5caf87c3..085384064d0 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -25,7 +25,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS= CPPOPTX='${CPPFLAGS}' COPTX='${CFLAGS}' C++OPTX='$
 # Stop failures when 'cc' can't be found
 export ac_cv_prog_CC = "${CC}"
 
-inherit native
+inherit sourceforge-releases native
 
 # Use -std=gnu89 to build with gcc-14 (https://bugs.gentoo.org/903876)
 # this needs to be after native inherit (which sets CFLAGS to BUILD_CFLAGS)
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 0e155b6c951..84687504349 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -5,10 +5,13 @@ DESCRIPTION = "A collection of autoconf macros, plus an autogen.sh script that c
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}.berlios/${BP}.tar.bz2"
+SOURCEFORGE_PROJECT = "${BPN}.berlios"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
 SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
 
+inherit sourceforge-releases
+
 do_configure() {
 	:
 }
diff --git a/meta/recipes-extended/hdparm/hdparm_9.65.bb b/meta/recipes-extended/hdparm/hdparm_9.65.bb
index 1b6af566a29..34d50054ab5 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.65.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.65.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            "
 
 SRC_URI[sha256sum] = "d14929f910d060932e717e9382425d47c2e7144235a53713d55a94f7de535a4b"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/hdparm/files/hdparm/"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index aa5a989df2c..00d2564257a 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -21,7 +21,7 @@ do_install(){
     oe_runmake install DESTDIR=${D}
 }
 
-inherit update-alternatives
+inherit update-alternatives sourceforge-releases
 
 ALTERNATIVE:${PN} = "getty"
 ALTERNATIVE_LINK_NAME[getty] = "${base_sbindir}/getty"
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
index d308071d293..e186bc35e10 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
           "
 SRC_URI[sha256sum] = "f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e"
 
-inherit autotools update-rc.d systemd pkgconfig update-alternatives
+inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
diff --git a/meta/recipes-multimedia/lame/lame_3.100.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
index 5b42795f4e3..5ace46ace0a 100644
--- a/meta/recipes-multimedia/lame/lame_3.100.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -17,7 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
 SRC_URI[md5sum] = "83e260acbe4389b54fe08e0bdbf7cddb"
 SRC_URI[sha256sum] = "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig sourceforge-releases
 
 PACKAGES += "libmp3lame libmp3lame-dev"
 FILES:${PN} = "${bindir}/lame"
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index eff1b54f734..b7a9b25f862 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0-native glib-2.0 intltool-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
+SOURCEFORGE_PROJECT = "pcmanfm"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/libfm-${PV}.tar.xz \
           "
 
 SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
@@ -17,6 +18,6 @@ S = "${WORKDIR}/libfm-${PV}"
 
 EXTRA_OECONF = "--with-extra-only --with-gtk=no"
 
-inherit autotools pkgconfig gtk-doc gettext
+inherit autotools pkgconfig gtk-doc gettext sourceforge-releases
 
 do_configure[dirs] =+ "${S}/m4"
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index 1d7609165b4..e3cf7517164 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -13,14 +13,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 glib-2.0-native pango gtk+3 menu-cache intltool-native libexif libfm-extra"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
+SOURCEFORGE_PROJECT = "pcmanfm"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/libfm-${PV}.tar.xz \
            file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch \
            file://0001-Do-not-add-library-path-to-avoid-host-contamination.patch \
            "
 
 SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
 
-inherit autotools pkgconfig gtk-doc gettext features_check mime mime-xdg
+inherit autotools pkgconfig gtk-doc gettext features_check mime mime-xdg sourceforge-releases
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OECONF = "--with-gtk=3"
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index 17fb6846a52..933bb00de65 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -7,7 +7,8 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
+SOURCEFORGE_PROJECT = "pcre"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${SOURCEFORGE_PROJECT}/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
@@ -32,7 +33,7 @@ PACKAGECONFIG[jit] = "--enable-jit=auto,--disable-jit"
 
 BINCONFIG = "${bindir}/pcre-config"
 
-inherit autotools binconfig-disabled ptest
+inherit autotools binconfig-disabled ptest sourceforge-releases
 
 EXTRA_OECONF = "--enable-utf"
 
-- 
2.39.5


