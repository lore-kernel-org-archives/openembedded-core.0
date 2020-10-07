Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.923.1602094916603455289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 11:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 343901063
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D496C3F71F
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] selftest: skip npm tests if nodejs-native isn't available
Date: Wed,  7 Oct 2020 19:21:50 +0100
Message-Id: <20201007182152.1331417-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007182152.1331417-1-ross.burton@arm.com>
References: <20201007182152.1331417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The tests are actually skipped if meta-oe isn't present which isn't
quite the same thing, but hopefully close enough.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py    | 4 ++++
 meta/lib/oeqa/selftest/cases/recipetool.py | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index 4a791ff40e..2c9ff7a95a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -520,6 +520,10 @@ class DevtoolAddTests(DevtoolBase):
         self._test_recipe_contents(recipefile, checkvars, [])
=20
     def test_devtool_add_npm(self):
+        collections =3D get_bb_var('BBFILE_COLLECTIONS').split()
+        if "openembedded-layer" not in collections:
+            self.skipTest("Test needs meta-oe for nodejs")
+
         pn =3D 'savoirfairelinux-node-server-example'
         pv =3D '1.0.0'
         url =3D 'npm://registry.npmjs.org;package=3D@savoirfairelinux/no=
de-server-example;version=3D' + pv
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 6bac53cf3d..9d56e9e1e3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -409,6 +409,10 @@ class RecipetoolTests(RecipetoolBase):
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
     def test_recipetool_create_npm(self):
+        collections =3D get_bb_var('BBFILE_COLLECTIONS').split()
+        if "openembedded-layer" not in collections:
+            self.skipTest("Test needs meta-oe for nodejs")
+
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
         recipefile =3D os.path.join(temprecipe, 'savoirfairelinux-node-s=
erver-example_1.0.0.bb')
--=20
2.25.1

