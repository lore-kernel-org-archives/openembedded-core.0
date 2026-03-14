Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EB210706F0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:04:06 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14837.1773511441565937166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qwd5gafl;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b93698bb57aso614793966b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773511440; x=1774116240; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMOV/Mdig7oybe1w6B6Jxbi5rr16m1yTx+lk59C5/Mc=;
        b=Qwd5gaflvCIsbP32ZairQXYugEzxmTb8edcjajjSsfx3pndEgAGBA8fhE2SPPI8TL9
         h20OvoESXs3G0DqoNr4TVOtlY3F3i+Mr9NLwTcdRxcP1Ra0vg3sffpcahhf9ac96EkwO
         LCgrG+uy6AKTJNW3r12Ryh73T3Y2IferE7V6+WtNd9EaU+Ygz64sNQw1p86JzKK1vCfN
         A6+TIxwReZMezLXe5Y9wCaJyz3sSRB+gYt9SQXLcsXPj7PYb9GYYOst0KtysRx+VY5go
         p3lZFWeZpIosppqd6OINLl5xyt6jCRk22SpAkydY5ZHmhQzyshAq9pN2aNlhWw2c/O20
         Y3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773511440; x=1774116240;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMOV/Mdig7oybe1w6B6Jxbi5rr16m1yTx+lk59C5/Mc=;
        b=pw3R7jYCfluQ19VB2rZ1kdWylNJs3JkZMNLEQpCbE8wEb4pJeW6OkydqNeLR7Blgxs
         WE4QXKbbsYmx+6Tcc0/oslLlTD9f7s05ggPdqpHNOzACs13eRUKTq4WmdHep4CaeHeWQ
         /HQNDahIj7beMqbq0Lxvs4dmeH3yrLbyMZkbIGwl9cg0AeFPMtRIv4RsvM8darMZJMZ3
         aEdzElJsA5UIEgEXvfrsfrReDivkGPrFkeop+oD4oikwve94KxsgJNQi/pTBkbW9Rmxw
         TfbLc23kXDBOu2D5SzHk+Pm+pKT7Y8sS5wqsXE5lsS00Kjm8+6BJm5n31Tkinb6d4O9+
         D39w==
X-Gm-Message-State: AOJu0Yzqtp31m9nYGSWkc4lCuK+zMSukq2mMZrYJ33ErCCpGCHNvuz7Z
	k8p0KB265fNwZgUxGEzYJXKJUwYqIJweMWWLYDv7gOjvEZfAvtko/rNrVG4ZBA==
X-Gm-Gg: ATEYQzzv25+iYivTDYL4vTUdWdkvWZfirThKSANRt4NqYlhv5boc5joiH3rMvgA3ty+
	+F2CXXnrdz3EMI+mk/qA8KXbffjgDw/JXe+5PvNX7VuGMW1gvS2Z2JzRSuKAVvgRzTnWJgpr0TL
	lW/Qz+OaXHsVe/TjpPADnwGUUjN5F1pXK6C5iSe026cs5Ew3nhH0WlZpRyEaQFGZHePWs6RwDAV
	Kgg2HMotfxPwysi7OBQNr/CK3inZC/mJ1vuRw5DmCd4Vd+5dLBZGRD0z2WrOLiS80X3sGyk9RNr
	pCsUlOgIk1p4zSk7SW7y2soJNxQuKTtpl6sHaLC9Y01ya0VU/GD3aqIm73W3KdgB6ehGRkpuzee
	jnCa+3Zqf8wVK67jM/ysJvCCeQMg1JGdRdYO2X7kd2OvJ2xj5JIie0oEhnkRetzHLCuwwXQbsmF
	D8bZVO2ApFkElu2R+suNqYpIStsqTCWP0BPd0F3sLLGMFh3fG1YhyFaud4/tN2+e3Y8m9Ql4o=
X-Received: by 2002:a17:907:7203:b0:b8a:e013:9c5b with SMTP id a640c23a62f3a-b976362ee32mr474086166b.4.1773511439458;
        Sat, 14 Mar 2026 11:03:59 -0700 (PDT)
Received: from [127.0.1.1] (185-72-186-147.cgnat.inetia.pl. [185.72.186.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0918a7sm268269766b.63.2026.03.14.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:03:58 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sat, 14 Mar 2026 19:03:25 +0100
Subject: [PATCH] Fix invalid conditional appends
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-fix-invalid-appends-v1-1-03ec0bff6942@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL73YLai7pK9CG5WwthoiBBdPekz
 4GZeSBTEsowqwcSFclyhQqmUbAdLuyE4iuD1XbQremQ5UYJxZ3i0cVIwWfcuDfTSGxZj1DLmKh
 q/3VZ3/cD++t05WUAAAA=
X-Change-ID: 20260314-fix-invalid-appends-cf5197ef2f07
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 18:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233096

Using `A:class-target += " b"` actually appends to `A:class-target`,
which will later override `A`. Most likely what was originally intended
is conditional append to `A`.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
This patch (or patches if it turns out I should split it) fixes several
findings for variable assignments of form:
    A:someoverride += "foo"
and transforms them into:
    A:append:someoverride = " foo"

In most of those cases I assume the original intent was to have a
conditional append, but what was actually happening was append to
a conditional override.

I first noticed such problem in our internal recipes and bbappends, but
then I decided to check if similar issue exists upstream and turns out
it does.

Here are results from bitbake-getvar for libffi.
Before patch:
    $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb
    EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
    EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
    $ bitbake-getvar -r libffi-native EXTRA_OECONF
    #
    # $EXTRA_OECONF [6 operations]
    #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
    #     ""
    #   :append /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs.inc:24
    #     "${DISABLE_STATIC}"
    #   set /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
    #     [doc] "Additional configure script options."
    #   append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:18
    #     "--disable-builddir --disable-exec-static-tramp"
    #   :append /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:134
    #     " ${PACKAGECONFIG_CONFARGS}"
    #   override[class-native]:append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:19
    #     "--with-gcc-arch=generic"
    # pre-expansion value:
    #   " --with-gcc-arch=generic${DISABLE_STATIC} ${PACKAGECONFIG_CONFARGS}"
    EXTRA_OECONF=" --with-gcc-arch=generic --disable-static "

After patch:
    $ grep EXTRA_OECONF /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb
    EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
    EXTRA_OECONF:append:class-native = " --with-gcc-arch=generic"
    $ bitbake-getvar -r libffi-native EXTRA_OECONF#
    # $EXTRA_OECONF [6 operations]
    #   set /path/to/layers/openembedded-core/meta/conf/bitbake.conf:590
    #     ""
    #   :append /path/to/layers/openembedded-core/meta/conf/distro/include/no-static-libs.inc:24
    #     "${DISABLE_STATIC}"
    #   set /path/to/layers/openembedded-core/meta/conf/documentation.conf:164
    #     [doc] "Additional configure script options."
    #   append /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:18
    #     "--disable-builddir --disable-exec-static-tramp"
    #   :append[class-native] /path/to/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:19
    #     " --with-gcc-arch=generic"
    #   :append /path/to/layers/openembedded-core/meta/classes-recipe/autotools.bbclass:134
    #     " ${PACKAGECONFIG_CONFARGS}"
    # pre-expansion value:
    #   " --disable-builddir --disable-exec-static-tramp${DISABLE_STATIC} --with-gcc-arch=generic ${PACKAGECONFIG_CONFARGS}"
    EXTRA_OECONF=" --disable-builddir --disable-exec-static-tramp --disable-static --with-gcc-arch=generic "

Now there are some cases where I am not sure if the override was needed
in the first place. Actually most `:class-target` overrides seem
unnecessary. Please let me know if I should actually delete the override
and keep `+=` for them.
---
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb    | 4 ++--
 meta/recipes-devtools/dnf/dnf_4.24.0.bb                  | 2 +-
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb | 2 +-
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     | 2 +-
 meta/recipes-devtools/python/python3-chardet_5.2.0.bb    | 2 +-
 meta/recipes-devtools/python/python3-cython_3.2.4.bb     | 4 ++--
 meta/recipes-devtools/python/python3-ply_3.11.bb         | 2 +-
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     | 2 +-
 meta/recipes-devtools/python/python3-pycparser_3.0.bb    | 4 ++--
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    | 2 +-
 meta/recipes-devtools/python/python3-pytz_2025.2.bb      | 2 +-
 meta/recipes-devtools/qemu/qemu_10.2.0.bb                | 2 +-
 meta/recipes-kernel/systemtap/systemtap_5.4.bb           | 2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 922e665028..0d1937a5f9 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -150,8 +150,8 @@ do_install () {
 PACKAGES =+ "pybootchartgui"
 FILES:pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
 RDEPENDS:pybootchartgui = "python3-pycairo python3-compression python3-image python3-math python3-shell python3-compression python3-codecs"
-RDEPENDS:${PN}:class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
-RDEPENDS:${PN}:class-target += "lsb-release"
+RDEPENDS:${PN}:append:class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
+RDEPENDS:${PN}:append:class-target = " lsb-release"
 DEPENDS:append:class-native = " python3-pycairo-native"
 
 PACKAGES =+ "bootchartd-stop-initscript"
diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
index d40b85c4b0..832b96c929 100644
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -55,7 +55,7 @@ RDEPENDS:${PN} += " \
 
 RDEPENDS:${PN}:class-native = ""
 
-RRECOMMENDS:${PN}:class-target += "gnupg"
+RRECOMMENDS:${PN}:append:class-target = " gnupg"
 
 # Create a symlink called 'dnf' as 'make install' does not do it, but
 # .spec file in dnf source tree does (and then Fedora and dnf documentation
diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index 322497b09b..0449438ebe 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c80530
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-codecs \
     python3-crypt \
     python3-ctypes \
diff --git a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 6397ecd818..f803f28ddf 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -14,7 +14,7 @@ CARGO_SRC_DIR = "src/_bcrypt"
 
 require ${BPN}-crates.inc
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-cffi \
     python3-ctypes \
     python3-shell \
diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
index 9acbeeb3f2..1b4600f00b 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
@@ -14,7 +14,7 @@ FILES:${PN}-cli += " \
 
 RDEPENDS:${PN}-cli = "${PN} "
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-logging \
 "
 
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
index 3e889857e1..c39473be7b 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
@@ -25,7 +25,7 @@ do_install:append() {
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
 }
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-misc \
     python3-netserver \
     python3-pkgutil \
@@ -35,7 +35,7 @@ RDEPENDS:${PN}:class-target += "\
     python3-xml \
 "
 
-RDEPENDS:${PN}:class-nativesdk += "\
+RDEPENDS:${PN}:append:class-nativesdk = " \
     nativesdk-python3-misc \
     nativesdk-python3-netserver \
     nativesdk-python3-pkgutil \
diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215..69c0b839c6 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-netclient \
     python3-shell \
 "
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 01157e251e..a6eb561bf4 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e95126290
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-codecs \
     python3-logging \
     python3-math \
diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
index c17be9b2d4..ef6f48d0e5 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -9,11 +9,11 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-netclient \
 "
 
-RSUGGESTS:${PN}:class-target += "\
+RSUGGESTS:${PN}:append:class-target = " \
     cpp \
     cpp-symlinks \
     "
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index dbf0fb0ee6..ce7f0fb7cf 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -10,7 +10,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-email \
     python3-io \
     python3-logging \
diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
index 86bfceadc8..07ae7ac702 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
@@ -9,7 +9,7 @@ PTEST_PYTEST_DIR = "pytz/tests"
 
 SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-datetime \
     python3-doctest \
     python3-io \
diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
index 5d544d8d13..1abc035a47 100644
--- a/meta/recipes-devtools/qemu/qemu_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl = " libucontext"
 CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 LDFLAGS:append:toolchain-clang:x86 = " -latomic"
 
-RDEPENDS:${PN}-common:class-target += "bash"
+RDEPENDS:${PN}-common:append:class-target = " bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
diff --git a/meta/recipes-kernel/systemtap/systemtap_5.4.bb b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
index 254bac4d6f..f319aa54fd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_5.4.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_5.4.bb
@@ -52,7 +52,7 @@ FILES:${PN}-runtime = "\
  ${bindir}/stapsh \
  ${libexecdir}/${BPN}/stapio \
 "
-RDEPENDS:${PN}:class-target += "${PN}-runtime"
+RDEPENDS:${PN}:append:class-target = " ${PN}-runtime"
 
 PACKAGES =+ "${PN}-examples"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples/"

---
base-commit: c05ef14f2840e9c0cb9fc7a5bf52cbfa9ccedc1a
change-id: 20260314-fix-invalid-appends-cf5197ef2f07

Best regards,
-- 
Michal Sieron <michalwsieron@gmail.com>


