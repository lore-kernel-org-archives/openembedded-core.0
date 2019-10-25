Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 69D7B7FA9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A7C7A9C0365;
	Fri, 25 Oct 2019 04:40:07 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id mO18FeTPNm_Q; Fri, 25 Oct 2019 04:40:07 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0EED59C02D0;
	Fri, 25 Oct 2019 04:40:07 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id abI2KSd8EmA9; Fri, 25 Oct 2019 04:40:06 -0400 (EDT)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E2C3F9C03EF;
	Fri, 25 Oct 2019 04:40:05 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 10:39:52 +0200
Message-Id: <20191025083952.14591-8-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191025083952.14591-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [RFC][PATCH v2 7/7] oeqa/selftest/recipetool: add npm recipe creation test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 08:40:06 -0000
Content-Transfer-Encoding: quoted-printable

This commit adds a recipetool creation test for npm recipe.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index c1562c63b2..71613fd2fb 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -421,6 +421,25 @@ class RecipetoolTests(RecipetoolBase):
         inherits =3D ['cmake']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
+    def test_recipetool_create_npm(self):
+        temprecipe =3D os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        recipefile =3D os.path.join(temprecipe, 'savoirfairelinux-node-s=
erver-example_1.0.0.bb')
+        shrinkwrap =3D os.path.join(temprecipe, 'savoirfairelinux-node-s=
erver-example', 'npm-shrinkwrap.json')
+        srcuri =3D 'npm://registry.npmjs.org;name=3D@savoirfairelinux/no=
de-server-example;version=3D1.0.0'
+        result =3D runCmd('recipetool create -o %s \'%s\'' % (temprecipe=
, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        self.assertTrue(os.path.isfile(shrinkwrap))
+        checkvars =3D {}
+        checkvars['SUMMARY'] =3D 'Node Server Example'
+        checkvars['HOMEPAGE'] =3D 'https://github.com/savoirfairelinux/n=
ode-server-example#readme'
+        checkvars['LICENSE'] =3D set(['MIT'])
+        checkvars['SRC_URI'] =3D 'npm://registry.npmjs.org/;name=3D@savo=
irfairelinux/node-server-example;version=3D${PV}'
+        checkvars['S'] =3D '${WORKDIR}/npm'
+        checkvars['NPM_SHRINKWRAP'] =3D '${THISDIR}/${BPN}/npm-shrinkwra=
p.json'
+        inherits =3D ['npm']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
--=20
2.20.1


