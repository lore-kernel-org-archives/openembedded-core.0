Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED1C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064165"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:10 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:20 +0200
Message-Id: <69b9c458eaf38b526632f91fc194ddd60e7a1467.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/20] python-numpy: update to 1.10.1
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:09 -0000

LICENSE checksum has changed due to updated copyright years

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-usr-and-so-on-for-libraries-by-default-.patch} | 33 ++++++++++++++++++----
 ...ython-numpy_1.7.0.bb => python-numpy_1.10.1.bb} |  9 +++---
 2 files changed, 31 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/python-numpy/{no-host-paths.patch => 0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch} (69%)
 rename meta/recipes-devtools/python/{python-numpy_1.7.0.bb => python-numpy_1.10.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python-numpy/no-host-paths.patch b/meta/recipes-devtools/python/python-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
similarity index 69%
rename from meta/recipes-devtools/python/python-numpy/no-host-paths.patch
rename to meta/recipes-devtools/python/python-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index d745036..5b134ed 100644
--- a/meta/recipes-devtools/python/python-numpy/no-host-paths.patch
+++ b/meta/recipes-devtools/python/python-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,18 +1,27 @@
-Don't search /usr and so on for libraries by default to avoid host contamination.
+From cc2ce6d8b6a3e6e2c8874896c10897034a80cd4f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 10 Dec 2015 13:20:30 +0200
+Subject: [PATCH] Don't search /usr and so on for libraries by default to avoid
+ host contamination.
 
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ numpy/distutils/system_info.py | 50 +++++-------------------------------------
+ 1 file changed, 6 insertions(+), 44 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index bac90fb..a63d796 100644
+index 9dd48e2..80e197a 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -191,41 +191,12 @@ if sys.platform == 'win32':
+@@ -204,51 +204,13 @@ if sys.platform == 'win32':
      default_x11_lib_dirs = []
      default_x11_include_dirs = []
  else:
 -    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
 -                                 '/opt/local/lib', '/sw/lib'], platform_bits)
+     default_runtime_dirs = []
 -    default_include_dirs = ['/usr/local/include',
 -                            '/opt/include', '/usr/include',
 -                            # path of umfpack under macports
@@ -35,17 +44,26 @@ index bac90fb..a63d796 100644
 -                                             '/usr/include/X11'])
 -
 -    import subprocess as sp
+-    tmp = None
 -    try:
+-        # Explicitly open/close file to avoid ResourceWarning when
+-        # tests are run in debug mode Python 3.
+-        tmp = open(os.devnull, 'w')
 -        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
--                stderr=open(os.devnull, 'w'))
--    except OSError:
--        pass # gcc is not installed
+-                stderr=tmp)
+-    except (OSError, DistutilsError):
+-        # OSError if gcc is not installed, or SandboxViolation (DistutilsError
+-        # subclass) if an old setuptools bug is triggered (see gh-3160).
+-        pass
 -    else:
 -        triplet = str(p.communicate()[0].decode().strip())
 -        if p.returncode == 0:
 -            # gcc supports the "-print-multiarch" option
 -            default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
 -            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+-    finally:
+-        if tmp is not None:
+-            tmp.close()
 +    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
 +    default_include_dirs = ['/deaddir/include']
 +    default_src_dirs = ['.', '/deaddir/src']
@@ -55,3 +73,6 @@ index bac90fb..a63d796 100644
  
  if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
      default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
+-- 
+2.6.2
+
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.10.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python-numpy_1.7.0.bb
rename to meta/recipes-devtools/python/python-numpy_1.10.1.bb
index 81cdfde..693020e 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.10.1.bb
@@ -1,11 +1,10 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
-PR = "r1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f4e88b5748e8313caaf33d081ce65a3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-           file://no-host-paths.patch \
+           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            ${CONFIGFILESURI} "
 
 CONFIGFILESURI ?= ""
@@ -70,8 +69,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "4fa54e40b6a243416f0248123b6ec332"
-SRC_URI[sha256sum] = "f4fa70b7edbab65ee6432eb63743f5489f1919c614632b20b2fb45aa7e682ac6"
+SRC_URI[md5sum] = "3fed2b50906bc19018cec5fa26168aa5"
+SRC_URI[sha256sum] = "8b9f453f29ce96a14e625100d3dcf8926301d36c5f622623bf8820e748510858"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
-- 
2.6.2


