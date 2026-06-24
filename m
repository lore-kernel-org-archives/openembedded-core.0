Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5A9CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:11:54 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3655.1782295903156235249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 03:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=U2Fazsat;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-20260624101138c4cb5e60ff0002079d-bwo8xv@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260624101138c4cb5e60ff0002079d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 24 Jun 2026 12:11:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TJf/Us4ER5ojDm0dX1DxA+WE0dA3aulfNDunnd29Bvk=;
 b=U2Fazsat5NMDSajte69bQh99V4wpFwnWAcWJI6jAo6dRiQ3tn+eGfbFkEz5TuM8TV7/Wz6
 G9rR3LrLleLc/NQFFJ/nVA3TDzp0F763nkmiAOOCZwMiEQhgbs0GmVnp/L8b6AuOAUdCs5jF
 z9Uygu8YG0Kt6tN59lPnjFeYUXhRNPaudOL5z6c65hHY9L4Uq4Clyc1Z6L/7aYBGIgUhPRi5
 0w1UFMW4yLBfmIg+sJ7J8JPoYx2wK7N9IF8ria/Qg3JVUi5NJUttPRtashpxBHxauSK87T8O
 ZK94sgfbwoYTwWrcHvfXqB6G32h7a60Gi4HhpSpupiSi1Z+dFXhCIf4g==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] rust: backport explicit-tail-calls test skips for unsupported LLVM targets
Date: Wed, 24 Jun 2026 12:11:15 +0200
Message-Id: <20260624101115.52072-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 10:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239485

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

oe-selftest for rust fails on powerpc and other architectures where LLVM
does not fully support musttail lowering, causing:

  LLVM ERROR: failed to perform tail call elimination on musttail marked calls

Add an upstream backport patch that marks the affected explicit-tail-calls
tests as ignored on unsupported LLVM targets.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 ...lls-ignore-tests-on-unsupported-llvm.patch | 96 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch

diff --git a/meta/recipes-devtools/rust/files/0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch b/meta/recipes-devtools/rust/files/0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch
new file mode 100644
index 0000000000..a6b73cf326
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch
@@ -0,0 +1,96 @@
+Backport commits that disable failing tests on unsupported LLVM targets.
+
+Fixes LLVM ERROR: failed to perform tail call elimination on musttail marked calls.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/ded0aaba6ce257adf0b7e1fb6b702cad12328faf]
+
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+
+---
+ src/tools/compiletest/src/directives/directive_names.rs |  3 ++
+ tests/ui/explicit-tail-calls/become-indirect-return.rs  | 21 +++++++++++++++++
+ tests/ui/explicit-tail-calls/indirect.rs               | 19 ++++++++++++++++
+ 3 files changed, 43 insertions(+)
+diff --git a/src/tools/compiletest/src/directives/directive_names.rs b/src/tools/compiletest/src/directives/directive_names.rs
+index 1234567..abcdefg 100644
+--- a/src/tools/compiletest/src/directives/directive_names.rs
++++ b/src/tools/compiletest/src/directives/directive_names.rs
+@@ -67,6 +67,7 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] = &[
+     "ignore-coverage-map",
+     "ignore-coverage-run",
+     "ignore-cross-compile",
++    "ignore-csky",
+     "ignore-eabi",
+     "ignore-elf",
+     "ignore-emscripten",
+@@ -91,6 +92,8 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] = &[
+     "ignore-loongarch64",
+     "ignore-macabi",
+     "ignore-macos",
++    "ignore-mips",
++    "ignore-mips64",
+     "ignore-msp430",
+     "ignore-msvc",
+     "ignore-musl",
+diff --git a/tests/ui/explicit-tail-calls/become-indirect-return.rs b/tests/ui/explicit-tail-calls/become-indirect-return.rs
+index 1234567..abcdefg 100644
+--- a/tests/ui/explicit-tail-calls/become-indirect-return.rs
++++ b/tests/ui/explicit-tail-calls/become-indirect-return.rs
+@@ -2,6 +2,27 @@
+ //@ ignore-backends: gcc
+ //@ ignore-wasm 'tail-call' feature not enabled in target wasm32-wasip1
+ //@ ignore-cross-compile
++//
++// LLVM musttail support is incomplete for these targets.
++// See https://github.com/rust-lang/rust/issues/148748 for the target test matrix.
++// See https://github.com/llvm/llvm-project/issues/63214 for AIX and PowerPC.
++// See https://github.com/llvm/llvm-project/issues/57795 for MIPS and MIPS64.
++//@ ignore-aix
++//@ ignore-csky
++//@ ignore-mips
++//@ ignore-mips64
++//@ ignore-powerpc
++//@ ignore-powerpc64
++//
++// LLVM musttail support is lacking for sret lowering on these targets.
++// Returning `[u8; 24]` uses sret lowering here.
++// See https://github.com/llvm/llvm-project/issues/157814 for RISC-V.
++// See https://github.com/llvm/llvm-project/issues/168152 for LoongArch.
++// RISC-V fix: https://github.com/llvm/llvm-project/pull/185094, should be in LLVM 23.
++// LoongArch will likely be fixed with similar changes.
++//@ ignore-riscv64
++//@ ignore-loongarch32
++//@ ignore-loongarch64
+ #![expect(incomplete_features)]
+ #![feature(explicit_tail_calls)]
+ 
+diff --git a/tests/ui/explicit-tail-calls/indirect.rs b/tests/ui/explicit-tail-calls/indirect.rs
+index 1234567..abcdefg 100644
+--- a/tests/ui/explicit-tail-calls/indirect.rs
++++ b/tests/ui/explicit-tail-calls/indirect.rs
+@@ -2,7 +2,26 @@
+ //@ ignore-backends: gcc
+ //
+ //@ ignore-wasm
++//
++// LLVM musttail support is incomplete for these targets.
++// See https://github.com/rust-lang/rust/issues/148748 for the target test matrix.
++// See https://github.com/llvm/llvm-project/issues/63214 for AIX and PowerPC.
++// See https://github.com/llvm/llvm-project/issues/57795 for MIPS and MIPS64.
++//@ ignore-aix
++//@ ignore-csky
++//@ ignore-mips
++//@ ignore-mips64
++//@ ignore-powerpc
++//@ ignore-powerpc64
++//
++// LLVM musttail support is lacking for indirect arguments that do not fit in registers.
++// See https://github.com/llvm/llvm-project/issues/157814 for RISC-V.
++// See https://github.com/llvm/llvm-project/issues/168152 for LoongArch.
++// RISC-V fix: https://github.com/llvm/llvm-project/pull/185094, should be in LLVM 23.
++// LoongArch will likely be fixed with similar changes.
+ //@ ignore-riscv64
++//@ ignore-loongarch32
++//@ ignore-loongarch64
+ #![feature(explicit_tail_calls)]
+ #![expect(incomplete_features)]
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 55c43ffd6d..094baba526 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
+            file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b99ce16cdf0ecfc761b585ac84d131b46733465a02f8ecd0ff2de9713c62ee09"
 
-- 
2.39.5


