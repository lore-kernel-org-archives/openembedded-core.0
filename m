Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6642C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.667.1648751370055526314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A23AA139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542013F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/23] oeqa/selftest: generalise
 test_devtool_virtual_kernel_modify
Date: Thu, 31 Mar 2022 19:29:15 +0100
Message-Id: <20220331182915.22128-23-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/163864

Generalise this test so that it works on more than qemux86-64:

- Don't edit a file in arch/x86 to cause a rebuild, instead use init/
- Look for the edits in the build tree, as the deployed kernel could be
  of any type (zImage/bzImage/etc) and edits may be in the compressed
  part.

Also remove redundant checks on the result of runCmd(), as this will
raise AssertionError exceptions itself so the explicit asserts will
never trigger.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 38 +++++++++++--------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index ba5dca0359e..3eea2b1a0ea 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1875,8 +1875,9 @@ class DevtoolUpgradeTests(DevtoolBase):
          Expected:       devtool modify is able to checkout the source o=
f the kernel
                          and modification to the source and configuratio=
ns are reflected
                          when building the kernel.
-         """
-        kernel_provider =3D get_bb_var('PREFERRED_PROVIDER_virtual/kerne=
l')
+        """
+        kernel_provider =3D self.td['PREFERRED_PROVIDER_virtual/kernel']
+
         # Clean up the environment
         bitbake('%s -c clean' % kernel_provider)
         tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
@@ -1903,33 +1904,28 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted =
source could not be found')
         #Step 4.2
         configfile =3D os.path.join(tempdir,'.config')
-        diff =3D runCmd('diff %s %s' % (tmpconfig, configfile))
-        self.assertEqual(0,diff.status,'Kernel .config file is not the s=
ame using bitbake and devtool')
+        runCmd('diff %s %s' % (tmpconfig, configfile))
+
         #Step 4.3
         #NOTE: virtual/kernel is mapped to kernel_provider
-        result =3D runCmd('devtool build %s' % kernel_provider)
-        self.assertEqual(0,result.status,'Cannot build kernel using `dev=
tool build`')
+        runCmd('devtool build %s' % kernel_provider)
         kernelfile =3D os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_p=
rovider), 'vmlinux')
         self.assertExists(kernelfile, 'Kernel was not build correctly')
=20
         #Modify the kernel source
-        modfile =3D os.path.join(tempdir,'arch/x86/boot/header.S')
-        modstring =3D "Use a boot loader. Devtool testing."
-        modapplied =3D runCmd("sed -i 's/Use a boot loader./%s/' %s" % (=
modstring, modfile))
-        self.assertEqual(0,modapplied.status,'Modification to %s on kern=
el source failed' % modfile)
+        modfile =3D os.path.join(tempdir, 'init/version.c')
+        runCmd("sed -i 's/Linux/LiNuX/g' %s" % (modfile))
+
         #Modify the configuration
-        codeconfigfile =3D os.path.join(tempdir,'.config.new')
+        codeconfigfile =3D os.path.join(tempdir, '.config.new')
         modconfopt =3D "CONFIG_SG_POOL=3Dn"
-        modconf =3D runCmd("sed -i 's/CONFIG_SG_POOL=3Dy/%s/' %s" % (mod=
confopt, codeconfigfile))
-        self.assertEqual(0,modconf.status,'Modification to %s failed' % =
codeconfigfile)
+        runCmd("sed -i 's/CONFIG_SG_POOL=3Dy/%s/' %s" % (modconfopt, cod=
econfigfile))
+
         #Build again kernel with devtool
-        rebuild =3D runCmd('devtool build %s' % kernel_provider)
-        self.assertEqual(0,rebuild.status,'Fail to build kernel after mo=
dification of source and config')
+        runCmd('devtool build %s' % kernel_provider)
+
         #Step 4.4
-        bzimagename =3D 'bzImage-' + get_bb_var('KERNEL_VERSION_NAME', k=
ernel_provider)
-        bzimagefile =3D os.path.join(get_bb_var('D', kernel_provider),'b=
oot', bzimagename)
-        checkmodcode =3D runCmd("grep '%s' %s" % (modstring, bzimagefile=
))
-        self.assertEqual(0,checkmodcode.status,'Modification on kernel s=
ource failed')
+        runCmd("grep '%s' %s" % ('LiNuX', kernelfile))
+
         #Step 4.5
-        checkmodconfg =3D runCmd("grep %s %s" % (modconfopt, codeconfigf=
ile))
-        self.assertEqual(0,checkmodconfg.status,'Modification to configu=
ration file failed')
+        runCmd("grep %s %s" % (modconfopt, codeconfigfile))
--=20
2.25.1


