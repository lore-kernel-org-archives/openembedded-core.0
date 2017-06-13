Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 96C21782B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 19:54:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 12:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,339,1493708400"; d="scan'208";a="980413235"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by orsmga003.jf.intel.com with ESMTP; 13 Jun 2017 12:54:05 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:56:20 -0500
Message-Id: <20170613195620.24139-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
References: <20170515135023.4090-1-jose.perez.carranza@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v4] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Tue, 13 Jun 2017 19:54:08 -0000
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
 meta/lib/oeqa/runtime/cases/dnf.py | 22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fa2d6fd9f..d76d64d442 100644
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
index 2f87296b4e..25db9bacd2 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -120,4 +120,26 @@ class DnfRepoTest(DnfTest):
     def test_dnf_reinstall(self):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1771)
+    def test_dnf_installroot(self):
+        rootpath = '/home/root/chroot/test'
+        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -v -y busybox run-postinsts' % rootpath)
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
+        self.dnf_with_repo('remove -y curl*')
+        self.dnf('list %s' % excludepkg, 1)
+        self.dnf_with_repo('install -y --exclude=%s curl*' % excludepkg)
+        self.dnf('list %s' % excludepkg, 1)
-- 
2.11.0


