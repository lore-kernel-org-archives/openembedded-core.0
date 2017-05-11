Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 50CDF72FBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 17:31:41 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 May 2017 10:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,325,1491289200"; d="scan'208";a="98829904"
Received: from jgperezc-mobl1.zpn.intel.com ([10.219.4.33])
	by orsmga005.jf.intel.com with ESMTP; 11 May 2017 10:31:42 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 12:33:03 -0500
Message-Id: <20170511173303.26995-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <bd532acb-3dda-ac74-37d8-892fc797a407@linux.intel.com>
References: <bd532acb-3dda-ac74-37d8-892fc797a407@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH v2] runtime/dnf: Add new dnf test cases
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
X-List-Received-Date: Thu, 11 May 2017 17:31:42 -0000
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
 meta/lib/oeqa/runtime/cases/dnf.py | 19 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index fb214604a97..a0d07c9f003 100644
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
index 2f87296b4e0..0baf796278b 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -120,4 +120,21 @@ class DnfRepoTest(DnfTest):
     def test_dnf_reinstall(self):
         self.dnf_with_repo('reinstall -y run-postinsts-dev')
 
-
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    @OETestID(1771)
+    def test_dnf_installroot(self):
+        rootpath = '/home/root/chroot/test'
+        self.dnf_with_repo('install --installroot=%s --allowerasing -v -y busybox run-postinsts' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
+        self.assertEqual(0, status, output)
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_reinstall'])
+    @OETestID(1772)
+    def test_dnf_exclude(self):
+        excludepkg = 'curl-dev'
+        self.dnf('list %s' % excludepkg, 0)
+        self.dnf_with_repo('remove -y curl')
+        self.dnf_with_repo('install -y --exclude=%s curl' % excludepkg)
+        self.dnf('list %s' % excludepkg, 1)
-- 
2.11.0


