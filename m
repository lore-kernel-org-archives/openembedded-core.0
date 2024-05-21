Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF2DC25B75
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 12:50:55 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.18798.1716295848374976611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 05:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mn0f8QtM;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52388d9ca98so7398912e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716295846; x=1716900646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SmRgHmvopiNMlB0ESLKg+BaG2pXfO29SQwCiabAuGU=;
        b=Mn0f8QtMt4ML2d+9AQ1RPd0AgNBDS5fCyNFgCVLuvKIA+pVmXWGAUYHTSLraTijc9h
         1a+JbDmfAr9CDx0xfwwdFuC194q2iHiXtWW0OZe8YH5qmAgBvvtfh2NN+zyqO0SKRXgR
         vasqPZpuutNauLNLOD+lO+uyD86sl2hrP8XId5I2gXFVcEJvXGkhTorH//njYsI1CsqT
         R9jY51zyMfqDXfMpQsNFyROspUsZuHcjXwigJtOsAfauhh4plR9T+3kQvicdPW0SAfP+
         PTcU0mV/oK4OzRVWO5tNKH/klI3tdCDUVz4C8mayq2crVZIu9qT/Hm8hsyYFJjos1MYy
         6ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716295846; x=1716900646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SmRgHmvopiNMlB0ESLKg+BaG2pXfO29SQwCiabAuGU=;
        b=XXHjgfJTS1n989D7vh3t1m7Vw1YBdRPG8II1JjPeEn1hC0rYZVJCDjGbRU4+45NfSE
         3xlV4EfsgJ1+ICPdRaLiTwIQ6Ak3k6qkvGnnzs6/68ba1PWf2ikBHy9ilfoyf8fPLfY8
         /55ff7HXpNN85ZdXjOMrw4+m02DeZA0Is5Hlg/rZVvvEzZwxAKXF6DNoiAtbIItax+Hs
         GyK/yH6OainNRagxjbd95T99MxvR0vKjl1eOwJPVrDCT4nGQUTor7QcSbio1IIBORvfE
         lLj2hL/SoHcduA3ZcI4wde0Erco0mtXW6+f/DsyVTkizkwHj/cyvLZs7tRXechPMM9WP
         JWvQ==
X-Gm-Message-State: AOJu0YzqD0YJweeT1DMcbdwSfLovi5d5eDmxPjGbRp/n+awTqhSm+Sn2
	PW5bzWjHAzCUJT9Y1CaVmFWqDR7NpUv4w8ydCEjaJyxCgYd1nFzWcxavFg==
X-Google-Smtp-Source: AGHT+IHDBiXw5RFaCJIpbjqJTvs0vdsmeCFg+Gnc8G8Wb4rIPHDWOTRwFzAr8SeKpsKynnPsJqyuWQ==
X-Received: by 2002:a05:6512:2147:b0:523:b068:a6d4 with SMTP id 2adb3069b0e04-523b068a93dmr9938393e87.45.1716295846377;
        Tue, 21 May 2024 05:50:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d294sm1595584166b.28.2024.05.21.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:50:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/5] rust: correctly link rust-snapshot into build/stage0
Date: Tue, 21 May 2024 14:50:37 +0200
Message-Id: <20240521125041.3611820-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 12:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199632

From: Alexander Kanavin <alex@linutronix.de>

This does not seem to be used in regular builds, but is beneficial
in rust selftest, where it allows dropping a custom patch
that is unsuitable for upstream (and was rejected by them).

Also remove an obsolete comment that seems related to the code
but describes something that was resolved long time ago.

I have confirmed that the rust selftest continues to pass with just
this one commit on top of master (as the following changes do break
the selftest).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../rust/files/cargo-path.patch               | 37 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  6 +--
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch

diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
deleted file mode 100644
index 9a50c402201..00000000000
--- a/meta/recipes-devtools/rust/files/cargo-path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Fix the cargo binary path error and ensure that it is fetched
-during rustc bootstrap in rust oe-selftest.
-
-======================================================================
-ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
-----------------------------------------------------------------------
-Traceback (most recent call last):
-  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
-    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
-  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
-    return build.build_bootstrap_cmd(env), env
-  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
-    raise Exception("no cargo executable found at `{}`".format(
-Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
-
-Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
----
-diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
---- a/src/bootstrap/bootstrap.py
-+++ b/src/bootstrap/bootstrap.py
-@@ -954,9 +954,11 @@
-         if "RUSTFLAGS_BOOTSTRAP" in env:
-             env["RUSTFLAGS"] += " " + env["RUSTFLAGS_BOOTSTRAP"]
-
--        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
--            os.pathsep + env["PATH"]
--        if not os.path.isfile(self.cargo()):
-+        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
-+        if not os.path.isfile(cargo_bin_path):
-+            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
-+            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
-+        else:
-             raise Exception("no cargo executable found at `{}`".format(
-                 self.cargo()))
-         args = [self.cargo(), "build", "--manifest-path",
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b14221b6cb8..c83c8ec3a39 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rv32-missing-syscalls.patch;patchdir=${RUSTSRC} \
             file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
             file://rv32-cargo-rustix-0.38.19-fix.patch;patchdir=${RUSTSRC} \
-            file://cargo-path.patch;patchdir=${RUSTSRC} \
             file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
             file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
             file://target-build-value.patch;patchdir=${RUSTSRC} \
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index 76e1fe2d84a..8ef838ee90c 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -35,8 +35,6 @@ RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-co
 # own vendoring.
 CARGO_DISABLE_BITBAKE_VENDORING = "1"
 
-# We can't use RUST_BUILD_SYS here because that may be "musl" if
-# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
@@ -54,8 +52,8 @@ do_rust_setup_snapshot () {
 
     # Some versions of rust (e.g. 1.18.0) tries to find cargo in stage0/bin/cargo
     # and fail without it there.
-    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
-    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUILD_SYS}/stage0
+    mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
+    ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
 
     # Need to use uninative's loader if enabled/present since the library paths
     # are used internally by rust and result in symbol mismatches if we don't
-- 
2.39.2


