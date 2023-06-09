Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC713C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.152.1686329669788328565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4AdVzRFG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-65242634690so1617904b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329669; x=1688921669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9fZdFYfUvzFXurAl3sxWJ4AQG2W7zt0QPzy153dJCA=;
        b=4AdVzRFGqnzzKw5OrBlwhFhKzRR+xSH2/q9/D8WlfI5z2GxdHcBxkGjfvkSVyhO9j+
         Ppxla7HsI9ThzO+r9pEpU+RUR/ivOEDilNuB+50WnwdZxpXlKNBhMbCPSsMdaLwrbTEn
         cKdcZxXmRiow6WemR1kD08CXjNffwTiHWM8bcJla7qGhvqxql2ObdZh6I7fCa1BF4Zll
         RXXd8ZgE3GDJfZVpqF0KzUUYHYkKTY8NdKZbWoW8k/+PaEMPq27uRQ00CeWNBZANdihM
         mSb6ybcZaSpXFR6kDW96M8VRA8Kq1qnBsUarGHk0ca6hD0JIXl1dkgK+ehpBZ7fbcX7G
         tZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329669; x=1688921669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9fZdFYfUvzFXurAl3sxWJ4AQG2W7zt0QPzy153dJCA=;
        b=eQaTbUkvzVdaBSyH5iGLHulVlUwouQ6+SPKiL/pCJaLhW/qGdzZRMUHyG77Y+RdEe3
         QzvYw/tvMLghI6vFHwag7l0hXP2czkxVbIS6ZlCENRkfV9gVfKceFmJO5CvCVZEW2mAQ
         z3pI+vAmcDFG4L10sJS8pJb17Nx9xylM+otKT34SAxUyVru9m/S6Z86xQwb0Y3QU8mY1
         pT9f9epMalYZ2sna99QI5JrqkdWvOSJ5zWizmkB7N1TGSt3AnlTstwf1kh1kZEY3JuYA
         KCOgPqbWnFG1+3+PLfBXRXSVhPiDrQw0LfjSbGTuUMS69JCKjGkULSo1wE6GEFW/N2kE
         wNBQ==
X-Gm-Message-State: AC+VfDyj1t31s+Ks0Pv6RQ5gTMbiAWGrHNCgxs7fAlK/hWW5KYYpOWQf
	Ur4F1lL2xO5QS6S/YJCrbPEajVoXjN3aOJy0Jhg=
X-Google-Smtp-Source: ACHHUZ78KmiPmiLKW4GcKaiT4bptih5ZkHc9k+sook0wUX7doYXavYJLLVtYtEWxZXtKTUuPFTvvUA==
X-Received: by 2002:a05:6a00:1911:b0:663:8255:8cc3 with SMTP id y17-20020a056a00191100b0066382558cc3mr2096592pfi.7.1686329668732;
        Fri, 09 Jun 2023 09:54:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/30] meta: depend on autoconf-archive-native, not autoconf-archive
Date: Fri,  9 Jun 2023 06:53:42 -1000
Message-Id: <be5534a8ca4a5ab7323039123e680ba1f6ede908.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182581

From: Ross Burton <ross.burton@arm.com>

autoconf-archive is a collection of m4 autoconf macros needed at
build-time, and autoconf-archive-native is a suitable provider as there
is nothing in the recipe that needs to be cross-compiled.

Also if we use DEPENDS=autoconf-archive then the recipe's -dev package
ends up RDEPENDing on autoconf-archive, which isn't correct.

Universally change any DEPENDS on autoconf-archive to the -native form,
and add any missing dependencies that were implicit before.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 571132415ea7fe2d91c62948f2b6aa553eafa83d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/neard/neard_0.18.bb                  | 2 +-
 meta/recipes-core/dbus/dbus_1.14.6.bb                          | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                  | 2 +-
 meta/recipes-extended/wget/wget.inc                            | 2 +-
 .../gobject-introspection/gobject-introspection_1.74.0.bb      | 2 +-
 meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb                 | 2 +-
 meta/recipes-kernel/powertop/powertop_2.15.bb                  | 2 +-
 meta/recipes-support/icu/icu_72-1.bb                           | 3 +--
 meta/recipes-support/mpfr/mpfr_4.2.0.bb                        | 2 +-
 9 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes-connectivity/neard/neard_0.18.bb
index dbd6e3841a..362a7615b6 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
                    "
 
-DEPENDS = "dbus glib-2.0 libnl"
+DEPENDS = "dbus glib-2.0 libnl autoconf-archive-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;branch=master \
            file://neard.in \
diff --git a/meta/recipes-core/dbus/dbus_1.14.6.bb b/meta/recipes-core/dbus/dbus_1.14.6.bb
index a6e18a92cb..da25155773 100644
--- a/meta/recipes-core/dbus/dbus_1.14.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.6.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
 PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
-DEPENDS = "expat virtual/libintl autoconf-archive glib-2.0"
+DEPENDS = "expat virtual/libintl autoconf-archive-native glib-2.0"
 RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native = ""
 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index d345b91472..0cb3f0e6a6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
                       file://lib/et/et_name.c;beginline=1;endline=11;md5=ead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=1;endline=20;md5=6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION = "base"
-DEPENDS = "util-linux attr autoconf-archive"
+DEPENDS = "util-linux attr autoconf-archive-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 58cb5ca73d..d31756dbc8 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
-DEPENDS += "autoconf-archive"
+DEPENDS += "autoconf-archive-native"
 
 EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
                 --disable-rpath"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
index 781ed65da3..d3a7ce2fd9 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
@@ -27,7 +27,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
+DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive-native"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
index 1b95cfb432..7831b4986a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
@@ -13,7 +13,7 @@ DEPENDS += "xorgproto \
             xtrans \
             libxcb \
             xorgproto-native \
-            autoconf-archive \
+            autoconf-archive-native \
             "
 
 PROVIDES = "virtual/libx11"
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-kernel/powertop/powertop_2.15.bb
index 0aae4c9397..65c6d0fcd3 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -2,7 +2,7 @@ SUMMARY = "Power usage tool"
 DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
 HOMEPAGE = "https://01.org/powertop/"
 BUGTRACKER = "https://app.devzing.com/powertopbugs/bugzilla"
-DEPENDS = "ncurses libnl pciutils autoconf-archive"
+DEPENDS = "ncurses libnl pciutils autoconf-archive-native"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
diff --git a/meta/recipes-support/icu/icu_72-1.bb b/meta/recipes-support/icu/icu_72-1.bb
index 2b20bdd7b2..c2eae5298f 100644
--- a/meta/recipes-support/icu/icu_72-1.bb
+++ b/meta/recipes-support/icu/icu_72-1.bb
@@ -6,8 +6,7 @@ same results on all platforms."
 HOMEPAGE = "http://site.icu-project.org/"
 
 LICENSE = "ICU"
-DEPENDS = "icu-native autoconf-archive"
-DEPENDS:class-native = "autoconf-archive-native"
+DEPENDS = "icu-native autoconf-archive-native"
 
 CVE_PRODUCT = "international_components_for_unicode"
 
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.0.bb b/meta/recipes-support/mpfr/mpfr_4.2.0.bb
index fead5c3833..31804382e0 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.0.bb
@@ -9,7 +9,7 @@ inherit autotools texinfo
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
                     "
-DEPENDS = "gmp autoconf-archive"
+DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC_URI[sha256sum] = "06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993"
-- 
2.34.1


