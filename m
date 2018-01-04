Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E696D787D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:58:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 05:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="7369702"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2018 05:58:49 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 15:58:45 +0200
Message-Id: <20180104135845.10717-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104135845.10717-1-alexander.kanavin@linux.intel.com>
References: <20180104135845.10717-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] gobject-introspection: correct the --lib-dirs-envvar patch
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
X-List-Received-Date: Thu, 04 Jan 2018 13:58:49 -0000

The first version introduced a new branch in if-else statement, and so
discarded the actions in the branch taken previously. This seemed
to have no adverse effect for now, but let's do it right.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...01-giscanner-add-a-lib-dirs-envvar-option.patch | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
index e1776bc9b40..4ec527dcc0f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -1,4 +1,4 @@
-From a02076fe916ade6c3f78f6d35072ec53482e9446 Mon Sep 17 00:00:00 2001
+From e48f1e18f5ea41656f0ba10fe61d69d2604b0064 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 3 Jan 2018 17:02:01 +0200
 Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
@@ -11,17 +11,18 @@ which can be picked up and used by the wrapper.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- giscanner/ccompiler.py   | 6 ++++--
+ giscanner/ccompiler.py   | 4 ++--
  giscanner/dumper.py      | 3 ++-
  giscanner/scannermain.py | 3 +++
- 3 files changed, 9 insertions(+), 3 deletions(-)
+ 3 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index 29de0ee..e969337 100644
+index 29de0ee..928eae8 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
-@@ -109,14 +109,16 @@ class CCompiler(object):
+@@ -109,7 +109,7 @@ class CCompiler(object):
  
              self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
  
@@ -30,16 +31,15 @@ index 29de0ee..e969337 100644
          # An "internal" link is where the library to be introspected
          # is being built in the current directory.
  
-         runtime_path_envvar = []
-         runtime_paths = []
- 
--        if self.check_is_msvc():
-+        if lib_dirs_envvar:
-+            runtime_path_envvar = [lib_dirs_envvar]
-+        elif self.check_is_msvc():
+@@ -119,7 +119,7 @@ class CCompiler(object):
+         if self.check_is_msvc():
              runtime_path_envvar = ['LIB', 'PATH']
          else:
-             runtime_path_envvar = ['LD_LIBRARY_PATH']
+-            runtime_path_envvar = ['LD_LIBRARY_PATH']
++            runtime_path_envvar = ['LD_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
+             # Search the current directory first
+             # (This flag is not supported nor needed for Visual C++)
+             args.append('-L.')
 diff --git a/giscanner/dumper.py b/giscanner/dumper.py
 index 7f77bd2..db96df6 100644
 --- a/giscanner/dumper.py
-- 
2.15.1


