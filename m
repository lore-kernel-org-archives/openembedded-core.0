Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F5BD232DA
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 04:55:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4024.1767934501777068987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 20:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NS+mZ0+v;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d5c365ceso28435585ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 20:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767934501; x=1768539301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbvtdbI5p+HtSqxzgJ/mbK7DcOmFEG9FQ7LxzqmXAms=;
        b=NS+mZ0+vvqVyaAvsrBh63vAixLv+VW1zSlmjzb2mekMLy90mT8023pIeYWN9+9CwfZ
         Rmp7S5x4k7QFQqa3oW5Nu7G7xvomhgZjDVetkrUd3pViPDA3kP/y4X6EBZU7Kp3SM9N2
         Oo5atDPmkuzTdxex1SV4rBBoXpxLGKwcakT+s0x9xG7pf7pscvGF+hS7WeaOuBjz6tO+
         bsUyPpj4o6rMp1lhYsGVGk5IQN42r15oJ4HZ9wYSBCdYwBsz/llPiAKfBhH2TAJsPccW
         fMQyA5jGsv9/b9YNZaui/sskRdiSuZqrSMvU44PJ3iCvjxBbskQ8gBm6n28UbmsVBTCb
         MvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767934501; x=1768539301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbvtdbI5p+HtSqxzgJ/mbK7DcOmFEG9FQ7LxzqmXAms=;
        b=desJZSznIATdOjXCYoGL/RHRqZZpKv1PpSrhV1gG/aMsknUnKX/kMW9eo/luXYGEQS
         ZvaAvOfnFY+UBIHYaLl7vApzbHO9tpfsLe70w7wkeH+27nmhml0cJHWhDcukU2tJWOe4
         aDRsM+jYsfWWRat88RYQfDGsbzbv7+FPelVzkLncwHhgv6hIDtXyyQZLuWXhkTA1CeW4
         cz/r7phKNKtRSmNu68inArIMKpA46W8HiBqhafTYQkmPRH9IKNIYIRGClnBwN2ezlK5k
         Sv5Q7qWPDMAjxBAQBqtyN/vQHvNF7c9jnMnMhA1KgjCHVGh3+ahbawCmxmWCIe/ZsZT0
         AL9w==
X-Gm-Message-State: AOJu0YyBdl5obqFl9X+m+VkAbF2ws6gIeWCMNtNStek3CpPkb7zMF2ia
	Hh/zN0omA+B0QB+UIkf1r/knvsC+WnNvZ3T1LKHBCZ7zqyuTyIUiITrr0zFy7g==
X-Gm-Gg: AY/fxX6Hu2eUmjP2RQ9PA/m1pP+Tpb/DQN6d7eDpw6kcrRKxnyPAQGfaJunVKggT8qQ
	6WdXTm+b7eKLb+9L3xmwHha9/EO4pd0lPXrSAMNyhxARR8wgP/cc8XxhsPSyH57hbbJgEfSY/wR
	UJFlu1WB1RMcu09x0DjVyKmFp98J5qdFxq0pXKenO8iSBcz4p7mdwBeqH9T2O+ScoKl0DB8d/Lo
	E8ziyVOKT0eQPdRhMa6i9p0XxV/6S3cWR2hOs9mCnqdLGkYZJVqwF2H07d/XjeVxaFlQGwQJFIn
	67RiPHmVEXSYyPEMJ6JKot0InW/QF/aqqMNDm67UAAEOYDZicFxwIylWHsoS53dq2A0oiMLZZPK
	/83FLQJjg0Ni7vjBaGf/mQ0iyrClEX5bYFcEg4YHGvphxIFz0oWNLfdmBqG6OEME3DMb9PHyqoR
	0yjBjJ5Y2lHiQxM5PQj2CZZUqy5AGvkfEktxTK0zOK2EOCAL7w9R/9vs3Ryg/F/IQM6cdy///mz
	YIy/Q0NW6TbmeIEQDA=
X-Google-Smtp-Source: AGHT+IHerQiIu1I67GvCWGr6WOjeyJ26vairHXtkVFKMhXWTBuJHt+71MRWok+I59lUJbei1yei0iQ==
X-Received: by 2002:a17:902:fc43:b0:2a0:ccdb:218d with SMTP id d9443c01a7336-2a3ee442824mr87663885ad.17.1767934500519;
        Thu, 08 Jan 2026 20:55:00 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1922sm9393807a91.4.2026.01.08.20.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:54:59 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [OE-Core][PATCH 1/2] rust: Install the Rust source
Date: Fri,  9 Jan 2026 14:54:46 +1000
Message-ID: <20260109045447.1933604-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 04:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229091

From: Alistair Francis <alistair.francis@wdc.com>

When building the Linux kernel with Rust support enabled the kernel
expects to find the Rust source as the kernel build system will cross
compile the core library.

This patch uses the Rust tooling to install the Rust source when we
install the compiller as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.92.0.bb     |  4 +-
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch

diff --git a/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
new file mode 100644
index 0000000000..e561266d70
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
@@ -0,0 +1,60 @@
+From 2e89bf7969ac6d77b7c6a38265b1eabc8ec6df7a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 9 Jan 2026 08:35:43 +1000
+Subject: [PATCH] bootstrap: Ensure host documentation is built before tarball
+ is created
+
+`run_default_doc_steps()` is called to ensure the documentation is built
+by `Docs::run()` and it should build the documentation if it isn't
+already built.
+
+When running the `install src` command I'm seeing failures as the
+`builder.doc_out(host)` directory does not exist. This is because
+`match_paths_to_steps_and_run()` doesn't actually build any
+documentation as the `paths.is_empty()` causes an early return. This
+results in install failures as the `*/doc` src directory doesn't exist.
+
+This patch passes the paths to `run_host_step_descriptions()` when building
+documentation to ensure it is correctly built.
+
+This fixes installing the Rust source code in OpenEmbedded.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/150845]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ src/bootstrap/src/core/build_steps/dist.rs | 2 +-
+ src/bootstrap/src/core/builder/mod.rs      | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootstrap/src/core/build_steps/dist.rs b/src/bootstrap/src/core/build_steps/dist.rs
+index f47b0c0b007..2fbb068632e 100644
+--- a/src/bootstrap/src/core/build_steps/dist.rs
++++ b/src/bootstrap/src/core/build_steps/dist.rs
+@@ -83,7 +83,7 @@ fn run(self, builder: &Builder<'_>) -> Option<GeneratedTarball> {
+         // FIXME: explicitly enumerate the steps that should be executed here, and gather their
+         // documentation, rather than running all default steps and then read their output
+         // from a shared directory.
+-        builder.run_default_doc_steps();
++        builder.run_host_default_doc_steps();
+ 
+         let dest = "share/doc/rust/html";
+ 
+diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/core/builder/mod.rs
+index 4a04b97c549..16c1c324be0 100644
+--- a/src/bootstrap/src/core/builder/mod.rs
++++ b/src/bootstrap/src/core/builder/mod.rs
+@@ -1117,6 +1117,11 @@ pub fn execute_cli(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(self.kind), &self.paths);
+     }
+ 
++    /// Run all default documentation steps to build documentation.
++    pub fn run_host_default_doc_steps(&self) {
++        self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &self.paths);
++    }
++
+     /// Run all default documentation steps to build documentation.
+     pub fn run_default_doc_steps(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &[]);
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..8a22d484c1 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+            file://0001-bootstrap-Ensure-host-documentation-is-built-before-.patch \
 "
 SRC_URI[rust.sha256sum] = "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
 
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..306661b6e4 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 inherit rust
 inherit cargo_common
+inherit pkgconfig
 
-DEPENDS += "llvm"
+DEPENDS += "llvm openssl"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -282,6 +283,7 @@ do_install () {
 
 rust_do_install() {
     rust_runx install
+    rust_runx install src
 }
 
 rust_do_install:class-nativesdk() {
-- 
2.52.0


