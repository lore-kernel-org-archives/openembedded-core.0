Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB512CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:29:23 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.28824.1761560956196150408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=g9Q8hC0T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-20251027102912348ae36ae200020742-5z_dq4@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251027102912348ae36ae200020742
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 11:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2MdZWODoi/k5Ppb1PpuPbzxl4jFe14eo+7NFhzlCtLY=;
 b=g9Q8hC0T4puqpQfSEdszIHX8xQODF84b97Zh5GYvE4E1mwhs6C1EcOKz0OyxHA14iQsM4L
 bMAqh+kI8W1WUSQJz4xTEUYB8GnYVxsIGcJDz//mfshgDGOY7ZwR1XZl2yEtgagfc+a/NkCK
 TLpOkOlpTklvaSZ2ecsASPE7CifbtbCR/cNg1ZxYGVInVpSLxTF3ysTIGL+syfPzJv9vHkJF
 gud5LCmRIvVbxhdGH9b7UfZ3HQLX9nqZKDnTYAlJb6NUk7xZSAF8nm9W0duwUz87s/vrkEJ4
 b8oYUDnI6mYiwEM65sPa+lCJUm0tDxsmYOMB2o6MCgq3p8/phJwy9AqA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH 1/3] rust: add missing zlib and zstd dependencies
Date: Mon, 27 Oct 2025 11:28:58 +0100
Message-Id: <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 10:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225330

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Use WRAPPER_TARGET_EXTRALD to pass '-lz -lzstd' to the target linker wrapper,

Rust's internal LLVM requires zlib and zstd compression libraries when
building rustc_codegen_llvm and other compiler components.
Without these dependencies, building Rust for PowerPC target fails
with linker errors:

  error: linking with `target-rust-ccld` failed: exit status: 1
  = note: undefined reference to `compress2'
  = note: undefined reference to `uncompress'
  = note: undefined reference to `ZSTD_decompress'
  = note: undefined reference to `ZSTD_isError'
  = note: undefined reference to `ZSTD_compress2'
  = note: undefined reference to `crc32'

This manifested in oe-selftest failure on qemuppc:
  oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

Fix rust-common.bbclass wrapper generation to properly split EXTRALD flags
into separate arguments (extend instead of append), making the wrapper
mechanism work correctly for multi-flag values like '-lz -lzstd'.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/rust-common.bbclass   | 2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 31331c7a26..d9f7a7a932 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -149,7 +149,7 @@ create_wrapper_rust () {
 	binary = orig_binary.split()[0]
 	args = orig_binary.split() + sys.argv[1:]
 	if extras:
-	    args.append(extras)
+	    args.extend(extras.split())
 	os.execvp(binary, args)
 	EOF
 	chmod +x "${file}"
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 0319d73b93..8247e9a10a 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -69,6 +69,11 @@ do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 do_rust_setup_snapshot[depends] += "patchelf-native:do_populate_sysroot"
 
+# Pass zlib/zstd link flags to the target linker wrapper via WRAPPER_TARGET_EXTRALD.
+# This ensures LLVM-using components (like rustc_codegen_llvm) can find compression libraries.
+# The wrapper will split this into separate arguments automatically.
+WRAPPER_TARGET_EXTRALD:append:class-target = " -lz -lzstd"
+
 RUSTC_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/rustc"
 CARGO_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/cargo"
 RUSTC_BOOTSTRAP:class-native = "${WORKDIR}/rust-snapshot/bin/rustc"
-- 
2.47.2


