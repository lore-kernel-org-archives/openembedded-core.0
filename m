Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26254C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:12 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.33427.1743021002764502132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLFtBGNc;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so5811015ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021002; x=1743625802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IwbutlOWIsPpLHJvYeJmsZDPlYNIXhLq6URV0hy78s=;
        b=eLFtBGNcHgT4zJym1CYKzORc/6rXYJg7UZF7D/CVrublU23cpakviufOBnBr4puTgN
         B8ikq0mcAFxQue9QWDJDkkABCikAzs/dDxqd6nk0DgEAQ1ksFJZkCk09TuRhC72vSNBl
         wGen6kw2x58cOMEmw8LCK8bw6m6W2KwP0SrVurng041+zQW5FbU9RqwJ0I7zzUnL6ni4
         o6EnV7zA5nlykzo0iEU5t9NWmua7V5q0FiLXNgbvCBP7GI51A4cOuNDxunIBbTDP1oI5
         +PNZSmgcEOJ8RKZzB77kXFi98jUoD/uIieuqOygkNm6hM3Ieo48fzWJcLsDId56/IW/V
         +mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021002; x=1743625802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IwbutlOWIsPpLHJvYeJmsZDPlYNIXhLq6URV0hy78s=;
        b=KIhkSN6LOxXBu0rToOudhaPelHoOgIu13QuYEFV4RBDnjalWGWHLUypJr1R8h6EQ/l
         y6XCyn3Ts3CsBQj1jt7P6z4BCPEZoN0jVOaNGJRZIFZjmxxm6Fv4htlFY/L/vP2dR4RA
         63TWC/TPi6AQIn66Pu5tPtLOIC1mZu6KUIrNMAV64tqFXHPFkwhhSJ+g5vI9Xmh1D3OS
         Zo5VNR8NShqtAkA8oOGEr7vrGIboU5WGq5GxCZs419LsKv7/XuP3lJqfqsZ1HCSDhzIf
         BKdURuP6OF+olnU6+C4pusJsY4yeIaM/wLXhwfJ3uxJPJma1Bh4zXmC8ab4NJUVqdMNi
         5PiQ==
X-Gm-Message-State: AOJu0YxBNpZiN6fntgMXCBHVGcwLi+lXp3L3vN2m9kf1zmgWaNIRdlyA
	bpTdy0gmwEXon/dbHvvx9Z3e3BpUGrRAW1307/TEpFDdfrPmJ3Ncqiciqvs3
X-Gm-Gg: ASbGncsduUQ9RTJVyO5CQ9+1em+ZrO0OvNDGkr99dGicplC5uNrrvb8kqWXm3Rv2Kxg
	IB/7CIy6u78VL02KCX9YaVSXgkJu2tP+UQS/DMMGrdItHLgu+uYDAxq+WFmqmX37lbPFO5zgZWc
	4D8UyjG0E+yAZOIQbVr2H5S1pt8yVoDBSsBE6HnfHomKPs6Y7XE5EWrnZN0CJVQ3fEJV5YWndpJ
	oP4mEe+8nuc+JLc703WLli2Vtqca49qPa/jBK1A1XvBvqXeVdrBY6zLl+A+aiBJlPxaiK13Bp5M
	EGkBZFzV1BuiVjSg+qKYuGU2lIclyBOKlj5rLPP/1s/SWlPiJ57gqgHrDuQ2Y7foB8Y=
X-Google-Smtp-Source: AGHT+IGPe9eMuwZQVtONg1+Vhp0VCI3RIK+TXyPLkTkc5HSmqAj1lE4e5f/C4xKA4j2YoE+SEO3OQw==
X-Received: by 2002:a17:90b:5184:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-303a916a9c2mr1315638a91.34.1743021001315;
        Wed, 26 Mar 2025 13:30:01 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:00 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [styhead][PATCH v2 22/31] meta/meta-selftest: Fix variable assignment whitespace
Date: Wed, 26 Mar 2025 17:28:08 -0300
Message-Id: <20250326202817.64437-23-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213682

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Recipes are much more readable with whitespace around the assignment operators.
Fix various assignments in OE-Core to show this is definitely the preferred
formatting.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30ea609d3357fb3de911f2f6a5e6856c151b976a)
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 .../sysdig/sysdig-selftest_0.28.0.bb          |  2 +-
 .../bbclasses/systemd-and-sysvinit.bb         |  2 +-
 .../recipes-test/bbclasses/systemd-only.bb    |  2 +-
 .../recipes-test/gitrepotest/gitrepotest.bb   |  2 +-
 .../selftest-users/acreategroup.bb            |  2 +-
 .../selftest-users/bcreategroup.bb            |  2 +-
 .../selftest-users/ccreategroup.bb            |  2 +-
 .../selftest-users/dcreategroup.bb            |  2 +-
 meta/classes-global/base.bbclass              |  2 +-
 meta/classes-recipe/autotools.bbclass         |  2 +-
 meta/classes-recipe/cargo.bbclass             |  2 +-
 meta/classes-recipe/go.bbclass                |  4 +--
 meta/classes-recipe/gtk-icon-cache.bbclass    |  2 +-
 meta/classes-recipe/kernel.bbclass            |  2 +-
 meta/classes-recipe/python3native.bbclass     |  6 ++---
 meta/classes-recipe/python_pyo3.bbclass       | 12 ++++-----
 meta/classes-recipe/rust.bbclass              |  8 +++---
 meta/classes-recipe/setuptools3.bbclass       |  2 +-
 .../classes-recipe/setuptools3_legacy.bbclass |  2 +-
 meta/conf/documentation.conf                  |  2 +-
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  2 +-
 meta/recipes-connectivity/connman/connman.inc |  4 +--
 .../inetutils/inetutils_2.5.bb                |  2 +-
 meta/recipes-core/coreutils/coreutils_9.5.bb  |  2 +-
 meta/recipes-core/glibc/glibc-package.inc     |  2 +-
 .../glibc/glibc-y2038-tests_2.40.bb           |  2 +-
 meta/recipes-core/meta/meta-environment.bb    |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 meta/recipes-core/newlib/newlib.inc           |  2 +-
 meta/recipes-core/os-release/os-release.bb    |  2 +-
 meta/recipes-core/ovmf/ovmf-shell-image.bb    |  2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |  6 ++---
 .../packagegroup-rust-cross-canadian.bb       |  2 +-
 meta/recipes-core/picolibc/picolibc.inc       |  2 +-
 .../binutils/binutils-2.43.1.inc              |  2 +-
 meta/recipes-devtools/cmake/cmake_3.30.2.bb   |  2 +-
 .../nativesdk-icecc-toolchain_0.1.bb          |  2 +-
 .../libtool/libtool-2.5.2.inc                 |  2 +-
 .../perl/libxml-parser-perl_2.47.bb           |  2 +-
 .../python/python3-attrs_24.2.0.bb            |  2 +-
 .../python/python3-pygobject_3.48.2.bb        |  2 +-
 .../recipes-devtools/python/python3_3.12.9.bb |  2 +-
 meta/recipes-devtools/rust/rust_1.79.0.bb     |  2 +-
 .../asciidoc/asciidoc_10.2.1.bb               |  2 +-
 .../baremetal-helloworld_git.bb               |  2 +-
 .../go-examples/go-helloworld_0.1.bb          |  2 +-
 meta/recipes-extended/gzip/gzip.inc           |  4 +--
 .../logrotate/logrotate_3.22.0.bb             |  2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb |  2 +-
 meta/recipes-extended/shadow/shadow.inc       |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  2 +-
 .../libadwaita/libadwaita_1.5.3.bb            |  2 +-
 meta/recipes-graphics/mesa/mesa.inc           | 26 +++++++++----------
 .../xorg-lib/xcb-util-errors_1.0.1.bb         |  2 +-
 .../xorg-proto/xorgproto_2024.1.bb            |  2 +-
 .../cryptodev/cryptodev-module_1.14.bb        |  2 +-
 .../cryptodev/cryptodev-tests_1.14.bb         |  2 +-
 .../linux-firmware/linux-firmware_20250109.bb |  4 +--
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  6 ++---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++---
 meta/recipes-kernel/linux/linux-yocto.inc     |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 12 ++++-----
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 12 ++++-----
 .../lttng/lttng-modules_2.13.14.bb            |  2 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 .../gstreamer/gstreamer1.0-meta-base.bb       |  4 +--
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |  2 +-
 meta/recipes-support/apr/apr_1.7.5.bb         |  2 +-
 meta/recipes-support/gnutls/gnutls_3.8.6.bb   |  2 +-
 meta/recipes-support/gpgme/gpgme_1.23.2.bb    |  2 +-
 meta/recipes-support/vte/vte_0.76.3.bb        |  4 +--
 74 files changed, 121 insertions(+), 121 deletions(-)

diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
index 2ce85fe451ed..819f65409d6e 100644
--- a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
@@ -28,7 +28,7 @@ SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sys
            file://0099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
            "
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
-SRCREV_falco= "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
+SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 SRCREV_FORMAT = "sysdig_falco"
 
diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
index f9fc59a494d3..94f9a7a77014 100644
--- a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
+++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
@@ -14,4 +14,4 @@ INITSCRIPT_NAME = "${BPN}"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
index 590a27b9cbb2..6968247b08f0 100644
--- a/meta-selftest/recipes-test/bbclasses/systemd-only.bb
+++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
@@ -9,4 +9,4 @@ do_install() {
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
index f1b6c55833bf..c4806793eed4 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PATCHTOOL="git"
+PATCHTOOL = "git"
 
 SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
            file://0001-testpatch.patch \
diff --git a/meta-selftest/recipes-test/selftest-users/acreategroup.bb b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
index 7805182d4826..a970c41134ff 100644
--- a/meta-selftest/recipes-test/selftest-users/acreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
index b15c07d7b25b..08106dab7ccf 100644
--- a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
@@ -10,7 +10,7 @@ USERADD_DEPENDS = "acreategroup ccreategroup"
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
index ff2da1c03944..c82ced848126 100644
--- a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
@@ -8,7 +8,7 @@ USERADD_DEPENDS = "acreategroup"
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
 
 inherit useradd allarch
 
diff --git a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
index ab0a52966923..0030e81ee0a2 100644
--- a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
+++ b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
@@ -8,7 +8,7 @@ USERADD_DEPENDS = "bcreategroup"
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
-EXCLUDE_FROM_WORLD="1"
+EXCLUDE_FROM_WORLD = "1"
 
 inherit useradd allarch
 
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b6940bbb6ff0..bb5aa8ea18a7 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -54,7 +54,7 @@ BASEDEPENDS = ""
 BASEDEPENDS:class-target = "${@get_base_dep(d)}"
 BASEDEPENDS:class-nativesdk = "${@get_base_dep(d)}"
 
-DEPENDS:prepend="${BASEDEPENDS} "
+DEPENDS:prepend = "${BASEDEPENDS} "
 
 FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 9ebdca476807..a07957f73528 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -52,7 +52,7 @@ export CC_FOR_BUILD = "${BUILD_CC}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 
 export CXX_FOR_BUILD = "${BUILD_CXX}"
-export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
+export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
 
 export LD_FOR_BUILD = "${BUILD_LD}"
 export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 0829a58dd90f..cacc8c30b6cd 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -42,7 +42,7 @@ CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manif
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
 BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_TARGET_SUBDIR="${RUST_HOST_SYS}/${BUILD_DIR}"
+CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index 9146dd611e07..e3e47820252b 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -20,8 +20,8 @@ export GOCACHE = "${B}/.cache"
 
 export GOARCH = "${TARGET_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
-export GOHOSTARCH="${BUILD_GOARCH}"
-export GOHOSTOS="${BUILD_GOOS}"
+export GOHOSTARCH = "${BUILD_GOARCH}"
+export GOHOSTOS = "${BUILD_GOOS}"
 
 GOARM[export] = "0"
 GOARM:arm:class-target = "${TARGET_GOARM}"
diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-recipe/gtk-icon-cache.bbclass
index 9ecb49916c2a..fad8c4c65fa1 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -16,7 +16,7 @@ GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if d.getVar('GTKIC_VERSION') == '4' el
 inherit features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-DEPENDS +=" ${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else 'hicolor-icon-theme' } \
+DEPENDS += "${@ '' if d.getVar('BPN') == 'hicolor-icon-theme' else 'hicolor-icon-theme' } \
             ${@ '' if d.getVar('BPN') == 'gdk-pixbuf' else 'gdk-pixbuf' } \
             ${@ '' if d.getVar('BPN') == d.getVar('GTKPN') else d.getVar('GTKPN') } \
             ${GTKPN}-native \
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a7c4bf0ef412..10f556a6c1d6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -661,7 +661,7 @@ KERNEL_LOCALVERSION ??= ""
 # Note: This class saves the value of localversion to a file
 # so other recipes like make-mod-scripts can restore it via the
 # helper function get_kernellocalversion_file
-export LOCALVERSION="${KERNEL_LOCALVERSION}"
+export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
diff --git a/meta/classes-recipe/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
index 654a002fdb94..da1283d6b3a7 100644
--- a/meta/classes-recipe/python3native.bbclass
+++ b/meta/classes-recipe/python3native.bbclass
@@ -6,7 +6,7 @@
 
 inherit python3-dir
 
-PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
+PYTHON = "${STAGING_BINDIR_NATIVE}/python3-native/python3"
 EXTRANATIVEPATH += "python3-native"
 DEPENDS:append = " python3-native "
 
@@ -20,8 +20,8 @@ export STAGING_LIBDIR
 # find_package(PythonLibs REQUIRED)
 # which ends up using libs/includes from build host
 # Therefore pre-empt that effort
-export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
-export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+export PYTHON_LIBRARY = "${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
+export PYTHON_INCLUDE_DIR = "${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 9a32eac6fd33..7f5a00f584f0 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -11,13 +11,13 @@
 
 inherit cargo python3-dir siteinfo
 
-export PYO3_CROSS="1"
-export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
-export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
-export CARGO_BUILD_TARGET="${RUST_HOST_SYS}"
+export PYO3_CROSS = "1"
+export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_BASEVERSION}"
+export PYO3_CROSS_LIB_DIR = "${STAGING_LIBDIR}"
+export CARGO_BUILD_TARGET = "${RUST_HOST_SYS}"
 export RUSTFLAGS
-export PYO3_PYTHON="${PYTHON}"
-export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
+export PYO3_PYTHON = "${PYTHON}"
+export PYO3_CONFIG_FILE = "${WORKDIR}/pyo3.config"
 
 python_pyo3_do_configure () {
     cat > ${WORKDIR}/pyo3.config << EOF
diff --git a/meta/classes-recipe/rust.bbclass b/meta/classes-recipe/rust.bbclass
index dae25cac2a52..e727601679a3 100644
--- a/meta/classes-recipe/rust.bbclass
+++ b/meta/classes-recipe/rust.bbclass
@@ -43,9 +43,9 @@ HOST_CFLAGS   ?= "${CFLAGS}"
 HOST_CXXFLAGS ?= "${CXXFLAGS}"
 HOST_CPPFLAGS ?= "${CPPFLAGS}"
 
-rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${RUST_HOST_SYS}/lib"
+rustlib_suffix = "${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${RUST_HOST_SYS}/lib"
 # Native sysroot standard library path
-rustlib_src="${prefix}/lib/${rustlib_suffix}"
+rustlib_src = "${prefix}/lib/${rustlib_suffix}"
 # Host sysroot standard library path
-rustlib="${libdir}/${rustlib_suffix}"
-rustlib:class-native="${libdir}/rustlib/${BUILD_SYS}/lib"
+rustlib = "${libdir}/${rustlib_suffix}"
+rustlib:class-native = "${libdir}/rustlib/${BUILD_SYS}/lib"
diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recipe/setuptools3.bbclass
index 64a78e9a367e..f19899d42e5b 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -49,4 +49,4 @@ setuptools3_do_install() {
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
 
-export LDSHARED="${CCLD} -shared"
+export LDSHARED = "${CCLD} -shared"
diff --git a/meta/classes-recipe/setuptools3_legacy.bbclass b/meta/classes-recipe/setuptools3_legacy.bbclass
index 264b1f5cfb1e..030c3d9e0eb6 100644
--- a/meta/classes-recipe/setuptools3_legacy.bbclass
+++ b/meta/classes-recipe/setuptools3_legacy.bbclass
@@ -79,6 +79,6 @@ setuptools3_legacy_do_install[vardepsexclude] = "MACHINE"
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
 
-export LDSHARED="${CCLD} -shared"
+export LDSHARED = "${CCLD} -shared"
 DEPENDS += "python3-setuptools-native"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3f130120c0c7..76ce77a866de 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -180,7 +180,7 @@ FILESPATH[doc] = "The default set of directories the OpenEmbedded build system u
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
-FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."
+FULL_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."
 
 #G
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index f3010763c01d..4e4f7fa092dd 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -2,7 +2,7 @@ SUMMARY = "U-Boot bootloader tools"
 DEPENDS += "gnutls openssl util-linux swig-native"
 
 inherit python3native
-export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"
+export STAGING_INCDIR = "${STAGING_INCDIR_NATIVE}"
 
 PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage ${MLPREFIX}u-boot-mkeficapsule"
 PROVIDES:class-native = "u-boot-mkimage-native u-boot-mkenvimage-native u-boot-mkeficapsule-native"
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 073061eeda99..133e8616daaf 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -155,12 +155,12 @@ python populate_packages:prepend() {
 PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
 
 FILES:${PN}-tools = "${bindir}/wispr"
-RDEPENDS:${PN}-tools ="${PN}"
+RDEPENDS:${PN}-tools = "${PN}"
 
 FILES:${PN}-tests = "${bindir}/*-test"
 
 FILES:${PN}-client = "${bindir}/connmanctl"
-RDEPENDS:${PN}-client ="${PN}"
+RDEPENDS:${PN}-client = "${PN}"
 
 FILES:${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index afb0462c617d..19a6e6126854 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -141,7 +141,7 @@ ALTERNATIVE:${PN}-telnetd = "telnetd"
 ALTERNATIVE_LINK_NAME[telnetd] = "${sbindir}/telnetd"
 ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
 
-ALTERNATIVE:${PN}-inetd= "inetd"
+ALTERNATIVE:${PN}-inetd = "inetd"
 ALTERNATIVE:${PN}-traceroute = "traceroute"
 
 ALTERNATIVE:${PN}-hostname = "hostname"
diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.5.bb
index af0fcdcc4cfc..1b8b9ceaeef8 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -60,7 +60,7 @@ bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false hostname kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname stat"
 
-sbindir_progs= "chroot"
+sbindir_progs = "chroot"
 
 # Split stdbuf into its own package, so one can include
 # coreutils-stdbuf without getting the rest of coreutils, but make
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3352f3e2f502..19cf085bdd37 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -292,7 +292,7 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
-CONFFILES:nscd="${sysconfdir}/nscd.conf"
+CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
 SYSTEMD_SERVICE:nscd = "nscd.service"
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
index 8ed94386d266..9ea09a4e12ce 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
@@ -31,7 +31,7 @@ RDEPENDS:${PN} = "glibc libgcc sed bash"
 RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
-export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
+export oe_srcdir = "${exec_prefix}/src/debug/glibc/${PV}/"
 
 # Just build tests for target - do not run them
 do_check:append () {
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 65436bc3e68d..e2590993130d 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -70,7 +70,7 @@ do_install() {
 
 PN = "meta-environment-${MACHINE}"
 PACKAGES = "${PN}"
-FILES:${PN}= " \
+FILES:${PN} = " \
     ${SDKPATH}/* \
     "
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e3a8dff7d5c4..65be4d040496 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -29,7 +29,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
 GLIBC_LDSO = "${@get_glibc_loader(d)}"
 MUSL_LDSO_ARCH = "${@get_musl_loader_arch(d)}"
 
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 LDFLAGS += "-Wl,-soname,libc.so"
 
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index 34b0f3f747bd..17cf8a909ce1 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = " \
 BASEVER = "4.4.0"
 PV = "${BASEVER}+git"
 SRC_URI = "git://sourceware.org/git/newlib-cygwin.git;protocol=https;branch=main"
-SRCREV="ad11e2587f83d61357a32c61c36d72ea4f39315e"
+SRCREV = "ad11e2587f83d61357a32c61c36d72ea4f39315e"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc"
diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 93af08c182d2..e1906d05d8a6 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -38,7 +38,7 @@ PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 # the CPE.
 
 CPE_DISTRO ??= "${DISTRO}"
-CPE_NAME="cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
+CPE_NAME = "cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
 
 BUILD_ID ?= "${DATETIME}"
 BUILD_ID[vardepsexclude] = "DATETIME"
diff --git a/meta/recipes-core/ovmf/ovmf-shell-image.bb b/meta/recipes-core/ovmf/ovmf-shell-image.bb
index 4d7958eb5fae..5aafba97e055 100644
--- a/meta/recipes-core/ovmf/ovmf-shell-image.bb
+++ b/meta/recipes-core/ovmf/ovmf-shell-image.bb
@@ -1,5 +1,5 @@
 SUMMARY = "boot image with UEFI shell and tools"
-COMPATIBLE_HOST:class-target='(i.86|x86_64).*'
+COMPATIBLE_HOST:class-target = '(i.86|x86_64).*'
 
 # For this image recipe, only the wic format with a
 # single vfat partition makes sense. Because we have no
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index c86fc72d3e18..cd0f4d224db7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -52,13 +52,13 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "nasm-native acpica-native ovmf-native util-linux-native"
 
-EDK_TOOLS_DIR="edk2_basetools"
+EDK_TOOLS_DIR = "edk2_basetools"
 
 # OVMF has trouble building with the default optimization of -O2.
 BUILD_OPTIMIZATION = ""
 
 # OVMF supports IA only, although it could conceivably support ARM someday.
-COMPATIBLE_HOST:class-target='(i.86|x86_64).*'
+COMPATIBLE_HOST:class-target = '(i.86|x86_64).*'
 
 # Additional build flags for OVMF with Secure Boot.
 # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
@@ -139,7 +139,7 @@ fix_toolchain:append:class-native() {
 export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
 
-GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
+GCC_VER = "$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
 
 fixup_target_tools() {
     case ${1} in
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index bb10a2d34f26..7e220d2cce6a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -5,7 +5,7 @@ inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-RUST="rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+RUST = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
     ${@all_multilib_tune_values(d, 'RUST')} \
diff --git a/meta/recipes-core/picolibc/picolibc.inc b/meta/recipes-core/picolibc/picolibc.inc
index 3b380fe7aff2..640be819a3d4 100644
--- a/meta/recipes-core/picolibc/picolibc.inc
+++ b/meta/recipes-core/picolibc/picolibc.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 BASEVER = "1.8.6"
 PV = "${BASEVER}+git"
 SRC_URI = "git://github.com/picolibc/picolibc.git;protocol=https;branch=main"
-SRCREV="764ef4e401a8f4c6a86ab723533841f072885a5b"
+SRCREV = "764ef4e401a8f4c6a86ab723533841f072885a5b"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-devtools/binutils/binutils-2.43.1.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
index 091fa61cc6e3..8f99f8fe7a6a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -1,4 +1,4 @@
-LIC_FILES_CHKSUM="\
+LIC_FILES_CHKSUM = "\
     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
     file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674\
     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504\
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.2.bb b/meta/recipes-devtools/cmake/cmake_3.30.2.bb
index 9146fa8c0f96..7d8b8cac6591 100644
--- a/meta/recipes-devtools/cmake/cmake_3.30.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.30.2.bb
@@ -33,7 +33,7 @@ python () {
     d.setVar("docdir_stripped", docdir_stripped)
 }
 
-EXTRA_OECMAKE=" \
+EXTRA_OECMAKE = " \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
index d03d8adcb0fc..a7f5fc4cb45b 100644
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
 
 inherit nativesdk
 
-ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTRO_VERSION}.tar.gz"
+ENV_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-@TARGET_PREFIX@${DISTRO_VERSION}.tar.gz"
 
 do_compile() {
 }
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.2.inc b/meta/recipes-devtools/libtool/libtool-2.5.2.inc
index bde80e12ce7d..3658005ba6b2 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.2.inc
@@ -33,4 +33,4 @@ FILES:${PN} += "${datadir}/aclocal"
 FILES:${PN}-dev:remove = "${datadir}/aclocal"
 FILES:libltdl = "${libdir}/libltdl${SOLIBS}"
 
-export CONFIG_SHELL="/bin/bash"
+export CONFIG_SHELL = "/bin/bash"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index 17072ece0793..1f312b00e1cc 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -39,4 +39,4 @@ do_install_ptest() {
 RDEPENDS:${PN} += "perl-module-carp perl-module-file-spec"
 RDEPENDS:${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
 
-BBCLASSEXTEND="native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
index a6cb60a8c82a..064de5a2d834 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     python3-hatch-fancy-pypi-readme-native \
 "
 
-RDEPENDS:${PN}+= " \
+RDEPENDS:${PN} += " \
     python3-compression \
     python3-crypt \
 "
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
index 3d83a8a1c260..15ed62e23172 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
@@ -16,7 +16,7 @@ python() {
 
 DEPENDS += "python3 glib-2.0"
 
-SRCNAME="pygobject"
+SRCNAME = "pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7"
diff --git a/meta/recipes-devtools/python/python3_3.12.9.bb b/meta/recipes-devtools/python/python3_3.12.9.bb
index 2becde7f3457..dac579078453 100644
--- a/meta/recipes-devtools/python/python3_3.12.9.bb
+++ b/meta/recipes-devtools/python/python3_3.12.9.bb
@@ -80,7 +80,7 @@ EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3"
 EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
-export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
 EXTRANATIVEPATH += "python3-native"
 
diff --git a/meta/recipes-devtools/rust/rust_1.79.0.bb b/meta/recipes-devtools/rust/rust_1.79.0.bb
index eae1f28bb8d9..50e4cbbed905 100644
--- a/meta/recipes-devtools/rust/rust_1.79.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.79.0.bb
@@ -31,7 +31,7 @@ S = "${RUSTSRC}"
 RUST_CHANNEL ?= "stable"
 PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)}"
 
-export FORCE_CRATE_HASH="${BB_TASKHASH}"
+export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
 RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index 1065acdb8e0f..0360a342b412 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 # Tell xmllint where to find the DocBook XML catalogue, because right now it
 # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
-export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
+export SGML_CATALOG_FILES = "file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
 inherit setuptools3
 CLEANBROKEN = "1"
diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 6832ccc541e6..0e873604a441 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -8,7 +8,7 @@ SRCREV = "db2bf750eaef7fc0832e13ada8291343bbcc3afe"
 PV = "0.1+git"
 
 SRC_URI = "git://github.com/ahcbb6/baremetal-helloqemu.git;protocol=https;branch=master"
-UPSTREAM_VERSION_UNKNOWN="1"
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 8d4dd49ab67a..a2f880ecfe88 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 GO_IMPORT = "golang.org/x/example"
 GO_INSTALL = "${GO_IMPORT}/hello"
 
-export GO111MODULE="off"
+export GO111MODULE = "off"
 
 inherit go
 
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 62b3e2f4f939..12232dd4dacf 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.gnu.org/software/gzip/"
 SECTION = "console/utils"
 
 inherit autotools texinfo
-export DEFS="NO_ASM"
+export DEFS = "NO_ASM"
 
 EXTRA_OEMAKE:class-target = "GREP=${base_bindir}/grep"
 EXTRA_OEMAKE:append:class-nativesdk = " GREP=grep"
@@ -30,4 +30,4 @@ ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
 ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
 ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
 
-export CONFIG_SHELL="/bin/sh"
+export CONFIG_SHELL = "/bin/sh"
diff --git a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
index ac14f3005155..5c4a0a9807d6 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.22.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 # TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
 
-DEPENDS="coreutils popt"
+DEPENDS = "coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index 568268d886d5..b7e4c8b2232f 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -23,5 +23,5 @@ inherit cpan ptest-perl
 
 RDEPENDS:${PN}-ptest += "perl-module-test-more"
 
-BBCLASSEXTEND="native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 6ba5a9c7f1cc..a9b1af62702d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -37,7 +37,7 @@ PAM_SRC_URI = "file://pam.d/chfn \
 
 inherit autotools gettext github-releases pkgconfig
 
-export CONFIG_SHELL="/bin/sh"
+export CONFIG_SHELL = "/bin/sh"
 
 EXTRA_OECONF += " \
                  --with-group-name-max-length=24 \
diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f1dbd7ba8109..ca9e29f72df0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2025a"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
index 2e22211135a9..fb3bf4774af7 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Building blocks for modern GNOME applications"
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libadwaita"
-LICENSE="LGPL-2.1-or-later"
+LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9fdf496e8b38..a84d27bd9a5a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -112,10 +112,10 @@ VULKAN_DRIVERS:append:x86 = ",intel,amd"
 VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
 # i686 is a 32 bit override for mesa-native
 VULKAN_DRIVERS:append:i686 = ",intel,amd"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 # mesa development and testing tools support, per driver
@@ -165,12 +165,12 @@ GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
 # i686 is a 32 bit override for mesa-native
 GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
 
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
@@ -196,13 +196,13 @@ PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpa
 PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 
 PACKAGECONFIG[lima] = ""
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
 PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
 
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb b/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
index dd76275b6726..1f6e63d37cdb 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
@@ -4,7 +4,7 @@ SUMMARY = "xcb-util-errors gives human readable names to error codes and event c
 
 DEPENDS += "xcb-util xorgproto"
 
-export PYTHON="python3"
+export PYTHON = "python3"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c90ee77011043c608617f5323a523726"
diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
index 3f56e21a55be..d79dc23f1b24 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[legacy] = "-Dlegacy=true,-Dlegacy=false"
 
 # Datadir only used to install pc files, $datadir/pkgconfig
-datadir="${libdir}"
+datadir = "${libdir}"
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 DEV_PKG_DEPENDENCY = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
index 6fb75675bb7d..88d76c9d23eb 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
@@ -7,7 +7,7 @@ inherit module
 # Header file provided by a separate package
 DEPENDS += "cryptodev-linux"
 
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+EXTRA_OEMAKE = 'KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
 
 RCONFLICTS:${PN} = "ocf-linux"
 RREPLACES:${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
index f6a286e1b79d..2cbee8a34886 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
@@ -4,7 +4,7 @@ SUMMARY = "A test suite for /dev/crypto device driver"
 
 DEPENDS += "openssl"
 
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
+EXTRA_OEMAKE = 'KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
 
 do_compile() {
 	oe_runmake tests
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
index f0b710a6cc6a..3d22b25ef090 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
@@ -1130,7 +1130,7 @@ RDEPENDS:${PN}-nxpiw612-sdio += "${PN}-nxp-license"
 LICENSE:${PN}-nxp-mc = "Firmware-nxp_mc_firmware"
 LICENSE:${PN}-nxp-mc-license = "Firmware-nxp_mc_firmware"
 
-FILES:${PN}-nxp-mc= "${nonarch_base_libdir}/firmware/dpaa2/mc/*"
+FILES:${PN}-nxp-mc = "${nonarch_base_libdir}/firmware/dpaa2/mc/*"
 FILES:${PN}-nxp-mc-license = " \
   ${nonarch_base_libdir}/firmware/LICENSE.nxp_mc_firmware \
 "
@@ -1711,7 +1711,7 @@ RDEPENDS:${PN}-ibt-18      = "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-20 = "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-misc    = "${PN}-ibt-license"
 
-ALLOW_EMPTY:${PN}-ibt= "1"
+ALLOW_EMPTY:${PN}-ibt = "1"
 ALLOW_EMPTY:${PN}-ibt-misc = "1"
 
 LICENSE:${PN}-i915       = "Firmware-i915"
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 77249671513e..338d782bd53a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -32,7 +32,7 @@ B = "${STAGING_KERNEL_BUILDDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-KERNEL_BUILD_ROOT="${nonarch_base_libdir}/modules/"
+KERNEL_BUILD_ROOT = "${nonarch_base_libdir}/modules/"
 
 do_install() {
     kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 292897ce4305..f1139a058a17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -51,9 +51,9 @@ KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 7c0425bb27cc..e362e30e6ae6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -41,8 +41,8 @@ KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index f17fd6f76fb3..e4b17a0def2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -41,8 +41,8 @@ KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0132fcffb3bb..bd803811c8e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -31,7 +31,7 @@ DEPENDS:append:arc = " libgcc"
 KERNEL_CC:append:arc = " ${TOOLCHAIN_OPTIONS}"
 KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
 
-KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES:append:qemuall = " features/debug/printk.scc features/taskstats/taskstats.scc"
 
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
@@ -57,7 +57,7 @@ do_install:append(){
 }
 
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
-KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
+KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG ?= ""
 # These used to be version specific, but are now common dependencies.  New
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 1d5b8af337c6..7242894e6b75 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -58,9 +58,9 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
@@ -69,8 +69,8 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " featur
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 # openl2tp tests from meta-networking needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f0d477faf447..81b7d7ccb536 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -58,17 +58,17 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index f6e86c44307d..98a571e39645 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -25,7 +25,7 @@ SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-w
 
 SRC_URI[sha256sum] = "c6449f7ff12ab644a630692a556304e51525ca37d98aebf826796918be0f5da6"
 
-export INSTALL_MOD_DIR="kernel/lttng-modules"
+export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
 EXTRA_OEMAKE += "KERNELDIR='${STAGING_KERNEL_DIR}'"
 
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 581e90e9b47c..1a20472994b6 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -23,7 +23,7 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-export LOCALVERSION="${KERNEL_LOCALVERSION}"
+export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index f3f350aa98cd..dbeaa659d087 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -70,7 +70,7 @@ S = "${WORKDIR}/${BP}"
 # The LDFLAGS is required or some old kernels fails due missing
 # symbols and this is preferred than requiring patches to every old
 # supported kernel.
-LDFLAGS="-ldl -lutil"
+LDFLAGS = "-ldl -lutil"
 
 # Perf's build system adds its own optimization flags for most TUs,
 # overriding the flags included here. But for some, perf does not add
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index 6cc11e19280b..dcb5c0e6b5af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -7,8 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
-DEPENDS_UGLY="${@'gstreamer1.0-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
-DEPENDS_BAD="${@'gstreamer1.0-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_UGLY = "${@'gstreamer1.0-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_BAD = "${@'gstreamer1.0-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
 
 PACKAGES = "\
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 55400839284a..3d8c427b69d3 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -17,7 +17,7 @@ DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git"
 SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
-SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
+SRCREV = "3cdccdc9505643e50f8208171d9eee5de11a42ff"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.5.bb
index 78796476e225..215ac4b4b8b4 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -135,4 +135,4 @@ do_install_ptest() {
 	cp ${S}/test/tryread $t/
 }
 
-export CONFIG_SHELL="/bin/bash"
+export CONFIG_SHELL = "/bin/bash"
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.6.bb b/meta/recipes-support/gnutls/gnutls_3.8.6.bb
index 37d12fb5ea33..1f44f304699d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.6.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.6.bb
@@ -55,7 +55,7 @@ EXTRA_OECONF = " \
 "
 
 # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
-export POSIX_SHELL="${base_bindir}/sh"
+export POSIX_SHELL = "${base_bindir}/sh"
 
 do_configure:prepend() {
 	for dir in . lib; do
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
index 55f164e4a95c..1e258266a9f4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -66,7 +66,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
 inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
 inherit_defer ${PYTHON_INHERIT} python3native
 
-export PKG_CONFIG='pkg-config'
+export PKG_CONFIG = 'pkg-config'
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/vte/vte_0.76.3.bb b/meta/recipes-support/vte/vte_0.76.3.bb
index 515ff228fd41..b8bbf49b4255 100644
--- a/meta/recipes-support/vte/vte_0.76.3.bb
+++ b/meta/recipes-support/vte/vte_0.76.3.bb
@@ -38,7 +38,7 @@ PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
 
 PACKAGES =+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt"
 FILES:libvte-gtk4 = "${libdir}/lib*gtk4.so.* ${libdir}/girepository-1.0/Vte-3.91.typelib"
-FILES:${PN}-gtk4 ="${bindir}/vte-2.91-gtk4"
+FILES:${PN}-gtk4 = "${bindir}/vte-2.91-gtk4"
 FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
                         ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
                         ${datadir}/gir-1.0/Vte-3.91.gir \
@@ -46,7 +46,7 @@ FILES:${PN}-gtk4-dev = "${libdir}/lib*gtk4.so \
                         ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
                         ${includedir}/vte-2.91-gtk4 \
                         "
-FILES:${PN} +="${systemd_user_unitdir}"
+FILES:${PN} += "${systemd_user_unitdir}"
 FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES:${PN}-prompt = " \
     ${sysconfdir}/profile.d \
-- 
2.39.5


