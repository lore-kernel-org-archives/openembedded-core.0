Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6662C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.708.1648751369496433477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA5B13D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1E883F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/23] oeqa/selftest/wic: use self.td instead of get_bb_var to
 save on bitbake calls
Date: Thu, 31 Mar 2022 19:29:14 +0100
Message-Id: <20220331182915.22128-22-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163863

When a test case starts, self.td is populated with all the variables in
the data store.  Typically this can be used instead of get_bb_var(),
which saves a bitbake call per variable lookup.

The only catch is that in parallel runs the build directory is moved
after td is populated, so paths in the build directory are wrong: these
still need to be fetched in the test.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index 5bdd9ae87e3..de74c07a039 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -82,7 +82,7 @@ class WicTestCase(OESelftestTestCase):
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not WicTestCase.image_is_ready:
-            if get_bb_var('USE_NLS') !=3D 'yes':
+            if self.td['USE_NLS'] !=3D 'yes':
                 self.skipTest('wic-tools needs USE_NLS=3Dyes')
=20
             bitbake('wic-tools core-image-minimal core-image-minimal-mtd=
utils')
@@ -98,9 +98,8 @@ class WicTestCase(OESelftestTestCase):
         """Generate and obtain the path to <image>.env"""
         if image not in WicTestCase.wicenv_cache:
             bitbake('%s -c do_rootfs_wicenv' % image)
-            bb_vars =3D get_bb_vars(['STAGING_DIR', 'MACHINE'], image)
-            stdir =3D bb_vars['STAGING_DIR']
-            machine =3D bb_vars['MACHINE']
+            stdir =3D get_bb_var('STAGING_DIR', image)
+            machine =3D self.td["MACHINE"]
             WicTestCase.wicenv_cache[image] =3D os.path.join(stdir, mach=
ine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
=20
@@ -827,9 +826,8 @@ class Wic2(WicTestCase):
         bitbake('wic-image-minimal')
         self.remove_config(config)
=20
-        bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
-        deploy_dir =3D bb_vars['DEPLOY_DIR_IMAGE']
-        machine =3D bb_vars['MACHINE']
+        deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D self.td['MACHINE']
         prefix =3D os.path.join(deploy_dir, 'wic-image-minimal-%s.' % ma=
chine)
         # check if we have result image and manifests symlinks
         # pointing to existing files
@@ -1069,7 +1067,7 @@ class Wic2(WicTestCase):
     def _rawcopy_plugin(self, fstype):
         """Test rawcopy plugin"""
         img =3D 'core-image-minimal'
-        machine =3D get_bb_var('MACHINE', img)
+        machine =3D self.td["MACHINE"]
         params =3D ',unpack' if fstype.endswith('.gz') else ''
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
             wks.write('part / --source rawcopy --sourceparams=3D"file=3D=
%s-%s.%s%s"\n'\
@@ -1098,12 +1096,11 @@ class Wic2(WicTestCase):
         self.append_config(config)
         bitbake('core-image-minimal')
         self.remove_config(config)
+        deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D self.td['MACHINE']
=20
-        bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
-        deploy_dir =3D bb_vars['DEPLOY_DIR_IMAGE']
-        machine =3D bb_vars['MACHINE']
         image_path =3D os.path.join(deploy_dir, 'core-image-minimal-%s.w=
ic' % machine)
-        self.assertEqual(True, os.path.exists(image_path))
+        self.assertTrue(os.path.exists(image_path))
=20
         sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
=20
@@ -1245,7 +1242,7 @@ class Wic2(WicTestCase):
=20
     def test_sparse_copy(self):
         """Test sparse_copy with FIEMAP and SEEK_HOLE filemap APIs"""
-        libpath =3D os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib=
', 'wic')
+        libpath =3D os.path.join(self.td['COREBASE'], 'scripts', 'lib', =
'wic')
         sys.path.insert(0, libpath)
         from  filemap import FilemapFiemap, FilemapSeek, sparse_copy, Er=
rorNotSupp
         with NamedTemporaryFile("w", suffix=3D".wic-sparse") as sparse:
@@ -1300,9 +1297,8 @@ class Wic2(WicTestCase):
         bitbake('core-image-minimal')
=20
         # get path to the image
-        bb_vars =3D get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'])
-        deploy_dir =3D bb_vars['DEPLOY_DIR_IMAGE']
-        machine =3D bb_vars['MACHINE']
+        deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
+        machine =3D self.td['MACHINE']
         image_path =3D os.path.join(deploy_dir, 'core-image-minimal-%s.w=
ic' % machine)
=20
         self.remove_config(config)
--=20
2.25.1


