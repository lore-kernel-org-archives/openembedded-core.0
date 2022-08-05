Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE5EC25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6825.1659705185985244244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cEkxndDI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id bv3so3223126wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=CF3mxMtOl/AMFTtFQaFajW6zuCrxI6fPjDU7urA9OeQ=;
        b=cEkxndDI/smxnEA7J/IHLcqMYUYqkCGhqs7ypIyc9g79wIxdBOYwpmKge+Zg1B0shU
         h4Fm+ty9kWKdq3IjuywAJVG4kAPe/zck26FM5J831wyUh0dJBo9lFbzzBfgMEkPMle5J
         2FtvWxwjNZvpcSb8oD/APam8Na5CBMXhawzwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=CF3mxMtOl/AMFTtFQaFajW6zuCrxI6fPjDU7urA9OeQ=;
        b=Egxd6VmuVASVJW3qBwzLxP4SdLiqq5Ayg/CYRZQ6EKuFbaDTtlY8Gro6ZE71IXutpT
         FLr5jthEDc3eddm/VTnKHOx9+Dd5Tz4nI7Td4bIDTb1/pSFuXU8+bcHgcjlFlLvJUlAJ
         vmxCeT6Offrdx/dvP42Xiw52F6YtWUk/af2PCrhJTxwmbME9ZPJHkGFJTdRBHbqXXM9k
         rpONj9ul8dXSWPnXwH8307j7BkvJTXuS/uIpKdFmO/gJujQy9d2L1xaVTDqMMkWOlThb
         605zgQEfN+U1LuCktwb6SORWYzjkL8vqPs6lhRf1hm+yQYhbXtMA0nKcCRDhaOeMrASY
         R+fA==
X-Gm-Message-State: ACgBeo1H/7zZ8XhDqAsAaTG01CCmmFla/KNCUbfZPEQkGg3sBOvhQIvv
	RrOJxqsv2Ij/uVzvru6iBsrv1kMqLztQng==
X-Google-Smtp-Source: 
 AA6agR56vjDCzhkcfPGrreztCDouwrxOOio3hxboNjEo/MmBQcoP2GD+FPPXKhRkNXp3SACgHfgKCQ==
X-Received: by 2002:adf:e112:0:b0:21d:7195:3a8d with SMTP id
 t18-20020adfe112000000b0021d71953a8dmr4472332wrz.371.1659705199368;
        Fri, 05 Aug 2022 06:13:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/29] rust-cross-canadian: Simplify and fix
Date: Fri,  5 Aug 2022 14:12:48 +0100
Message-Id: <20220805131252.3706794-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168959

Since a copy of rust can target any target and doesn't need to be target
specific, we can simplify rust-cross-canadian to simply contain the json
configuration and envirionment setup scripts.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../rust/rust-cross-canadian-common.inc       | 49 --------------
 .../rust/rust-cross-canadian.inc              | 65 +++----------------
 .../rust/rust-cross-canadian_1.62.0.bb        |  8 +--
 3 files changed, 12 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian-common.inc

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
deleted file mode 100644
index 34020ff6ff4..00000000000
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-
-RUST_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
-
-require rust.inc
-
-DEPENDS += "rust-llvm (=${PV})"
-
-inherit cross-canadian
-
-DEPENDS += "  \
-            virtual/${HOST_PREFIX}gcc-crosssdk \
-            virtual/nativesdk-libc rust-llvm-native \
-            virtual/${TARGET_PREFIX}compilerlibs \
-            virtual/nativesdk-${HOST_PREFIX}compilerlibs \
-            gcc-cross-${TARGET_ARCH} \
-           "
-
-# The host tools are likely not to be able to do the necessary operation on
-# the target architecturea. Alternatively one could check compatibility
-# between host/target.
-EXCLUDE_FROM_SHLIBS_${RUSTLIB_TARGET_PN} = "1"
-
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-                    "
-
-RUST_TARGETGENS = "BUILD HOST TARGET"
-
-INHIBIT_DEFAULT_RUST_DEPS = "1"
-
-export WRAPPER_TARGET_CC = "${CCACHE}${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_CXX = "${CCACHE}${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_CCLD = "${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TARGET_CC_ARCH} ${SECURITY_NOPIE_CFLAGS}"
-export WRAPPER_TARGET_LDFLAGS = "${TARGET_LDFLAGS}"
-export WRAPPER_TARGET_AR = "${TARGET_PREFIX}ar"
-
-python do_configure:prepend() {
-    targets = [d.getVar("TARGET_SYS", True), "{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-    hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
-}
-
-INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
-SKIP_FILEDEPS:${RUSTLIB_TARGET_PN} = "1"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
-
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 677bd8842c6..2b09661542d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -1,20 +1,11 @@
-
-require rust-cross-canadian-common.inc
-
-RUSTLIB_TARGET_PN = "rust-cross-canadian-rustlib-target-${TRANSLATED_TARGET_ARCH}"
-RUSTLIB_HOST_PN = "rust-cross-canadian-rustlib-host-${TRANSLATED_TARGET_ARCH}"
-RUSTLIB_SRC_PN = "rust-cross-canadian-src"
-RUSTLIB_PKGS = "${RUSTLIB_SRC_PN} ${RUSTLIB_TARGET_PN} ${RUSTLIB_HOST_PN}"
 PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-PACKAGES = "${RUSTLIB_PKGS} ${PN}"
-RDEPENDS:${PN} += "${RUSTLIB_PKGS}"
+inherit rust-target-config
+inherit rust-common
 
-# The default behaviour of x.py changed in 1.47+ so now we need to
-# explicitly ask for the stage 2 compiler to be assembled.
-do_compile () {
-    rust_runx build --stage 2
-}
+LICENSE = "MIT"
+
+MODIFYTOS = "0"
 
 create_sdk_wrapper () {
         file="$1"
@@ -30,39 +21,14 @@ create_sdk_wrapper () {
 
 do_install () {
     # Rust requires /usr/lib to contain the libs.
-    # Similar story is with /usr/bin ruquiring  `lib` to be at the same level.
     # The required structure is retained for simplicity.
     SYS_LIBDIR=$(dirname ${D}${libdir})
     SYS_BINDIR=$(dirname ${D}${bindir})
     RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
 
-    install -d "${SYS_BINDIR}"
-    cp build/${SNAPSHOT_BUILD_SYS}/stage2/bin/* ${SYS_BINDIR}
-    for i in ${SYS_BINDIR}/*; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-
-    install -d "${D}${libdir}"
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/*.so ${SYS_LIBDIR}
-    cp -pRd build/${SNAPSHOT_BUILD_SYS}/stage2/lib/${TARGET_SYS}/rustlib ${RUSTLIB_DIR}
-
-    for i in ${SYS_LIBDIR}/*.so; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-    for i in ${RUSTLIB_DIR}/*/lib/*.so; do
-	chrpath -d ${i}
-    done
-
-    install -m 0644 "${WORKDIR}/targets/${TARGET_SYS}.json" "${RUSTLIB_DIR}"
-
-    SRC_DIR=${RUSTLIB_DIR}/src/rust
-    install -d ${SRC_DIR}/src/llvm-project
-    cp -R --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/src/llvm-project/libunwind ${SRC_DIR}/src/llvm-project
-    cp -R --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/library ${SRC_DIR}
-    cp --no-dereference build/${SNAPSHOT_BUILD_SYS}/stage2/lib/rustlib/src/rust/Cargo.lock ${SRC_DIR}
-    # Remove executable bit from any files so then SDK doesn't try to relocate.
-    chmod -R -x+X ${SRC_DIR}
-
+    install -d ${RUSTLIB_DIR}
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
 
     # Uses SDK's CC as linker so linked binaries works out of box.
     install -d ${SYS_BINDIR}
@@ -73,7 +39,7 @@ do_install () {
     ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     cat <<- EOF > "${ENV_SETUP_SH}"
-	export RUSTFLAGS="--sysroot=\$OECORE_NATIVE_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib/${TARGET_SYS}/lib"
+	export RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
@@ -100,16 +66,5 @@ do_install () {
 	EOF
 }
 
-PKG_SYS_LIBDIR = "${SDKPATHNATIVE}/usr/lib"
-PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-PKG_RUSTLIB_DIR = "${PKG_SYS_LIBDIR}/${TARGET_SYS}/rustlib"
-FILES:${PN} = "${PKG_SYS_LIBDIR}/*.so ${PKG_SYS_BINDIR} ${base_prefix}/environment-setup.d"
-FILES:${RUSTLIB_TARGET_PN} = "${PKG_RUSTLIB_DIR}/${TARGET_SYS} ${PKG_RUSTLIB_DIR}/${TARGET_SYS}.json"
-FILES:${RUSTLIB_HOST_PN} = "${PKG_RUSTLIB_DIR}/${BUILD_ARCH}-unknown-linux-gnu"
-FILES:${RUSTLIB_SRC_PN} = "${PKG_RUSTLIB_DIR}/src"
-
-SUMMARY:${RUSTLIB_TARGET_PN} = "Rust cross canadian libaries for ${TARGET_SYS}"
-SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${HOST_SYS}"
-SUMMARY:${RUSTLIB_SRC_PN} = "Rust standard library sources for cross canadian toolchain"
-SUMMARY:${PN} = "Rust crost canadian compiler"
+FILES:${PN} += "${base_prefix}/environment-setup.d"
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
index 766912c019b..55865238ab4 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
@@ -1,6 +1,2 @@
-require rust-cross-canadian.inc
-require rust-source.inc
-require rust-snapshot.inc
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/rust:"
-
+inherit cross-canadian
+require rust-cross-canadian.inc
\ No newline at end of file
-- 
2.34.1


