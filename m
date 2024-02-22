Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F1BC48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 10:30:26 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.9922.1708597817581005749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 02:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=oesGeFP/;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CCDBF9C4AE3;
	Thu, 22 Feb 2024 05:30:16 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id bOB-dleI_G9z; Thu, 22 Feb 2024 05:30:16 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2CAC49C489C;
	Thu, 22 Feb 2024 05:30:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 2CAC49C489C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708597816; bh=Cc/DlJhYW5al8c3EfDEHCtXUsVz1RP4o+uOHvYZSJPk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=oesGeFP/XLc4AAlj8hoPtBnJTLOIhzA7Fblx61bc39jyGYSmszM7WjsvdyQaRS3WQ
	 as1uuTJzugrTmHO1FXaLknAohRhz58DkkyF0kHvlr2nm5UHAhFYK1olOoslGqVFFsY
	 Gg6Nv2QPkvcYfGq76R4MZQ1srTlYm2T3u815WpshLrekl3eOpGHDvG3Wg04NO+n+xN
	 VGjRsSA0vY0aqJ6dudVhDvHQcqvyoCYt016GPa0O5rbStohUwEQZfL4y03XOG8cTt+
	 8RFw7u0gsYj7Ng0h5nZisngxDDeB2RbivpRLpOlLFoYmjxfPu6HzikAwSFgufuGfcT
	 FA5EEcM6Ea3fw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Unww7-1dZieR; Thu, 22 Feb 2024 05:30:16 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 575599C4AC2;
	Thu, 22 Feb 2024 05:30:15 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	richard.purdie@linuxfoundation.org,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 1/2] devtool: ide: define compilerPath for meson projects
Date: Thu, 22 Feb 2024 11:29:55 +0100
Message-Id: <20240222102956.346542-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222102956.346542-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240222102956.346542-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 10:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196009

The compile_commands.json file output by meson uses the compiler as if
present in the $PATH. However, when using an IDE, the $PATH used by
bitbake is not there.

The vscode-cpptools now allows to define the compilerPath in addition
to replace the one from compile_commands.json.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
 scripts/lib/devtool/ide_sdk.py              | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/de=
vtool/ide_plugins/ide_code.py
index f44665ed872..d5e3a4f4215 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -194,6 +194,7 @@ class IdeVSCode(IdeBase):
             properties_dict["configurationProvider"] =3D "ms-vscode.cmak=
e-tools"
         elif modified_recipe.build_tool is BuildTool.MESON:
             properties_dict["configurationProvider"] =3D "mesonbuild.mes=
onbuild"
+            properties_dict["compilerPath"] =3D os.path.join(modified_re=
cipe.staging_bindir_toolchain, modified_recipe.cxx.split()[0])
         else:  # no C/C++ build
             return
=20
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index 14679744807..b52b52ae738 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -345,6 +345,7 @@ class RecipeModified:
         self.base_libdir =3D recipe_d.getVar('base_libdir')
         self.bblayers =3D recipe_d.getVar('BBLAYERS').split()
         self.bpn =3D recipe_d.getVar('BPN')
+        self.cxx =3D recipe_d.getVar('CXX')
         self.d =3D recipe_d.getVar('D')
         self.fakerootcmd =3D recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv =3D recipe_d.getVar('FAKEROOTENV')
@@ -360,6 +361,8 @@ class RecipeModified:
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native =3D os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
+        self.staging_bindir_toolchain =3D os.path.realpath(
+            recipe_d.getVar('STAGING_BINDIR_TOOLCHAIN'))
         self.staging_incdir =3D os.path.realpath(
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd =3D recipe_d.getVar('STRIP')
--=20
2.34.1


