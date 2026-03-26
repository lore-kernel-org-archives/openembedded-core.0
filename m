Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC8210A88C8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:17:04 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50864.1774538214638716513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LFIGwifZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0bb213b16so1952581eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538214; x=1775143014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INIXbz3qa+jbyX5BwUL6nwLc4PkiSd0H/g6nnR7Rehw=;
        b=LFIGwifZkeffrSrp/1AFcbc+PjJs8VK4vEYZzenYv2CPRdncvzk8NjYcOQkJ9h9D+w
         LnuX5nqyiDamtUWqNc+vGm4IGa/hQiGR8xv5a7ObJ74/RI9b6CbLKA/KyV5NlNh1U/RC
         nIZMHG99qDRjLeNxOS8xlLIUSRygcEG3Zb2Rb3vjQ4O++U/xQy0WNgfKhb53v5s6YRiX
         0IjdLn38snz6wCfXBpsmh/XIBbiLEozRix3pyyr9Bzov+K5p5fyADU5qjDLWDljN6JGz
         WXxHuSh4Fnkbf3551EaRpG/0+50cBykyxO5T2+82LkbJRj6VcD1lW4DYD2EC6YxZ/2zC
         Zi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538214; x=1775143014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INIXbz3qa+jbyX5BwUL6nwLc4PkiSd0H/g6nnR7Rehw=;
        b=eD8UQmDVubfJ/ZAjCyr0GdPz/BxXyAU0dvL5DfmeDdSC+WAN5rTbE+DJ1L4CiBHZqg
         9Mz84r7iztOipQycVFjDEfLoN78ofGgVvLaOVEMyDhHCfJzZkBByWxWthO/RWtCHiwgq
         ERIGrmSuG2Il8+WRoNC4GetB95/WMkyctUe6zkFtudVmBLyI0ADP8ZCfbBVP5TBLdvsy
         YK38pznYK2Q43ZBT+F4U3cnVGequSTXiT69JZignQivh43C+GCDciynE8zbB6K5ZVYcJ
         +lPffsoB9mJN8qHiiCmKYOYqPH2jZFBeWjdjow8luhbFlZGW9oyJahmoYme7i4ALbE6Q
         WqUQ==
X-Gm-Message-State: AOJu0YxM1i4y1ZeUf8puz6nKlupQzmEOxvlXS28fLaQAKf81DzYo4Gvk
	pW3cAxiW8XBzVJbcK18XtulS9SZtMvYcwLx9uHen3+TzeKzd4hEXsLbudWJuTE/3AmA=
X-Gm-Gg: ATEYQzyYQyDJoJGdXl6TyXiceSvSCA9b981Qn+BGrwh6bgrC6BUszBVC1BOAEiBVweO
	tNihIhf3KeG4eGNtICsnk7sxtwDPIpTW0/AP2imQ9/smSKlMHmEJoshOiQlWksvLZJyO7SULLD3
	JLKF+Ffh1udk67uRt+Qj2rhEK5amAWnsMbT38KF3ZoQcbqKxQcgkMfPzEzRPI+tJAjRwXxKcIWb
	iY5KJrL2jsMY58ogOywvV0c8jpA2JTDybUhZ/dfkjLQygXbbVR8HLOpQ8fPBQF2qNPFsj5z9/Tp
	M+zz2NSvvr8wlGb9vvWLvHeV/d+o+3CpQC9rDxWkrJnvL7XbjCipU8VZdKrOgKtIR3ywOc+EqQc
	UOJKeGDZ+NZr7eftQczrL2IVpnFtFUjgPW+aHqxN+u9jluBnV4vJNvYfPROksULs5TNvTsyFBjJ
	sLiZQP3mVK1FmGijkfFlevBUkj3fi0FZd1pARLE4muYMHUQV6bDQ6/hojkJvKjqLve89gZBPKDk
	1ipO3489whgu55Wi6gk+H2tebA4PcbEG3AwS6uuJOATa6xfwChnp3P50xUU
X-Received: by 2002:a05:7301:2503:b0:2c1:67e1:61c4 with SMTP id 5a478bee46e88-2c167e1842amr2195435eec.5.1774538213712;
        Thu, 26 Mar 2026 08:16:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 7/7] rust: Fix loongarch unit test with llvm-22
Date: Thu, 26 Mar 2026 08:16:41 -0700
Message-ID: <20260326151641.3974221-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234027

Adjust loongarch assembly test
This generates different code on loongarch32r now.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Adjust-loongarch-assembly-test.patch | 66 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch b/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch
new file mode 100644
index 0000000000..67c649ebd8
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Adjust-loongarch-assembly-test.patch
@@ -0,0 +1,66 @@
+From e015fc820db5d7fe2495c09b1fdd5e2092ed3cd1 Mon Sep 17 00:00:00 2001
+From: Nikita Popov <npopov@redhat.com>
+Date: Tue, 27 Jan 2026 12:03:48 +0100
+Subject: [PATCH] Adjust loongarch assembly test
+
+This generates different code on loongarch32r now.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e015fc820db5d7fe2495c09b1fdd5e2092ed3cd1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/assembly-llvm/asm/loongarch-type.rs | 27 +++++++++++++++++------
+ 1 file changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/tests/assembly-llvm/asm/loongarch-type.rs b/tests/assembly-llvm/asm/loongarch-type.rs
+index e0a7940f89a..5efad583a39 100644
+--- a/tests/assembly-llvm/asm/loongarch-type.rs
++++ b/tests/assembly-llvm/asm/loongarch-type.rs
+@@ -1,10 +1,14 @@
+ //@ add-minicore
+-//@ revisions: loongarch32 loongarch64
++//@ revisions: loongarch32s loongarch32r loongarch64
+
+ //@ assembly-output: emit-asm
+
+-//@[loongarch32] compile-flags: --target loongarch32-unknown-none
+-//@[loongarch32] needs-llvm-components: loongarch
++//@[loongarch32s] compile-flags: --target loongarch32-unknown-none -Ctarget-feature=+32s
++//@[loongarch32s] needs-llvm-components: loongarch
++
++//@[loongarch32r] compile-flags: --target loongarch32-unknown-none
++//@[loongarch32r] needs-llvm-components: loongarch
++//@[loongarch32r] min-llvm-version: 22
+
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-none
+ //@[loongarch64] needs-llvm-components: loongarch
+@@ -28,8 +32,12 @@
+
+ // CHECK-LABEL: sym_fn:
+ // CHECK: #APP
+-// CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)
+-// CHECK: ld.{{[wd]}} $t0, $t0, %got_pc_lo12(extern_func)
++// loongarch64: pcalau12i $t0, %got_pc_hi20(extern_func)
++// loongarch64: ld.d $t0, $t0, %got_pc_lo12(extern_func)
++// loongarch32s: pcalau12i $t0, %got_pc_hi20(extern_func)
++// loongarch32s: ld.w $t0, $t0, %got_pc_lo12(extern_func)
++// loongarch32r: pcaddu12i $t0, %got_pcadd_hi20(extern_func)
++// loongarch32r: ld.w $t0, $t0, %got_pcadd_lo12(.Lpcadd_hi0)
+ // CHECK: #NO_APP
+ #[no_mangle]
+ pub unsafe fn sym_fn() {
+@@ -38,8 +46,13 @@ pub unsafe fn sym_fn() {
+
+ // CHECK-LABEL: sym_static:
+ // CHECK: #APP
+-// CHECK: pcalau12i $t0, %got_pc_hi20(extern_static)
+-// CHECK: ld.{{[wd]}} $t0, $t0, %got_pc_lo12(extern_static)
++// loongarch64: pcalau12i $t0, %got_pc_hi20(extern_static)
++// loongarch64: ld.d $t0, $t0, %got_pc_lo12(extern_static)
++// loongarch32s: pcalau12i $t0, %got_pc_hi20(extern_static)
++// loongarch32s: ld.w $t0, $t0, %got_pc_lo12(extern_static)
++// loongarch32r: pcaddu12i $t0, %got_pcadd_hi20(extern_static)
++// loongarch32r: ld.w $t0, $t0, %got_pcadd_lo12(.Lpcadd_hi1)
++
+ // CHECK: #NO_APP
+ #[no_mangle]
+ pub unsafe fn sym_static() {
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e1942db93d..cd6999c8f2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-flaky-assertions-in-oneshot-tests.patch;patchdir=${RUSTSRC} \
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
+            file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "0b53ae34f5c0c3612cfe1de139f9167a018cd5737bc2205664fd69ba9b25f600"


