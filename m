Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EC5C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:00:51 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17558.1787083245136095961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 13:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=k7rZswBl;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3E802E41112;
	Tue, 18 Aug 2026 22:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1787083243; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6P0IPtTt8BLo1o7egMuGvBwawE0dHVjsrunaOo1yr1o=;
	b=k7rZswBl1h1hgrkjvTpF8wm2+rs5Oi0Vfb6Ol6DzmjDQORy/92AYqV/3J0G7H41i63ZS7u
	j6dRo0e16sj5SXuwiXd+8zbFFs7vGrt8FnuztcIF6EEjIzEgC+sJFBMr5PYKPamwqVRKOH
	NIZ7g+9r2zGSgCu7V8sTiYqQmYYlIEZX3eXMwX3rIWlmAYGWwCAUw9/Ii+TdXwyME5z64s
	DWvFOolM+f1wBto/QFB+v0RZRMUEFybBIVbrvrpYv0j7u1wECU4oEX0Hucs11ysVwmuV3W
	Jzr9kfCuaoLbTKcr0tWIYoUVbKivxZJr/0/BBsSErUdKG45aAxHa2fowKkFscA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-core@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [wrynose][PATCH 2/2] python3: fix stringold cache files
Date: Tue, 18 Aug 2026 22:00:37 +0200
Message-ID: <20260818200037.7044-2-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818200037.7044-1-tafil@tafhub.de>
References: <20260818200037.7044-1-tafil@tafhub.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 20:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243692

In the 3.14.0 upgrade the stringold package updated to the string module
directory but did not update the cache files. This resulted on targets
to generate `string/__pycache__/__init__.cpython-314.pyc`.

The packaging of the cache files can be only separated with a manual
edit but breaks do_create_manifest. Instead follow other packages and
bundle `string/__pycache__` in files.

Fixes: 56318067ab3e ("python3: upgrade 3.13.11 -> 3.14.0")

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90e44d557d9897bd5c73018825d74eb338273b58)
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

