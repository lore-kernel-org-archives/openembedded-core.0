Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3A0C46467
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.126055.1672005572286435701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JEoWQhRU;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id u19so23077569ejm.8
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=JEoWQhRUZMVum7pYPxyf8dj5AW0o5Hry3IT1QDyOH+JOX9LagQc5pWGVg54B7yGT+5
         zMS2JC7Vq7XYk00nrBAktjXMci8Sp1ANQ/OMV9ePRcyOaslw/gfXnRQg5eN9fQjubdyb
         K7WlMPJ35CHnxCAVq1SM/EQw8JVu7xxuPyedwqroX4pwU+7ZD9VEmE6HRkQvqsc6oAmZ
         hP3WiSAqpLTfjs323Z4PRR+JKFCNb09bsLYJTfyKYfbN+OBpU8ZdMVwUxhi38u9S5FlH
         FkJlAbZ2Lv0w4AKpvi7pYGLd1EKxnwlpfSZRBXpkMJ9URGTcxV/m6REmwPiQ4U30ps1n
         ZNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=2dmgtSzsmVptNtMTSwvRHZBpmjdaP5HIDOi9JuHTSEFHt1qQsJi6cbUF8YcL0XOFKY
         fh3OX4pSCLllD1HE5utFXWpu1hGGc7TjHHjmiKOtNp8TxRFCHjc8BP4ZnNv6NYrKYrxh
         mtlAYz718XFGlqj4iRxQN1yR2hGSXZeC7OpEV9BpoUFW5lx89VB/gE5NDPXnZFBT6aFl
         xPhmX3W8PVdesfJbJiq/y2/fkIdFphWvAbgdPkJS7qS9i/BX/imyCkaTmF2MlE/F3ihO
         NRz3eFyG9AoNx309gdJdJ2qifP2Uyx3p6foUs4WQKAx8/tP2XEVKQNLnfxlr8LHEVvkC
         ohIw==
X-Gm-Message-State: AFqh2kqfKVF6hBrlNZ6q5aBDI1Fw+/CCqQHfM9qXvRHeGu7iSt8PycHp
	Lngj9P361RumcJ8n/xYoGwd9oR9Hp9A=
X-Google-Smtp-Source: AMrXdXvKSTI/U773Le2L7fI1I5AdvNQDMepYEC+BORBO6H3tsthMiFpVjYTsUjAPDKNToadjYOgwTA==
X-Received: by 2002:a17:907:8b89:b0:7c1:6f86:eeb with SMTP id tb9-20020a1709078b8900b007c16f860eebmr12587652ejc.7.1672005574867;
        Sun, 25 Dec 2022 13:59:34 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:34 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 05/11] cargo: Merge .inc into .bb
Date: Sun, 25 Dec 2022 21:59:15 +0000
Message-Id: <20221225215921.12868-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/cargo/cargo.inc       | 69 --------------------
 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 71 ++++++++++++++++++++-
 2 files changed, 69 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/cargo/cargo.inc

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
deleted file mode 100644
index 40421df4f76d..000000000000
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY ?= "Cargo, a package manager for Rust."
-HOMEPAGE = "https://crates.io"
-LICENSE = "MIT | Apache-2.0"
-SECTION = "devel"
-
-DEPENDS = "openssl zlib curl ca-certificates libssh2"
-
-LIC_FILES_CHKSUM = " \
-    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
-    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
-    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
-"
-
-
-S = "${RUSTSRC}/src/tools/cargo"
-CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
-EXCLUDE_FROM_WORLD = "1"
-
-inherit cargo pkgconfig
-
-do_cargo_setup_snapshot () {
-	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
-	# Need to use uninative's loader if enabled/present since the library paths
-	# are used internally by rust and result in symbol mismatches if we don't
-	if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
-		patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
-	fi
-}
-
-addtask cargo_setup_snapshot after do_unpack before do_configure
-do_cargo_setup_snapshot[dirs] += "${WORKDIR}/${CARGO_SNAPSHOT}"
-do_cargo_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
-
-
-do_compile:prepend () {
-	export RUSTC_BOOTSTRAP="1"
-}
-
-do_install () {
-	install -d "${D}${bindir}"
-	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
-}
-
-do_install:append:class-nativesdk() {
-	# To quote the cargo docs, "Cargo also sets the dynamic library path when compiling
-	# and running binaries with commands like `cargo run` and `cargo test`". Sadly it
-	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
-	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
-	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
-}
-
-# Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
-# as shipped by Yocto Dunfell.
-# According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
-# libgit2-sys and arbitrary system libgit2 versions, so better keep this turned off.
-#export LIBGIT2_SYS_USE_PKG_CONFIG = "1"
-
-# Needed for pkg-config to be used
-export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
-
-# When building cargo-native we don't have cargo-native to use and depend on,
-# so we must use the locally set up snapshot to bootstrap the build.
-BASEDEPENDS:remove:class-native = "cargo-native"
-CARGO:class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
-
-DEPENDS:append:class-nativesdk = " nativesdk-rust"
-RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/lib/rustlib/${RUST_HOST_SYS}/lib"
-
-
diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index 5c8527708cb3..6c167c0c5f0b 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -1,5 +1,72 @@
+SUMMARY ?= "Cargo, a package manager for Rust."
+HOMEPAGE = "https://crates.io"
+LICENSE = "MIT | Apache-2.0"
+SECTION = "devel"
+
+DEPENDS = "openssl zlib curl ca-certificates libssh2"
+
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d \
+    file://LICENSE-APACHE;md5=71b224ca933f0676e26d5c2e2271331c \
+    file://LICENSE-THIRD-PARTY;md5=f257ad009884cb88a3a87d6920e7180a \
+"
+
 require recipes-devtools/rust/rust-source.inc
 require recipes-devtools/rust/rust-snapshot.inc
-require cargo.inc
+
+S = "${RUSTSRC}/src/tools/cargo"
+CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit cargo pkgconfig
+
+do_cargo_setup_snapshot () {
+	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
+	# Need to use uninative's loader if enabled/present since the library paths
+	# are used internally by rust and result in symbol mismatches if we don't
+	if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+		patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
+	fi
+}
+
+addtask cargo_setup_snapshot after do_unpack before do_configure
+do_cargo_setup_snapshot[dirs] += "${WORKDIR}/${CARGO_SNAPSHOT}"
+do_cargo_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
+
+
+do_compile:prepend () {
+	export RUSTC_BOOTSTRAP="1"
+}
+
+do_install () {
+	install -d "${D}${bindir}"
+	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
+}
+
+do_install:append:class-nativesdk() {
+	# To quote the cargo docs, "Cargo also sets the dynamic library path when compiling
+	# and running binaries with commands like `cargo run` and `cargo test`". Sadly it
+	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
+	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
+	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+}
+
+# Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
+# as shipped by Yocto Dunfell.
+# According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
+# libgit2-sys and arbitrary system libgit2 versions, so better keep this turned off.
+#export LIBGIT2_SYS_USE_PKG_CONFIG = "1"
+
+# Needed for pkg-config to be used
+export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
+
+# When building cargo-native we don't have cargo-native to use and depend on,
+# so we must use the locally set up snapshot to bootstrap the build.
+BASEDEPENDS:remove:class-native = "cargo-native"
+CARGO:class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
+
+DEPENDS:append:class-nativesdk = " nativesdk-rust"
+RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/lib/rustlib/${RUST_HOST_SYS}/lib"
+RUSTLIB_DEP:class-nativesdk = ""
+
 BBCLASSEXTEND = "native nativesdk"
-RUSTLIB_DEP:class-nativesdk = ""
\ No newline at end of file
-- 
2.39.0


