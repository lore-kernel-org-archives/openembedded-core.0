Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D4AC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:38 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.19504.1708016673072717387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=dPZ+HGGW;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 61AA59C32FC;
	Thu, 15 Feb 2024 12:04:32 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5EmF2YRzckC5; Thu, 15 Feb 2024 12:04:31 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AA5AA9C2A5D;
	Thu, 15 Feb 2024 12:04:31 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AA5AA9C2A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016671; bh=GPObCRhK69ChSNIJBXEBRkYwd/skQBRxPcWfi7wHSJ8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=dPZ+HGGW+loQp/pePWNsEZ1bj5ow3qxqIaKpIIhjW1Fqj5YP4N493xQL+UCUEoNtE
	 S+UdcIbKpcwSy39TfDAAnVC6I16f9Zt45TmQ4YwV4Qco1oHAKor4zg6Tp/NzBldvMI
	 RLZpEVcg4Vlqrk8hGQhswjG0F6X3hObUDWzzbgb2LIDym1VR5sKu8bgMZFTGCyG1em
	 nIYbHjeCSnnIEDjMOw/GRYsaSAJDRUF0ZjazQFMv4LQ9ba7mSnaWJH1WgazipacTwr
	 tKXXaKDqOM7qtRJIsOo5PsgS2FJqgCn0d6UJat1gse0sSOiSgz+61f19F3CWJBQvF8
	 1R8afP35q4CaA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JXlMrEix4xpi; Thu, 15 Feb 2024 12:04:31 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EC7BD9C117B;
	Thu, 15 Feb 2024 12:04:30 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 4/6] devtool: ide: vscode: Configure read-only files
Date: Thu, 15 Feb 2024 18:04:20 +0100
Message-Id: <20240215170422.659073-5-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195552

When debugging or browsing files, the user may fall into external
sources from other packages in the sysroot or dbg-rootfs. Modifying them
will only lead to confusion since they will be overwritten by Yocto. The
user should open them in a separate devtool modify session if they want
to make changes. Meanwhile, we should prevent write access to them.
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/de=
vtool/ide_plugins/ide_code.py
index c063b7d0590..7b683c74086 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -125,7 +125,7 @@ class IdeVSCode(IdeBase):
         settings_dict["cmake.configureOnOpen"] =3D True
         settings_dict["cmake.sourceDirectory"] =3D modified_recipe.real_=
srctree
=20
-    def vscode_settings(self, modified_recipe):
+    def vscode_settings(self, modified_recipe, image_recipe):
         files_excludes =3D {
             "**/.git/**": True,
             "**/oe-logs/**": True,
@@ -138,9 +138,16 @@ class IdeVSCode(IdeBase):
             "**/oe-workdir/**",
             "**/source-date-epoch/**"
         ]
+        files_readonly =3D {
+            modified_recipe.recipe_sysroot + '/**': True,
+            modified_recipe.recipe_sysroot_native + '/**': True,
+        }
+        if image_recipe.rootfs_dbg is not None:
+            files_readonly[image_recipe.rootfs_dbg + '/**'] =3D True
         settings_dict =3D {
             "files.watcherExclude": files_excludes,
             "files.exclude": files_excludes,
+            "files.readonlyInclude": files_readonly,
             "python.analysis.exclude": python_exclude
         }
         self.__vscode_settings_cmake(settings_dict, modified_recipe)
@@ -425,7 +432,7 @@ class IdeVSCode(IdeBase):
             self.vscode_tasks_fallback(args, modified_recipe)
=20
     def setup_modified_recipe(self, args, image_recipe, modified_recipe)=
:
-        self.vscode_settings(modified_recipe)
+        self.vscode_settings(modified_recipe, image_recipe)
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe)
         if args.target:
--=20
2.34.1


