Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B89C53210
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.182566.1672241030905317998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mnnaz3tj;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bx10so15245900wrb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=mnnaz3tjJ7BeIpECrle7+7o8R0qXHl7fkecDOKp2afmgQOVpBBYgNxRwLrdp9Q73S5
         WwKIe443hIS35RF1F2oRWYdNC7J7/oHz4P+4CIXfj9+0kPtgvb8MoXCc8dkZJarUPNU6
         mNloF4K/Q9tKPaeVJ5J3SMSnZK8fsM6kbRFkdPsz4++TXNicnJWRMsOnWqPoSEfj5ktX
         zs/gjoggDLCc17umMOe1gz4x0pNEXVTn6M2HoMrxUwilQXM/levclmCzTxefqIzCopjA
         y8auAInphP+gbEmBpBFMb8VVyVFM435WYbzPkLuBTTcwXdhM2dpq0zsGpeD02eDCZvFX
         jHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXKqORzweSvujDCxv+GaazsPIlo9TE4kGXHlHGAWgvI=;
        b=gIbeSjfO7+9HGGDZhoPIfOoriAN9ImUig5oJpW4/8MX7EBDiEl9dvzNBtj2p2FvVVV
         FD2I3Q6kl2Ne5Sk3GrLlLEk1TVdPTiHAN0N2rCIGCOFekL0f6vSYjdzuGC7w/X8oeu/9
         BdeDzJLbHbjWXfjSWBZnJsN/cR6th6EWDWwWuHyPzO3QFW0vVf2NsbzTIxpMGMAybemE
         YydYG1ZjKPurSO1x9JJ1H/5B6dfNZwQ3SuoTUkTfXl9zfIzE0BXTDkVEs22fVWd/RkBQ
         cZCKNtp6/iGlYf137+TEL+RXzv9jYolZkbSEhR0sV+s/jfLgyRqCE+GpARhAmPk8bRzc
         xZtA==
X-Gm-Message-State: AFqh2kqCcNy6eDJKFrDHNXPqQbvcykWDDCO/UYwMkfmimSTonr9uJRxK
	1sANLcKAj8xO4kw/22+VE3v0xy4Xn0o=
X-Google-Smtp-Source: AMrXdXuVney7FKjwLOyWI0S1m10P6oPoBs6mFxMYDgx2cB0xvFmPzjblkzr8N01z5VMXltEYG/s2Yg==
X-Received: by 2002:a5d:44cf:0:b0:236:c62f:eb70 with SMTP id z15-20020a5d44cf000000b00236c62feb70mr13836397wrr.13.1672241029168;
        Wed, 28 Dec 2022 07:23:49 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:48 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 07/12] cargo: Merge .inc into .bb
Date: Wed, 28 Dec 2022 15:23:29 +0000
Message-Id: <20221228152334.25449-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175077

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


