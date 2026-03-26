Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D1510A88CE
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:54 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50863.1774538213504362504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q7RmZT5T;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c1092cc08cso2855814eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538213; x=1775143013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB0iRoCTpoDkrX0GnGHR06HJs+pBhm4MzqCuaFBld8M=;
        b=Q7RmZT5TjU7N3ml6w05wwqW39XxhITmNaOdaJgeA5NA+6quyCglREqQKseDz+mO33x
         XU65Xb3XZmy3W8J5gfSGCHqaEV8yQA1xQwsJceY9t/hfCQv0iC8j/LxhrKc3AlYbBCh/
         jCJi7h+8pwuLgk/O8/0RhnEibDcbgdzNXrzEOpLamGDSla0QTOqu1rPooFSxDez36sIk
         56dlOeHqDcJuc2pzxWopwZqmaw3HUnNwCLg2k6a5jvSY/1yGjouGmhuIPTCTp67F0dfz
         dAotHmoSWQOtjdm3ozA7P2ViJaa4VrS0G75ANr6MDf8oPQQcvIJua6yfIx6PgF8vp3IM
         WlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538213; x=1775143013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BB0iRoCTpoDkrX0GnGHR06HJs+pBhm4MzqCuaFBld8M=;
        b=ZxTYVZE8H/+L/8/PRrGONwvDs/cMvgOzV0UljywIGB9p+/Y/5XgtjMpn0XJ1/vaopT
         9knNJMspyGUeEMMXkiopL4Zmaglv4ELkspsUY/ALJgV8SF6zc10hAQCVq74wVpvC/CC6
         2yuXeK/vHF00wqVUaFChXTbH4ICmPsB7ASYcaMbD1BjUD8iJQwqr9RQKZFsxDA2Ck+ic
         VmVZmvjcg7xLbUuRAVEph4eaJc1puKHXRv8mn2sWHsRR7VVWHwFqP/coKRWxos0zZTm2
         zd3WbRj8dMZEGlExxBcZqT7O7rxU0yivLvhyI/5DrVQyo45lQbo5wAJBR+7JoaB2rwqJ
         BCow==
X-Gm-Message-State: AOJu0YwJVBaKo7WfAMsKEfuVCrPPFPC3kP+MVsBVGVyYX5Y93UxHxD1s
	ZWvgNXZHgpLdqAXvC88ViksrTQuSMKQx7apXNgfM76ZNZ8d4X0+lAxnq1pesyunhgcs=
X-Gm-Gg: ATEYQzw5+bUMtCRoEclN1Zse2pQboldQSBXCeGGyV6jz2C0x/oWiLx4Rmtal/Upeohg
	xufmXH64mScmP1LKKo3Y4A7et1G1gCzq2yzGJ9yzGerju3Edv2LE0m1qkkINGriJoAZ87V3FjA+
	SPDxt8Db2QtznXRj1gEOmDyf6B4uQgRMGyiEK3PiKe//hWjiGzPOr531rZkDEBszWT79NpfV3mi
	doAr9T0AmGuGUbKtOPdOiNK/3D4g9CYjgucrbv2i5/uOZhYSRpBMbMv0FmKfx2LmFX7H6dHeymh
	womEYwHRWDTjuCgMFNpXtAeDlRikMN/x3J+5jZjXBkpEstR/Cl8Z1akVoBpTu5JtkHyFzi4AxDt
	C4oNqXI4VHxf25qtj2EPdJrs3shP0CRPupEZPVy+SlIBksoZNxhxlyKM91c8aGF1LK8/ypU2cWI
	wKn0EmdCJq0cqcS8PG1h+7k9koRNLFtHEcJd+DNTI0SkOZ3t5BVBF7QTxPwgkkR0lEuw6NHHTly
	5mDqKUhlqcVRMZSMN4I8SFcXFbFgIPONNsivNdV+Kv0X2Jpw3R+Vfwq26qj
X-Received: by 2002:a05:7301:19a8:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c15d479457mr3956074eec.26.1774538212541;
        Thu, 26 Mar 2026 08:16:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 6/7] rust: Fix build with llvm-22
Date: Thu, 26 Mar 2026 08:16:40 -0700
Message-ID: <20260326151641.3974221-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234026

Backport patch to update data layout for amdgpu

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Update-amdgpu-data-layout.patch      | 44 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch b/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch
new file mode 100644
index 0000000000..1c09cd8fa6
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Update-amdgpu-data-layout.patch
@@ -0,0 +1,44 @@
+From bf3ac98d6930ba4e258cf33240c2fe7c99d19eae Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npopov@redhat.com>
+Date: Tue, 6 Jan 2026 11:51:33 +0100
+Subject: [PATCH] Update amdgpu data layout
+
+This changed in:
+https://github.com/llvm/llvm-project/commit/853760bca6aa7a960b154cef8c61f87271870b8a
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c99d19eae]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler/rustc_codegen_llvm/src/context.rs                  | 5 +++++
+ compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/compiler/rustc_codegen_llvm/src/context.rs b/compiler/rustc_codegen_llvm/src/context.rs
+index 4b2544b7efd..4328b15c73f 100644
+--- a/compiler/rustc_codegen_llvm/src/context.rs
++++ b/compiler/rustc_codegen_llvm/src/context.rs
+@@ -215,6 +215,11 @@ pub(crate) unsafe fn create_module<'ll>(
+             // LLVM 22 updated the ABI alignment for double on AIX: https://github.com/llvm/llvm-project/pull/144673
+             target_data_layout = target_data_layout.replace("-f64:32:64", "");
+         }
++        if sess.target.arch == Arch::AmdGpu {
++            // LLVM 22 specified ELF mangling in the amdgpu data layout:
++            // https://github.com/llvm/llvm-project/pull/163011
++            target_data_layout = target_data_layout.replace("-m:e", "");
++        }
+     }
+
+     // Ensure the data-layout values hardcoded remain the defaults.
+diff --git a/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs b/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
+index 828d853ac65..d6a2cfc2aab 100644
+--- a/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
++++ b/compiler/rustc_target/src/spec/targets/amdgcn_amd_amdhsa.rs
+@@ -5,7 +5,7 @@
+ pub(crate) fn target() -> Target {
+     Target {
+         arch: Arch::AmdGpu,
+-        data_layout: "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9".into(),
++        data_layout: "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9".into(),
+         llvm_target: "amdgcn-amd-amdhsa".into(),
+         metadata: TargetMetadata {
+             description: Some("AMD GPU".into()),
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 4579b6bf6a..e1942db93d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
+            file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "0b53ae34f5c0c3612cfe1de139f9167a018cd5737bc2205664fd69ba9b25f600"


