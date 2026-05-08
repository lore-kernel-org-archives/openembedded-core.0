Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BB5CD37B3
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8169.1778224353183258853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pREZiAee;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-444826c16ffso1480642f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224351; x=1778829151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma/3Xq8wBkjb2xKEUUNQm13bb2c4GqebiVcxLk90s3A=;
        b=pREZiAeeKCfn8Npf4tPqFkLvxpV3tj1IBLb64+w2rv0Qj4d7roR4fF7scNd1ax9Mrk
         enWj5bLXDmTtz+KjVX6ywPu+Z6tJzqaQmVxePO9PHuUgfCWgkvbVOoSDB/mxGHyOz3Bf
         o1Rn5vPfxBhr3Th+2YkeKUKtytXniqP+xZdVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224351; x=1778829151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ma/3Xq8wBkjb2xKEUUNQm13bb2c4GqebiVcxLk90s3A=;
        b=P22vE/VQZAJQhtTHZCFUma7sgf2KHDcLlKsnrSRIWU4yJU8p+/bzmb362bzjN+sP+L
         uwinpJmILIF0WmFxlCvEYCd9dOY565mWp4CwdIAAiF1JpYYaM20pXG6Ayuk8fdBJrZ8x
         K7+ZpVW7srTJaaz6Ser7ND5TtHfFSvT8mXl9+8qnMzYbSU2heVL7BFQlxO9zu/05i6vD
         Z2JYIMV6IToqlMBOyWAs7wkKhp8FqYczGKR4+bcTBv8DoOvKZlMJfYLlrvimioOqdliA
         KLz496zK/vJ5OcUjit24XYJIB6ASOPr9nEOOYd6IyS7WDm+0I68Uf4ZZi2doK23/esGx
         fmOw==
X-Gm-Message-State: AOJu0YxUgThtO8CVsGM3BXT6YKZc6HBUOc6TA7wZmalIyDAlNeannHPl
	8EyHVY+gWMg60aBNQ5JNZSZuwU1ulwYGeabJ01oC7R6dkxUh6ShBKBM30Qwe2TuIFm1Zq7e/QO4
	NUg+7nWA=
X-Gm-Gg: Acq92OFObj7FyhwQbUqqlTJFw+PyVP2HAzItecI0LETktI0Qay5XKVvqNWQNOet7c7i
	uNlRZuAfwXif8SFG8mYHDdzLYtmwjkS8bQpwUqysvOdMKSn3PeKkywvDmE0AhdG0SRwZcI+1+Ky
	qyw84ml6kZ+olqF+nr+vfRG62RjkKr0tmNjy7x9IpL8wXKWWvanAbPTcqXK5WmCCJIlS2WEQjML
	WtqcuW6qeXC624fVXjlljZBZOaJxgIqeK2gng3825aYSRLMas0NdufoZgyaJ6jqqHo1hcwsR8lZ
	eyBOdFIylT/TVaoJuIz/hrb7JerDlqMQuqn5jOg0i4dV5yGt9vvmMjVeCnm34LJPaH+YullJwnd
	SiFnkpOq0WBMk3NonkcPPMdQxFYWQrh41pxQSMHjASbwhufQfEhUpDId7GxrFcHu7pW9idSMsYh
	RzCQFekkngHfyoNv6dWN7mAJ/cZKGdbihi1FTGkT5pdm7VxqpwnsBNbabK+gnV5OZooYIseCvpX
	pNsKUJ5NHENfyFn2ql65h1dcwloHdXqcswRZA==
X-Received: by 2002:a05:6000:22ca:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-4515cf11e8bmr18332093f8f.22.1778224351002;
        Fri, 08 May 2026 00:12:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/52] rust: fix codegen test failure on big-endian targets
Date: Fri,  8 May 2026 09:11:21 +0200
Message-ID: <3bab91e8a72024341c3ecbb7a33f8b407dda9502.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236670

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1efb76b9698d025e9d8b3de2039e6a422b5f4bee)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ion-or-permutations-test-for-big-end.patch | 121 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch b/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
new file mode 100644
index 00000000000..a36089cf3ac
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
index 43d60fb6f63..f11bbea9b34 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
+            file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 

