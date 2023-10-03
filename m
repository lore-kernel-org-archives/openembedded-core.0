Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA5CE75432
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 07:06:56 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.102813.1696316807532956660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 00:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=fq6vPdr/;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=7qaREPnWPCoM82eXEXvpc1UVBL8vlUYgDUw33uG6yP8=; b=fq6vPdr/LY0ZXpCz9wQSFIgRwO
	zb9sDS9hGxb+NmSq3aXcUxpYEFbDkDjHoFGoPWRpIIsYhV63VdTqZe2JvxQMXCuRfzx0+fUXfc7t9
	GDKudQZfhTn7yND26L4qHo/lBgi3PEdiGIQDMuZHK9LFYLMkmrXr7qi7JndCpmrsy1htuDqFk3snX
	BjT8xsCzkCW9ni6ZFF6p6HmDPacb0fa5iZCWDCDWNE19VuEC+DRA6izXK6Sw6HNkGO4S18U3HFUOI
	GUYlaFUy1VJHTTyltD3DxP5rKE0L3qjZ3bsZszbCyr582KFCa5eSpaCRX01NljGC4kbKPy0pG9viT
	2H8kLV0g==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qnZUS-000PJi-FL; Tue, 03 Oct 2023 09:06:44 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qnZUS-000Nnw-6O; Tue, 03 Oct 2023 09:06:44 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH v2 1/3] rust-cross-canadian: set CARGO_TARGET_<triple>_RUSTFLAGS
Date: Tue,  3 Oct 2023 09:06:28 +0200
Message-ID: <20231003070632.1040011-1-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27049/Mon Oct  2 09:37:00 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 07:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188625

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


