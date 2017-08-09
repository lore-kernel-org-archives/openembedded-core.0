Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7FD77E4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:04 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 Aug 2017 10:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337515"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:31 -0700
Message-Id: <1502300913-40295-10-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 09/11] python3: improve reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:04 -0000

The compiled .pyc files contain time stamp corresponding to the compile time.
This prevents binary reproducibility. This patch allows to achieve binary
reproducibility by overriding the build time stamp by the value
exported via SOURCE_DATE_EPOCH.

Patch by Bernhard M. Wiedemann.

[YOCTO#11241]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../python/python3-native_3.5.3.bb                 |  1 +
 .../support_SOURCE_DATE_EPOCH_in_py_compile.patch  | 97 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 3 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index 250697f..3467d29 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -24,6 +24,7 @@ ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
+file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 "
 
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
diff --git a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
new file mode 100644
index 0000000..32ecab9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
@@ -0,0 +1,97 @@
+The compiled .pyc files contain time stamp corresponding to the compile time.
+This prevents binary reproducibility. This patch allows to achieve binary
+reproducibility by overriding the build time stamp by the value 
+exported via SOURCE_DATE_EPOCH. 
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+
+From aeab488630fdb1b56a8d0b0c13fa88706b2afe9b Mon Sep 17 00:00:00 2001
+From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
+Date: Sat, 25 Feb 2017 06:42:28 +0100
+Subject: [PATCH] bpo-29708: support SOURCE_DATE_EPOCH env var in py_compile
+
+to allow for reproducible builds of python packages
+
+See https://reproducible-builds.org/ for why this is good
+and https://reproducible-builds.org/specs/source-date-epoch/
+for the definition of this variable.
+
+Background:
+In some distributions like openSUSE, binary rpms contain precompiled .pyc files.
+
+And packages like amqp or twisted dynamically generate .py files at build time
+so those have the current time and that timestamp gets embedded
+into the .pyc file header.
+When we then adapt file timestamps in rpms to be constant,
+the timestamp in the .pyc header will no more match
+the .py timestamp in the filesystem.
+The software will still work, but it will not use the .pyc file as it should.
+---
+ Doc/library/py_compile.rst  |  4 ++++
+ Lib/py_compile.py           |  4 ++++
+ Lib/test/test_py_compile.py | 19 +++++++++++++++++++
+ 3 files changed, 27 insertions(+)
+
+diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
+index 0af8fb1..841f3e8 100644
+--- a/Doc/library/py_compile.rst
++++ b/Doc/library/py_compile.rst
+@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the source code.
+    :func:`compile` function.  The default of ``-1`` selects the optimization
+    level of the current interpreter.
+ 
++   If the SOURCE_DATE_EPOCH environment variable is set, the .py file mtime
++   and timestamp entry in .pyc file header, will be limited to this value.
++   See https://reproducible-builds.org/specs/source-date-epoch/ for more info.
++
+    .. versionchanged:: 3.2
+       Changed default value of *cfile* to be :PEP:`3147`-compliant.  Previous
+       default was *file* + ``'c'`` (``'o'`` if optimization was enabled).
+diff --git a/Lib/py_compile.py b/Lib/py_compile.py
+index 11c5b50..62dcdc7 100644
+--- a/Lib/py_compile.py
++++ b/Lib/py_compile.py
+@@ -137,6 +137,10 @@ def compile(file, cfile=None, dfile=None, doraise=False, optimize=-1):
+     except FileExistsError:
+         pass
+     source_stats = loader.path_stats(file)
++    sde = os.environ.get('SOURCE_DATE_EPOCH')
++    if sde and source_stats['mtime'] > int(sde):
++        source_stats['mtime'] = int(sde)
++        os.utime(file, (source_stats['mtime'], source_stats['mtime']))
+     bytecode = importlib._bootstrap_external._code_to_bytecode(
+             code, source_stats['mtime'], source_stats['size'])
+     mode = importlib._bootstrap_external._calc_mode(file)
+diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
+index 4a6caa5..3d09963 100644
+--- a/Lib/test/test_py_compile.py
++++ b/Lib/test/test_py_compile.py
+@@ -98,6 +98,25 @@ def test_bad_coding(self):
+         self.assertFalse(os.path.exists(
+             importlib.util.cache_from_source(bad_coding)))
+ 
++    def test_source_date_epoch(self):
++        testtime = 123456789
++        orig_sde = os.getenv("SOURCE_DATE_EPOCH")
++        os.environ["SOURCE_DATE_EPOCH"] = str(testtime)
++        py_compile.compile(self.source_path, self.pyc_path)
++        if orig_sde:
++            os.environ["SOURCE_DATE_EPOCH"] = orig_sde
++        else:
++            del os.environ["SOURCE_DATE_EPOCH"]
++        self.assertTrue(os.path.exists(self.pyc_path))
++        self.assertFalse(os.path.exists(self.cache_path))
++        statinfo = os.stat(self.source_path)
++        self.assertEqual(statinfo.st_mtime, testtime)
++        f = open(self.pyc_path, "rb")
++        f.read(4)
++        timebytes = f.read(4) # read timestamp from pyc header
++        f.close()
++        self.assertEqual(timebytes, (testtime).to_bytes(4, 'little'))
++
+     @unittest.skipIf(sys.flags.optimize > 0, 'test does not work with -O')
+     def test_double_dot_no_clobber(self):
+         # http://bugs.python.org/issue22966
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 7419c71..0c32b85 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -16,6 +16,7 @@ file://130-readline-setup.patch \
 file://150-fix-setupterm.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
 file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
+file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 ${DISTRO_SRC_URI} \
 "
 
-- 
2.7.4


