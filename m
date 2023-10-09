Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AC4E95A91
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 10:51:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.58251.1696848681742544964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 03:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=D1fzYaYh;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=7DT9LzvNFuQGp3cl2s0ksQbyawohnuvn3Qc5omAZe64=; b=D1fzYaYhh36euFsKoh3d6I6Too
	EvNzdso/p3fYW1ElZgxpfs7JHUulnfl/8FOQvsqYVnn+DVDKr/8Uzrw6AGS1b6RP8MaEeuUSlLqp/
	6eTihnylWJS9NInqRHJl0elJHGOrl7lBDW2IJ084w9iXdimWh134Aumvdd+nqhdkyOCGzwxsl26R2
	J1upKe3KGj/4S4gAygOU07UNEba6szXgMaSaPaDcXlcXWE8z3jeytyAN3qLCG5kzpkUTYn+Z2jgin
	fZ4+tbA6bAgStNoYAvD6xgKpzwdNUmG+XelYS4wxgx0xM+1Tyj3VwaLPZajA0YkYjHiq974irrKpv
	dg/XJUjQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qpnr4-000N2g-Ub; Mon, 09 Oct 2023 12:51:18 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qpnr4-000C3o-Mn; Mon, 09 Oct 2023 12:51:18 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH v3 2/3] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER for nativesdk
Date: Mon,  9 Oct 2023 12:51:13 +0200
Message-ID: <20231009105116.4169222-2-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009105116.4169222-1-sean@geanix.com>
References: <20231009105116.4169222-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27056/Mon Oct  9 09:40:11 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 10:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188833

This will enable us to build and run rust programs on the sdk host.

% cargo run --target x86_64-oesdk-linux-gnu -vv
       Fresh hello v0.1.0 (~/development/hello)
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 target/x86_64-oesdk-linux-gnu/debug/hello`
Hello, world

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Changes since v2:
- Find correct loader. Made with inspiration from meta/classes-global/uninative.bbclass

 meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index d25646237c..baa58e9838 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -55,9 +55,12 @@ do_install () {
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKLOADER=${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'i686', 'ld-linux.so.2', '', d)}${@bb.utils.contains('SDK_ARCH', 'aarch64', 'ld-linux-aarch64.so.1', '', d)}${@bb.utils.contains('SDK_ARCH', 'ppc64le', 'ld64.so.2', '', d)}
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
-- 
2.42.0


