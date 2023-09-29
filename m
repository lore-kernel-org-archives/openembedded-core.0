Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B71E7F153
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 10:20:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.14115.1695982796974962269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 03:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=I7k34PGl;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7qaREPnWPCoM82eXEXvpc1UVBL8vlUYgDUw33uG6yP8=; b=I7k34PGliONsKF+lfEKhs/9RUv
	poGgR1dfouTtIQPo2qOnccJypcKKRSdYK+NgZjsxlZe7WfPF0AC6XkI4tKGeor30gfck/x3RBNbIz
	QRN0D1DljEz30xLoOewomfzKHW9o9OOtuvjd9bkGWbGZnvk1k9OVAHRCxrBY3RY8hmrm8UQMoVIZP
	sRh5+Ia58xqp1YjoqVAdMXgcVAcRdY7IbyDlGlr7G4yOxGZ88D651yylWbrGFImOSj//gSy+hPXyo
	H9TzoZ4dBTW35bTC6jtiU4kx87c5XPTOvlv4sfnKjy2Vc94REagz46xEkCHAQe+l2uICmfUEm+50M
	I9B/bV+A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qmAbC-000EYG-5J; Fri, 29 Sep 2023 12:19:54 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qmAbB-000MOV-Tz; Fri, 29 Sep 2023 12:19:53 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH 1/3] rust-cross-canadian: set CARGO_TARGET_<triple>_RUSTFLAGS
Date: Fri, 29 Sep 2023 12:19:21 +0200
Message-ID: <20230929101925.1442545-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27046/Fri Sep 29 09:41:56 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 10:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188399

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


