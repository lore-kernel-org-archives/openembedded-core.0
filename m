Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F219B109E53E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:09:37 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39422.1774490971278696231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MGr1wskB;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128e4d0cc48so599141c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490970; x=1775095770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB0iRoCTpoDkrX0GnGHR06HJs+pBhm4MzqCuaFBld8M=;
        b=MGr1wskB8vYoPkQt5E37b8w+C80ydCdPRct1osd1GeiZ2m8jEckoCqQTJMzB5jOStm
         bAc19BXrNn1HZiyw0qtBsXTpR+4lD9GOj+LR5ERKTIMNRMbSmuJ3Fs+4GUoOVph6w/e9
         cfSsfTEnxb9SV3Z2IxVaAEc8SZPgfLeKP15Gy2ig11cd7beqNLXmQ6NgS/TE03XFn2Ta
         fCAD4j2A2BnI2LLwD7aFGMkyqK8xcfUOucHiSWzy9ojV0SO6kLWP3FjWPNkgCNVWAE4h
         xs+AShS2kPMnB11028DOxZ2+T+qh6U21DrbYzFWEO8ChRHoP23IjHaE4Z2RgOuqTYbkl
         cE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490970; x=1775095770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BB0iRoCTpoDkrX0GnGHR06HJs+pBhm4MzqCuaFBld8M=;
        b=A2r7hZppgJPO4O+ehBgWQDfAfhGsHoMfx9Ueyr3iZqCRIsvqhwiG/HNIPIPkFQTK1Q
         nPlE0oat70USG/cFfMjjENaLCsJcU7FwokhLKWvM1FBG0xAbm8rmZBK/aFeDwm2BPwQ8
         UsCbKPbh/MV6GmPzIfr0zRJKImQopNProSUNI7POoena6yb/0WoE/Uv20sWWftqtimiq
         PeneFKUr6Uhry2sL9vOMbyduYMpxBmBpH+R6Z6ub4YLMRSRnpI55fTkMsxo101jeMJMR
         jpf7fIhR9xy2tMud9g3IHVDNQ0mhbdXcsCjbLHfPovfqAdqzJvYV96pogVtbpSJuiW0e
         +9tw==
X-Gm-Message-State: AOJu0YxxT63HLxrfZA87Q4heowQ0JKCWXNs4AlpDkWLLDqCq8ZhGyNR+
	dsI6YeXMulvshchY1SinQ8Vhv8BJaI1JjVoHKP4/PYjOsSZqBJnVOvIf2IgSvNeP7e4=
X-Gm-Gg: ATEYQzzkAfxOalSs2oR5OisAC82DcmqbG7C8n/WeVNJXTgcr+TPwzW6Vu73N1EJDJBU
	JtZBS20T/q7SlOZzyUx1RZ0vbp0bT9ptTgcAodJr45Ie5PjTaK3aBbAJhhovah7exOjrZqADLCh
	o4pOFEeZxSVUNpuTRt+dE3otgbMag3CgF7JG5Vjb8oC/20SPux5wukcJR4xKFcBDIbLLSNXfNUO
	vzrLPDp3VxRVvJSZbHQlEPJ+1bjsq184h6Lw2dxx+CpjdCvRrzLVFyYXYdEHZaInHbmOKvTWuI2
	6udFzTMyc38gvzAHRCbEHvxIc9zYS0Fx7+6ipFxFvYALSDDxPGyaU2UGb1Rhv7LAkLUbqeq4CSD
	/I9BFV2YKq+DwiHzlT9LThdGw6c3lejnZTUFPwUgmQzTwHg0x3p0li1P8LzwwFbb2kntUJnf1rT
	ABxZrGsyeyLzBqzsUgaNym6BcetHpHA1AxDVYSaIQogxwbZldsltU7Bfa4XDA8TRjJcx37EzHDa
	ETDUSHvUR/hK2QJsII37haBxojdryn6U7aPMkwWwAHuMzLnKb2tKoxnM4yh
X-Received: by 2002:a05:7022:662a:b0:11b:9386:8254 with SMTP id a92af1059eb24-12a96f00133mr2798823c88.41.1774490970291;
        Wed, 25 Mar 2026 19:09:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b38csm2359060c88.2.2026.03.25.19.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:09:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2 4/4] rust: Fix build with llvm-22
Date: Wed, 25 Mar 2026 19:09:22 -0700
Message-ID: <20260326020923.297511-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233944

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


