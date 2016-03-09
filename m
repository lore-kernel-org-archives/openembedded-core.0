Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E72526FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083577"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:48 +0200
Message-Id: <15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:59 -0000

In python 3.4 python-config was rewritten in shell, ironically
to support cross-compilation:
https://bugs.python.org/issue16235

This new shell version is broken in several ways, and doesn't
have our oe-specific tweaks. Let's revert to the old script,
which is still provided.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/python3-native_3.5.1.bb                 |  1 +
 ...the-shell-version-of-python-config-that-w.patch | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
index 152da1c..7bad11a 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
@@ -25,6 +25,7 @@ file://unixccompiler.patch \
 ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
+file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 "
 SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
 SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
new file mode 100644
index 0000000..b7e0ac6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
@@ -0,0 +1,38 @@
+From 045c99b5f1eb6e4e0d8ad1ef9f0ba6574f738150 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 23 Oct 2015 12:25:09 +0300
+Subject: [PATCH] Do not use the shell version of python-config that was
+ introduced in 3.4
+
+Revert instead to the original python version: it has our tweaks and
+outputs directories correctly.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.pre.in | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index d7fc9a0..47e60bc 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1270,12 +1270,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+ 	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
+ 	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
+ 	sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
+-	# On Darwin, always use the python version of the script, the shell
+-	# version doesn't use the compiler customizations that are provided
+-	# in python (_osx_support.py).
+-	if test `uname -s` = Darwin; then \
+-		cp python-config.py python-config; \
+-	fi
++	# In OpenEmbedded, always use the python version of the script, the shell
++	# version is broken in multiple ways, and doesn't return correct directories
++	cp python-config.py python-config
+ 
+ 
+ # Install the include files
+-- 
+2.1.4
+
-- 
2.7.0


