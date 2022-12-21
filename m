Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE57C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.30960.1671657443193836384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pgf/bL5y;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id y16so16225623wrm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=pgf/bL5y/zef5BFRoRCb9Yewta3BqjAOUQ98JBVtsdRYWMOjh3rIfsqZCnDrb8QN+X
         B2Qv4iDd4a0Yzj0PgxLZlzXaF3hl2/N2FoGqcx2VKyNfK+AKDiTD4OHO9Ce7Y/+ggA6a
         J4a9PyW9AHjGMiUkSpyHSAODr4q6NMOnCTJbmH76WIPp5QY3wRgPNRL6xS6nhqxcb4i1
         tKrV4pGkPgfRy9PF0N38p7yP8I2LGl5qvE5y4MvxK5xY/zN9PGuyAnklpF+UerPfFYkq
         scmAXQns9uLgYFZ1LgGUiC9AY5EBbKOCZXseZjBgf7ewXNnJBqEDpiXhlJVdBLzQUB7G
         IIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=cOERwrQStlqykq/m42eijd58I5I0Ak5WUnjUdcpIDgZ3vaGzkMot8mIjdVyTg0Lz4t
         185bkVXBamdSZrCy4/aO26c39P34z6CXBQUMTagXDby7BssvMEOvB3H1NBYaslH7BiAx
         jMrvmfaijGz0l193/FhDYvYIldm3/91r+gMMJz7SOU8u2Jkd4Zffjbmy+jGxGDDxyUUN
         yFhLgb5dwj1WSYGCg+ZOWCU8hZyTCvstjwRJpc0mbVv8A3NX1PsAIxxkGWfivJvHHb4P
         grc90i4TJHchzbF/4pEwQ7BWGAzTc1YYaKTHoEeWeO3kHlwQyxC8szyUiRV7SutsYaz4
         /+nA==
X-Gm-Message-State: AFqh2krMpE/dXm7qUOW1Bejbkf37L2nz8w4+PJoYNAb9TCibgSL8hJsM
	oJEctIhLMSB+A94cP8I1uPkZ3Ps58kw=
X-Google-Smtp-Source: AMrXdXuO7agwHekziJefvDPxcsr6UPVxCchZMJoXbdNlt1nFxdqC6coxtBHa4CS9y8+6kF+PpfAdPA==
X-Received: by 2002:adf:f00c:0:b0:242:4d1a:aa36 with SMTP id j12-20020adff00c000000b002424d1aaa36mr2173758wro.56.1671657441445;
        Wed, 21 Dec 2022 13:17:21 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:20 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 06/10] cargo: Merge .inc into .bb
Date: Wed, 21 Dec 2022 21:17:02 +0000
Message-Id: <20221221211706.25347-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174946

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


