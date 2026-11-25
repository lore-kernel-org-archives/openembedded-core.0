Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45849.1795624772463608683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jsaP8W3A;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154AC2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99D523F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624772; bh=fKyYyifovmORosSt4yiGDUvtmyMyX3xC5AaUr3WcIoU=;
	h=From:To:Subject:Date:From;
	b=jsaP8W3AeN8fdMBiqDQVBHButTZZ+ORvS4O+v1Fu+dXeHjBBIXc+ImgRo6OP7MV6Q
	 cDs5b2n8MiuUNQX9FyyAy3fQj8fvZ3lEj7KWQZ15HlLKkJTY8IME722Ufy2ragnabp
	 +yqqRxby5HHsikrr2F7ZWztyq/jX0GPku/Weyhhc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/18] python3: fix packaging of libdir/python3.15/config/
Date: Wed, 25 Nov 2026 16:39:10 +0000
Message-ID: <20261125163927.1835785-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251212
Content-Type: text/plain; charset="utf-8"

The manifest explicitly used ${prefix}/lib/ instead of ${libdir}, which
may have either been correct historically or a mistake.

Either way, if ${libdir} is not "lib" then this means config/ is packaged
into -misc instead of -core.  Use ${libdir} for reliable packaging.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 3462b6e9b11..e425b3d4347 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -330,7 +330,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipimport.py",
-            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
+            "${libdir}/python${PYTHON_MAJMIN}/config*/*[!.a]"
         ]
     },
     "crypt": {
--=20
2.43.0

