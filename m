Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2F67FC0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 10:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 78CE29C01C7;
	Mon, 20 Jan 2020 05:27:35 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id w1M032AgulJQ; Mon, 20 Jan 2020 05:27:34 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C4F319C01B6;
	Mon, 20 Jan 2020 05:27:34 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id jh4edcTrhBCo; Mon, 20 Jan 2020 05:27:34 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2332C9C01C7;
	Mon, 20 Jan 2020 05:27:33 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:27:04 +0100
Message-Id: <20200120102705.20916-13-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v5 12/13] oeqa/selftest/recipetool: add npm recipe creation test
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
X-List-Received-Date: Mon, 20 Jan 2020 10:27:34 -0000
Content-Transfer-Encoding: quoted-printable

This commit adds a recipetool creation test for npm recipe:

 - recipetool.RecipetoolTests.test_recipetool_create_npm

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index c1562c63b2..6bfe8f177f 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -421,6 +421,31 @@ class RecipetoolTests(RecipetoolBase):
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
+        srcuri =3D 'npm://registry.npmjs.org;package=3D@savoirfairelinux=
/node-server-example;version=3D1.0.0'
+        result =3D runCmd('recipetool create -o %s \'%s\'' % (temprecipe=
, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        self.assertTrue(os.path.isfile(shrinkwrap))
+        checkvars =3D {}
+        checkvars['SUMMARY'] =3D 'Node Server Example'
+        checkvars['HOMEPAGE'] =3D 'https://github.com/savoirfairelinux/n=
ode-server-example#readme'
+        checkvars['LICENSE'] =3D set(['MIT', 'ISC', 'Unknown'])
+        urls =3D []
+        urls.append('npm://registry.npmjs.org/;package=3D@savoirfairelin=
ux/node-server-example;version=3D${PV}')
+        urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
+        checkvars['SRC_URI'] =3D set(urls)
+        checkvars['S'] =3D '${WORKDIR}/npm'
+        checkvars['LICENSE_${PN}'] =3D 'MIT'
+        checkvars['LICENSE_${PN}-base64'] =3D 'Unknown'
+        checkvars['LICENSE_${PN}-accepts'] =3D 'MIT'
+        checkvars['LICENSE_${PN}-inherits'] =3D 'ISC'
+        inherits =3D ['npm']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
     def test_recipetool_create_github(self):
         # Basic test to see if github URL mangling works
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
--=20
2.20.1


