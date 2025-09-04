Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7A5CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 11:21:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.36431.1756984903598663980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 04:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PglRZKUs;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3df726ecff3so382002f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 04:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756984902; x=1757589702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMonadI9vw8RJr591L4iXRdJ6vTPTJ8f6o4LOh+SYmo=;
        b=PglRZKUs1Ia4Etqz6Mosu1vF7oSD1r0cANdqvtN+fA22u1SBPNb5+CKgTdatQPvV8z
         1U4hAF1RlgQ2JCEs5kvVRIYCQ9SqdOew5idiPojsFftTro9+sqqWYWxTmNA65p1aYq1u
         tKnm01zzv2K2VrWfBoBI//SWIbDChGq0Hf4HyOGBtFmh/kGGUmDkWRp2CK5EK8FeXsFW
         LCH9EFDzTiT4wKjrIQ++oYdlcW2nI1Y/v8Nd5mLe1k4+sJffarkk0X136VK6ApY6m+2D
         BbidSrSp5iLGwJnwK9ObQnvfKSq/HX/HlJbfhQ/urfarYWvaCZpIZmblgvTKUa3tDsUo
         WUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984902; x=1757589702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMonadI9vw8RJr591L4iXRdJ6vTPTJ8f6o4LOh+SYmo=;
        b=PW56ogdyrCeMT63HmZIUDgUV0uB3YWq0TidYwX8CXC+hpecEhwfaxKds3x7ICJr7Ds
         DhZTFBGQo0fTuOeoIrXRyDWQV7QXeNb+RMl/lU3Uj5MW0qeCutStzebGL3WoGbHlBZbO
         dGrLgElDHNdJs6zuQvyH/1x8yJb+slT1HR6g17fx3/N3SVV/jXfUT9bnRRuM4bg274kN
         9y84BfIWDe3lTbnneaR3ROmA0Gu2el1fvrPe5ncIgZ9cBpEaBd+/zzcBzjZBtaauIsmH
         gfk/uUcqaVeNUIGyxr3fI0t/FqlFXKfs4bJQjrDfZH8WFb4ZQrEaUzvS4s+Ci3ZrwKc6
         x9qA==
X-Gm-Message-State: AOJu0YybvvLi60i/1mCGhEs4FFh95FchuDEalL01utUqckxrofa/+oAv
	dccy+IhmiaBhjHryIcCJe/MscrkJCEAZzOk1gHlmxPWZmQJN2UvqDG4fVWSSJRgF
X-Gm-Gg: ASbGncvAjBUgKGqcRhGJ/2VA97SnkqLaMygcrZgqXGoRKtpxECResypXrjih2oAKFSd
	117kP5EjFVTNZrB9L+t8ciZShn/X9XgM5qIvpVVsK8pcBqyBCQc6WOYyrgmsaS8HlM2AODTV06Y
	UJ3XwlTxgMlvAYkt9gcJMq221gc8HDUiLM07HvqgKRlIF6yNrgUiyPk1GeQP8+uq5W/zC/S6Whd
	JConuzJHCl85dqbVrlkDyzPfY32GxlYC0jD5DbLRYT4cztK7pbLQNGgFpn6lyc/qoq+cTXNYnz+
	kt6gyI3OBJtKqCe05w5p5NLtG5pbLqtmwzBJKY3rLjGADzt1+eRdRslSfLBPKdCuy+riwN0hf9T
	H37Jyu/w6t0OAoG6LA3kYrEcFTyTEqy8=
X-Google-Smtp-Source: AGHT+IHgR/HcTCYCT/aSIMyCtAfb02cYgv6nosQi/HQKvvHb/321+pyyk3dv3gwsKWr4BffJmE5Bww==
X-Received: by 2002:a05:6000:402c:b0:3d1:54de:f4b3 with SMTP id ffacd0b85a97d-3d1dc5a395fmr13523041f8f.6.1756984901497;
        Thu, 04 Sep 2025 04:21:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e092bd127csm3138755f8f.14.2025.09.04.04.21.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:21:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] librsvg: add ptest support
Date: Thu,  4 Sep 2025 13:21:40 +0200
Message-ID: <20250904112140.2762452-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 11:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222919

The suite is quick, it takes ~5 seconds on my machine to execute.

The tests consist of 2 or 3 parts, depending on how one counts them.

The apitest PACKAGACONFIG compiles tests for the c-interface, as part of
the main meson build. This apitest expects test data to be present in
a folder relative the test binary: ../../rsvg/tests folder.

ptest-cargo compiles two sets of test: rsvg-convert tests, and generic assorted
tests for the library, in multiple binaries.

The rsvg-convert tests expect test data to be present in a "tests" folder,
in the same folder where the test binaries are.

The library tests expect the tests to be in a folder called "tests", that's
location is specified by the CARGO_MANIFEST_DIR environment variable.

As part of compiling the cargo tests, rsvg-convert is also compiled specifically
for the tests, however it is not supposed to be different from the actual binary.
It is deleted from the test set, because of two reasons:
1. It is not bit-identical to the actually installed rsvg-convert (it is compiled differently,
   with cargo only, without meson)
2. ptest-cargo class treated it as a test binary, and tried to execute it, which resulted
   in failing/hanging test.

It is avoided by not installing this binary, but rather use the real rsvg package
as a runtime dependency, and create a symlink to it in the run-ptest script.

Added liberation-fonts as a runtime dependency to the tests - the rsvg-convert
tests require some fonts to be available to be able to render during some
svg->pdf conversion tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Added rust tests beside the C tests, copy all test data folder to the ptest folder 
    without cherrypicking the content
v1: https://lists.openembedded.org/g/openembedded-core/message/221454

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-gnome/librsvg/librsvg/run-ptest  | 17 ++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.61.0.bb  | 32 +++++++++++++++++--
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9a7b25a916..e6e725bd25 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -32,6 +32,7 @@ PTESTS_FAST = "\
     libgpg-error\
     libnl \
     libpcre \
+    librsvg \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-gnome/librsvg/librsvg/run-ptest b/meta/recipes-gnome/librsvg/librsvg/run-ptest
new file mode 100644
index 0000000000..da1c65f1a6
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+export CARGO_MANIFEST_DIR="$(cd "$(dirname "$0")" && pwd)"
+cd $CARGO_MANIFEST_DIR
+
+ln -sf `which rsvg-convert` ./rsvg-convert
+
+./api_test/bin/api
+
+if [ $? = 0 ]; then
+  echo PASS: /usr/lib/librsvg/ptest/api_test/bin/api
+  rc=0
+else
+  echo FAIL: /usr/lib/librsvg/ptest/api_test/bin/api
+  rc=1
+fi
+
+# rust tests are appended here by ptest-cargo class
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb
index dda51abab5..de1853c6d8 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb
@@ -11,9 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SECTION = "x11/utils"
 DEPENDS = "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-native cargo-c-native"
+RDEPENDS:${PN}-ptest += "rsvg liberation-fonts"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit cargo_common gnomebase pixbufcache gobject-introspection rust vala gi-docgen cargo-update-recipe-crates
+inherit cargo_common gnomebase pixbufcache gobject-introspection rust vala gi-docgen cargo-update-recipe-crates ptest-cargo
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 GIDOCGEN_MESON_OPTION = 'docs'
@@ -23,7 +24,8 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 require ${BPN}-crates.inc
 
 SRC_URI += "file://0001-query-rustc-append-RUSTFLAGS-to-rustc-executable.patch \
-            file://0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch"
+            file://0001-Revert-meson.build-do-not-force-disable-gdk-pixbuf-l.patch \
+            file://run-ptest"
 SRC_URI[archive.sha256sum] = "dbd0db40a1179a382fbb8cc930837671b973d722ba106a3dee2aad0fd858e2c4"
 
 UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -58,17 +60,41 @@ LDFLAGS += " -L${B}/rsvg"
 # needed on ubuntu 20.04/debian 11 to avoid 'undefined reference to `dlsym'' errors
 BUILD_LDFLAGS += " -ldl"
 
-PACKAGECONFIG ??= "gdkpixbuf"
+PACKAGECONFIG ??= "gdkpixbuf ${@bb.utils.contains('PTEST_ENABLED', '1', 'apitest', '', d)}"
 PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "-Dpixbuf-loader=enabled,-Dpixbuf-loader=disabled,gdk-pixbuf-native"
 PACKAGECONFIG[vala] = "-Dvala=enabled,-Dvala=disabled"
+PACKAGECONFIG[apitest] = "-Dtests=true,-Dtests=false"
 
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux
 	rm -f ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.a ${D}${libdir}/gdk-pixbuf-2.0/*/loaders/*.la
 }
 
+do_compile_ptest_cargo:prepend() {
+    # The packageconfig is for meson, but the rust tests are compiled directly with cargo,
+    # so these arguments don't apply. Note that this is Python, the intendation is intentional.
+    d.setVar('PACKAGECONFIG_CONFARGS', '')
+}
+
+do_compile_ptest:prepend() {
+	# rsvg-convert is the tested binary, which shouldn't be executed as a test.
+	# Beside this, it is not bit-identical to the actual rsvg-convert binary, so
+	# remove it from this list, as create  a symlink to the real thing from run-ptest script
+	sed -i '/rsvg-convert$/d' ${CARGO_TEST_BINARIES_FILES}
+}
+
+do_install_ptest:append() {
+	install -d ${D}${PTEST_PATH}/api_test/bin
+	cp -r ${S}/rsvg/tests ${D}${PTEST_PATH}
+	cp -r ${S}/rsvg_convert/tests ${D}${PTEST_PATH}
+	install ${B}/librsvg-c/tests-c/api ${D}${PTEST_PATH}/api_test/bin
+	# the api tests look for the required files in rsvg folder, so simulate it
+	# with a symlink that points to the current folder
+	ln -s . ${D}${PTEST_PATH}/rsvg
+}
+
 PACKAGES =+ "librsvg-gtk rsvg"
 FILES:rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \

