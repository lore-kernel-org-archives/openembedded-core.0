Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 51B3778A48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054092"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:18:01 +0200
Message-Id: <20180308181804.31261-39-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 39/42] python-numpy: update to 1.14.1
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:41 -0000

Drop backported 0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch.

Drop 0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch as
upstream is using os.path.basename() instead now.

License-Update: License.txt file was update to list licenses of individual components;
not all of them are 3-clause BSD.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...inite-loop-when-creating-np.pad-on-an-emp.patch | 45 ----------------------
 ...h-usr-and-so-on-for-libraries-by-default-.patch | 33 +++++++++-------
 .../files/remove-build-path-in-comments.patch      | 30 ---------------
 ...thon-numpy_1.13.1.bb => python-numpy_1.14.1.bb} | 10 ++---
 ...on3-numpy_1.13.3.bb => python3-numpy_1.14.1.bb} | 13 +++----
 5 files changed, 29 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch
 delete mode 100644 meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.13.1.bb => python-numpy_1.14.1.bb} (88%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.13.3.bb => python3-numpy_1.14.1.bb} (87%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch b/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch
deleted file mode 100644
index b9e585610f4..00000000000
--- a/meta/recipes-devtools/python-numpy/files/0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4170b98e0d5864ef4db1c5704a6e9428c3be9fb8 Mon Sep 17 00:00:00 2001
-From: Iryna Shcherbina <ishcherb@redhat.com>
-Date: Thu, 24 Aug 2017 18:01:43 +0200
-Subject: [PATCH] BUG: fix infinite loop when creating np.pad on an empty array
-
-Upstream-Status: Backport [https://github.com/numpy/numpy/pull/9599/commits/6f9ea0abbd305d53f9017debab3a3a591fe0e249]
-CVE: CVE-2017-12852
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- numpy/lib/arraypad.py            | 3 +++
- numpy/lib/tests/test_arraypad.py | 4 ++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/numpy/lib/arraypad.py b/numpy/lib/arraypad.py
-index 2dad99c..294a689 100644
---- a/numpy/lib/arraypad.py
-+++ b/numpy/lib/arraypad.py
-@@ -1406,6 +1406,9 @@ def pad(array, pad_width, mode, **kwargs):
-             newmat = _append_min(newmat, pad_after, chunk_after, axis)
- 
-     elif mode == 'reflect':
-+        if narray.size == 0:
-+            raise ValueError("There aren't any elements to reflect in `array`")
-+
-         for axis, (pad_before, pad_after) in enumerate(pad_width):
-             # Recursive padding along any axis where `pad_amt` is too large
-             # for indexing tricks. We can only safely pad the original axis
-diff --git a/numpy/lib/tests/test_arraypad.py b/numpy/lib/tests/test_arraypad.py
-index 056aa45..0f71d32 100644
---- a/numpy/lib/tests/test_arraypad.py
-+++ b/numpy/lib/tests/test_arraypad.py
-@@ -1014,6 +1014,10 @@ class ValueError1(TestCase):
-         assert_raises(ValueError, pad, arr, ((-2, 3), (3, 2)),
-                       **kwargs)
- 
-+    def test_check_empty_array(self):
-+        assert_raises(ValueError, pad, [], 4, mode='reflect')
-+        assert_raises(ValueError, pad, np.ndarray(0), 4, mode='reflect')
-+
- 
- class ValueError2(TestCase):
-     def test_check_negative_pad_amount(self):
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index ffd6ced1361..516ccd7b9bd 100644
--- a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,23 +1,24 @@
-From cc2ce6d8b6a3e6e2c8874896c10897034a80cd4f Mon Sep 17 00:00:00 2001
+From c8c6649b29a08f82e1d6761a6d62ce5f632313c5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
-Subject: [PATCH] Don't search /usr and so on for libraries by default to avoid
- host contamination.
+Subject: [PATCH 1/3] Don't search /usr and so on for libraries by default to
+ avoid host contamination.
 
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  numpy/distutils/system_info.py | 50 +++++-------------------------------------
  1 file changed, 6 insertions(+), 44 deletions(-)
 
-Index: numpy-1.13.1/numpy/distutils/system_info.py
-===================================================================
---- numpy-1.13.1.orig/numpy/distutils/system_info.py
-+++ numpy-1.13.1/numpy/distutils/system_info.py
-@@ -211,51 +211,13 @@ if sys.platform == 'win32':
-     default_x11_lib_dirs = []
-     default_x11_include_dirs = []
+diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
+index bea120c..544e056 100644
+--- a/numpy/distutils/system_info.py
++++ b/numpy/distutils/system_info.py
+@@ -262,51 +262,13 @@ if sys.platform == 'win32':
+             add_system_root(os.path.join(conda_dir, 'Library'))
+                         
  else:
 -    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
 -                                 '/opt/local/lib', '/sw/lib'], platform_bits)
@@ -29,10 +30,7 @@ Index: numpy-1.13.1/numpy/distutils/system_info.py
 -                            '/opt/local/include', '/sw/include',
 -                            '/usr/include/suitesparse']
 -    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
-+    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
-+    default_include_dirs = ['/deaddir/include']
-+    default_src_dirs = ['.', '/deaddir/src']
- 
+-
 -    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
 -                                     '/usr/lib'], platform_bits)
 -    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
@@ -67,8 +65,15 @@ Index: numpy-1.13.1/numpy/distutils/system_info.py
 -    finally:
 -        if tmp is not None:
 -            tmp.close()
++    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
++    default_include_dirs = ['/deaddir/include']
++    default_src_dirs = ['.', '/deaddir/src']
++
 +    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
 +    default_x11_include_dirs = ['/deaddir/include']
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
+-- 
+2.16.1
+
diff --git a/meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch b/meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch
deleted file mode 100644
index eb8a71a2e28..00000000000
--- a/meta/recipes-devtools/python-numpy/files/remove-build-path-in-comments.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c560abff71f98a39a7401f08c2c13dad9ae7f15f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 25 Feb 2016 01:23:32 -0500
-Subject: [PATCH] remove build path in comments
-
-It has build path in comments, so remove it.
-
-Upstream-Status: Inappropriate [openembedded specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- numpy/distutils/misc_util.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/distutils/misc_util.py b/numpy/distutils/misc_util.py
-index 345e60f..dafb068 100644
---- a/numpy/distutils/misc_util.py
-+++ b/numpy/distutils/misc_util.py
-@@ -2254,7 +2254,7 @@ def generate_config_py(target):
-     from distutils.dir_util import mkpath
-     mkpath(os.path.dirname(target))
-     f = open(target, 'w')
--    f.write('# This file is generated by %s\n' % (os.path.abspath(sys.argv[0])))
-+    f.write('# This file is generated by %s\n' % (os.path.abspath(sys.argv[0]).replace(os.path.abspath('../'),'')))
-     f.write('# It contains system_info results at the time of building this package.\n')
-     f.write('__all__ = ["get_info","show"]\n\n')
-     for k, i in system_info.saved_results.items():
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
similarity index 88%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
index b6ec2308e41..6b5dd67fa3e 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.13.1.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
@@ -1,19 +1,17 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1002b09cd654fcaa2dcc87535acd9a96"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
 
 SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
-           file://0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch \
            ${CONFIGFILESURI} "
 
-SRC_URI[md5sum] = "6d459e4a24f5035f720dda3c57716a92"
-SRC_URI[sha256sum] = "de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93"
+SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
+SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
similarity index 87%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
index 553b0fac7f2..736e0f57f09 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.13.3.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
@@ -1,18 +1,17 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1002b09cd654fcaa2dcc87535acd9a96"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
 
 SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://remove-build-path-in-comments.patch \
            file://fix_shebang_f2py.patch \
-           file://0001-BUG-fix-infinite-loop-when-creating-np.pad-on-an-emp.patch \
-           ${CONFIGFILESURI} "
-SRC_URI[md5sum] = "c1d433e5973e548809e80c9118474b73"
-SRC_URI[sha256sum] = "4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094"
+           ${CONFIGFILESURI} \
+           "
+SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
+SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.16.1


