Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F61C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 11:16:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.27430.1664190963777158855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 04:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 162521576;
	Mon, 26 Sep 2022 04:16:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDCB83F66F;
	Mon, 26 Sep 2022 04:16:02 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] oeqa/runtime/dnf: use dnf-test packages
Date: Mon, 26 Sep 2022 12:16:00 +0100
Message-Id: <20220926111600.1324000-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926111600.1324000-1-ross.burton@arm.com>
References: <20220926111600.1324000-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 11:16:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171060

Instead of installing run-postinsts with it's postinst scripts causing
systemd restarts, use the new dnf-test-* packages instead.

Remove from the installroot tests entirely as they're exercised enough
using just busybox.

Rewrite the exclude test to be simplier now these packages are not going
to be part of an existing dependency chain.

[ YOCTO #14787 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testimage.bbclass |  5 +--
 meta/lib/oeqa/runtime/cases/dnf.py    | 52 +++++++++++----------------
 2 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 819c7d2bf4c..5cc408b0c47 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -468,10 +468,7 @@ def create_rpm_index(d):
         package_list =3D glob.glob(idx_path + "*/*.rpm")
=20
         for pkg in package_list:
-            if os.path.basename(pkg).startswith(("curl-ptest")):
-                bb.utils.remove(pkg)
-
-            if not os.path.basename(pkg).startswith(("rpm", "run-postins=
ts", "busybox", "bash", "update-alternatives", "libc6", "curl", "musl")):
+            if not os.path.basename(pkg).startswith(("dnf-test-", "busyb=
ox", "update-alternatives", "libc6", "musl")):
                 bb.utils.remove(pkg)
=20
         bb.utils.unlockfile(lf)
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/c=
ases/dnf.py
index e0b91090b20..410d456bdf1 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -75,48 +75,43 @@ class DnfRepoTest(DnfTest):
     def test_dnf_makecache(self):
         self.dnf_with_repo('makecache')
=20
-
-# Does not work when repo is specified on the command line
-#    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-#    def test_dnf_repolist(self):
-#        self.dnf_with_repo('repolist')
-
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     def test_dnf_repoinfo(self):
         self.dnf_with_repo('repoinfo')
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     def test_dnf_install(self):
-        output =3D self.dnf_with_repo('list run-postinsts-dev')
-        if 'Installed Packages' in output:
-            self.dnf_with_repo('remove -y run-postinsts-dev')
-        self.dnf_with_repo('install -y run-postinsts-dev')
+        self.dnf_with_repo('remove -y dnf-test-*')
+        self.dnf_with_repo('install -y dnf-test-dep')
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
     def test_dnf_install_dependency(self):
-        self.dnf_with_repo('remove -y run-postinsts')
-        self.dnf_with_repo('install -y run-postinsts-dev')
+        self.dnf_with_repo('remove -y dnf-test-*')
+        self.dnf_with_repo('install -y dnf-test-main')
+        output =3D self.dnf('list --installed dnf-test-*')
+        self.assertIn("dnf-test-main.", output)
+        self.assertIn("dnf-test-dep.", output)
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
     def test_dnf_install_from_disk(self):
-        self.dnf_with_repo('remove -y run-postinsts-dev')
-        self.dnf_with_repo('install -y --downloadonly run-postinsts-dev'=
)
-        status, output =3D self.target.run('find /var/cache/dnf -name ru=
n-postinsts-dev*rpm', 1500)
+        self.dnf_with_repo('remove -y dnf-test-dep')
+        self.dnf_with_repo('install -y --downloadonly dnf-test-dep')
+        status, output =3D self.target.run('find /var/cache/dnf -name dn=
f-test-dep*rpm')
         self.assertEqual(status, 0, output)
         self.dnf_with_repo('install -y %s' % output)
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
     def test_dnf_install_from_http(self):
-        output =3D subprocess.check_output('%s %s -name run-postinsts-de=
v*' % (bb.utils.which(os.getenv('PATH'), "find"),
+        output =3D subprocess.check_output('%s %s -name dnf-test-dep*' %=
 (bb.utils.which(os.getenv('PATH'), "find"),
                                                                         =
   os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=3DTru=
e).decode("utf-8")
         rpm_path =3D output.split("/")[-2] + "/" + output.split("/")[-1]
         url =3D 'http://%s:%s/%s' %(self.target.server_ip, self.repo_ser=
ver.port, rpm_path)
-        self.dnf_with_repo('remove -y run-postinsts-dev')
+        self.dnf_with_repo('remove -y dnf-test-dep')
         self.dnf_with_repo('install -y %s' % url)
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
     def test_dnf_reinstall(self):
-        self.dnf_with_repo('reinstall -y run-postinsts-dev')
+        self.dnf_with_repo('reinstall -y dnf-test-main')
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not e=
nable usrmerge')
@@ -139,7 +134,7 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
         self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox run-postinsts' % rootpath)
+        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox' % rootpath)
         status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath, 1500)
         self.assertEqual(0, status, output)
         status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath, 1500)
@@ -171,7 +166,7 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
         self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox run-postinsts' % rootpath)
+        self.dnf_with_repo('install --installroot=3D%s -v -y --rpmverbos=
ity=3Ddebug busybox' % rootpath)
         status, output =3D self.target.run('test -e %s/var/cache/dnf' % =
rootpath, 1500)
         self.assertEqual(0, status, output)
         status, output =3D self.target.run('test -e %s/bin/busybox' % ro=
otpath, 1500)
@@ -179,15 +174,8 @@ class DnfRepoTest(DnfTest):
=20
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
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
+        self.dnf_with_repo('remove -y dnf-test-*')
+        self.dnf_with_repo('install -y --exclude=3Ddnf-test-dep dnf-test=
-*')
+        output =3D self.dnf('list --installed dnf-test-*')
+        self.assertIn("dnf-test-main.", output)
+        self.assertNotIn("dnf-test-dev.", output)
--=20
2.34.1


