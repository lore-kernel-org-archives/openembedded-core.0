Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7054C5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 19:51:07 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14925.1786823462125043192
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 12:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=EbZ7kN90;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 510D12E41108;
	Sat, 15 Aug 2026 21:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1786823460; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hCVwaABr8C9HeRM2WtSaDYOIMQXcNzp+QM8L6YAw+So=;
	b=EbZ7kN906/B8eiuABfVqi70NPgWW5T59WvdWwJFsECwAi0W6f0b8OgxFSoilf+OvnI0u/N
	3qk22DByrZQ91k8ZBEYss8vyhAFnuNT5dxNV9v5oEbK4WAkZiS5TTGBJTRGzEOrq5knn2A
	a0Al/M38+KY6DefCHI1kwbIibnC1OEiyhNVSPOTs7C2GL01WV4LYn6M1jvkQPHRqAomaOb
	F1RW+wnncbRh26T3Fetvfy0/yp2QFJRm2t9Np46QTsYZeXUYx7pAtj7iweJBSLnBFEl2bY
	taWKw6J7XsBgGt8LK1IO2TnFlPzJEJ701PjeHynZL9EyRcV+0SkKbCZuW8O85A==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-core@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [PATCH 2/2] python3: fix stringold cache files
Date: Sat, 15 Aug 2026 21:49:48 +0200
Message-ID: <20260815194948.124291-2-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815194948.124291-1-tafil@tafhub.de>
References: <20260815194948.124291-1-tafil@tafhub.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 19:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243503

In the 3.14.0 upgrade the stringold package updated to the string module
directory but did not update the cache files. This resulted on targets
to generate `string/__pycache__/__init__.cpython-314.pyc`.

The packaging of the cache files can be only separated with a manual
edit but breaks do_create_manifest. Instead follow other packages and
bundle `string/__pycache__` in files.

Fixes: 56318067ab3e ("python3: upgrade 3.13.11 -> 3.14.0")

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../recipes-devtools/python/python3/python3-manifest.json | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 5d46e4e8b9..008d41e565 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1047,12 +1047,10 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string/__init__.py",
-            "${libdir}/python${PYTHON_MAJMIN}/string/templatelib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/string",
+            "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
-        ]
+        "cached": []
     },
     "syslog": {
         "summary": "Python syslog interface",

