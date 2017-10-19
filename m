Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9542D77B39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 19:28:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 19 Oct 2017 12:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,402,1503385200"; d="scan'208";a="164675221"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.141])
	by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2017 12:28:32 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 14:28:25 -0500
Message-Id: <1508441305-13290-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507756660-30327-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1507756660-30327-1-git-send-email-jose.a.lamego@linux.intel.com>
Subject: [PATCH v2] python-scons*: upgrade to 3.0.0
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
X-List-Received-Date: Thu, 19 Oct 2017 19:28:34 -0000

Both python-scons and python-scons-native need to be upgraded to latest
upstream version.
LIC_FILES_CHKSUM changed due to updated year in date, but rest of file
remain the same.
Following dependencies were added to enable appropriate package usage:
python-shell, python-pprint and python-importlib.
A patch was taken from upstream to support python2 print statements
in SConscripts. This should be included in next version.
These changes were tested in qemux86 with core-image-minimal.

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 ...ative_2.5.1.bb => python-scons-native_3.0.0.bb} |  0
 ...onscript-Support-python2-print-statements.patch | 38 ++++++++++++++++++++++
 ...python-scons_2.5.1.bb => python-scons_3.0.0.bb} | 12 ++++---
 3 files changed, 46 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.5.1.bb => python-scons-native_3.0.0.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
 rename meta/recipes-devtools/python/{python-scons_2.5.1.bb => python-scons_3.0.0.bb} (51%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.5.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.5.1.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.0.bb
diff --git a/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch b/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
new file mode 100644
index 0000000..b1a7902
--- /dev/null
+++ b/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
@@ -0,0 +1,38 @@
+From 885aabdb313685405737112dcb7d7774eee6d879 Mon Sep 17 00:00:00 2001
+From: Thomas Berg <merlin66b@gmail.com>
+Date: Thu, 19 Oct 2017 14:02:21 -0500
+Subject: [PATCH] SConscript: Support python2 print statements
+
+This fixes a regression introduced in scons-3.0.0, where
+SConscripts containing python 2 print statements would cause
+syntax errors even when executing scons with python 2.7.
+
+This ensures backward compatibility, allowing users to build
+legacy code with scons-3.0.0 without having to patch it.
+
+Taken from
+https://github.com/SConsProject/scons/commit/2e0de3c55f22b3eaa7767b69740b898f3d2f46bf
+
+Upstream-Status: Accepted
+
+Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
+---
+ engine/SCons/Script/SConscript.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/engine/SCons/Script/SConscript.py b/engine/SCons/Script/SConscript.py
+index bc05540..332d1fa 100644
+--- a/engine/SCons/Script/SConscript.py
++++ b/engine/SCons/Script/SConscript.py
+@@ -5,8 +5,6 @@ files.
+ 
+ """
+ 
+-from __future__ import print_function
+-
+ #
+ # Copyright (c) 2001 - 2017 The SCons Foundation
+ #
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python-scons_2.5.1.bb b/meta/recipes-devtools/python/python-scons_3.0.0.bb
similarity index 51%
rename from meta/recipes-devtools/python/python-scons_2.5.1.bb
rename to meta/recipes-devtools/python/python-scons_3.0.0.bb
index 3f43856..33bfb45 100644
--- a/meta/recipes-devtools/python/python-scons_2.5.1.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.0.bb
@@ -1,13 +1,14 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a885dff6d14e4cd876d9008a09a42de"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
 SRCNAME = "scons"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+           file://SConscript-Support-python2-print-statements.patch"
 
-SRC_URI[md5sum] = "3eac81e5e8206304a9b4683c57665aa4"
-SRC_URI[sha256sum] = "c8de85fc02ed1a687b1f2ac791eaa0c1707b4382a204f17d782b5b111b9fdf07"
+SRC_URI[md5sum] = "7ca558edaaa1942fe38f3105ca2400fb"
+SRC_URI[sha256sum] = "aa5afb33c2bbd33c311e47e912412195739e9ffb2e933534a31f85fba8f3470e"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
 
@@ -20,4 +21,7 @@ RDEPENDS_${PN} = "\
   python-io \
   python-json \
   python-subprocess \
+  python-shell \
+  python-pprint \
+  python-importlib \
   "
-- 
2.7.4


