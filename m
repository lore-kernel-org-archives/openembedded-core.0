Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A4CCF2E6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36689.1792421923520804369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sPjDTdmE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA549202C
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD11E3F673
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792421923; bh=f8ueY5GHiTFjheE0Ym5YzgvuB6l3ffB2wQ11zgOt1AU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sPjDTdmEE8WS6bygQTU+XKRfLk6hKdHz8psM/IZhZDggEWm7wK8p11yADhavXqxQh
	 bkta+CWKhaejGtmebX0Y+lOn/Q8co1mKdNbZjStt+sOauYxtLGeEv9i7leobuceoDm
	 MhE3D2D08kZ+Xbe+tfV7OPl2jIMPWoWmyWfCpr04=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] lib/oe/package: use cachedpath.is_executable() instead of os.access()
Date: Mon, 19 Oct 2026 15:58:34 +0100
Message-ID: <20261019145837.2487873-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019145837.2487873-1-ross.burton@arm.com>
References: <20261019145837.2487873-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248185

os.access() asks if the *current user* can run the specified binary,
which isn't what we care about when packaging.

We simply want to know if the binary has executable bits set so check
the mode, using cachedpath.is_executable() to avoid another stat() call.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 5d4966be295..5938798cef0 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1780,7 +1780,7 @@ def process_shlibs(pkgfiles, d):
                     darwin_so(file, needed, sonames, pkgver)
                 elif hostos.startswith("mingw"):
                     mingw_dll(file, needed, sonames, pkgver)
-                elif os.access(file, os.X_OK) or lib_re.match(file):
+                elif cpath.is_executable(file) or lib_re.match(file):
                     linuxlist.append(file)
=20
         if linuxlist:
--=20
2.43.0


