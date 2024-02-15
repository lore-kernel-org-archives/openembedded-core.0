Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106B1C48BF1
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:39 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.19503.1708016672182225371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=GuG+iKA6;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7CB5A9C334C;
	Thu, 15 Feb 2024 12:04:31 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DsnmTqwL5sck; Thu, 15 Feb 2024 12:04:30 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CC12F9C2A5D;
	Thu, 15 Feb 2024 12:04:30 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CC12F9C2A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016670; bh=Wzrm8azSed8nb4684dMiieGw87UQ+4LX4zZMKDKCJso=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=GuG+iKA6jHPPQGbWrBl5wCSXU8ghpjiWS0aHenGTp7/dxiiCoSWdoFKrHsLaOhypO
	 DAXNJdZE/RAUjCwndxFNjS+Sb3RW1sxCt1z+2f36YAwuLzAkqzpI68jF4TAKMmHsq3
	 HkQaz9KmWWii7fZ2VF3ZdEwyB1KSPWxmJQRI+cPHf15t4us/4TLgy5+AaUX9m7jES5
	 C9Yize32C0QypDjrPq90G4vmcuMskA/Sn7uwL+0EYJDvxvRTKomULsfe1qBUVsntDl
	 Fh9rbbpdOIE/kiqw1d2h1JzNwkkyUT61fDPE1FGPBFEOGWXXlX0o2S79zuuqUWSGVo
	 udJPqKdtzV2Cg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id zQYFGhd6YUnU; Thu, 15 Feb 2024 12:04:30 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1C3F19C117B;
	Thu, 15 Feb 2024 12:04:30 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 3/6] devtool: code: Add source mapping for debug source files
Date: Thu, 15 Feb 2024 18:04:19 +0100
Message-Id: <20240215170422.659073-4-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195551

When launching the debug configuration, the source files from the debug
rootfs were openened in the editor instead of the local workspace files.
We add an exception to properly map them to the file being developed and
compiled by the IDE integration. This also more closely matches what the
user would expect compared to native development.

This is also true for the devtool fallback mode.
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
 scripts/lib/devtool/ide_sdk.py              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/de=
vtool/ide_plugins/ide_code.py
index b2193130d2e..c063b7d0590 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -234,6 +234,7 @@ class IdeVSCode(IdeBase):
         if gdb_cross_config.image_recipe.rootfs_dbg:
             launch_config['additionalSOLibSearchPath'] =3D modified_reci=
pe.solib_search_path_str(
                 gdb_cross_config.image_recipe)
+            src_file_map[os.path.join("/usr/src/debug", modified_recipe.=
pn, modified_recipe.pv)] =3D "${workspaceFolder}"
             src_file_map["/usr/src/debug"] =3D os.path.join(
                 gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", =
"debug")
         else:
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index a82ab572998..1e36f2b2093 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -356,6 +356,7 @@ class RecipeModified:
             'PACKAGE_DEBUG_SPLIT_STYLE')
         self.path =3D recipe_d.getVar('PATH')
         self.pn =3D recipe_d.getVar('PN')
+        self.pv =3D recipe_d.getVar('PV')
         self.recipe_sysroot =3D os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native =3D os.path.realpath(
--=20
2.34.1


