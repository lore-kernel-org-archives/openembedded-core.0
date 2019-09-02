Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB787F381
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:42:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x829gBxt025380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2019 02:42:11 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 02:42:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2019 17:42:09 +0800
Message-ID: <1567417329-325366-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] dnf.py: support usrmerge
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
X-List-Received-Date: Mon, 02 Sep 2019 09:42:10 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 629b9af..9a5308f 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -9,7 +9,7 @@ from oeqa.utils.httpserver import HTTPService
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfInDataVar, skipIfNotInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class DnfTest(OERuntimeTestCase):
@@ -116,6 +116,7 @@ class DnfRepoTest(DnfTest):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not enable usrmerge')
     def test_dnf_installroot(self):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
@@ -141,6 +142,37 @@ class DnfRepoTest(DnfTest):
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
+    def test_dnf_installroot_usrmerge(self):
+        rootpath = '/home/root/chroot/test'
+        #Copy necessary files to avoid errors with not yet installed tools on
+        #installroot directory.
+        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
+        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
+        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
+        #Handle different architectures lib dirs
+        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
+        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
+        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
+        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
+        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
+        self.target.run('ln -ef -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
+        self.target.run('ln -ef -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
+        self.target.run('ln -ef -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
+        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
+        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     def test_dnf_exclude(self):
         excludepkg = 'curl-dev'
         self.dnf_with_repo('install -y curl*')
-- 
2.7.4


