Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AACC0612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498181"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:18 +0300
Message-Id: <a4ad421382764de5d462ed30923660798ba41f85.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/45] python-pyrex: remove unused recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:54:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 .../python/python-pyrex-native_0.9.9.bb            |  5 -----
 .../python-pyrex/pyrex-fix-optimized-mode.patch    | 15 ---------------
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb | 22 ----------------------
 4 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 delete mode 100644 meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
 delete mode 100644 meta/recipes-devtools/python/python-pyrex_0.9.9.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index c8f9395..5626792 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -343,7 +343,6 @@ DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl Ubuntu=python-pycurl"
 DISTRO_PN_ALIAS_pn-python-pygobject = "Meego=pygobject2 Fedora=pygobject2 Ubuntu=pygobject Debian=pygobject"
-DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex Ubuntu=python-pyrex"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
 DISTRO_PN_ALIAS_pn-python-setuptools = "Mandriva=python-setup OpenSuSE=python-setup-git"
 DISTRO_PN_ALIAS_pn-python-smartpm = "Debian=smart OpenSuSE=smart"
diff --git a/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
deleted file mode 100644
index e8ef1aa..0000000
--- a/meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pyrex_${PV}.bb
-inherit native pythonnative
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-PR = "r3"
diff --git a/meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch b/meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
deleted file mode 100644
index c58c328..0000000
--- a/meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Index: Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
-===================================================================
---- Pyrex-0.9.8.4.orig/Pyrex/Distutils/extension.py
-+++ Pyrex-0.9.8.4/Pyrex/Distutils/extension.py
-@@ -15,7 +15,7 @@ except ImportError:
-     warnings = None
- 
- class Extension(_Extension.Extension):
--    _Extension.Extension.__doc__ + \
-+    _Extension.Extension.__doc__ or "" + \
-     """pyrex_include_dirs : [string]
-         list of directories to search for Pyrex header files (.pxd) (in
-         Unix form for portability)
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
deleted file mode 100644
index c4dd2e6..0000000
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Language for writing Python extension modules"
-DESCRIPTION = "Pyrex is a language specially designed for writing Python extension modules. \
-It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
-and the messy, low-level world of C."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
-SRCNAME = "Pyrex"
-PR = "r4"
-
-SRC_URI = "\
-  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-  file://pyrex-fix-optimized-mode.patch \
-"
-
-SRC_URI[md5sum] = "515dee67d15d4393841e2d60e8341947"
-SRC_URI[sha256sum] = "5f87df06831d0b3412eb4bc9d3fc2ee7bfae1b913d7da8c23ab2bf5699fb6b50"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-FILES_${PN} += "${datadir}${base_libdir}/${PYTHON_DIR}/site-packages/Pyrex/Compiler/Lexicon.pickle"
-- 
2.8.1


