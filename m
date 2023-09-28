Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436B0CE7B05
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 08:11:03 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.9300.1695888653969468926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 01:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0ORuHC8A;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TetLa8yIJ40GrgWyOdxvtyUvKYfr61F6OmAb2/Wdnkc=; b=0ORuHC8A2il1WLhLsJUKDc0XIs
	yJDyCOgAkz+pZEObpFkDtIrw94HsjYoCYOvjFVb6QAmK8b7PpnaEzUfkGJAVGw7wrGka+VQjLHzxv
	N/Izy1RXYbbrJQShp6QaxsGu/zn2ZUD1SeGZEkdiUMYRjvB2x4hN0plveyPe86+NGJwkw+o/IDxBF
	wFX4wo/CSt4QaAoQZw9FyHaCp/lVs8KYYSYrJiUSQpMQxZw6ez2Wj42daLxSPl8zfSpjJhYjnF94H
	MkK+zlKecraH/S+kFXROYNKsJ3hSMtLzcBLCFDa65rMydhEo5XLVDOIvUu5bVZ3q0K7sk0POMpYYE
	5qrMvIOQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qlm6l-000PLz-1G; Thu, 28 Sep 2023 10:10:51 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qlm6k-000LdD-OD; Thu, 28 Sep 2023 10:10:50 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][RFC 2/2] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER for nativesdk
Date: Thu, 28 Sep 2023 10:10:33 +0200
Message-ID: <20230928081035.604380-2-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230928081035.604380-1-sean@geanix.com>
References: <20230928081035.604380-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27044/Wed Sep 27 09:43:59 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 08:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188370

This will enable us to build and run rust programs on the sdk host.

% cargo run --target x86_64-oesdk-linux-gnu -vv
       Fresh hello v0.1.0 (~/development/hello)
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `/usr/local/sdk/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 target/x86_64-oesdk-linux-gnu/debug/hello`
Hello, world

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index d25646237c..5b89216658 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -55,9 +55,12 @@ do_install () {
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+    SDKARCH=`echo ${SDK_ARCH} | sed 's/_/-/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/ld-linux-${SDKARCH}.so.2"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
-- 
2.42.0


