Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1D9C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 09:37:37 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.13412.1720949854488649192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 02:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=A4hu/E0A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202407140937315a29e167ccb2e17f93-xjdpya@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202407140937315a29e167ccb2e17f93
        for <openembedded-core@lists.openembedded.org>;
        Sun, 14 Jul 2024 11:37:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=V6XAZrIGK9Hq1tBBAfBycj9ASNWNpEaSESeeHj4+mEQ=;
 b=A4hu/E0A7T+JFxM/GiJTxiMhU78cb86Llorg4BUwsju6SFIwBGx/Y1PG5fS0zc8xBLAT6D
 +h7Yk5cLnsqCeSPojQgCDb+r42HXojSxjb27EPNvFzmjYHk3g6ZsUiqWsd804jNEpLvnL8Ib
 ssgT/wfXFX3aSh1Klxhm4gAVx4haQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH] libstd-rs,rust-cross-canadian: set CVE_PRODUCT to rust
Date: Sun, 14 Jul 2024 11:36:28 +0200
Message-Id: <20240714093628.10082-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 09:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201855

From: Peter Marko <peter.marko@siemens.com>

These recipes come from rust sources and CVEs are reported for them
under rust-lang:rust vendor:product touple.
Especially libstd-rs needs correct CVE_PRODUCT as is it installed on
target devices (being statically linked to rust compiled binaries).

before:
cargo: CVE_PRODUCT="cargo"
cargo-c-native: CVE_PRODUCT="cargo-c"
libstd-rs: CVE_PRODUCT="libstd-rs"
rust: CVE_PRODUCT="rust"
rust-cross-canadian: CVE_PRODUCT="rust-cross-canadian-<arch>"
rust-llvm: CVE_PRODUCT="rust-llvm"

after:
cargo: CVE_PRODUCT="cargo"
cargo-c-native: CVE_PRODUCT="cargo-c"
libstd-rs: CVE_PRODUCT="rust"
rust: CVE_PRODUCT="rust"
rust-cross-canadian-x86-64: CVE_PRODUCT="rust"
rust-llvm: CVE_PRODUCT="rust-llvm"

Product for rust-llvm is uncertain and, should be handled in another
commit if it is desired to align it, too.

sqlite> select vendor, product, count(product) from products where vendor="rust-lang" group by product;
rust-lang|async-h1|2
rust-lang|cargo|5
rust-lang|future-utils|2
rust-lang|futures-task|2
rust-lang|mdbook|1
rust-lang|regex|2
rust-lang|rsa|2
rust-lang|rust|45
rust-lang|socket2|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/libstd-rs_1.75.0.bb     | 2 ++
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
index 5fc6fb97bb..14161714f2 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
@@ -15,6 +15,8 @@ S = "${RUSTSRC}/library/sysroot"
 RUSTLIB_DEP = ""
 inherit cargo
 
+CVE_PRODUCT = "rust"
+
 DEPENDS:append:libc-musl = " libunwind"
 # rv32 does not have libunwind ported yet
 DEPENDS:remove:riscv32 = "libunwind"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f962437d6b..c34b839d15 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -1,5 +1,6 @@
 SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
 PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+CVE_PRODUCT = "rust"
 
 inherit rust-target-config
 inherit rust-common
-- 
2.30.2


