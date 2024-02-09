Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B5C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:39:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14847.1707493194378683966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D099FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:40:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6B5C3F762
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Feb 2024 07:39:53 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][master-next 2/2] oeqa/selftest/recipetool: downgrade meson version used to not use pyproject.toml
Date: Fri,  9 Feb 2024 15:39:51 +0000
Message-Id: <20240209153951.2659327-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240209153951.2659327-1-ross.burton@arm.com>
References: <20240209153951.2659327-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195229

From: Ross Burton <ross.burton@arm.com>

recipetool's pyproject.toml parsing needs tomllib (python 3.11+) or
tomli (not a hard dependency), so is prone to failing depending on the
host configuration.

Downgrade the Meson release used for the checks to 0.52.1, which was the
last release before moving to pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 28 ++++++++++------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 6a8d0302f71..613843869a0 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -451,21 +451,20 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_github(self):
-        # This test require python 3.11 or above for the tomllib module =
or tomli module to be installed
-        needTomllib(self)
-
-        # Basic test to see if github URL mangling works
+        # Basic test to see if github URL mangling works. Deliberately u=
se an
+        # older release of Meson so that 1) this verifies we don't grab =
HEAD and
+        # 2) this release is pre-pyproject.toml.
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
@@ -679,21 +678,18 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_github_tarball(self):
-        # This test require python 3.11 or above for the tomllib module =
or tomli module to be installed
-        needTomllib(self)
-
         # Basic test to ensure github URL mangling doesn't apply to rele=
ase tarballs
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


