Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08AFC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 16:45:24 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.40700.1737391516026445190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 08:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=K0ZtsI0B;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 50KGjDlk1870040
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1737391513;
	bh=6r/eMduz7iAyQwUMVsWPF8C4dpCdtqoiPvflbU7532M=; l=1786;
	h=From:To:Cc:Subject:Date;
	b=K0ZtsI0BfjRzcU7qIpgRRgnRqjsZ5kGwq20Wq7DkKR8HvERf4fK9aSjhjWvTHSHAW
	 8jUvR2tmF92wgfA+o+bAQ6gM4vG8IW4nFcrZgv2tolEJfcSMK7JyJmcgpTiAGvK9oZ
	 KE4t4sciy8ZTJgaWxCNDtuo6art7FGkFtneVMWEwmHxjWMHJcyTr4Gob+qo6Jl+lAJ
	 KzBEhxMWdRWowu7ZTbxv6z3TZwsZAllRfWSEXfUh2FqLR4eMGTaiaMj8fbDGR5TkVs
	 Ykyi4Q7ZDOKjN3o65NVahS/+WA0SgsFQ+d21LajXjlA8c9i+Q/TtNS5VJzA5X9FQzs
	 DP/u2ptL70pYQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTP id 50KGjA0c2312817
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 20 Jan 2025 17:45:10 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id DP2KQJ1LCR; Mon, 20 Jan 2025 17:45:09 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 50KGj9XG1815253
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 20 Jan 2025 17:45:09 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.98)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1tZuth-00000002qzW-1bPB;
	Mon, 20 Jan 2025 17:45:09 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] rust-common: add LDFLAGS to 'build-rust-cc' wrapper
Date: Mon, 20 Jan 2025 17:45:04 +0100
Message-ID: <20250120164504.680234-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 678e7d958c284250d7b37cb5
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210043

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Although rust differs between compiling (--> 'rust-cc' wrapper) and
linking (--> 'rust-ccld' wrapper), some core crates are using only the
'rust-cc' wrapper to check for available compiler options [1] and
libraries [2].

Not having LDFLAGS can break the build in subtle ways.  E.g. 'cargo-native'
can fail to build with

|   = note: .../hosttools/ld: .../liblibz_sys-....rlib(deflate.o):
|     relocation R_X86_64_32S against hidden symbol `_length_code' can not be used when making a PIE object

because it does not find '-lz' (added by "DEPENDS = zlib") and builds
a static libz.a with missing PIC flags.

Add LDFLAGS to the 'build-rust-cc' wrapper as it is done already for
the target one.

[1] https://github.com/rust-lang/cc-rs/pull/1322

[2] https://github.com/rust-lang/libz-sys/blob/12a32798c6bd18986cb5cd603359b03c96f0eb4c/build.rs#L228-L234

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 6940093e59bf..baa3869c478f 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -173,7 +173,7 @@ do_rust_create_wrappers () {
 	mkdir -p "${WRAPPER_DIR}"
 
 	# Yocto Build / Rust Host C compiler
-	create_wrapper_rust "${RUST_BUILD_CC}" "" "${CRATE_CC_FLAGS}" "${BUILD_CC}"
+	create_wrapper_rust "${RUST_BUILD_CC}" "" "${CRATE_CC_FLAGS}" "${BUILD_CC}" "${BUILD_LDFLAGS}"
 	# Yocto Build / Rust Host C++ compiler
 	create_wrapper_rust "${RUST_BUILD_CXX}" "" "${CRATE_CC_FLAGS}" "${BUILD_CXX}"
 	# Yocto Build / Rust Host linker
-- 
2.48.1


