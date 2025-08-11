Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2601FCA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:44:25 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.43855.1754901858791669446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PpUD3UmY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250811084414601ea3039e08a59d34-zcw9ta@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250811084414601ea3039e08a59d34
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 Aug 2025 10:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Hq8frSuqwvvCY9ME2DhuH7OcxSbAUTY26M9R65/jxTM=;
 b=PpUD3UmYNZ9k48lE3NZ5DUJcUJ9kzV3JLHs3q1cmfHTVtWKShT699LCDVnU1DeL47YH+62
 2Tx6V3HgiQxvUkouXPdbWv+VIj3TLePjiLoSLZQ8IerlQ5ygPCqxZ4ohBjafv4pVMrgfKpz7
 KOnbnh+Z9FvO/zU/SUbVnRryYlk5ZyFUjvae/jC2pSOm474LXGMsuhHms+3LgYI6dqbvjmnw
 d9M6fVp24/S+XFQovEkGvBeYxINjOjXISDLbAl/GCHBK+bRIIpPLI3Rb6YsP4fX1+RSB0+UD
 RSzE9n4plVnmEvsiPmR9QbGkaUig0jG/4K3r76iXRyIi3LotTcZEx5bw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] rust: disable executable-no-mangle-strip test on PowerPC due to linker issue
Date: Mon, 11 Aug 2025 10:43:33 +0200
Message-Id: <20250811084334.28553-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221726

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The executable-no-mangle-strip test fails on PowerPC target with an undefined
reference error when linking. The linker attempts to resolve this undefined symbol
at link time, causing the test to fail with:
  undefined reference to `THIS_SYMBOL_SHOULD_BE_UNDEFINED'

The test is designed to verify garbage collection behavior of #[no_mangle]
functions and used(compiler)] statics. This appears to be a PowerPC-specific
linker behavior issue.

Temporarily disable this test on PowerPC until the underlying issue is
resolved upstream.

Related upstream issue: https://github.com/rust-lang/rust/issues/144777

Fixes oe-selftest failure:
- tests/ui/linking/executable-no-mangle-strip.rs on powerpc-poky-linux-gnu

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
Tested-by: Peter Marko <peter.marko@siemens.com>
---
 .../rust/files/rust-oe-selftest.patch             | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 547807f94c..61f366d18d 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -4,6 +4,8 @@ ignore them during rust oe-selftest.
 Upstream-Status: Inappropriate [OE testing specific]
 
 Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+# added executable-no-mangle-strip.rs ignore
+Signed-off-by: Peter Tatrai <Peter.Tatrai@siemens.com>
 ---
 diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_errors/src/markdown/tests/term.rs
 --- a/compiler/rustc_errors/src/markdown/tests/term.rs
@@ -306,3 +308,16 @@ index 42921442e03..af0edc2ee92 100644
  //@ revisions: OPT0 OPT0_S390X
  //@ [OPT0] ignore-s390x
  //@ [OPT0_S390X] only-s390x
+
+diff --git a/tests/ui/linking/executable-no-mangle-strip.rs b/tests/ui/linking/executable-no-mangle-strip.rs
+index cc283dc53..73cbab9c0 100644
+--- a/tests/ui/linking/executable-no-mangle-strip.rs
++++ b/tests/ui/linking/executable-no-mangle-strip.rs
+@@ -1,5 +1,7 @@
+ //@ run-pass
+ //@ ignore-windows-gnu: only statics marked with used can be GC-ed on windows-gnu
++//@ ignore-powerpc: this test is not working on powerpc
++//  bug report: https://github.com/rust-lang/rust/issues/144777
+ 
+ // Regression test for <https://github.com/rust-lang/rust/issues/139744>.
+ // Functions in the binary marked with no_mangle should be GC-ed if they

