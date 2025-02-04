Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B02C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:42:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.113302.1738665735177037233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FDzUzMZr;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so53948015e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738665733; x=1739270533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOY04z60SClxf2PZTNt9j2qPFecvSheR0Y3fv7CdaKY=;
        b=FDzUzMZrbgHn+IyPRhBwJ67gP0CONK0haRWCUNmQWa4DXgg066OWeUt4YTtssesFE1
         DwmHD1oA9dswQhO2Ta4YHQkFKnEGMAVKYU2Aq97ateK2Nkh7hJZDO84vwlVphj6dwBQn
         4nhKenqhuzHuiKUt51WLJfchf1EyDebAcqjjMdQjLZllUJM9Gcuh5dN0nhxjqQdlZvjc
         o1DhaUn/Synvgr6imoJCYZo/vHI3NH2rPlq9FbkdizTbuN1bm5rvpjmSXvF0dIVYOtOZ
         zIGu5zzisoFL9quXZY49GOG+/qA6SJmz4UbempW3xpskC1weICib5Db/tBGJ0xPq9OZI
         d8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665733; x=1739270533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOY04z60SClxf2PZTNt9j2qPFecvSheR0Y3fv7CdaKY=;
        b=FP7ESsfnz97CSzYfXKX3aT8xo2NV6198ITIan4sHalF2mfaoWrx44QPs1V0L5fvWbH
         0ZDTqmuBMnRhoVjSTqFPEEfVN1kaZu5+qe8BNeXmAq4aNkZNRl9H/oxZWC+5ke/i/2He
         6vjfzh2Bw4GsklPoIeCrNZ9+/r7BJeOJgTVrLmscbzCZt4uN3sx7WMgFrQ3BXoV/M/5O
         06gXGlo0LCCoTbAzPbUYkP4QL6PiKy2FH1Q4+nBm8JUtvyUG7tbgBAxp8VytkIgE2xsY
         8ZQnNythCkotfvKXoNqGBHSqts9SU0FjADwfovs35ZYguzfZ9N/HJCk8/xrFUmcKaeQS
         e1YA==
X-Gm-Message-State: AOJu0YynLufCHQOuq6FmTYxPAf6ojGlHssIbySiOIYvtS5O1rPNCy8Wd
	D3LFLrR9SVEwhgkvdiTJ2f2zXGt1kAD8FOuVC8B678CincMD+V3KHs8qCg==
X-Gm-Gg: ASbGncuUHweZ/4DLiWiumghEOkRRedszphgXNcPoMV2gApOgjHIJdEbNkLLPlDAoS8f
	K8ZDfbALenNDnXX8yermiRYcMydM3IndcnSpFFYqAgu8v4q054YyABfoXTKwGRSni5tBez0hpLh
	MHhN38baiJ0Bd0Xif9sQCzNpfGQI0fw7MWJK/Dk7N2PR2DyHYG8M5GqHkcroQt986tDzFWgOk+c
	p90SI4n+iE9J3JQMf5UBGCqmvMPPaeEPRqzzmYsEXL6Ks76Kg9FJn9mCB2mpLC1/lUMmtMzSHsU
	66szY3fwAyJZBVbEBkntvQTEAvztF/1wYTMS6BBd5xuJTg0Q8cUW
X-Google-Smtp-Source: AGHT+IGeEZqX+PJPPRRzoOCnt+O7nGxicfzuIg94ow/IzSQvZBiEZhydysxPZfTt02fcEaD96UEsLg==
X-Received: by 2002:a5d:47c9:0:b0:38c:3eab:2e17 with SMTP id ffacd0b85a97d-38c5194dae9mr19402119f8f.2.1738665733068;
        Tue, 04 Feb 2025 02:42:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81589sm219738965e9.33.2025.02.04.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:42:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] rust: restore parallel builds, disable lto only for rustdoc
Date: Tue,  4 Feb 2025 11:42:05 +0100
Message-Id: <20250204104205.3423548-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210763

From: Alexander Kanavin <alex@linutronix.de>

The original reproducibility fix was problematic for a couple reasons:

- disabling both lto and parallel builds had an unfortunate effect of nearly
doubling rust-native and rust build times (which are slow to begin with).
Disabling lto hurts runtime performance too.

- both of these things were done for the *entire build*, while the only
problematic item is the librustdoc crate.

- lto=off option in config.toml has an effect only on building rustc
(the compiler itself), and doesn't help with rustdoc reproducibility.
Actual fix is the codegen-units setting, which indirectly disables
lto via giving llvm only one unit to work with at a time.

After some digging, here's a more targeted fix for the problem.

Why librustdoc is non-reproducible, but not anything else
remains a mystery, hidden deep in rust-llvm's lto optimization code.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...teps-tool.rs-switch-off-lto-for-rust.patch | 46 +++++++++++++++++++
 ...ue-fix-cargo-config-for-codegenunits.patch | 26 -----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 meta/recipes-devtools/rust/rust_1.81.0.bb     |  1 -
 4 files changed, 47 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
 delete mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch

diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
new file mode 100644
index 00000000000..e63cfb07198
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
@@ -0,0 +1,46 @@
+From ce68809d41291f671b440abce41f8f71c95428aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 3 Feb 2025 20:06:46 +0100
+Subject: [PATCH] src/core/build_steps/tool.rs: switch off lto for rustdoc
+
+For reasons currently unknown, librustdoc binary ends up with
+non-reproducible .llvm.<number> suffixes in its symbols - but
+not any other binary.
+
+Disabling lto avoids creating these suffixes. More info about the option:
+https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
+
+As seen below, there's a comment in the source tree saying not to tweak the options
+but this only creates a mix of lto and non-lto optimized binary objects from
+various crates, which should be safe to mix.
+
+Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/134589]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/bootstrap/src/core/build_steps/tool.rs | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootstrap/src/core/build_steps/tool.rs b/src/bootstrap/src/core/build_steps/tool.rs
+index 087df2f8a..00790affb 100644
+--- a/src/bootstrap/src/core/build_steps/tool.rs
++++ b/src/bootstrap/src/core/build_steps/tool.rs
+@@ -635,7 +635,7 @@ impl Step for Rustdoc {
+         }
+ 
+         // NOTE: Never modify the rustflags here, it breaks the build cache for other tools!
+-        let cargo = prepare_tool_cargo(
++        let mut cargo = prepare_tool_cargo(
+             builder,
+             build_compiler,
+             Mode::ToolRustc,
+@@ -645,6 +645,7 @@ impl Step for Rustdoc {
+             SourceType::InTree,
+             features.as_slice(),
+         );
++        cargo.rustflag("-Clto=off");
+ 
+         let _guard = builder.msg_tool(
+             Kind::Build,
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
deleted file mode 100644
index 0aab8772eb2..00000000000
--- a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-rust: rustdoc reproducibility issue fix
-
-rust: rustdoc reproducibility issue fix
-
-The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
-To fix this the codegen-units & the lto options are disabled.
-
-More info about options:
-https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
-https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
----
---- a/.cargo/config.toml
-+++ b/.cargo/config.toml
-@@ -3,3 +3,7 @@
-
- [source.vendored-sources]
- directory = "vendor"
-+
-+[profile.release]
-+codegen-units = 1
-+
-
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 8484c94ef8b..83355935fcc 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,10 +4,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
             file://rv32-cargo-rustix-0.38.28-fix.patch;patchdir=${RUSTSRC} \
-            file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
+            file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "36217ef7e32f40a180e3d79bd666b4dfdaed49dd381023a5fb765fd12d0092ce"
 
diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-devtools/rust/rust_1.81.0.bb
index 288b0fbb443..1038c275f6d 100644
--- a/meta/recipes-devtools/rust/rust_1.81.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
@@ -136,7 +136,6 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
-    config.set("rust", "lto", "\"off\"")
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.39.5


