Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B37E7F156
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 10:20:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.14116.1695982797250523566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 03:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=lloqF+mR;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TetLa8yIJ40GrgWyOdxvtyUvKYfr61F6OmAb2/Wdnkc=; b=lloqF+mRYiEbM73YKG/puL74Dl
	ve8SGcc10mX1hFCwc1MlKQjXzb+Ykg+YI1OVAmhA8DkjRnUW7b4XUyE9ueMFQeV/9rJjyX/XZMBZe
	btpYLE1E9S5d/EJX9Kf1T7WHJCYsCXf+VaYXThc4qZQWoTh+aUbRdC7G1AybNkwaIaweuqeCYAHdo
	bJz7Px/Ra2/jX93ODTJApvmsMNrS7j066VSXUcBSoaesFipfvhBYLphOKXfwayYxXMJedqf/xOGmk
	Jm81kXRaJ7AdUz4F/igY0TxTCn8szc9r+iZQ2wO0ix0ZvZaO6Q9SzD69mBC1GGpdwfHqvoBUuYH/z
	boMWoz+Q==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qmAbC-000EYH-9G; Fri, 29 Sep 2023 12:19:54 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qmAbC-000MOV-1s; Fri, 29 Sep 2023 12:19:54 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH 2/3] rust-cross-canadian: set CARGO_TARGET_<triple>_RUNNER for nativesdk
Date: Fri, 29 Sep 2023 12:19:22 +0200
Message-ID: <20230929101925.1442545-2-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929101925.1442545-1-sean@geanix.com>
References: <20230929101925.1442545-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27046/Fri Sep 29 09:41:56 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 10:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188397

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


