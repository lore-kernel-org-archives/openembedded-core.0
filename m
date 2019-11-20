Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id B6AFC7F7D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D7FBA9C03D7;
	Wed, 20 Nov 2019 04:34:27 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id AFBBVDH4D31L; Wed, 20 Nov 2019 04:34:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2F1299C03AF;
	Wed, 20 Nov 2019 04:34:27 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id qtEGO7c04bOO; Wed, 20 Nov 2019 04:34:27 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DA6A69C03D7;
	Wed, 20 Nov 2019 04:34:25 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:57 +0100
Message-Id: <20191120093358.11622-17-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 16/17] oeqa/selftest/recipetool: add npm recipe creation test
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:27 -0000
Content-Transfer-Encoding: quoted-printable

This commit adds a recipetool creation test for npm recipe:

 - recipetool.RecipetoolTests.test_recipetool_create_npm

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index c1562c63b2..fd993ab260 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -421,6 +421,27 @@ class RecipetoolTests(RecipetoolBase):
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
+        checkvars['LICENSE'] =3D set(['MIT', 'ISC', 'Unknown'])
+        checkvars['SRC_URI'] =3D 'npm://registry.npmjs.org/;name=3D@savo=
irfairelinux/node-server-example;version=3D${PV}'
+        checkvars['S'] =3D '${WORKDIR}/npm'
+        checkvars['NPM_SHRINKWRAP'] =3D '${THISDIR}/${BPN}/npm-shrinkwra=
p.json'
+        checkvars['LICENSE_${PN}-execute'] =3D 'Unknown'
+        checkvars['LICENSE_${PN}-base64'] =3D 'Unknown'
+        inherits =3D ['npm']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
--=20
2.20.1


