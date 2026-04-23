Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3FBFA1FDF
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:17:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14296.1776928627254736678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=itPUnKL5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1328017-2026042307170321bd24b9b1000207d9-2r8jtq@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026042307170321bd24b9b1000207d9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Apr 2026 09:17:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DBJGmoyMIJS9yqKyFRUVZVJ5elhhDlC+yectjIXrv7s=;
 b=itPUnKL5X1CybtfnVlOmtZ8vlAMBmgFz9OhFn9GQPveLZ6t8LxGsIeOrEizfwXnA3V/VDW
 iBQFMzYQ103TuYmk+lzp0pPn83AwbcojCvpJcGZ+R3C/7CIFwGdK6Ytvc8M6V2hPntf3Lcu1
 1pf5SzX5tCmP+UK06Wnq1elb+a75mSKLgOL+YbTNrUNvY9wZzxS3WP0AKcMDLdxy4FX82jej
 pIRbynSPMFSnG44dYTiIPvplTfGfhSWEDXrOnXVGCOEUZlLigVdk0UCmzfGUeMKiW5t4dPzk
 7E2CGvitbSPRW77oYpVJ8l8fXbUwoaDjTfKDztsJC1loFpNqDuxwhS6w==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] rust: fix codegen test failure on big-endian targets
Date: Thu, 23 Apr 2026 09:17:01 +0200
Message-Id: <20260423071701.2112776-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235744

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The test tests/codegen-llvm/issues/multiple-option-or-permutations.rs
uses FileCheck to verify LLVM IR for Option::or operations on slices.
The CHECK-NEXT directives assumed a little-endian memory layout where
the Option discriminant is the low byte, emitting a simple:

  trunc i16 %0 to i1

On big-endian targets (e.g. powerpc), the discriminant resides in the
high byte, so LLVM first emits an lshr before the trunc, causing the
test to fail.

Backport upstream fix from rust-lang/rust#151780 which introduces
BIG/LITTLE revisions with the only-endian-big / ignore-endian-big
directives (also backported via directive_names.rs change) to handle
both layouts correctly.

Fixes: rust-lang/rust#151718
Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/151780]

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 ...ion-or-permutations-test-for-big-end.patch | 121 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch b/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
new file mode 100644
index 0000000000..a36089cf3a
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
@@ -0,0 +1,121 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Ryan Ward <rwardd@users.noreply.github.com>
+Date: Tue, 28 Jan 2026 12:21:35 +0000
+Subject: [PATCH] Fix multiple-option-or-permutations test for big-endian
+ targets
+
+The FileCheck tests for Option::or on slices assumed little-endian
+layout. On big-endian targets (e.g. powerpc), the Option discriminant
+resides in the high byte, so LLVM emits an lshr before the trunc.
+
+Add only-endian-big directive support and use BIG/LITTLE revisions to
+cover both cases.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/151780]
+Signed-off-by: Ryan Ward <rwardd@users.noreply.github.com>
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+---
+ .../compiletest/src/directives/directive_names.rs     |  1 +
+ .../issues/multiple-option-or-permutations.rs         | 47 ++++++++++++++++--
+ 2 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/src/tools/compiletest/src/directives/directive_names.rs b/src/tools/compiletest/src/directives/directive_names.rs
+index 9813ac7ff500d..334b2dda343a5 100644
+--- a/src/tools/compiletest/src/directives/directive_names.rs
++++ b/src/tools/compiletest/src/directives/directive_names.rs
+@@ -218,6 +218,7 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] = &[
+     "only-eabihf",
+     "only-elf",
+     "only-emscripten",
++    "only-endian-big",
+     "only-gnu",
+     "only-i686-pc-windows-gnu",
+     "only-i686-pc-windows-msvc",
+diff --git a/tests/codegen-llvm/issues/multiple-option-or-permutations.rs b/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
+index 9ec4ec8eeb159..8756d45eaa03e 100644
+--- a/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
++++ b/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
+@@ -1,4 +1,7 @@
+ // Tests output of multiple permutations of `Option::or`
++//@ revisions: LITTLE BIG
++//@ [BIG] only-endian-big
++//@ [LITTLE] ignore-endian-big
+ //@ compile-flags: -Copt-level=3 -Zmerge-functions=disabled
+ 
+ #![crate_type = "lib"]
+@@ -70,8 +73,16 @@ pub fn if_some_u8(opta: Option<u8>, optb: Option<u8>) -> Option<u8> {
+ #[no_mangle]
+ pub fn or_match_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+     // CHECK: start:
+-    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
+-    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
++    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
++    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
++    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
++    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
++    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
++    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
++    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
+     // CHECK: ret i16 [[R]]
+     match opta {
+         Some(x) => Some(x),
+@@ -84,8 +95,16 @@ pub fn or_match_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+ #[no_mangle]
+ pub fn or_match_slice_alt_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+     // CHECK: start:
+-    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
+-    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
++    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
++    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
++    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
++    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
++    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
++    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
++    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
+     // CHECK: ret i16 [[R]]
+     match opta {
+         Some(_) => opta,
+@@ -98,8 +117,16 @@ pub fn or_match_slice_alt_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+ #[no_mangle]
+ pub fn option_or_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+     // CHECK: start:
+-    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
+-    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
++    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
++    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
++    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
++    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
++    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
++    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
++    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
+     // CHECK: ret i16 [[R]]
+     opta.or(optb)
+ }
+@@ -109,8 +136,16 @@ pub fn option_or_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+ #[no_mangle]
+ pub fn if_some_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
+     // CHECK: start:
+-    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
+-    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
++    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
++    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
++    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
++    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
++    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
++    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
++    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
++    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
+     // CHECK: ret i16 [[R]]
+     if opta.is_some() { opta } else { optb }
+ }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 43d60fb6f6..f11bbea9b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
+            file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 
-- 
2.39.5


