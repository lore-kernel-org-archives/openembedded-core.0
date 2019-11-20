Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id DC6967F83D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 09:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2337E9C0405;
	Wed, 20 Nov 2019 04:34:29 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id i9MNYFnLJeNR; Wed, 20 Nov 2019 04:34:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7A55B9C03AF;
	Wed, 20 Nov 2019 04:34:28 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id mn59AAHwfwP3; Wed, 20 Nov 2019 04:34:28 -0500 (EST)
Received: from sulaco.jml.bzh (91-167-182-132.subs.proxad.net [91.167.182.132])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3AC3A9C0405;
	Wed, 20 Nov 2019 04:34:27 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 10:33:58 +0100
Message-Id: <20191120093358.11622-18-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com, bunk@stusta.de
Subject: [PATCH v3 17/17] oeqa/selftest/devtool: add npm recipe build test
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
X-List-Received-Date: Wed, 20 Nov 2019 09:34:28 -0000
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
index 3a25da2033..d89a33e3c8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -510,6 +510,26 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRC_URI'] =3D url.replace(testver, '${PV}')
         self._test_recipe_contents(recipefile, checkvars, [])
=20
+    def test_devtool_add_npm(self):
+        pn =3D 'savoirfairelinux-node-server-example'
+        pv =3D '1.0.0'
+        url =3D 'npm://registry.npmjs.org;name=3D@savoirfairelinux/node-=
server-example;version=3D1.0.0'
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


