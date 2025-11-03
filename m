Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120B4CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:29:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16126.1762158589809033987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=N5ROCn2O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1328017-202511030829475157e285d4000207b7-cfixsa@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202511030829475157e285d4000207b7
        for <openembedded-core@lists.openembedded.org>;
        Mon, 03 Nov 2025 09:29:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/FcPT6YV1o0QRAh50MUTdJX7EcaXO3sYghuczaka/kg=;
 b=N5ROCn2O3CXbWJeCU3vEYOCknMNLCuRMBcxyvz+jkOwf8yU2EUlmolkGqrlZN+NP9he9qJ
 891V9ura0o/g8GEEbp0yV32IQpQj/0O1LuGW6R2n/T/Yl7PSV6uJ5T5WfSNiYYhDrA8pPyCW
 14X1d21Dw9c75xYRZ96VkQUJ2D8ftF7uNKnKRE3A9Vf4uXZqQa2eva6TI20RbzcH1tkJNK+2
 dmkc0fh9CofSPkXfJslx6hCuvTLrwwCMp/DSxh8w9Ha6yo9ruWoZRrnRRRjudcM/IlIcZ+7i
 WbS8D+JsUvWmHryYlpsQfnOFsHL8axIxdrytGlgNAv58DVO/PhDrSSbQ==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH v2 1/2] oeqa/selftest/rust: pass zlib/zstd link args to test build
Date: Mon,  3 Nov 2025 09:29:10 +0100
Message-Id: <20251103082911.1792759-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
References: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225634

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Pass -lz and -lzstd linker arguments via RUSTFLAGS when running the
bootstrap test suite.

The Rust self-test executes 'python3 src/bootstrap/bootstrap.py test --target'
on the host, which builds and links test binaries for the target architecture
(these binaries are then uploaded to QEMU for execution). The test binaries
use LLVM's compression functionality and require explicit linker flags for
zlib and zstd.

The RUSTFLAGS exported at recipe level (in rust_1.90.0.bb) do not propagate
to this bootstrap test invocation in the selftest harness, so we must set them
explicitly in the test command.

This fixes PowerPC (qemuppc) test failures with undefined references:
  undefined reference to 'compress2'
  undefined reference to 'uncompress'
  undefined reference to 'ZSTD_decompress'
  undefined reference to 'ZSTD_isError'
  undefined reference to 'ZSTD_compress2'
  undefined reference to 'crc32'

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 31222e2456..819ff6af9e 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to minimize test binary sizes
-            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo';"
+            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo -Clink-arg=-lz -Clink-arg=-lzstd';"
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
             cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s" % (builddir, testargs, targetsys)
-- 
2.47.2


