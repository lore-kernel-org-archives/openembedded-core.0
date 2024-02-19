Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DBEC48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:55:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.46412.1708361735567545142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 08:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=RPZIVnP6;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E2C399C4B16;
	Mon, 19 Feb 2024 11:55:34 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id gweErc3HqfEf; Mon, 19 Feb 2024 11:55:34 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3ED8A9C4B13;
	Mon, 19 Feb 2024 11:55:34 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3ED8A9C4B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708361734; bh=HyvSBjrry93ilY5b8144GXeAAo7617Q8fVvZ3SOXfHg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RPZIVnP6RkFlRhVUaC1wOuQ/xysNiyCehcy0mUBFmB4/ATrTe185AInw/s0FK5u7U
	 otkkR78oA7tZ0IpnaFAUjvJE4Sjgh9vuPo+rXjd/Y9E6Laae7T8azKnzU1YLcyTQfU
	 68prV4ZqLHbqFJfjmUnN8U01I/ax7oFd37whLAim0pXTu0ETdRuFhyFjEv/b0UddNZ
	 t1Gtu2mtdV5vgzlgBmZQNX08FnlAmKuI2d8mM3OX5WmXiQB9aNodP3kyEclg37P9hE
	 gFs8DbFZ2yD/O8+TTU6DMON2SWi5wPCN+Tz+NhJHS7lkJADqtiiFjMz/ZxjQP5TRtL
	 e06XOj4AUNTVQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TR1-45U7iefO; Mon, 19 Feb 2024 11:55:34 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 84AF59C4B10;
	Mon, 19 Feb 2024 11:55:33 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH v2 2/5] devtool: code: Add source mapping for debug source files
Date: Mon, 19 Feb 2024 17:55:22 +0100
Message-Id: <20240219165525.714512-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195887

When launching the debug configuration, the source files from the debug
rootfs were openened in the editor instead of the local workspace files.
We add an exception to properly map them to the file being developed and
compiled by the IDE integration. This also more closely matches what the
user would expect compared to native development.

This is also true for the devtool fallback mode.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
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
index 14679744807..f292edbe25c 100755
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


