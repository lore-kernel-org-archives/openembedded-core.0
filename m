Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D24ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:48:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9111.1663948096444102362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 08:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 245AA13D5;
	Fri, 23 Sep 2022 08:48:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03E593F73B;
	Fri, 23 Sep 2022 08:48:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/runtime/dnf: streamline test case
Date: Fri, 23 Sep 2022 16:48:10 +0100
Message-Id: <20220923154810.2932500-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 15:48:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171000

The DNF test case exercises a lot of functionality that we don't really
care about in the runtime QA: we mainly care that DNF is capable of
connecting to a remote repository and installing a package.
Specifically, we don't need to exercise so many different ways of
installing or the installroot functionality: if an image has been built
then it's clearly functional.

Also, change the package that we install/reinstall to netbase and
friends from run-postinsts, as run-postinsts has non-trivial
side-effects such as causing systemd to reload, which might be causing
issues for other tests being ran.

[ YOCTO #14787 ], hopefully

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testimage.bbclass |   6 +-
 meta/lib/oeqa/runtime/cases/dnf.py    | 182 +++++---------------------
 2 files changed, 34 insertions(+), 154 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 819c7d2bf4c..d53f1a3d6f1 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -468,10 +468,8 @@ def create_rpm_index(d):
         package_list =3D glob.glob(idx_path + "*/*.rpm")
=20
         for pkg in package_list:
-            if os.path.basename(pkg).startswith(("curl-ptest")):
-                bb.utils.remove(pkg)
-
-            if not os.path.basename(pkg).startswith(("rpm", "run-postins=
ts", "busybox", "bash", "update-alternatives", "libc6", "curl", "musl")):
+            basename =3D os.path.basename(pkg)
+            if basename.startswith("curl-ptest") or not basename.startsw=
ith("curl"):
                 bb.utils.remove(pkg)
=20
         bb.utils.unlockfile(lf)
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/c=
ases/dnf.py
index e0b91090b20..ef8bebfec0e 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -5,53 +5,14 @@
 #
=20
 import os
-import re
-import subprocess
 from oeqa.utils.httpserver import HTTPService
=20
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature,=
 skipIfInDataVar, skipIfNotInDataVar
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
=20
 class DnfTest(OERuntimeTestCase):
-
-    def dnf(self, command, expected =3D 0):
-        command =3D 'dnf %s' % command
-        status, output =3D self.target.run(command, 1500)
-        message =3D os.linesep.join([command, output])
-        self.assertEqual(status, expected, message)
-        return output
-
-class DnfBasicTest(DnfTest):
-
-    @skipIfNotFeature('package-management',
-                      'Test requires package-management to be in IMAGE_F=
EATURES')
-    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
-                      'RPM is not the primary package manager')
-    @OEHasPackage(['dnf'])
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_dnf_help(self):
-        self.dnf('--help')
-
-    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    def test_dnf_version(self):
-        self.dnf('--version')
-
-    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    def test_dnf_info(self):
-        self.dnf('info dnf')
-
-    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    def test_dnf_search(self):
-        self.dnf('search dnf')
-
-    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
-    def test_dnf_history(self):
-        self.dnf('history')
-
-class DnfRepoTest(DnfTest):
-
     @classmethod
     def setUpClass(cls):
         cls.repo_server =3D HTTPService(os.path.join(cls.tc.td['WORKDIR'=
], 'oe-testimage-repo'),
@@ -63,6 +24,13 @@ class DnfRepoTest(DnfTest):
     def tearDownClass(cls):
         cls.repo_server.stop()
=20
+    def dnf(self, command, expected =3D 0):
+        command =3D 'dnf %s' % command
+        status, output =3D self.target.run(command, 1500)
+        message =3D os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
     def dnf_with_repo(self, command):
         pkgarchs =3D os.listdir(os.path.join(self.tc.td['WORKDIR'], 'oe-=
testimage-repo'))
         deploy_url =3D 'http://%s:%s/' %(self.target.server_ip, self.rep=
o_server.port)
@@ -71,123 +39,37 @@ class DnfRepoTest(DnfTest):
         output =3D self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck "=
 + command)
         return output
=20
-    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @skipIfNotFeature('package-management',
+                      'Test requires package-management to be in IMAGE_F=
EATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
+                      'RPM is not the primary package manager')
+    @OEHasPackage(['dnf'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_dnf_help(self):
+        self.dnf('--help')
+
+    @OETestDepends(['dnf.DnfTest.test_dnf_help'])
     def test_dnf_makecache(self):
         self.dnf_with_repo('makecache')
=20
-
-# Does not work when repo is specified on the command line
-#    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-#    def test_dnf_repolist(self):
-#        self.dnf_with_repo('repolist')
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
     def test_dnf_repoinfo(self):
-        self.dnf_with_repo('repoinfo')
+        output =3D self.dnf_with_repo('repoinfo')
+        self.assertIn("Added oe-testimage-repo-noarch", output)
=20
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
     def test_dnf_install(self):
-        output =3D self.dnf_with_repo('list run-postinsts-dev')
-        if 'Installed Packages' in output:
-            self.dnf_with_repo('remove -y run-postinsts-dev')
-        self.dnf_with_repo('install -y run-postinsts-dev')
+        self.dnf_with_repo('remove -y curl-dev')
+        self.dnf_with_repo('install -y curl-dev')
=20
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
-    def test_dnf_install_dependency(self):
-        self.dnf_with_repo('remove -y run-postinsts')
-        self.dnf_with_repo('install -y run-postinsts-dev')
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
-    def test_dnf_install_from_disk(self):
-        self.dnf_with_repo('remove -y run-postinsts-dev')
-        self.dnf_with_repo('install -y --downloadonly run-postinsts-dev'=
)
-        status, output =3D self.target.run('find /var/cache/dnf -name ru=
n-postinsts-dev*rpm', 1500)
-        self.assertEqual(status, 0, output)
-        self.dnf_with_repo('install -y %s' % output)
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
-    def test_dnf_install_from_http(self):
-        output =3D subprocess.check_output('%s %s -name run-postinsts-de=
v*' % (bb.utils.which(os.getenv('PATH'), "find"),
-                                                                        =
   os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=3DTru=
e).decode("utf-8")
-        rpm_path =3D output.split("/")[-2] + "/" + output.split("/")[-1]
-        url =3D 'http://%s:%s/%s' %(self.target.server_ip, self.repo_ser=
ver.port, rpm_path)
-        self.dnf_with_repo('remove -y run-postinsts-dev')
-        self.dnf_with_repo('install -y %s' % url)
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
+    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
     def test_dnf_reinstall(self):
-        self.dnf_with_repo('reinstall -y run-postinsts-dev')
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not e=
nable usrmerge')
-    @OEHasPackage('busybox')
-    def test_dnf_installroot(self):
-        rootpath =3D '/home/root/chroot/test'
-        #Copy necessary files to avoid errors with not yet installed too=
ls on
-        #installroot directory.
-        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
-        self.target.run('mkdir -p %s/bin %s/sbin %s/usr/bin %s/usr/sbin'=
 % (rootpath, rootpath, rootpath, rootpath), 1500)
-        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
-        #Handle different architectures lib dirs
-        self.target.run('mkdir -p %s/lib' % rootpath, 1500)
-        self.target.run('mkdir -p %s/libx32' % rootpath, 1500)
-        self.target.run('mkdir -p %s/lib64' % rootpath, 1500)
-        self.target.run('cp /lib/libtinfo.so.5 %s/lib' % rootpath, 1500)
-        self.target.run('cp /libx32/libtinfo.so.5 %s/libx32' % rootpath,=
 1500)
-        self.target.run('cp /lib64/libtinfo.so.5 %s/lib64' % rootpath, 1=
500)
-        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
-        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
-        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
-        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox run-postinsts' % rootpath)
-        status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath, 1500)
-        self.assertEqual(0, status, output)
-        status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath, 1500)
-        self.assertEqual(0, status, output)
-
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when en=
able usrmerge')
-    @OEHasPackage('busybox')
-    def test_dnf_installroot_usrmerge(self):
-        rootpath =3D '/home/root/chroot/test'
-        #Copy necessary files to avoid errors with not yet installed too=
ls on
-        #installroot directory.
-        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, r=
ootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, root=
path), 1500)
-        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, ro=
otpath), 1500)
-        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
-        #Handle different architectures lib dirs
-        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
-        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1=
500)
-        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootp=
ath, 1500)
-        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpat=
h, 1500)
-        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpa=
th), 1500)
-        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,=
rootpath), 1500)
-        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,ro=
otpath), 1500)
-        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
-        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
-        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
-        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox run-postinsts' % rootpath)
-        status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath, 1500)
-        self.assertEqual(0, status, output)
-        status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath, 1500)
-        self.assertEqual(0, status, output)
+        self.dnf_with_repo('reinstall -y curl')
=20
-    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestDepends(['dnf.DnfTest.test_dnf_makecache'])
     def test_dnf_exclude(self):
-        excludepkg =3D 'curl-dev'
-        self.dnf_with_repo('install -y curl*')
-        self.dnf('list %s' % excludepkg, 0)
-        #Avoid remove dependencies to skip some errors on different arch=
s and images
-        self.dnf_with_repo('remove --setopt=3Dclean_requirements_on_remo=
ve=3D0 -y curl*')
-        #check curl-dev is not installed adter removing all curl occurre=
nces
-        status, output =3D self.target.run('dnf list --installed | grep =
%s'% excludepkg, 1500)
-        self.assertEqual(1, status, "%s was not removed,  is listed as i=
nstalled"%excludepkg)
-        self.dnf_with_repo('install -y --exclude=3D%s --exclude=3Dcurl-s=
taticdev curl*' % excludepkg)
-        #check curl-dev is not installed after being excluded
-        status, output =3D self.target.run('dnf list --installed | grep =
%s'% excludepkg , 1500)
-        self.assertEqual(1, status, "%s was not excluded, is listed as i=
nstalled"%excludepkg)
+        self.dnf_with_repo('remove -y curl-dev')
+        self.dnf_with_repo('install -y --exclude=3Dcurl-dev curl*')
+        output =3D self.dnf('list --installed curl*')
+        self.assertIn("curl.", output)
+        self.assertNotIn("curl-dev.", output)
--=20
2.34.1


