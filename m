Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90591C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:21:17 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.10987.1715858475996745622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X08Ukxbs;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b81d087aso268051166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858474; x=1716463274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SmRgHmvopiNMlB0ESLKg+BaG2pXfO29SQwCiabAuGU=;
        b=X08UkxbsP6EJ8A7xhd2CTcZ1MZc6j4ux13vb9J5/877NRwGmR5OI4iwi7LHnmpvbLD
         YlzPljitxOY48dUeZLSGyREOOWUvmUvcMSRnAF2ILXYWlqGigVxv+7a76/lYem6LW6Bq
         58qfwwwn9tM7xZ8dsneC3osV2tH7eTTypEK4IizFZGHeGUkyKv3X0ZCp0waXuV7BkZIL
         IotoLWvdlb8n64qvV0BmYzimO6V+kHguMgAdU7k2FoHLIT4SUoqCSH/SnTsI44gG3ouw
         z4qXKvNTu6UrRiwEv5g5KW1JittqUwWQm1cz3My9KsEN6275+xFux66lByLgL4UmU6y+
         ClJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858474; x=1716463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SmRgHmvopiNMlB0ESLKg+BaG2pXfO29SQwCiabAuGU=;
        b=VVjfJ/ODde2xcWmIf1rOCFHYdEJyJDg+hNxktkFCEKWF6C+B2keEPteXTkQSZyHm2K
         eNNtdjIYxWXKqQSJOHB1z7coBxMb4wHN2gq+s3Vj8KOGMTcoFCbkgO1m/LFdiFlUz3TL
         oQMJyMyc0Q4xgXM6u2bXcR1w0hSImlBN4H/rKvCmrOF0+WlJ1eW81Ncd9NgN0aTy6us7
         DhnzBQJm84hSOwJmBsotld6VudoEz+JcIx7D8lZ308mwvpif5chPig2gp6ZV/EvtD5rf
         m0s0iTh7JOg36JmAWaVouBp/vivJl4nb4r4CAYoK79Hp8f/ycedoH9NO9OssZ1kBlwiE
         Z9yQ==
X-Gm-Message-State: AOJu0Ywkyd2ETdB0q6lYP7lHdHmmeQfgEsoxHOff20w4xiZ84rcy8Imu
	bwc++7u74h6dr6CDzcoIcn9HWXjOkgGJmIQaXfINHigyF+CFh2ukHuegdA==
X-Google-Smtp-Source: AGHT+IEcD/UBcGVCxtNm1p0DICnhWo8PmsIuPS54yq7V6TN2eYmCkvzSg0kKovn65uVJEMt7U2pA5A==
X-Received: by 2002:a17:906:ee81:b0:a59:b1cf:fea0 with SMTP id a640c23a62f3a-a5a2d55eef4mr2334433166b.19.1715858474139;
        Thu, 16 May 2024 04:21:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdcd149c5sm131254866b.201.2024.05.16.04.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:21:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] rust: correctly link rust-snapshot into build/stage0
Date: Thu, 16 May 2024 13:21:08 +0200
Message-Id: <20240516112111.2145436-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199464

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


