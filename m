Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B2C6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 12:09:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.10223.1664280569577150764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6KfTX8N;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id m4so358477wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=25Do0OS4vJ/cOP15Zd/7J1JW3OCIcXhGyv3qRJR42aM=;
        b=A6KfTX8NKcQRck8V/mnDwPYtro7TCJ/Gm0soqWRd0llbsjgrRkqaexwFxjsTPYfxYk
         xZxRLrNi3OG5lE5xr69tVMJgpKFkMhIx/Eg+ObwPGlBOJvZ3TAIK8iBtCpqT/XkgUWzN
         iJvOWMjPmNg6zAXo2uWekOcG7ERQWDWkJ6pfIHfukbXE/89nPp1ZAjIlfOzmL/j5K2KC
         7Qir1V1RA0zQwSkDOfDol9u08gfPih7GeyNp36W7nXVeNZbx74nx6wA5Q2kAk3jhc3tk
         hdzS4fTBlJKt2pEPm77kaHMlsJQxbOwMjCJPaXaG4pxMlYMPlj2Nd36H+8gd+Kz68y2q
         oeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=25Do0OS4vJ/cOP15Zd/7J1JW3OCIcXhGyv3qRJR42aM=;
        b=kfAAfIw2pPi9PXu1MwQ5Mich+ZB0iFXVzzo9QgJa3nssxvZ8VzgApUVUI6jf6+m+79
         W1gei4Os8TKeuO5+dbE4Ca6Bo0RrcTK002Rs3Y8vY62NgD0Kj662TvCMxSysru1Pll4W
         bfBlgUcAx8KDrD8BprOWp7kvQKxbz6lDoHKPdMLZN364zQmUeveDrU81f1CKLWz2H4tU
         Z/mCr/fplQD/HpJeBAmAR23kE8v+gcS4qnBL61VfCn2HPMLIu6udd2orQ0TuAaJz3RTI
         ucRztU16IhuoqPsVZnmiQDW/tFQWCeAga25AlhWoIHWURdjoRESQFmrtFKqHeaW8EzjY
         fmkw==
X-Gm-Message-State: ACrzQf2o/BpcdRyBcJIYPm9SkZZnnwqof/EimJSjdeK3J2hCXUslEqQb
	YlD1DH5C+iar0pqKW4x4KxUUeStt7To=
X-Google-Smtp-Source: 
 AMsMyM7WQuurzlT6varzP1f9m4wt32yvJzKwZP4KlNl5chNOXPx3c/EJar7X4Ygfk5UScOHFe2BfEw==
X-Received: by 2002:adf:f646:0:b0:22c:b602:63a9 with SMTP id
 x6-20020adff646000000b0022cb60263a9mr2375550wrp.585.1664280567754;
        Tue, 27 Sep 2022 05:09:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4743000000b00225307f43fbsm1608096wrs.44.2022.09.27.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 05:09:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] meta: fix version checks in all github recipes using the
 github-releases class
Date: Tue, 27 Sep 2022 14:09:21 +0200
Message-Id: <20220927120922.137422-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927120922.137422-1-alex@linutronix.de>
References: <20220927120922.137422-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 12:09:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171097

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb           |  6 +++---
 meta/recipes-core/expat/expat_2.4.9.bb                 |  7 ++++---
 meta/recipes-core/libcgroup/libcgroup_3.0.0.bb         |  6 +++---
 meta/recipes-core/udev/eudev_3.2.11.bb                 |  7 +++----
 meta/recipes-devtools/ccache/ccache_4.6.3.bb           |  6 ++----
 meta/recipes-devtools/dosfstools/dosfstools_4.2.bb     |  6 ++----
 meta/recipes-devtools/flex/flex_2.6.4.bb               |  8 +++-----
 meta/recipes-devtools/meson/meson_0.63.2.bb            |  8 +++-----
 meta/recipes-devtools/perl-cross/perlcross_1.4.bb      |  6 +++---
 meta/recipes-devtools/python/python3-numpy_1.23.3.bb   |  7 +++----
 meta/recipes-devtools/python/python3-pycairo_1.21.0.bb |  6 +++---
 meta/recipes-extended/cronie/cronie_1.6.1.bb           |  7 ++++---
 meta/recipes-extended/cups/cups.inc                    |  7 +++----
 meta/recipes-extended/logrotate/logrotate_3.20.1.bb    |  7 ++-----
 meta/recipes-extended/pam/libpam_1.5.2.bb              |  6 +++---
 meta/recipes-extended/shadow/shadow.inc                |  6 +++---
 meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb       |  7 ++-----
 meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb       |  6 +++---
 meta/recipes-graphics/libva/libva.inc                  |  6 +++---
 .../ttf-fonts/liberation-fonts_2.1.5.bb                |  4 ++--
 .../libsamplerate/libsamplerate0_0.2.2.bb              |  6 +++---
 .../recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb |  6 +++---
 .../bash-completion/bash-completion_2.11.bb            |  7 +++----
 meta/recipes-support/enchant/enchant2_2.3.3.bb         |  6 +++---
 meta/recipes-support/fribidi/fribidi_1.0.12.bb         |  6 ++----
 meta/recipes-support/icu/icu_71.1.bb                   | 10 +++++-----
 .../libatomic-ops/libatomic-ops_7.6.14.bb              |  6 +++---
 meta/recipes-support/libcheck/libcheck_0.15.2.bb       |  6 +++---
 meta/recipes-support/libevent/libevent_2.1.12.bb       |  7 +++----
 meta/recipes-support/libexif/libexif_0.6.24.bb         |  6 ++----
 meta/recipes-support/libffi/libffi_3.4.2.bb            |  6 ++----
 meta/recipes-support/libical/libical_3.0.14.bb         |  5 ++---
 meta/recipes-support/libnl/libnl_3.7.0.bb              |  8 ++++----
 meta/recipes-support/libpcre/libpcre2_10.40.bb         |  7 ++++---
 meta/recipes-support/libproxy/libproxy_0.4.18.bb       |  7 ++-----
 meta/recipes-support/libpsl/libpsl_0.21.1.bb           |  6 +++---
 meta/recipes-support/libusb/libusb1_1.0.26.bb          |  6 +++---
 meta/recipes-support/nghttp2/nghttp2_1.49.0.bb         |  6 ++----
 meta/recipes-support/re2c/re2c_3.0.bb                  |  6 +++---
 meta/recipes-support/taglib/taglib_1.12.bb             |  2 +-
 40 files changed, 113 insertions(+), 141 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a2efe7e80a..a830385352 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://00avahi-autoipd \
            file://99avahi-autoipd \
            file://initscript.patch \
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://local-ping.patch \
            "
 
-UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
+GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
 SRC_URI[md5sum] = "229c6aa30674fc43c202b22c5f8c2be7"
 SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
 
@@ -48,7 +48,7 @@ PACKAGECONFIG[libdns_sd] = "--enable-compat-libdns_sd --enable-dbus,,dbus"
 PACKAGECONFIG[libevent] = "--enable-libevent,--disable-libevent,libevent"
 PACKAGECONFIG[qt5] = "--enable-qt5,--disable-qt5,qtbase"
 
-inherit autotools pkgconfig gettext gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection github-releases
 
 EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/expat/expat_2.4.9.bb
index cb007708c7..9561edd84f 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.4.9.bb
@@ -8,11 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7b3b078238d0901d3b339289117cb7fb"
 
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
-SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
+SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            "
 
-UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
+GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
+UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
 SRC_URI[sha256sum] = "7f44d1469b110773a94b0d5abeeeffaef79f8bd6406b07e52394bcf48126437a"
 
@@ -20,7 +21,7 @@ EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
 RDEPENDS:${PN}-ptest += "bash"
 
-inherit cmake lib_package ptest
+inherit cmake lib_package ptest github-releases
 
 do_install_ptest:class-target() {
 	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
index f3e841246f..9937a17fb5 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
@@ -7,16 +7,16 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4d794c5d710e5b3547a6cc6a6609a641"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 DEPENDS = "bison-native flex-native"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v3.0/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v3.0/${BP}.tar.gz \
            file://0001-api-Use-GNU-strerror_r-when-available.patch \
 "
+UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/tags"
 
 SRC_URI[sha256sum] = "8d284d896fca1c981b55850e92acd3ad9648a69227c028dda7ae3402af878edd"
-UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl = " fts "
 EXTRA_OEMAKE:append:libc-musl = " LIBS=-lfts"
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index bc2c77de89..eba36c2f91 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -9,7 +9,7 @@ DEPENDS = "gperf-native"
 
 PROVIDES = "udev"
 
-SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
            file://0001-build-Remove-dead-g-i-r-configuration.patch \
@@ -17,10 +17,9 @@ SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP
 
 SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
 
-UPSTREAM_CHECK_URI = "https://github.com/eudev-project/eudev/releases"
-UPSTREAM_CHECK_REGEX = "eudev-(?P<pver>\d+(\.\d+)+)\.tar"
+GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d qemu pkgconfig features_check manpages
+inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
diff --git a/meta/recipes-devtools/ccache/ccache_4.6.3.bb b/meta/recipes-devtools/ccache/ccache_4.6.3.bb
index 5ed46cdc19..bc1be92bff 100644
--- a/meta/recipes-devtools/ccache/ccache_4.6.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.6.3.bb
@@ -11,14 +11,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=7a19377a02749d8a1281ed608169b0ee"
 
 DEPENDS = "zstd"
 
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
 SRC_URI[sha256sum] = "f46ba3706ad80c30d4d5874dee2bf9227a7fcd0ccaac31b51919a3053d84bd05"
 
-UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
-
-inherit cmake
+inherit cmake github-releases
 
 PATCHTOOL = "patch"
 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
index 289d939bb9..47d81dac8d 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -9,13 +9,11 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
           "
 SRC_URI[sha256sum] = "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527"
 
-UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
-
-inherit autotools gettext pkgconfig update-alternatives
+inherit autotools gettext pkgconfig update-alternatives github-releases
 
 EXTRA_OECONF = "--enable-compat-symlinks --without-iconv"
 
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 8736b3585e..15cf6f5cca 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -12,7 +12,7 @@ BBCLASSEXTEND = "native nativesdk"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067 \
                     file://src/gettext.h;beginline=1;endline=17;md5=9c05dda2f58d89b850c399cf22e1a00c"
 
-SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
@@ -24,16 +24,14 @@ SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
 SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
-# Flex has moved to github from 2.6.1 onwards
-UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
-UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
+GITHUB_BASE_URI = "https://github.com/westes/flex/releases"
 
 # Disputed - yes there is stack exhaustion but no bug and it is building the
 # parser, not running it, effectively similar to a compiler ICE. Upstream no plans to address
 # https://github.com/westes/flex/issues/414
 CVE_CHECK_IGNORE += "CVE-2019-6293"
 
-inherit autotools gettext texinfo ptest
+inherit autotools gettext texinfo ptest github-releases
 
 M4 = "${bindir}/m4"
 M4:class-native = "${STAGING_BINDIR_NATIVE}/m4"
diff --git a/meta/recipes-devtools/meson/meson_0.63.2.bb b/meta/recipes-devtools/meson/meson_0.63.2.bb
index 406f5bf05e..890faacec9 100644
--- a/meta/recipes-devtools/meson/meson_0.63.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.2.bb
@@ -7,7 +7,8 @@ interface for modern software development tools and practices."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/mesonbuild/meson/releases/"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://meson-setup.py \
            file://meson-wrapper \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
@@ -19,10 +20,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            "
 SRC_URI[sha256sum] = "16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf"
 
-UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
-UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit python_setuptools_build_meta
+inherit python_setuptools_build_meta github-releases
 
 RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
index 17ce901646..98a8fa3f8a 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
@@ -8,16 +8,16 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 # but is not provided inside the release tarballs
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
 
-inherit allarch
+inherit allarch github-releases
 
-SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
            file://README.md \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            file://0001-configure_func.sh-Add-_GNU_SOURCE-define-and-functio.patch \
            "
-UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
+GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
 SRC_URI[perl-cross.sha256sum] = "be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91"
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.3.bb b/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
index 1e591c260f..9d086aedfd 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8026691468924fb6ec155dadfe2a1a7f"
 
 SRCNAME = "numpy"
 
-SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
@@ -15,12 +15,11 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            "
 SRC_URI[sha256sum] = "51bf49c0cd1d52be0a240aa66f3458afc4b95d8993d2d04f0d91fa60c10af6cd"
 
-UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
+GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 
 DEPENDS += "python3-cython-native"
 
-inherit ptest setuptools3
+inherit ptest setuptools3 github-releases
 
 S = "${WORKDIR}/numpy-${PV}"
 
diff --git a/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
index 29452c7660..b692067809 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.21.0.bb
@@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f3713ca2c28d9312ad718520b6dc3eee \
 # cairo >= 1.14
 DEPENDS = "cairo python3"
 
-SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
+GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
 SRC_URI[sha256sum] = "251907f18a552df938aa3386657ff4b5a4937dde70e11aa042bc297957f4b74b"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-inherit meson pkgconfig python3targetconfig
+inherit meson pkgconfig python3targetconfig github-releases
 
 CFLAGS += "-fPIC"
 
diff --git a/meta/recipes-extended/cronie/cronie_1.6.1.bb b/meta/recipes-extended/cronie/cronie_1.6.1.bb
index 6d150dd3c7..078187534e 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.1.bb
@@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
 
 SECTION = "utils"
 
-UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
+GITHUB_BASE_URI = "https://github.com/cronie-crond/${BPN}/releases/"
 
-SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab \
            file://crond.service \
@@ -27,7 +27,8 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
 SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
 
-inherit autotools update-rc.d useradd systemd
+inherit autotools update-rc.d useradd systemd github-releases
+UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 4592980766..9c920bb133 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,7 +8,7 @@ SECTION = "console/utils"
 LICENSE = "Apache-2.0"
 DEPENDS = "libpng jpeg dbus zlib libusb1"
 
-SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${PV}-source.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0001-use-echo-only-in-init.patch \
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://libexecdir.patch \
@@ -17,8 +17,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            file://cups-volatiles.conf \
            "
 
-UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
-UPSTREAM_CHECK_REGEX = "cups-(?P<pver>(?!.+\d(b|rc)\d.+).+)-source.tar"
+GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
 
 # Issue only applies to MacOS
 CVE_CHECK_IGNORE += "CVE-2008-1033"
@@ -33,7 +32,7 @@ LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
 
-inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib_script
+inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib_script github-releases
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system lpadmin"
diff --git a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
index 35977535aa..034c37b429 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
@@ -10,10 +10,7 @@ DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
-
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094"
 
@@ -47,7 +44,7 @@ EXTRA_OEMAKE = "\
 # INSTALL=install and BASEDIR=/usr.
 OS_NAME = "Linux"
 
-inherit autotools systemd
+inherit autotools systemd github-releases
 
 SYSTEMD_SERVICE:${PN} = "\
     ${BPN}.service \
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 081986ef43..bde7fef8a2 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
                     file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
                     "
 
-SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux-PAM-${PV}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://99_pam \
            file://pam.d/common-account \
            file://pam.d/common-auth \
@@ -42,7 +42,7 @@ CFLAGS:append = " -fPIC "
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext pkgconfig systemd ptest
+inherit autotools gettext pkgconfig systemd ptest github-releases
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
@@ -180,6 +180,6 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 
-UPSTREAM_CHECK_URI = "https://github.com/linux-pam/linux-pam/releases"
+GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 414bf467ba..a87e23569b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c9a450b7be84eac23e6353efecb60b5b \
 
 DEPENDS = "virtual/crypt"
 
-UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
-SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            file://0001-shadow-use-relaxed-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
@@ -42,7 +42,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
 
-inherit autotools gettext
+inherit autotools gettext github-releases
 
 export CONFIG_SHELL="/bin/sh"
 
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
index 4c2d774803..4905e8e2ad 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
@@ -8,15 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
-
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-fix-signedness-of-char-in-tests.patch \
            "
 SRC_URI[sha256sum] = "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
 
-inherit meson pkgconfig lib_package gtk-doc gobject-introspection
+inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
index 487fc00360..1210f73a86 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
@@ -9,13 +9,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
 SRC_URI[sha256sum] = "d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4"
-UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
+GITHUB_BASE_URI = "https://github.com/anholt/libepoxy/releases"
 
-inherit meson pkgconfig features_check
+inherit meson pkgconfig features_check github-releases
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 956cd50756..735f2fca5b 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -16,17 +16,17 @@ BUGTRACKER = "https://github.com/intel/libva/issues"
 SECTION = "x11"
 LICENSE = "MIT"
 
-SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 SRC_URI[sha256sum] = "258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca"
 
 S = "${WORKDIR}/libva-${PV}"
 
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
+GITHUB_BASE_URI = "https://github.com/intel/libva/releases"
 
 DEPENDS = "libdrm"
 
-inherit meson pkgconfig
+inherit meson pkgconfig github-releases
 
 PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext libxfixes"
 PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
index 32247b09c8..b7fdc0d399 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
@@ -13,11 +13,11 @@ PE = "1"
 SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/7261482/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
 SRC_URI[sha256sum] = "7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0"
-UPSTREAM_CHECK_URI = "https://github.com/liberationfonts/liberation-fonts/releases"
+GITHUB_BASE_URI = "https://github.com/liberationfonts/liberation-fonts/releases"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
 
-inherit allarch fontcache
+inherit allarch fontcache github-releases
 
 do_install () {
 	install -d ${D}${datadir}/fonts/ttf/
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
index ed2b6437dd..29d48fd333 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=336d6faf40fb600bafb0061f4052f1f4 \
                     file://src/samplerate.c;beginline=1;endline=7;md5=7a4238289dc36bfb70968ccaa5bd0d4f"
 DEPENDS = "libsndfile1"
 
-SRC_URI = "https://github.com/libsndfile/libsamplerate/releases/download/${PV}/libsamplerate-${PV}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsamplerate-${PV}.tar.xz \
 "
 
 SRC_URI[sha256sum] = "3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893"
 
 CVE_PRODUCT = "libsamplerate"
 
-UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsamplerate/releases"
+GITHUB_BASE_URI = "https://github.com/libsndfile/libsamplerate/releases"
 
 S = "${WORKDIR}/libsamplerate-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 # FFTW and ALSA are only used in tests and examples, so they don't affect
 # normal builds. It should be safe to ignore these, but explicitly disabling
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
index 70626b3c16..1f1a40160d 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb
@@ -8,10 +8,10 @@ DEPENDS = "flac libogg libvorbis"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 
-SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
           "
-UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
+GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
 SRC_URI[sha256sum] = "0f98e101c0f7c850a71225fb5feaf33b106227b3d331333ddc9bacee190bcf41"
 
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
-inherit autotools lib_package pkgconfig multilib_header
+inherit autotools lib_package pkgconfig multilib_header github-releases
 
 do_install:append() {
     oe_multilib_header sndfile.h
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
index d981dd0c3a..19bc81619f 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
@@ -12,16 +12,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SECTION = "console/utils"
 
-SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "2514c6772d0de6254758b98c53f91861"
 SRC_URI[sha256sum] = "73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac"
-UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
-UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
+GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
 
-inherit autotools
+inherit autotools github-releases
 
 do_install:append() {
 	# compatdir
diff --git a/meta/recipes-support/enchant/enchant2_2.3.3.bb b/meta/recipes-support/enchant/enchant2_2.3.3.bb
index 96d56c2ea4..c892f570c4 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.3.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.3.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
-SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891"
 
-UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
+GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
 S = "${WORKDIR}/enchant-${PV}"
 
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.12.bb b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
index b29c47822f..9e46d958e9 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.12.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.12.bb
@@ -9,13 +9,11 @@ BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495"
 
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-
-inherit meson lib_package pkgconfig
+inherit meson lib_package pkgconfig github-releases
 
 CVE_PRODUCT = "gnu_fribidi fribidi"
 
diff --git a/meta/recipes-support/icu/icu_71.1.bb b/meta/recipes-support/icu/icu_71.1.bb
index b39633c203..df999dce3b 100644
--- a/meta/recipes-support/icu/icu_71.1.bb
+++ b/meta/recipes-support/icu/icu_71.1.bb
@@ -17,7 +17,7 @@ STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
@@ -96,8 +96,8 @@ ICU_FOLDER = "${@icu_download_folder(d)}"
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
-BASE_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
-DATA_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
+BASE_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
+DATA_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
 SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
@@ -111,8 +111,8 @@ SRC_URI:append:class-target = "\
 SRC_URI[code.sha256sum] = "67a7e6e51f61faf1306b6935333e13b2c48abd8da6d2f46ce6adca24b1e21ebf"
 SRC_URI[data.sha256sum] = "e3882b4fece6e5e039f22c3189b7ba224180fd26fdbfa9db284617455b93e804"
 
-UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
-UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
+GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
 
 EXTRA_OECONF:append:libc-musl = " ac_cv_func_strtod_l=no"
 
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index fad92df507..fbfbdacbdd 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
-SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
@@ -17,6 +17,6 @@ S = "${WORKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY:${PN} = "1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 1393aa2a1c..83f3c3f46e 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -10,14 +10,14 @@ SECTION = "devel"
 LICENSE  = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
            file://not-echo-compiler-info-to-check_stdint.h.patch"
 SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
-UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
+GITHUB_BASE_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
 
-inherit autotools pkgconfig texinfo
+inherit autotools pkgconfig texinfo github-releases
 
 CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index e26e8a9b57..55a65e6c08 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 
-SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}-stable/${BP}-stable.tar.gz \
            file://Makefile-missing-test-dir.patch \
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
@@ -21,15 +21,14 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            "
 
 SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
-
-UPSTREAM_CHECK_URI = "http://libevent.org/"
+UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>.+)-stable"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-inherit autotools
+inherit autotools github-releases
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
index 20ba0ef282..367f012f8c 100644
--- a/meta/recipes-support/libexif/libexif_0.6.24.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
@@ -10,14 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 def version_underscore(v):
     return "_".join(v.split("."))
 
-SRC_URI = "https://github.com/libexif/libexif/releases/download/v${PV}/libexif-${PV}.tar.bz2 \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            "
 
 SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
 
-UPSTREAM_CHECK_URI = "https://github.com/libexif/libexif/releases/"
-
-inherit autotools gettext
+inherit autotools gettext github-releases
 
 EXTRA_OECONF += "--disable-docs"
 
diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
index 71d9518baf..41c3cad586 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -10,18 +10,16 @@ A layer must exist above `libffi' that handles type conversions for values passe
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
 
-SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            "
 SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
-UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
-UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
-inherit autotools texinfo multilib_header
+inherit autotools texinfo multilib_header github-releases
 
 do_install:append() {
 	oe_multilib_header ffi.h ffitarget.h
diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
index 58baf3f32f..44030fdc9f 100644
--- a/meta/recipes-support/libical/libical_3.0.14.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -12,13 +12,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     "
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
 SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
-UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
-inherit cmake pkgconfig gobject-introspection vala
+inherit cmake pkgconfig gobject-introspection vala github-releases
 
 DEPENDS += "libical-native"
 
diff --git a/meta/recipes-support/libnl/libnl_3.7.0.bb b/meta/recipes-support/libnl/libnl_3.7.0.bb
index ddcc83a039..ef286a6429 100644
--- a/meta/recipes-support/libnl/libnl_3.7.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.7.0.bb
@@ -14,17 +14,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://enable-serial-tests.patch \
            file://run-ptest \
            "
 
 SRC_URI[sha256sum] = "9fe43ccbeeea72c653bdcf8c93332583135cda46a79507bfd0a483bb57f65939"
 
+GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
 
-UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
-
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest github-releases
 
 FILES:${PN} = "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 8c2cadfe2b..13f7c8305f 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -10,9 +10,10 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
-SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
-UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
+GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>.+)"
 
 SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
 
@@ -25,7 +26,7 @@ DEPENDS += "bzip2 zlib"
 
 BINCONFIG = "${bindir}/pcre2-config"
 
-inherit autotools binconfig-disabled
+inherit autotools binconfig-disabled github-releases
 
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.18.bb b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
index a9f2bf6cae..01ba2a6fe9 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.18.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.18.bb
@@ -12,13 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "69b5856e9ea42c38ac77e6b8c92ffc86a71d341fef74e77bef85f9cc6c47a4b1"
 
-UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
-UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
-
-inherit cmake pkgconfig
+inherit cmake pkgconfig github-releases
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)} gnome3"
 PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
diff --git a/meta/recipes-support/libpsl/libpsl_0.21.1.bb b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
index 4fc0ad8acb..58f56c145e 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
@@ -10,13 +10,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
                     file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
 
-SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c"
 
-UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
+GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-inherit autotools gettext gtk-doc manpages pkgconfig lib_package
+inherit autotools gettext gtk-doc manpages pkgconfig lib_package github-releases
 
 PACKAGECONFIG ?= "icu"
 PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
diff --git a/meta/recipes-support/libusb/libusb1_1.0.26.bb b/meta/recipes-support/libusb/libusb1_1.0.26.bb
index fd63e7adc2..7371faf017 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.26.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.26.bb
@@ -10,17 +10,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV}.tar.bz2 \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
-UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
+GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 
 SRC_URI[sha256sum] = "12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest github-releases
 
 PACKAGECONFIG:class-target ??= "udev"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
index b7bcd0ece0..6c3d543083 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
@@ -4,15 +4,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
-
 SRC_URI = "\
-    https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
+    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
 SRC_URI[sha256sum] = "b0cfd492bbf0b131c472e8f6501c9f4ee82b51b68130f47b278c0b7c9848a66e"
 
-inherit cmake manpages python3native
+inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
diff --git a/meta/recipes-support/re2c/re2c_3.0.bb b/meta/recipes-support/re2c/re2c_3.0.bb
index ab047601ae..f8f85125a3 100644
--- a/meta/recipes-support/re2c/re2c_3.0.bb
+++ b/meta/recipes-support/re2c/re2c_3.0.bb
@@ -7,10 +7,10 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
-SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "b3babbbb1461e13fe22c630a40c43885efcfbbbb585830c6f4c0d791cf82ba0b"
-UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
+GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools
+inherit autotools github-releases
diff --git a/meta/recipes-support/taglib/taglib_1.12.bb b/meta/recipes-support/taglib/taglib_1.12.bb
index 47ad8aacb6..e6e3ef07ad 100644
--- a/meta/recipes-support/taglib/taglib_1.12.bb
+++ b/meta/recipes-support/taglib/taglib_1.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "4313ed2671234e029b7af8f97c84e9af"
 SRC_URI[sha256sum] = "7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703"
 
-UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
+UPSTREAM_CHECK_URI = "https://taglib.org/"
 
 BINCONFIG = "${bindir}/taglib-config"
 
-- 
2.30.2


