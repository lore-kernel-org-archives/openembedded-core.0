Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D300C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 07:22:57 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14507.1786000967977531546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 00:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=JiemirIL;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id 58D33E96F
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 09:22:45 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.211]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wrsR5-19fAFF0; Thu, 6 Aug 2026 09:22:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] rust: patch uninative loader into snapshot's self-contained lld
Date: Thu,  6 Aug 2026 09:22:22 +0200
Message-ID: <20260806072223.3043147-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1786000959-FA7FB93F-8BC92A29/0/0 CLEAN NORMAL
X-TOI-MSGID: 9fb0d658-689c-4a77-b5bd-e5eb50724827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1786000965; i=f_l_k@t-online.de;
	bh=3vZDbX02eEvEFLqeNwuavi45H2uowAacUq2E2awjYzE=;
	h=From:To:Subject:Date;
	b=JiemirILAlT0OJsvDPzYyz/xjzalZReF22klE+HaZwBD3ZwinvxRj1WnOTyhY8HGw
	 +AxW9ubMURhSHddDgFNWayR4Yepf4PRqgPTM3S7W56b47Tt5ES+uMyj8lGSUxKFb3q
	 URcZrKbtOgw2HicFXYuwWQbZwk6QzIPzTXllt4keTY1dn8juFH1BFpsC+C3sp3N9sk
	 L7hQLNr5rTdCHQFn/XWwSrRE0sNLkPaO6Dn7DZyR/l4vwxHt4jme+UADrCE4KCro0e
	 EREnAoayqBKgLXqbEVpILEm39hj86MDE17OEs15qXHXwtFXNBK9WZ+mbpajazn0wI8
	 LglipmlAH0LMw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 07:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242919

Since Rust 1.90, rustc defaults to using the self-contained lld
linker (lib/rustlib/<triple>/bin/gcc-ld/ld.lld, which execs
rust-lld) on x86_64-unknown-linux-gnu.

https://blog.rust-lang.org/2025/09/01/rust-lld-on-1.90.0-stable/

This applies to the snapshot compiler used to bootstrap the target
rustc, before the rust.lld/use-lld settings in the config.toml we
generate for the target compiler can take effect. Without patching
these too, they fail to exec on build hosts without a /lib64
compatibility path.

collect2: fatal error: posix_spawnp: No such file or directory
|           compilation terminated.
|
|
| error: linking with
`/home/flk/bitbake/bitbake-builds/master/build/tmp/work/x86_64-linux/rust=
-native/1.96.1/wrapper/target-rust-ccld`
failed: exit status: 1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/rust/rust_1.96.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-dev=
tools/rust/rust_1.96.1.bb
index f8f47b0414..344e4f5293 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.1.bb
@@ -71,8 +71,12 @@ do_rust_setup_snapshot () {
     # Need to use uninative's loader if enabled/present since the librar=
y paths
     # are used internally by rust and result in symbol mismatches if we =
don't
     if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
-        for bin in cargo rustc rustdoc; do
-            patchelf ${WORKDIR}/rust-snapshot/bin/$bin --set-interpreter=
 ${UNINATIVE_LOADER}
+        for bin in ${WORKDIR}/rust-snapshot/bin/cargo \
+                   ${WORKDIR}/rust-snapshot/bin/rustc \
+                   ${WORKDIR}/rust-snapshot/bin/rustdoc \
+                   ${WORKDIR}/rust-snapshot/lib/rustlib/*/bin/rust-lld \
+                   ${WORKDIR}/rust-snapshot/lib/rustlib/*/bin/gcc-ld/*; =
do
+            [ -f "$bin" ] && patchelf "$bin" --set-interpreter ${UNINATI=
VE_LOADER}
         done
     fi
 }
--=20
2.55.0


