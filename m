Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC51C7EE32
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14135.1751032139866257498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B0DA1A00
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 195143F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 9/9] oeqa/selftest/devtool: update create_go test to match the new behaviour
Date: Fri, 27 Jun 2025 14:48:50 +0100
Message-ID: <20250627134850.152269-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134850.152269-1-ross.burton@arm.com>
References: <20250627134850.152269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219421

Update the test now that the recipe uses go-mod-update-modules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 33 +++++++---------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 2a91f6c7ae4..0bd724c8eef 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -757,13 +757,12 @@ class RecipetoolCreateTests(RecipetoolBase):
=20
     def test_recipetool_create_go(self):
         # Basic test to check go recipe generation
+        self.maxDiff =3D None
+
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
=20
         recipefile =3D os.path.join(temprecipe, 'recipetool-go-test_git.=
bb')
-        deps_require_file =3D os.path.join(temprecipe, 'recipetool-go-te=
st', 'recipetool-go-test-modules.inc')
-        lics_require_file =3D os.path.join(temprecipe, 'recipetool-go-te=
st', 'recipetool-go-test-licenses.inc')
-        modules_txt_file =3D os.path.join(temprecipe, 'recipetool-go-tes=
t', 'modules.txt')
=20
         srcuri =3D 'https://git.yoctoproject.org/recipetool-go-test.git'
         srcrev =3D "c3e213c01b6c1406b430df03ef0d1ae77de5d2f7"
@@ -771,13 +770,11 @@ class RecipetoolCreateTests(RecipetoolBase):
=20
         result =3D runCmd('recipetool create -o %s %s -S %s -B %s' % (te=
mprecipe, srcuri, srcrev, srcbranch))
=20
-        self.maxDiff =3D None
-        inherits =3D ['go-vendor']
+        inherits =3D ['go-mod', 'go-mod-update-modules']
=20
         checkvars =3D {}
         checkvars['GO_IMPORT'] =3D "git.yoctoproject.org/recipetool-go-t=
est"
-        checkvars['SRC_URI'] =3D {'git://${GO_IMPORT};destsuffix=3Dgit/s=
rc/${GO_IMPORT};nobranch=3D1;name=3D${BPN};protocol=3Dhttps',
-                                'file://modules.txt'}
+        checkvars['SRC_URI'] =3D {'git://${GO_IMPORT};protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${GO_SRCURI_DESTSUFFIX}'}
         checkvars['LIC_FILES_CHKSUM'] =3D {
             'file://src/${GO_IMPORT}/LICENSE;md5=3D4e3933dd47afbf115e484=
d11385fb3bd',
             'file://src/${GO_IMPORT}/is/LICENSE;md5=3D62beaee5a116dd1e80=
161667b1df39ab'
@@ -786,26 +783,16 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
         self.assertNotIn('Traceback', result.output)
=20
+        lics_require_file =3D os.path.join(temprecipe, 'recipetool-go-te=
st-licenses.inc')
+        self.assertFileExists(lics_require_file)
         checkvars =3D {}
-        checkvars['VENDORED_LIC_FILES_CHKSUM'] =3D set(
-                 ['file://src/${GO_IMPORT}/vendor/github.com/godbus/dbus=
/v5/LICENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc517eed',
-                 'file://src/${GO_IMPORT}/vendor/github.com/matryer/is/L=
ICENSE;md5=3D62beaee5a116dd1e80161667b1df39ab'])
-        self.assertTrue(os.path.isfile(lics_require_file))
+        checkvars['LIC_FILES_CHKSUM'] =3D {'file://pkg/mod/github.com/go=
dbus/dbus/v5@v5.1.0/LICENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc517eed;spdx=3D=
BSD-2-Clause'}
         self._test_recipe_contents(lics_require_file, checkvars, [])
=20
-        # make sure that dependencies don't mention local directory ./ma=
tryer/is
-        dependencies =3D \
-            [   ('github.com/godbus/dbus','v5.1.0', 'github.com/godbus/d=
bus/v5', '/v5', ''),
-            ]
-
-        src_uri =3D set()
-        for d in dependencies:
-            src_uri.add(self._go_urifiy(*d))
-
+        deps_require_file =3D os.path.join(temprecipe, 'recipetool-go-te=
st-go-mods.inc')
+        self.assertFileExists(deps_require_file)
         checkvars =3D {}
-        checkvars['GO_DEPENDENCIES_SRC_URI'] =3D src_uri
-
-        self.assertTrue(os.path.isfile(deps_require_file))
+        checkvars['SRC_URI'] =3D {'gomod://github.com/godbus/dbus/v5;ver=
sion=3Dv5.1.0;sha256sum=3D03dfa8e71089a6f477310d15c4d3a036d82d028532881b5=
0fee254358e782ad9'}
         self._test_recipe_contents(deps_require_file, checkvars, [])
=20
 class RecipetoolTests(RecipetoolBase):
--=20
2.43.0


