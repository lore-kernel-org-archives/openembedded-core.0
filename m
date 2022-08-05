Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88135C3F6B0
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6701.1659705199070377879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g61+dJrQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id q30so3182206wra.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=1F9m6E0GJEZi2ZJ/R/i2ot8u2oBB2TmMz7+MZsSQC7g=;
        b=g61+dJrQpZeeHnw8iT+OCKfngQwK7J14tDTCOZ+vNVjXRcSXv6ysEz/Ak7oOtdOWoP
         b5qZYbJns/Pa7QgV8dqsddIOIzYPchS6yPcfvfXwePpTxzicAb2/fqDwt01NFNoyrxBR
         3+r+8QfKbEfEAN3ui25B3mDQ1ZGwZdPaIItyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=1F9m6E0GJEZi2ZJ/R/i2ot8u2oBB2TmMz7+MZsSQC7g=;
        b=wNzLCKgcKnd/avMIxXMkFGEsxxL1wpkzBDwcAkiL1RQoH/Qelf8vbaFZ5cYbo11wqG
         dWU/fK/yByIw+reK9U3zSsGgJjrWJSemk1er5MGx7BG0kNaBlsf3OawxYxnMy4wVmVzh
         T44zRt+mY7cLhE3bJEKxbxeJaszoD3p1fPoIZrdJL7lbi/GTEyrMCP3/ee5DjssrxzRI
         0ToAukIsWfatmIhCYBEO+qI8Oq7fhoPFYobl8SDUCcwJo1G7GlWDtUo0u5SLOmygd6ln
         t436fEo3LHg3EZl00U1T1+LbHucxcfWh+yNpha/sWlmNy7rQGpWwAb400/AKE+pjZIwy
         GkgQ==
X-Gm-Message-State: ACgBeo2amKVQkaj6KnYcI9O7lGtNtO+BkewTUxVnf9UqMbSGe9YuIXq6
	ziPIGOydPwdJWK+PABbEai77QgMPn3DZ1A==
X-Google-Smtp-Source: 
 AA6agR4oP7gILeOf7q2jztl2r/3hf/XVY30s5vsWz4MEKOjLcEMOEx7QGiUErtF3zyX5Lg9JcJRwOA==
X-Received: by 2002:a05:6000:1a53:b0:220:77d7:75f8 with SMTP id
 t19-20020a0560001a5300b0022077d775f8mr4482446wry.0.1659705197201;
        Fri, 05 Aug 2022 06:13:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/29] cargo: Drop cross-canadian variant and fix/use
 nativesdk
Date: Fri,  5 Aug 2022 14:12:46 +0100
Message-Id: <20220805131252.3706794-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168957

The cargo-cross-candian variant made no sense as one version of cargo in
the SDK can work for all targets. Replace it with nativesdk-cargo instead.

Move the SDK env to rust-cross-canadian.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../packagegroup-rust-cross-canadian.bb       |  3 +-
 .../cargo/cargo-cross-canadian.inc            | 85 -------------------
 .../cargo/cargo-cross-canadian_1.62.0.bb      |  6 --
 meta/recipes-devtools/cargo/cargo.inc         |  5 ++
 meta/recipes-devtools/cargo/cargo_1.62.0.bb   |  1 +
 .../rust/rust-cross-canadian.inc              | 37 ++++++++
 7 files changed, 44 insertions(+), 94 deletions(-)
 delete mode 100644 meta/recipes-devtools/cargo/cargo-cross-canadian.inc
 delete mode 100644 meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e20275c6746..b563c517962 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -90,7 +90,6 @@ RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-cargo-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 0d4f5ec9ef2..6d324002a1a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -6,12 +6,11 @@ inherit cross-canadian packagegroup
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 RUST="rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-CARGO="cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 RUST_TOOLS="rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
     ${@all_multilib_tune_values(d, 'RUST')} \
-    ${@all_multilib_tune_values(d, 'CARGO')} \
+    nativesdk-cargo \
     rust-cross-canadian-src \
     ${@all_multilib_tune_values(d, 'RUST_TOOLS')} \
 "
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
deleted file mode 100644
index a2fac929d45..00000000000
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Cargo, a package manager for Rust cross canadian flavor."
-
-RUST_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
-
-HOST_SYS = "${HOST_ARCH}-unknown-linux-gnu"
-CARGO_RUST_TARGET_CCLD = "${RUST_BUILD_CCLD}"
-
-inherit rust-target-config
-require cargo.inc
-
-CARGO = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
-BASEDEPENDS:remove = "cargo-native"
-
-export RUST_TARGET_PATH="${WORKDIR}/targets/"
-
-RUSTLIB = " \
-	-L ${STAGING_DIR_NATIVE}/${SDKPATHNATIVE}/usr/lib/${TARGET_SYS}/rustlib/${HOST_SYS}/lib \
-"
-
-DEPENDS += "rust-native \
-            rust-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-            virtual/nativesdk-${HOST_PREFIX}compilerlibs \
-            nativesdk-openssl nativesdk-zlib \
-            virtual/nativesdk-libc \
-"
-
-inherit cross-canadian
-
-PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
-RUST_TARGETGENS = "BUILD HOST"
-
-do_compile:prepend () {
-	PKG_CONFIG_PATH="${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
-}
-
-create_sdk_wrapper () {
-        file="$1"
-        shift
-
-        cat <<- EOF > "${file}"
-		#!/bin/sh
-		\$$1 \$@
-		EOF
-
-        chmod +x "$file"
-}
-
-do_install () {
-    SYS_BINDIR=$(dirname ${D}${bindir})
-    install -d "${SYS_BINDIR}"
-    install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${SYS_BINDIR}"
-    for i in ${SYS_BINDIR}/*; do
-	chrpath -r "\$ORIGIN/../lib" ${i}
-    done
-
-    # Uses SDK's CC as linker so linked binaries works out of box.
-    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
-
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
-    ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
-	EOF
-}
-
-PKG_SYS_BINDIR = "${SDKPATHNATIVE}/usr/bin"
-FILES:${PN} += "${base_prefix}/environment-setup.d ${PKG_SYS_BINDIR}"
-
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
deleted file mode 100644
index 63fd69107be..00000000000
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require recipes-devtools/rust/rust-source.inc
-require recipes-devtools/rust/rust-snapshot.inc
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/cargo-${PV}:"
-
-require cargo-cross-canadian.inc
diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index 978504052b9..e34554a9d78 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -56,3 +56,8 @@ export LIBSSH2_SYS_USE_PKG_CONFIG = "1"
 # so we must use the locally set up snapshot to bootstrap the build.
 BASEDEPENDS:remove:class-native = "cargo-native"
 CARGO:class-native = "${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo"
+
+DEPENDS:append:class-nativesdk = " nativesdk-rust"
+RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/lib/rustlib/${RUST_HOST_SYS}/lib"
+
+
diff --git a/meta/recipes-devtools/cargo/cargo_1.62.0.bb b/meta/recipes-devtools/cargo/cargo_1.62.0.bb
index eee58fc2452..5c8527708cb 100644
--- a/meta/recipes-devtools/cargo/cargo_1.62.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.62.0.bb
@@ -2,3 +2,4 @@ require recipes-devtools/rust/rust-source.inc
 require recipes-devtools/rust/rust-snapshot.inc
 require cargo.inc
 BBCLASSEXTEND = "native nativesdk"
+RUSTLIB_DEP:class-nativesdk = ""
\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8bbbd61bdc3..677bd8842c6 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -16,6 +16,18 @@ do_compile () {
     rust_runx build --stage 2
 }
 
+create_sdk_wrapper () {
+        file="$1"
+        shift
+
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
+
+        chmod +x "$file"
+}
+
 do_install () {
     # Rust requires /usr/lib to contain the libs.
     # Similar story is with /usr/bin ruquiring  `lib` to be at the same level.
@@ -51,6 +63,11 @@ do_install () {
     # Remove executable bit from any files so then SDK doesn't try to relocate.
     chmod -R -x+X ${SRC_DIR}
 
+
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    install -d ${SYS_BINDIR}
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
+
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
@@ -61,6 +78,26 @@ do_install () {
 	EOF
 
     chown -R root.root ${D}
+
+    ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${ENV_SETUP_SH}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+        # Init the default target once, it might be otherwise user modified.
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
 }
 
 PKG_SYS_LIBDIR = "${SDKPATHNATIVE}/usr/lib"
-- 
2.34.1


