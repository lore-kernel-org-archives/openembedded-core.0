Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0400A7FBEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3C3A09C0481;
	Fri, 17 Jan 2020 11:46:39 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id twBOwc7IAu9V; Fri, 17 Jan 2020 11:46:38 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8DAA39C048B;
	Fri, 17 Jan 2020 11:46:38 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id EcGbwIbBqT7D; Fri, 17 Jan 2020 11:46:38 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E312E9C0482;
	Fri, 17 Jan 2020 11:46:36 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:46:09 +0100
Message-Id: <20200117164609.28400-14-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v4 13/13] oeqa/selftest/devtool: add npm recipe build test
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
X-List-Received-Date: Fri, 17 Jan 2020 16:46:38 -0000
Content-Transfer-Encoding: quoted-printable

This commit adds a devtool build test for npm recipe:

 - devtool.DevtoolAddTests.test_devtool_add_npm

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index 57e6662e4a..b6b14914bd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -511,6 +511,26 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRC_URI'] =3D url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
=20
+    def test_devtool_add_npm(self):
+        pn =3D 'savoirfairelinux-node-server-example'
+        pv =3D '1.0.0'
+        url =3D 'npm://registry.npmjs.org;name=3D@savoirfairelinux/node-=
server-example;version=3D' + pv
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
+        result =3D runCmd('devtool add \'%s\'' % url)
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer=
.conf'), 'Workspace directory not created')
+        self.assertExists(os.path.join(self.workspacedir, 'recipes', pn,=
 '%s_%s.bb' % (pn, pv)), 'Recipe not created')
+        self.assertExists(os.path.join(self.workspacedir, 'recipes', pn,=
 pn, 'npm-shrinkwrap.json'), 'Shrinkwrap not created')
+        # Test devtool status
+        result =3D runCmd('devtool status')
+        self.assertIn(pn, result.output)
+        # Clean up anything in the workdir/sysroot/sstate cache (have to=
 do this *after* devtool add since the recipe only exists then)
+        bitbake('%s -c cleansstate' % pn)
+        # Test devtool build
+        result =3D runCmd('devtool build %s' % pn)
+
 class DevtoolModifyTests(DevtoolBase):
=20
     def test_devtool_modify(self):
--=20
2.20.1


