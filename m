Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07130C98324
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:57:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1756.1790265453431256870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 08:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AyGQzLTw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8271E4D
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73C853F86F
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265452; bh=/qVjxrvD9NZah2XBudSbnDd5ERwEAkKpvTD1e+va82c=;
	h=From:To:Subject:Date:From;
	b=AyGQzLTwQbDFiPJ2DJPJ6YW4lOchvNRL/KCyAox03njEMd4JstX4GbNW+NY65pI67
	 VpN3SqhyIAd6gKItpdAS2xHfZ9YBSVXAkQzq56Apc10WgfEumtHU6ZW0S4NE0dI00L
	 rHLynPAdFbYOgvc8EAMj62DRQI2uIv+6sAGm6nr4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] lib/oe/package: remove unused and optional fatal argument to source_info()
Date: Thu, 24 Sep 2026 16:57:25 +0100
Message-ID: <20260924155728.295458-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 15:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246590

Nothing uses this, so clean up the code slightly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b7030643d2b..777bf99331c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -755,7 +755,7 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwar=
fsrcfiles_output):
=20
     return debugfiles.keys()
=20
-def source_info(file, d, fatal=3DTrue):
+def source_info(file, d):
     # Skip static libraries when using Clang toolchain with LTO enabled.
     # In this case, .a files contain LLVM bitcode instead of ELF objects=
,
     # and dwarfsrcfiles cannot process them.
@@ -775,9 +775,7 @@ def source_info(file, d, fatal=3DTrue):
     # 255 means a specific file wasn't fully parsed to get the debug fil=
e list, which is not a fatal failure
     if retval !=3D 0 and retval !=3D 255:
         msg =3D "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" =
% (retval, cmd, ":\n%s" % output if output else "")
-        if fatal:
-            bb.fatal(msg)
-        bb.note(msg)
+        bb.fatal(msg)
=20
     debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(output=
)
=20
--=20
2.43.0


