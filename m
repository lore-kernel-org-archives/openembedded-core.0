Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A085C784E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 16:18:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2017 08:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,341,1508828400"; d="scan'208";a="182457781"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.139])
	by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2017 08:18:12 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 10:23:02 -0600
Message-Id: <20171130162302.26034-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <a5107f4d-40b4-27c4-bfd9-70f18e06901b@linux.intel.com>
References: <a5107f4d-40b4-27c4-bfd9-70f18e06901b@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v5] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Thu, 30 Nov 2017 16:18:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Add test cases to test “exclude” and “installroot“ options, also modify
the logic of filtering packages on the feed to have all the packages
needed by the tests.

[YOCTO #10744]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/classes/testimage.bbclass     | 11 ++++++++---
 meta/lib/oeqa/runtime/cases/dnf.py | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 45bb2bda3b8..c1588da0fd8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -329,6 +329,7 @@ def create_index(arg):
     return None
 
 def create_rpm_index(d):
+    import glob
     # Index RPMs
     rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo_c")
     index_cmds = []
@@ -345,9 +346,13 @@ def create_rpm_index(d):
         lf = bb.utils.lockfile(lockfilename, False)
         oe.path.copyhardlinktree(rpm_dir, idx_path)
         # Full indexes overload a 256MB image so reduce the number of rpms
-        # in the feed. Filter to r* since we use the run-postinst packages and
-        # this leaves some allarch and machine arch packages too.
-        bb.utils.remove(idx_path + "*/[a-qs-z]*.rpm")
+        # in the feed by filtering to specific packages needed by the tests.
+        package_list = glob.glob(idx_path + "*/*.rpm")
+
+        for pkg in package_list:
+            if not os.path.basename(pkg).startswith(("rpm", "run-postinsts", "busybox", "bash", "update-alternatives", "libc6", "curl")):
+                bb.utils.remove(pkg)
+
         bb.utils.unlockfile(lf)
         cmd = '%s --update -q %s' % (rpm_createrepo, idx_path)
 
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 2f87296b4e0..020e025de4e 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -120,4 +120,40 @@ class DnfRepoTest(DnfTest):
     def test_dnf_reinstall(self):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1771)
+    def test_dnf_installroot(self):
+        rootpath = '/home/root/chroot/test'
+        #Copy necessary files to avoid errors with not yet installed tools on
+        #installroot directory.
+        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
+        self.target.run('mkdir -p %s/bin' % rootpath, 1500)
+        #Handle different architectures lib dirs
+        self.target.run('mkdir -p %s/lib' % rootpath, 1500)
+        self.target.run('mkdir -p %s/libx32' % rootpath, 1500)
+        self.target.run('cp /lib/libtinfo.so.5 %s/lib' % rootpath, 1500)
+        self.target.run('cp /libx32/libtinfo.so.5 %s/libx32' % rootpath, 1500)
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
+        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox run-postinsts' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
+        self.assertEqual(0, status, output)
 
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1772)
+    def test_dnf_exclude(self):
+        excludepkg = 'curl-dev'
+        self.dnf_with_repo('install -y curl*')
+        self.dnf('list %s' % excludepkg, 0)
+        #Avoid remove dependencies to skip some errors on different archs and images
+        self.dnf_with_repo('remove --setopt=clean_requirements_on_remove=0 -y curl*')
+        #check curl-dev is not installed adter removing all curl occurrences
+        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg, 1500)
+        self.assertEqual(1, status, "%s was not removed,  is listed as installed"%excludepkg)
+        self.dnf_with_repo('install -y --exclude=%s curl*' % excludepkg)
+        #check curl-dev is not installed after being excluded
+        status, output = self.target.run('dnf list --installed | grep %s'% excludepkg , 1500)
+        self.assertEqual(1, status, "%s was not excluded, is listed as installed"%excludepkg)
-- 
2.11.0


