Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C3DC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:13:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49040.1782922376775060959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=R1dB1EWw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4B7A452F
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE9953F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782922376; bh=wCYAUt7u/hesQLKXEJuk7YvEtHt0IzpINzISIcHTfco=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R1dB1EWwSrx1SYGEFzIAI5wB3SA9gXXqB+cqOfNmDF2sJi67f+jF5y8/om1x/VylD
	 4Ama78h0vZO0myaR3quHhiz7RNYHE5xSG30DYoLJlu3ryFLLu514NG/X8Bb5PM16Un
	 d9dUw8EAGy/q1zbHlkxCCv6cB8ZMTVWg7rCfIjFw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] meson: remove obsolete SSL_CERT_DIR assignment in the wrapper script
Date: Wed,  1 Jul 2026 17:12:50 +0100
Message-ID: <20260701161250.980101-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701161250.980101-1-ross.burton@arm.com>
References: <20260701161250.980101-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239990

The wrapper script no longer needs to set SSL_CERT_DIR to what it hopes
is the right path, as openssl now does this when initialising the SDK[1].

[1] oe-core d6b15d1e70b ("openssl: export necessary env vars in SDK")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recip=
es-devtools/meson/meson/meson-wrapper
index a0c1da23299..57eafca26aa 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -6,10 +6,6 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
     exec "meson.real" "$@"
 fi
=20
-if [ -z "$SSL_CERT_DIR" ]; then
-    export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
-fi
-
 case "$1" in
 setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewri=
te|compile|devenv|env2mfile|help)
     MESON_CMD=3D"$1"
--=20
2.43.0


