Return-Path: <sven@svenschwermer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB14CCD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 10:10:55 +0000 (UTC)
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
 by mx.groups.io with SMTP id smtpd.web11.14125.1712830245475750470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 03:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@svenschwermer.de header.s=mail header.b=TZuuSwjC;
 spf=pass (domain: svenschwermer.de, ip: 49.12.228.226, mailfrom: sven@svenschwermer.de)
X-Virus-Scanned: Yes
From: Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
	s=mail; t=1712830241;
	bh=jpnaUZwAhlNq+TTwzXreSSMypn7rOZnPT+w9I5axLBo=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=TZuuSwjCYmFPQliyjodhTuPVt1Glj2xJ5UHbwd63Jt0U4eRtyN9JY0gGEeJDcCNdJ
	 3MtxabagiV+do5Om4O/0xA7hsdX3cu4BSIY/Cp8JJYjB3CMGhWilKE7T8vI+1C2F70
	 dXh3Qzb5+XRl7M8nEakeEC61dEAaNYllDNRBm0H8sNUc/SwZkLWSUyMe97NXWEG3Jw
	 MXvSKXLvXd5W1e9OAHU1uEnUxjCiLMu0lESuikexxNw/qg6x6YEEUDLp6dd20mWg9o
	 IlODHitBph2Faa4PhoIaDnSxkVxu+hOGW5E2pdfpLqJReYY2kPOghDA09c1i6n0eF5
	 miz4PVuXZBQ4Q==
To: openembedded-core@lists.openembedded.org
Cc: lukas.funke@weidmueller.com,
	uvv.mail@gmail.com,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: [PATCH 2/2] recipetool: Handle several go-import tags in go resolver
Date: Thu, 11 Apr 2024 12:10:30 +0200
Message-ID: <20240411101030.2846823-2-sven@svenschwermer.de>
In-Reply-To: <20240411101030.2846823-1-sven@svenschwermer.de>
References: <20240411101030.2846823-1-sven@svenschwermer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 10:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198125

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

When dynamically resolving go modules, the HTML page may contain several
go-import meta tags. We must handle all and pick the correct one based
on the module name. An example for such a behaviour is
gonum.org/v1/gonum:

<meta name=3D"go-import" content=3D"gonum.org/v1/exp git https://github.c=
om/gonum/exp">
<meta name=3D"go-import" content=3D"gonum.org/v1/gonum git https://github=
.com/gonum/gonum">
<meta name=3D"go-import" content=3D"gonum.org/v1/hdf5 git https://github.=
com/gonum/hdf5">
<meta name=3D"go-import" content=3D"gonum.org/v1/netlib git https://githu=
b.com/gonum/netlib">
<meta name=3D"go-import" content=3D"gonum.org/v1/plot git https://github.=
com/gonum/plot">
<meta name=3D"go-import" content=3D"gonum.org/v1/tools git https://github=
.com/gonum/tools">

Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com=
>
---
 scripts/lib/recipetool/create_go.py | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
index 0fb7115e26..a85a2f2786 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -225,7 +225,7 @@ class GoRecipeHandler(RecipeHandler):
=20
             def __init__(self):
                 super().__init__()
-                self.__srv =3D []
+                self.__srv =3D {}
=20
             def handle_starttag(self, tag, attrs):
                 if tag =3D=3D 'meta' and list(
@@ -233,19 +233,14 @@ class GoRecipeHandler(RecipeHandler):
                     content =3D list(
                         filter(lambda a: (a[0] =3D=3D 'content'), attrs)=
)
                     if content:
-                        self.__srv =3D content[0][1].split()
+                        srv =3D content[0][1].split()
+                        self.__srv[srv[0]] =3D srv
=20
-            @property
-            def import_prefix(self):
-                return self.__srv[0] if len(self.__srv) else None
-
-            @property
-            def vcs(self):
-                return self.__srv[1] if len(self.__srv) else None
-
-            @property
-            def repourl(self):
-                return self.__srv[2] if len(self.__srv) else None
+            def go_import(self, modulepath):
+                if modulepath in self.__srv:
+                    srv =3D self.__srv[modulepath]
+                    return GoImport(srv[0], srv[1], srv[2], None)
+                return None
=20
         url =3D url.geturl() + "?go-get=3D1"
         req =3D urllib.request.Request(url)
@@ -265,7 +260,7 @@ class GoRecipeHandler(RecipeHandler):
         parser.feed(body.decode('utf-8'))
         parser.close()
=20
-        return GoImport(parser.import_prefix, parser.vcs, parser.repourl=
, None)
+        return parser.go_import(modulepath)
=20
     def __resolve_from_golang_proxy(self, modulepath, version):
         """
--=20
2.44.0


