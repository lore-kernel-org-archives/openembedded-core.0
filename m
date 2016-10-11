Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E0564719A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 21:34:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 11 Oct 2016 14:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,330,1473145200"; d="scan'208";a="19062444"
Received: from umukherj-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.96])
	by orsmga004.jf.intel.com with ESMTP; 11 Oct 2016 14:34:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2016 10:33:47 +1300
Message-Id: <d9721dfc03d8cc0614dd6081cd4da109524eafca.1476221600.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1476221600.git.paul.eggleton@linux.intel.com>
References: <cover.1476221600.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1476221600.git.paul.eggleton@linux.intel.com>
References: <cover.1476221600.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/externalsrc: re-run do_configure when configure files change
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
X-List-Received-Date: Tue, 11 Oct 2016 21:34:11 -0000

If the user modifies files such as CMakeLists.txt in the case of cmake,
we want do_configure to re-run so that those changes can take effect. In
order to accomplish that, have a variable CONFIGURE_FILES which
specifies a list of files that will be put into do_configure's checksum
(either full paths, or just filenames which will be searched for in the
entire source tree). CONFIGURE_FILES then just needs to be set
appropriately depending on what do_configure is doing; for now I've set
this for autotools and cmake which are the most common cases.

Fixes [YOCTO #7617].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/autotools.bbclass   |  2 ++
 meta/classes/cmake.bbclass       |  2 ++
 meta/classes/externalsrc.bbclass | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ecbba9f..c43ea9a 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -259,6 +259,8 @@ python autotools_copy_aclocals () {
 }
 autotools_copy_aclocals[vardepsexclude] += "MACHINE SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
 
+CONFIGURE_FILES = "${S}/configure.in ${S}/configure.ac ${S}/config.h.in ${S}/acinclude.m4 Makefile.am"
+
 autotools_do_configure() {
 	# WARNING: gross hack follows:
 	# An autotools built package generally needs these scripts, however only
diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7091f8b..3e762de 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -84,6 +84,8 @@ EOF
 
 addtask generate_toolchain_file after do_patch before do_configure
 
+CONFIGURE_FILES = "CMakeLists.txt"
+
 cmake_do_configure() {
 	if [ "${OECMAKE_BUILDPATH}" ]; then
 		bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 5c65d2b..31908c3 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -103,6 +103,7 @@ python () {
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
 
         d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')
+        d.setVarFlag('do_configure', 'file-checksums', '${@srctree_configure_hash_files(d)}')
 
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN', True))
@@ -166,3 +167,24 @@ def srctree_hash_files(d):
     else:
         ret = d.getVar('EXTERNALSRC', True) + '/*:True'
     return ret
+
+def srctree_configure_hash_files(d):
+    """
+    Get the list of files that should trigger do_configure to re-execute,
+    based on the value of CONFIGURE_FILES
+    """
+    in_files = (d.getVar('CONFIGURE_FILES', True) or '').split()
+    out_items = []
+    search_files = []
+    for entry in in_files:
+        if entry.startswith('/'):
+            out_items.append('%s:%s' % (entry, os.path.exists(entry)))
+        else:
+            search_files.append(entry)
+    if search_files:
+        s_dir = d.getVar('EXTERNALSRC', True)
+        for root, _, files in os.walk(s_dir):
+            for f in files:
+                if f in search_files:
+                    out_items.append('%s:True' % os.path.join(root, f))
+    return ' '.join(out_items)
-- 
2.5.5


