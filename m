Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EB7C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:12:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48980.1782922376116031098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZikfrI8n;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33ECA4537
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 310403F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782922375; bh=I+2FA1mSOApcB9KLwDy6NOKewsZ/EcSzQegPeymG000=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZikfrI8ndU/M7wL3F5fvGengyRMQZsprYbkrYH1ScXIJJa7XK7mmcOAP/GTprUTcS
	 rFCqjeId0IL8YNIgt2x3EvnbcEPZiY3jBVHgqdAg2zVflsaokO65AcV91tbuptEALx
	 NEmsZ1WlF5CD67+QE2NNDawPAM0X5GhbOJfPd0/g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] meson: remove obsolete environment unsets
Date: Wed,  1 Jul 2026 17:12:49 +0100
Message-ID: <20260701161250.980101-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701161250.980101-1-ross.burton@arm.com>
References: <20260701161250.980101-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239989

We no longer need to remove environment variables because their behaviour
was fixed in meson 0.54.0[1].  The corresponding cleanup was done in
meson.bbclass some time ago[2] but was not done here.

[1] https://mesonbuild.com/Release-notes-for-0-54-0.html#environment-vari=
ables-with-cross-builds
[2] oe-core 20a5af2583d ("meson: use native-file instead of environment v=
ariables")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recip=
es-devtools/meson/meson/meson-wrapper
index 570b550e019..a0c1da23299 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -10,11 +10,6 @@ if [ -z "$SSL_CERT_DIR" ]; then
     export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
 fi
=20
-# If these are set to a cross-compile path, meson will get confused and =
try to
-# use them as native tools. Unset them to prevent this, as all the cross=
-compile
-# config is already in meson.cross.
-unset CC CXX CPP LD AR NM STRIP
-
 case "$1" in
 setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewri=
te|compile|devenv|env2mfile|help)
     MESON_CMD=3D"$1"
--=20
2.43.0


