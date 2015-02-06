Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3D472E40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:44:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2015 07:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="682025968"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 07:44:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 15:44:35 +0000
Message-Id: <232c31581e240876ff866f80e3eb0e5a80c15e28.1423237365.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423237365.git.paul.eggleton@linux.intel.com>
References: <cover.1423237365.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] oe-pkgdata-util: add some QA tests
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
X-List-Received-Date: Fri, 06 Feb 2015 15:44:47 -0000

Test each of the subcommands that this utility provides.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/pkgdata.py | 125 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/pkgdata.py

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
new file mode 100644
index 0000000..cc2ad7d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -0,0 +1,125 @@
+import unittest
+import os
+import tempfile
+import logging
+
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
+
+class OePkgdataUtilTests(oeSelfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        # Ensure we have the right data in pkgdata
+        logger = logging.getLogger("selftest")
+        logger.info('Running bitbake to generate pkgdata')
+        bitbake('glibc busybox zlib bash')
+
+    def test_lookup_pkg(self):
+        # Forward tests
+        result = runCmd('oe-pkgdata-util lookup-pkg "glibc busybox"')
+        self.assertEqual(result.output, 'libc6\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-pkg zlib-dev')
+        self.assertEqual(result.output, 'libz-dev')
+        result = runCmd('oe-pkgdata-util lookup-pkg nonexistentpkg', ignore_status=True)
+        self.assertEqual(result.status, 1)
+        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+        # Reverse tests
+        result = runCmd('oe-pkgdata-util lookup-pkg -r "libc6 busybox"')
+        self.assertEqual(result.output, 'glibc\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-pkg -r libz-dev')
+        self.assertEqual(result.output, 'zlib-dev')
+        result = runCmd('oe-pkgdata-util lookup-pkg -r nonexistentpkg', ignore_status=True)
+        self.assertEqual(result.status, 1)
+        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+
+    def test_read_value(self):
+        result = runCmd('oe-pkgdata-util read-value PN libz1')
+        self.assertEqual(result.output, 'zlib')
+        result = runCmd('oe-pkgdata-util read-value PKGSIZE bash')
+        pkgsize = int(result.output.strip())
+        self.assertGreater(pkgsize, 1)
+
+    def test_find_path(self):
+        result = runCmd('oe-pkgdata-util find-path /lib/libc.so.6')
+        self.assertEqual(result.output, 'glibc: /lib/libc.so.6')
+        result = runCmd('oe-pkgdata-util find-path /bin/bash')
+        self.assertEqual(result.output, 'bash: /bin/bash')
+        result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
+        self.assertEqual(result.status, 1)
+        self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')
+
+    def test_lookup_recipe(self):
+        result = runCmd('oe-pkgdata-util lookup-recipe "libc6-staticdev busybox"')
+        self.assertEqual(result.output, 'glibc\nbusybox')
+        result = runCmd('oe-pkgdata-util lookup-recipe libz-dbg')
+        self.assertEqual(result.output, 'zlib')
+        result = runCmd('oe-pkgdata-util lookup-recipe nonexistentpkg', ignore_status=True)
+        self.assertEqual(result.status, 1)
+        self.assertEqual(result.output, 'ERROR: The following packages could not be found: nonexistentpkg')
+
+    def test_list_pkgs(self):
+        # No arguments
+        result = runCmd('oe-pkgdata-util list-pkgs')
+        pkglist = result.output.split()
+        self.assertIn('glibc-utils', pkglist)
+        self.assertIn('zlib-dev', pkglist)
+        # No pkgspec, runtime
+        result = runCmd('oe-pkgdata-util list-pkgs -r')
+        pkglist = result.output.split()
+        self.assertIn('libc6-utils', pkglist)
+        self.assertIn('libz-dev', pkglist)
+        # With recipe specified
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib')
+        pkglist = sorted(result.output.split())
+        try:
+            pkglist.remove('zlib-ptest') # in case ptest is disabled
+        except ValueError:
+            pass
+        self.assertEqual(pkglist, ['zlib', 'zlib-dbg', 'zlib-dev', 'zlib-doc', 'zlib-staticdev'])
+        # With recipe specified, runtime
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r')
+        pkglist = sorted(result.output.split())
+        try:
+            pkglist.remove('libz-ptest') # in case ptest is disabled
+        except ValueError:
+            pass
+        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc', 'libz-staticdev', 'libz1'])
+        # With recipe specified and unpackaged
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u')
+        pkglist = sorted(result.output.split())
+        self.assertIn('zlib-locale', pkglist)
+        # With recipe specified and unpackaged, runtime
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -u -r')
+        pkglist = sorted(result.output.split())
+        self.assertIn('libz-locale', pkglist)
+        # With recipe specified and pkgspec
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib "*-d*"')
+        pkglist = sorted(result.output.split())
+        self.assertEqual(pkglist, ['zlib-dbg', 'zlib-dev', 'zlib-doc'])
+        # With recipe specified and pkgspec, runtime
+        result = runCmd('oe-pkgdata-util list-pkgs -p zlib -r "*-d*"')
+        pkglist = sorted(result.output.split())
+        self.assertEqual(pkglist, ['libz-dbg', 'libz-dev', 'libz-doc'])
+
+
+    def test_glob(self):
+        tempdir = tempfile.mkdtemp(prefix='pkgdataqa')
+        self.track_for_cleanup(tempdir)
+        pkglistfile = os.path.join(tempdir, 'pkglist')
+        with open(pkglistfile, 'w') as f:
+            f.write('libc6\n')
+            f.write('libz1\n')
+            f.write('busybox\n')
+        result = runCmd('oe-pkgdata-util glob %s "*-dev"' % pkglistfile)
+        desiredresult = ['libc6-dev', 'libz-dev', 'busybox-dev']
+        self.assertEqual(sorted(result.output.split()), sorted(desiredresult))
+        # The following should not error (because when we use this during rootfs construction, sometimes the complementary package won't exist)
+        result = runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
+        self.assertEqual(result.output, '')
+
+    def test_specify_pkgdatadir(self):
+        result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
+        self.assertEqual(result.output, 'libc6')
-- 
1.9.3


