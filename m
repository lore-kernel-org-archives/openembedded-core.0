Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31DAC3DA7A
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.57319.1671559642910699743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dtJ91pQh;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id o15so9345183wmr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rANEk/igUBBQPK2ulUWi1cuO6QAlkAbEW+eCJMchwYg=;
        b=dtJ91pQhDv+mdFCIJqWFna+2o3PpEiZYkzQqqgbueBTaI3PCWYgAqZ8ln6gv9ggC6y
         ycypX3n6xQfYbWqhChbaDt0MnUo+1wK4RQpi2oGZm88kk2sTQMtAiH8j/g3PLBglpC6b
         B4oO2kw1SHwSMYq7aVeAHETGlifqIf95bHh/lA34yRjZGsH/zwxnge1Q2YnGiyR1vOYE
         QWYVy+DB06Tw9icIXzoceaIfyzc/d96c7wCXl4Dp8/74Z/fZluqtgdgNb5GFVyj++6S7
         BpqV4mCBS6A+Ca7W7VKZvFsdVEmzKOMZ1Uv9WW5HvrUzK2LDOOErrUq3YceiJJUPeFsJ
         IpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rANEk/igUBBQPK2ulUWi1cuO6QAlkAbEW+eCJMchwYg=;
        b=evubz08kqFVjSRYWztqqj9SkuCVVV28dl/asM94gzHSkp8lbWtGyOVejrSIQ6s+gu3
         huDGB0prBZzIo9KULnBqxwRAqalopr/xbMkILZpM3hnDKHiT45ICPhMD5Z2oaViAD2in
         FAjDZSdJjnWKeld8BLSKqS+lCp5f+lYT3ygDh1Skm5sfv6D51KNIMD91mb+3ZLmuAoAi
         d48uTyh1emSkluFe4F67Zmklmc+RLW25BS5Cp3AGjr7fa1KH/Q4uwsPu+/GWxYsjTaV7
         CBKDYMdgYNmf3XOiik10DfOvDu5D29Mu3YqKLq2/T9b+uSpy6eO8D/016XeWrY/GuD7U
         BZPw==
X-Gm-Message-State: AFqh2koEj5Az4H36hNgMFh5iYyXti8tJnN7GqeMzu/qlcVk/BMainhCV
	pUa2u90P8S/U37a19hPiKLYoYdCdcg4=
X-Google-Smtp-Source: AMrXdXv341K+Hqrk+DlZi5zbICWuP6UHyghQwedjqElTO8uNLVn+Um4OMvk9hj/5vyaNsKb9VgLRKQ==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:5c21:dd99 with SMTP id o20-20020a05600c4fd400b003d35c21dd99mr5256558wmq.18.1671559641033;
        Tue, 20 Dec 2022 10:07:21 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:20 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 09/11] cargo: Merge .inc into .bb
Date: Tue, 20 Dec 2022 18:06:10 +0000
Message-Id: <20221220180612.24555-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174869

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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


