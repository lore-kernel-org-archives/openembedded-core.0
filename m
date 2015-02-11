Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 29BFA732EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2015 06:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664876060"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 15:00:00 +0000
Message-Id: <ebf7d77b23d58de2a922edcab664201406142f48.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423666576.git.paul.eggleton@linux.intel.com>
References: <cover.1423666576.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 7/7] oe-pkgdata-util: add some QA tests
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:21 -0000

Test each of the subcommands that this utility provides.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/pkgdata.py | 213 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/pkgdata.py

diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
new file mode 100644
index 0000000..f689bf3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -0,0 +1,213 @@
+import unittest
+import os
+import tempfile
+import logging
+import fnmatch
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
+    def test_list_pkg_files(self):
+        def splitoutput(output):
+            files = {}
+            curpkg = None
+            for line in output.splitlines():
+                if line.startswith('\t'):
+                    self.assertTrue(curpkg, 'Unexpected non-package line:\n%s' % line)
+                    files[curpkg].append(line.strip())
+                else:
+                    self.assertTrue(line.rstrip().endswith(':'), 'Invalid package line in output:\n%s' % line)
+                    curpkg = line.split(':')[0]
+                    files[curpkg] = []
+            return files
+        base_libdir = get_bb_var('base_libdir')
+        libdir = get_bb_var('libdir')
+        includedir = get_bb_var('includedir')
+        mandir = get_bb_var('mandir')
+        # Test recipe-space package name
+        result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
+        files = splitoutput(result.output)
+        self.assertIn('zlib-dev', files.keys())
+        self.assertIn('zlib-doc', files.keys())
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
+        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
+        # Test runtime package name
+        result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
+        files = splitoutput(result.output)
+        self.assertIn('libz1', files.keys())
+        self.assertIn('libz-dev', files.keys())
+        self.assertGreater(len(files['libz1']), 1)
+        libspec = os.path.join(base_libdir, 'libz.so.1.*')
+        found = False
+        for fileitem in files['libz1']:
+            if fnmatch.fnmatchcase(fileitem, libspec):
+                found = True
+                break
+        self.assertTrue(found, 'Could not find zlib library file %s in libz1 package file list: %s' % (libspec, files['libz1']))
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
+        # Test recipe
+        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
+        files = splitoutput(result.output)
+        self.assertIn('zlib-dbg', files.keys())
+        self.assertIn('zlib-doc', files.keys())
+        self.assertIn('zlib-dev', files.keys())
+        self.assertIn('zlib-staticdev', files.keys())
+        self.assertIn('zlib', files.keys())
+        self.assertNotIn('zlib-locale', files.keys())
+        # (ignore ptest, might not be there depending on config)
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
+        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
+        self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
+        # Test recipe, runtime
+        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
+        files = splitoutput(result.output)
+        self.assertIn('libz-dbg', files.keys())
+        self.assertIn('libz-doc', files.keys())
+        self.assertIn('libz-dev', files.keys())
+        self.assertIn('libz-staticdev', files.keys())
+        self.assertIn('libz1', files.keys())
+        self.assertNotIn('libz-locale', files.keys())
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
+        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
+        self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
+        # Test recipe, unpackaged
+        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
+        files = splitoutput(result.output)
+        self.assertIn('zlib-dbg', files.keys())
+        self.assertIn('zlib-doc', files.keys())
+        self.assertIn('zlib-dev', files.keys())
+        self.assertIn('zlib-staticdev', files.keys())
+        self.assertIn('zlib', files.keys())
+        self.assertIn('zlib-locale', files.keys()) # this is the key one
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
+        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
+        self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
+        # Test recipe, runtime, unpackaged
+        result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
+        files = splitoutput(result.output)
+        self.assertIn('libz-dbg', files.keys())
+        self.assertIn('libz-doc', files.keys())
+        self.assertIn('libz-dev', files.keys())
+        self.assertIn('libz-staticdev', files.keys())
+        self.assertIn('libz1', files.keys())
+        self.assertIn('libz-locale', files.keys()) # this is the key one
+        self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
+        self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
+        self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
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


