Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E09CCE7B0B
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 08:11:03 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.9113.1695888653786375614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Sep 2023 01:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=AUlMh1mZ;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7qaREPnWPCoM82eXEXvpc1UVBL8vlUYgDUw33uG6yP8=; b=AUlMh1mZSkjXXjabByFX2cFbs1
	GKU+GH/GgAAuW+w5ZHqZ6KM3HDootwHz9UIRsZCLeP1cl0c0v8E7lxON+kbTqEq23oWsXFt0ybZx3
	wv6jImzK5WCyGSkHxcojt++K4u5KvBCmgxNnWoW2SQfA8BAtYqLGp8+SICU/qQ8npq1DNpVrRYOA6
	r7BG0+5kPsFFrzaMxZK7Su6VIxAcyM3jx4L601Vzn2Wu1P2/KAAg3rCXwT4ox/jmOpEb4n0HpCQIZ
	Y6DmVAOW3RjfZ6K5h0B2o4ysjuIAa7xQRrLCDo/0lclsw7Knixm/cFPG+cVFRpPKaKpZ/UEefIJtQ
	kS/FHDXQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qlm6k-000PLx-R5; Thu, 28 Sep 2023 10:10:50 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qlm6k-000LdD-Jq; Thu, 28 Sep 2023 10:10:50 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][RFC 1/2] rust-cross-canadian: set CARGO_TARGET_<triple>_RUSTFLAGS
Date: Thu, 28 Sep 2023 10:10:32 +0200
Message-ID: <20230928081035.604380-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27044/Wed Sep 27 09:43:59 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 08:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188369

Avoid setting sdk-wide RUSTFLAGS as these flags only are valid when
building for target.
This will enable building for different targets with different
RUSTFLAGS.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index d569ac59f5..d25646237c 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -54,8 +54,10 @@ do_install () {
     mkdir "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
+    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
-- 
2.42.0


