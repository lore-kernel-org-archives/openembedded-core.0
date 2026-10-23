Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3861.1792750979708833133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=T9IPWyk7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18B111650;
	Fri, 23 Oct 2026 03:22:56 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C04003F7B4;
	Fri, 23 Oct 2026 03:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750979; bh=S2/5EqP2l37RlG2hEb/e3l9ky9zayTRHpooM3WGh2Rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9IPWyk7I7qqPS1f4y/fC3Zv+uEsa2LsVJIkRDLgV0GCE5ruFL641HeNP7f3z6yRZ
	 m5PS8XF3UIDftPEAd3B8fkpoPDT4Qxlo6Qii4cYWyIXAt7MuzTqHnomK3tPV8rmVxT
	 E8JbdjlTayk8DHJniX6tKfICWkYRhjPWpqngyvgw=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 5/5] oe-selftest: devtool: Add multiconfig workflow tests
Date: Fri, 23 Oct 2026 11:22:15 +0100
Message-ID: <20261023102215.4043005-6-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248503
Content-Type: text/plain; charset="utf-8"

Cover modify, build, reset, update-recipe and finish with a
recipe available only in the selected multiconfig. Check
workspace isolation between configurations.

[YOCTO #13933]

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 133 ++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index b848623a6e..1b83ee16d4 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1327,6 +1327,139 @@ class DevtoolModifyTests(DevtoolBase):
         self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake'), 'Submodule not found')
         self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bi=
tbake-gitsm-test1'), 'Submodule not found')
=20
+class DevtoolMulticonfigTests(DevtoolBase):
+
+    def setUp(self):
+        super(DevtoolMulticonfigTests, self).setUp()
+        self.recipe =3D 'devtool-multiconfig-test'
+        self.target =3D 'mc:devtooltest:%s' % self.recipe
+        self.tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(self.tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.srctree =3D os.path.join(self.tempdir, 'source')
+        self.layerdir =3D os.path.join(self.tempdir, 'meta-devtool-multi=
config')
+
+        self.append_config('BBMULTICONFIG =3D "devtooltest"\n')
+        # Only this configuration satisfies the test recipe's compatibil=
ity
+        # restriction, regardless of the machine used by the selftest ru=
nner.
+        self.write_config('MACHINEOVERRIDES .=3D ":devtool-mc"\n'
+                          'TMPDIR =3D "${TOPDIR}/tmp-devtool-mc"\n', 'de=
vtooltest')
+        self.add_command_to_tearDown('bitbake -c clean %s' % self.target=
)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
+        self._create_temp_layer(self.layerdir, True, 'devtoolmulticonfig=
')
+
+        self.recipedir =3D os.path.join(self.layerdir, 'recipes-test', s=
elf.recipe)
+        filesdir =3D os.path.join(self.recipedir, self.recipe)
+        os.makedirs(filesdir)
+        archive =3D 'devtool-test-subdir.tar.gz'
+        shutil.copyfile(os.path.join(get_test_layer(), 'recipes-test', '=
devtool',
+                                     'devtool-test-subdir', archive),
+                        os.path.join(filesdir, archive))
+        with open(os.path.join(self.recipedir, self.recipe + '_1.0.bb'),=
 'w') as f:
+            f.write('LICENSE =3D "MIT"\n'
+                    'LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/=
MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"\n'
+                    'inherit allarch\n'
+                    'INHIBIT_DEFAULT_DEPS =3D "1"\n'
+                    'COMPATIBLE_MACHINE =3D "devtool-mc"\n'
+                    'SRC_URI =3D "file://devtool-test-subdir.tar.gz"\n'
+                    'S =3D "${UNPACKDIR}/devtool-test-subdir"\n'
+                    'B =3D "${WORKDIR}/build"\n'
+                    'do_compile() {\n'
+                    '    cp ${S}/testfile ${B}/testfile\n'
+                    '}\n'
+                    'do_install() {\n'
+                    '    install -Dm0644 ${B}/testfile ${D}${datadir}/${=
BPN}/testfile\n'
+                    '}\n'
+                    'FILES:${PN} =3D "${datadir}/${BPN}"\n')
+
+    def _modify(self, wildcard=3DFalse):
+        runCmd('devtool modify %s %s %s' %
+               ('--wildcard' if wildcard else '', self.target, self.srct=
ree))
+        self._check_src_repo(self.srctree)
+        append =3D os.path.join(self.workspacedir, 'appends', 'multiconf=
ig',
+                              'devtooltest', self.recipe + ('_%.bbappend=
' if wildcard else '_1.0.bbappend'))
+        self.assertExists(append)
+        self.assertEqual(get_bb_var('EXTERNALSRC', self.target), self.sr=
ctree)
+        self.assertIn(self.recipe, runCmd('devtool status').output)
+        return append
+
+    def test_devtool_multiconfig_modify_build_reset(self):
+        """Extract, build and clean a recipe unavailable in the default =
config."""
+        result =3D bitbake('%s -n' % self.recipe, ignore_status=3DTrue)
+        self.assertNotEqual(result.status, 0)
+        self.assertIn('incompatible with machine', result.output)
+
+        append =3D self._modify()
+        with open(os.path.join(self.srctree, 'testfile'), 'a') as f:
+            f.write('\nmulticonfig workspace change\n')
+        runCmd('devtool build %s' % self.target)
+        builddir =3D get_bb_var('B', self.target)
+        with open(os.path.join(builddir, 'testfile')) as f:
+            self.assertIn('multiconfig workspace change', f.read())
+
+        # Do not use --no-clean: cleaning must retain the multiconfig pr=
efix.
+        runCmd('devtool reset %s' % self.target)
+        self.assertNotExists(append)
+        self.assertNotIn(self.recipe, runCmd('devtool status').output)
+        self.assertFalse(get_bb_var('EXTERNALSRC', self.target))
+
+    def test_devtool_multiconfig_update_finish(self):
+        """Update and finish using qualified targets and bare workspace =
keys."""
+        append =3D self._modify()
+        for command, marker in [('update-recipe', 'update'), ('finish', =
'finish')]:
+            with open(os.path.join(self.srctree, 'testfile'), 'a') as f:
+                f.write('\nmulticonfig %s change\n' % marker)
+            runCmd('git commit -am "Multiconfig %s change" '
+                   '-m "Upstream-Status: Inappropriate [selftest]"' % ma=
rker,
+                   cwd=3Dself.srctree)
+            destination =3D self.layerdir if command =3D=3D 'finish' els=
e ''
+            runCmd('devtool %s %s %s' % (command, self.target, destinati=
on))
+            patches =3D glob.glob(os.path.join(self.recipedir, self.reci=
pe, '*.patch'))
+            self.assertTrue(patches, 'No patches written by %s' % comman=
d)
+            contents =3D ''
+            for patch in patches:
+                with open(patch) as f:
+                    contents +=3D f.read()
+            self.assertIn('multiconfig %s change' % marker, contents)
+            if command =3D=3D 'update-recipe':
+                self.assertExists(append)
+                self.assertIn(self.recipe, runCmd('devtool status').outp=
ut)
+
+        self.assertNotExists(append)
+        self.assertNotIn(self.recipe, runCmd('devtool status').output)
+        self.assertFalse(get_bb_var('EXTERNALSRC', self.target))
+        bitbake('%s -c patch' % self.target)
+        with open(os.path.join(get_bb_var('S', self.target), 'testfile')=
) as f:
+            contents =3D f.read()
+        self.assertIn('multiconfig update change', contents)
+        self.assertIn('multiconfig finish change', contents)
+
+    def test_devtool_multiconfig_workspace_isolation(self):
+        """A wildcard workspace append must affect only its configuratio=
n."""
+        self.append_config('COMPATIBLE_MACHINE:pn-%s =3D ".*"\n'
+                           'BBMULTICONFIG +=3D "devtoolother"\n' % self.=
recipe)
+        self.write_config('TMPDIR =3D "${TOPDIR}/tmp-devtool-other"\n', =
'devtoolother')
+        other_target =3D 'mc:devtoolother:%s' % self.recipe
+        append =3D self._modify(wildcard=3DTrue)
+        self.assertFalse(get_bb_var('EXTERNALSRC', self.recipe))
+        self.assertFalse(get_bb_var('EXTERNALSRC', other_target))
+
+        result =3D runCmd('devtool modify -n %s %s' % (self.recipe, self=
.srctree),
+                        ignore_status=3DTrue)
+        self.assertNotEqual(result.status, 0)
+        self.assertIn('already in your workspace', result.output)
+        self.assertExists(append)
+        runCmd('devtool reset %s' % self.target)
+        self.assertNotExists(append)
+
+        # The default configuration's append must likewise stay out of M=
Cs.
+        runCmd('devtool modify -n %s %s' % (self.recipe, self.srctree))
+        self.assertEqual(get_bb_var('EXTERNALSRC', self.recipe), self.sr=
ctree)
+        self.assertFalse(get_bb_var('EXTERNALSRC', self.target))
+        self.assertFalse(get_bb_var('EXTERNALSRC', other_target))
+        runCmd('devtool reset %s' % self.recipe)
+
+
 class DevtoolUpdateTests(DevtoolBase):
=20
     def test_devtool_update_recipe(self):
