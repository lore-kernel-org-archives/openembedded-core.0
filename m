Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FB6C021A0
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.9250.1739023517604026512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b+iLnwL1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so70675095ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023517; x=1739628317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP0XDbpP6++8n/NBVSMBHGgbtPgyOJhjZNvaE9JSrAA=;
        b=b+iLnwL1qtsZN5tZD2TxCe0HvSzUqhWdbwxOD8oNmw8yxS+lRZMuGLdxkA+yRK8mwx
         ozy7iy5TP2recCHXBxQEPsKb5PCn+5/rKrqhJvpccQWIrn9aeG7DRRLxDTWOqeOfnbt1
         RnsTcV+9bct6ohXIdRjolFffLxWMVAvNnWd+M1Ixk3Ong89W1dLoJKmcjqrrH/GcprG3
         qpjjJ5Y9sn3j+X2dbmd2kuGcw/eGvYb+m4bE3G9lH67wUyw/DrWUch8qvnoAaK6jhzig
         rJCkH9kzV2Zs0XvxKh9cWLohljGba62Ng2xoSNu58h4RLoebwjRdFnhK7ulzURq+eR2f
         SOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023517; x=1739628317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gP0XDbpP6++8n/NBVSMBHGgbtPgyOJhjZNvaE9JSrAA=;
        b=mYm5g/Beug/1Zr1QFgQqmo39koDE/KIdmUcY7Wonn9kytI4fuXeUruYxQ/KmQ1gs67
         R3b1T6j597S91N/mnEl07QyagXR2G/2FF2UfpMCOfaw/Sp2j7RHRzWYcUfIcXHF5diaQ
         JC8LMwC4X0S+opWiEdxwwdYWwLaWOVkQ1cn19zhwWCI/F6dUEp0b608bnIcDHCcFk605
         WrluPT1SbVnd6v9xCrxAEz6ZTssy2m34QEhjIx//onDmlNPMgFDbQjsqC72zQb4RJCUV
         CPY9nhgjFQCSz4ec4xKAMN1dso9iq3MrOwouNN/lvSrQ1lJp9nE1mfbM3uOfqsp1KfdO
         T9EA==
X-Gm-Message-State: AOJu0YynC5ueOBnau18Jmoiq7QZp4gmX98BHmzYoMXumPfcN9wQtG/px
	v9KuHDOJfgszEZq2gI/sX4JS4HL8b9AwxcxXEG0zIQUOuwY2eslI5x6IsiKYTq+KsqHDBPyPw/K
	n
X-Gm-Gg: ASbGnctKumTUXGIpB06ewhSnYHRPUD5CLGCufknL4C+Ef9iN2cJ6+pdU6f3L7BdKb+u
	mBF1cR5QaLsKUATRNDM9CGO/aY3IH0zptgaIoN/LXyNG4yLCC/lhzawObDDWYtAh85+x5HoeXsN
	hPruIcCb3/CrndqArd7bByu4RiL/4/ZYUErt/IXXX6Oznjp0VgPnHvV2pDO4M/0ANC7Rd07cvi2
	zbro52WhYX68ur1QKKeGVya8vhrIaWyNol1zDl7rZNs/BuE4QLv4IPHx97fu6+ygl4O+zYIy3tw
	GzIN
X-Google-Smtp-Source: AGHT+IFReZvfGNYIG0T+MQkPfgJngvdAHxmYDkvIZscXsKBqQeyBSCAklj3IdWbRdtqjXZvX8K0Ucg==
X-Received: by 2002:a17:902:ce06:b0:20c:6399:d637 with SMTP id d9443c01a7336-21f4e78de85mr143012495ad.40.1739023516835;
        Sat, 08 Feb 2025 06:05:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/13] rust: fix for rust multilib sdk configuration
Date: Sat,  8 Feb 2025 06:04:56 -0800
Message-ID: <889cda30baccd43e5c82b38752b462aef4ce626c.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211029

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location.
This causes below error while installing the lib32 & lib64 binaries:

Error: Transaction test error:
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
 rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
  file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk)
failed with exit code '1'

The change includes:
- Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
- Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust',
instead of being managed by the cross-canadian recipe.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=40eb4bfe2f100ba5301046ca25110fcc55a640bb

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/cargo_1.75.0.bb         | 13 +++++++++++++
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 +---------
 meta/recipes-devtools/rust/rust_1.75.0.bb          | 12 ++++++++++++
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index 50b7e7c7b4..a6d3f1754b 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -50,8 +50,21 @@ do_install:append:class-nativesdk() {
 	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
 	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
 	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+	
+	ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+	mkdir "${ENV_SETUP_DIR}"
+	CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+	
+	cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	# Keep the below off as long as HTTP/2 is disabled.
+	export CARGO_HTTP_MULTIPLEXING=false
+	
+	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8a51a02293..4e2e051f1d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -53,15 +53,12 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
@@ -80,11 +77,6 @@ do_install () {
 		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
 		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
     fi
-
-	# Keep the below off as long as HTTP/2 is disabled.
-	export CARGO_HTTP_MULTIPLEXING=false
-
-	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
 	EOF
 }
 
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b041a5f8e4..b9348bf050 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -270,8 +270,20 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'riscv64', 'ld-linux-riscv64-lp64d.so.1', '', d)}
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
+	EOF
 }
 
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
 rust_do_install:class-target() {
     export PSEUDO_UNLOAD=1
-- 
2.43.0


