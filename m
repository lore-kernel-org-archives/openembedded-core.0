Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A52C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:49:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15112.1707493781461631986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 120C5DA7
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:50:23 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9BEE3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:49:40 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/selftest/recipetool: downgrade meson version to not use pyproject.toml
Date: Fri,  9 Feb 2024 15:49:37 +0000
Message-Id: <20240209154937.2660108-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195231

From: Ross Burton <ross.burton@arm.com>

recipetool's pyproject.toml parsing needs tomllib (python 3.11+) or
tomli (not a hard dependency), so is prone to failing depending on the
host configuration.

Downgrade the Meson release used for the checks to 0.52.1, which was the
last release before moving to pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 5694d6fb694..83361814dfd 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -451,18 +451,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_github(self):
-        # Basic test to see if github URL mangling works
+        # Basic test to see if github URL mangling works. Deliberately u=
se an
+        # older release of Meson at present so we don't need a toml pars=
er.
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        recipefile =3D os.path.join(temprecipe, 'meson_git.bb')
-        srcuri =3D 'https://github.com/mesonbuild/meson;rev=3D1.3.1'
+        recipefile =3D os.path.join(temprecipe, 'python3-meson_git.bb')
+        srcuri =3D 'https://github.com/mesonbuild/meson;rev=3D0.52.1'
         cmd =3D ['recipetool', 'create', '-o', temprecipe, srcuri]
         result =3D runCmd(cmd)
         self.assertTrue(os.path.isfile(recipefile), msg=3D"recipe %s not=
 created for command %s, output %s" % (recipefile, " ".join(cmd), result.=
output))
         checkvars =3D {}
-        checkvars['LICENSE'] =3D set(['Apache-2.0', 'Proprietary', 'Unkn=
own'])
-        checkvars['SRC_URI'] =3D 'git://github.com/mesonbuild/meson;prot=
ocol=3Dhttps;branch=3D1.3'
-        inherits =3D ['python_setuptools_build_meta']
+        checkvars['LICENSE'] =3D set(['Apache-2.0', "Unknown"])
+        checkvars['SRC_URI'] =3D 'git://github.com/mesonbuild/meson;prot=
ocol=3Dhttps;branch=3D0.52'
+        inherits =3D ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_python3_setuptools(self):
@@ -676,18 +677,19 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_github_tarball(self):
-        # Basic test to ensure github URL mangling doesn't apply to rele=
ase tarballs
+        # Basic test to ensure github URL mangling doesn't apply to rele=
ase tarballs.
+        # Deliberately use an older release of Meson at present so we do=
n't need a toml parser.
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv =3D '1.3.1'
-        recipefile =3D os.path.join(temprecipe, 'meson_%s.bb' % pv)
+        pv =3D '0.52.1'
+        recipefile =3D os.path.join(temprecipe, 'python3-meson_%s.bb' % =
pv)
         srcuri =3D 'https://github.com/mesonbuild/meson/releases/downloa=
d/%s/meson-%s.tar.gz' % (pv, pv)
         result =3D runCmd('recipetool create -o %s %s' % (temprecipe, sr=
curi))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars =3D {}
-        checkvars['LICENSE'] =3D set(['Apache-2.0', 'Proprietary', 'Unkn=
own'])
+        checkvars['LICENSE'] =3D set(['Apache-2.0'])
         checkvars['SRC_URI'] =3D 'https://github.com/mesonbuild/meson/re=
leases/download/${PV}/meson-${PV}.tar.gz'
-        inherits =3D ['python_setuptools_build_meta']
+        inherits =3D ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def _test_recipetool_create_git(self, srcuri, branch=3DNone):
--=20
2.34.1


