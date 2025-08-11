Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5ADCA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:44:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.43493.1754901869727936187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Kv6DktU2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250811084427f84c644030bb4b2d26-bu8my7@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250811084427f84c644030bb4b2d26
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 Aug 2025 10:44:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Jeh++8G8cTc8nKmtA+4j0nOKCDNEL7APK0bLmvfOs7Q=;
 b=Kv6DktU2Ot9UYg/vCOCYjKtyPtjy3jg+6OdooR8NQj0DpYDrr/2gS8SVXbQLzkVoXtzWnP
 FxC0e8JeuypYOnehTsJB0WLq5aQoPPoTCQMIKc9w5gdBAeqVWJwWqVTCyKvD7JgAMGY/tX3t
 wXqwIzWKWJUpEA7NircO4ImAxQ/JycLQHVPR+gOfimBPCA/C/6WLHGDtfFgPHwUWKsP4i7q0
 iSBDDCn5O48cgIk9xgeSvcDJ+JbRcU2jdl3KEmh9WJDX7t9mRbQBCEKRDloNLuJkPY4ojSjA
 Mtvwoq0UwhiGclGbV+Hc1RaJxGtBqLFUskaySFr5gOm2x3GLqooT/ApA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] rust: backport cstring-merging test fix for PowerPC targets
Date: Mon, 11 Aug 2025 10:43:34 +0200
Message-Id: <20250811084334.28553-2-peter.marko@siemens.com>
In-Reply-To: <20250811084334.28553-1-peter.marko@siemens.com>
References: <20250811084334.28553-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221727

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The Rust cstring-merging assembly test was failing on PowerPC targets due to
LLVM's GlobalMerge optimization pass merging all global string constants into
a single merged global. This caused the test's CHECK directives to fail as
they expected separate .Lanon labels for each string literal ("foo", "bar",
"baz").

The test verifies that C-style string literals are correctly placed in
mergeable read-only sections (.rodata.str1.1) with proper section flags
(aMS - Allocatable, Merge, Strings) for linker optimization.

This backports the upstream fix that disables the GlobalMerge pass
(-Cllvm-args=-enable-global-merge=0) specifically for this test, allowing
it to verify the expected assembly structure without interference from
the optimization.

Fixes test failure:
- tests/assembly/cstring-merging.rs on powerpc-poky-linux-gnu

Backport of https://github.com/rust-lang/rust/commit/2d51acd2fbcbadb6f30709c5dd305494d413d388

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Tested-by: Peter Marko <peter.marko@siemens.com>
---
 .../backport-fix-test-string-merging.patch    | 27 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/backport-fix-test-string-merging.patch

diff --git a/meta/recipes-devtools/rust/files/backport-fix-test-string-merging.patch b/meta/recipes-devtools/rust/files/backport-fix-test-string-merging.patch
new file mode 100644
index 0000000000..1e72c100bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/backport-fix-test-string-merging.patch
@@ -0,0 +1,27 @@
+From 2d51acd2fbcbadb6f30709c5dd305494d413d388 Mon Sep 17 00:00:00 2001
+From: Jens Reidel <adrian@travitia.xyz>
+Date: Fri, 18 Jul 2025 19:44:20 +0200
+Subject: [PATCH] tests: assembly: cstring-merging: Disable GlobalMerge pass
+
+The test relies on LLVM not merging all the globals into one and would
+currently otherwise fail on powerpc64le.
+
+Signed-off-by: Peter Tatrai <Peter.Tatrai@siemens.com>
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/2d51acd2fbcbadb6f30709c5dd305494d413d388]
+---
+ tests/assembly/cstring-merging.rs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/assembly/cstring-merging.rs b/tests/assembly/cstring-merging.rs
+index f7d0775f7affd..03688e0068b79 100644
+--- a/tests/assembly/cstring-merging.rs
++++ b/tests/assembly/cstring-merging.rs
+@@ -2,7 +2,7 @@
+ // other architectures (including ARM and x86-64) use the prefix `.Lanon.`
+ //@ only-linux
+ //@ assembly-output: emit-asm
+-//@ compile-flags: --crate-type=lib -Copt-level=3
++//@ compile-flags: --crate-type=lib -Copt-level=3 -Cllvm-args=-enable-global-merge=0
+ //@ edition: 2024
+ 
+ use std::ffi::CStr;
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 1a5d98d9dc..8f341a0e5b 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchdir=${RUSTSRC} \
             file://triagebot.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+            file://backport-fix-test-string-merging.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e"
 

