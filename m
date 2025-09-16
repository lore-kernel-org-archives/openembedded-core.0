Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF9FCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:10:14 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web10.15494.1758017403985546545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 03:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=yCVAN1Xb;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78EAFCB0A1;
	Tue, 16 Sep 2025 12:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1758017400; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CQyFkTqrOb4mOOdkVcu2kR4CVMBWNuxtn986s+T8s2g=;
	b=yCVAN1Xbnmjp1O/o1z0t30tQ+CQHNM/Hs/rgHfWNexVAv7VXmaL2AZNzhOZnVRjL7qAKoG
	l8HQmHub9Kvp6t0ktBhQtKqNUppeqk0RASKXKQIIr7/r/OUZg6tzGDeUGaQRKcVpxK8w62
	5IJPiztM2spUMeENb3VwgzvAcH7YpJVxIIomt4Waa9qBuj2za496hUwHMuIBJ5zYx9iqe4
	AYvUyRdz/MH4EMT2+NoZGQv5V2eZ2Jj39y9Lv4R8T3y9e8hih/Dze+EMTWnic0oj+ZKSSA
	nomOddLhpa8ATEsD15FGjJ9Zo0M7iga40fceNBYk+vSzKQOVxjQdSglGZ3rPmw==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-core@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH] devtool: Support variables in SRC_URI when upgrading recipes
Date: Tue, 16 Sep 2025 12:09:56 +0200
Message-ID: <20250916100956.319729-1-frieder@fris.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 10:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223540

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Currently when upgrading recipes SRC_URI doesn't get expanded which
can lead to failures if variables are used in SRC_URI. Remove this
limitation by always expanding SRC_URI.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 scripts/lib/devtool/standard.py | 4 ++--
 scripts/lib/devtool/upgrade.py  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 1fd5947c41..9e8889f897 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1540,7 +1540,7 @@ def _update_recipe_srcrev(recipename, workspace, sr=
ctree, rd, appendlayerdir, wi
     remove_files =3D []
     patchfields =3D {}
     patchfields['SRCREV'] =3D srcrev
-    orig_src_uri =3D rd.getVar('SRC_URI', False) or ''
+    orig_src_uri =3D rd.getVar('SRC_URI') or ''
     srcuri =3D orig_src_uri.split()
     tempdir =3D tempfile.mkdtemp(prefix=3D'devtool')
     update_srcuri =3D False
@@ -1672,7 +1672,7 @@ def _update_recipe_patch(recipename, workspace, src=
tree, rd, appendlayerdir, wil
         updatefiles =3D False
         updaterecipe =3D False
         destpath =3D None
-        srcuri =3D (rd.getVar('SRC_URI', False) or '').split()
+        srcuri =3D (rd.getVar('SRC_URI') or '').split()
=20
         if appendlayerdir:
             files =3D OrderedDict((os.path.join(local_files_dir, key), v=
al) for
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
.py
index dda0a58098..6df53b0232 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -359,7 +359,7 @@ def _create_new_recipe(newpv, checksums, srcrev, srcb=
ranch, srcsubdir_old, srcsu
         newvalues['SRCREV'] =3D srcrev
=20
     if srcbranch:
-        src_uri =3D oe.recipeutils.split_var_value(rd.getVar('SRC_URI', =
False) or '')
+        src_uri =3D oe.recipeutils.split_var_value(rd.getVar('SRC_URI') =
or '')
         changed =3D False
         replacing =3D True
         new_src_uri =3D []
--=20
2.51.0


