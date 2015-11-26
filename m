Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 747B165D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574540"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:02 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:08 +0200
Message-Id: <4470984f91f566862fb41f8d7277b624aa5821a5.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/29] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:02 -0000

In python 3.4 python-config was rewritten in shell, ironically
to support cross-compilation:
https://bugs.python.org/issue16235

This new shell version is broken in several ways, and doesn't
have our oe-specific tweaks. Let's revert to the old script,
which is still provided.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../python/python3-native_3.4.3.bb                 |  1 +
 ...the-shell-version-of-python-config-that-w.patch | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.4.3.bb b/meta/recipes-devtools/python/python3-native_3.4.3.bb
index 464ff05..6b949b9 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
@@ -26,6 +26,7 @@ file://makerace.patch \
 ${DISTRO_SRC_URI} \
 file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
+file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 "
 SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
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
2.6.2


