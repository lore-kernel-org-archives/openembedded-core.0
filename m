Return-Path: <sven@svenschwermer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BD0CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 10:10:55 +0000 (UTC)
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
 by mx.groups.io with SMTP id smtpd.web10.14261.1712830245179628270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 03:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@svenschwermer.de header.s=mail header.b=S2COhHg4;
 spf=pass (domain: svenschwermer.de, ip: 49.12.228.226, mailfrom: sven@svenschwermer.de)
X-Virus-Scanned: Yes
From: Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
	s=mail; t=1712830241;
	bh=onW6WT5JeyeHi1N4Hx9WyFYzbwVpf+8SLeWK+IYGU2Y=;
	h=From:To:Cc:Subject;
	b=S2COhHg4AIxg6HR0l2gTGVacXc0iryco4bcwFGL0desmTKXApveIqbCpTP/Rlc6NN
	 c69IvVfy6bCfHZOF+63NPyOIYYhrPhvZaJzd82ClJlXgrj2qHYOMKFV63V7m56avKH
	 Uu90Ao3aQrZDm4/w9OvuVaPmLl9VusWgs8wH4qbkfEDELrOUte+ZuDAriVDnh6Hpso
	 PFqf+hKtsoPYCHO8ezAM9jvjD7lG/CIRCQIHxuPG2cOP6Vb6B7dy4Efi5QYcAhkHAr
	 tdJnQd/WgK++bC+1VsDabXbSYazVOpQsOweiN6aYOje6SufvqrnAlP1SyCIc7JTt6i
	 +dalF3P32qLEQ==
To: openembedded-core@lists.openembedded.org
Cc: lukas.funke@weidmueller.com,
	uvv.mail@gmail.com,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: [PATCH 1/2] recipetool: Handle unclean response in go resolver
Date: Thu, 11 Apr 2024 12:10:29 +0200
Message-ID: <20240411101030.2846823-1-sven@svenschwermer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 10:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198124

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

It appears that some go modules repond with a 404 error when trying to
resolve them dynamically. The response body may still contain the
go-import meta tag. An example for such behaviour is gonum.org/v1/gonum.

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com=
>
---
 scripts/lib/recipetool/create_go.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
index c560831442..0fb7115e26 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -16,7 +16,7 @@ from html.parser import HTMLParser
 from recipetool.create import RecipeHandler, handle_license_vars
 from recipetool.create import guess_license, tidy_licenses, fixup_licens=
e
 from recipetool.create import determine_from_url
-from urllib.error import URLError
+from urllib.error import URLError, HTTPError
=20
 import bb.utils
 import json
@@ -251,15 +251,18 @@ class GoRecipeHandler(RecipeHandler):
         req =3D urllib.request.Request(url)
=20
         try:
-            resp =3D urllib.request.urlopen(req)
-
+            body =3D urllib.request.urlopen(req).read()
+        except HTTPError as http_err:
+            logger.warning(
+                "Unclean status when fetching page from [%s]: %s", url, =
str(http_err))
+            body =3D http_err.fp.read()
         except URLError as url_err:
             logger.warning(
                 "Failed to fetch page from [%s]: %s", url, str(url_err))
             return None
=20
         parser =3D GoImportHTMLParser()
-        parser.feed(resp.read().decode('utf-8'))
+        parser.feed(body.decode('utf-8'))
         parser.close()
=20
         return GoImport(parser.import_prefix, parser.vcs, parser.repourl=
, None)
--=20
2.44.0


