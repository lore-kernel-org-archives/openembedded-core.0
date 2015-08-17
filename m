Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC5FF73E19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:16:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 17 Aug 2015 08:16:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="785698485"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2015 08:16:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 07:10:12 +0000
Message-Id: <8a6c98b192128c361fe5d5692b0f1d23f1cfcbad.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439794714.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 1/2] insane.bbclass: Check for invalid characters (non UTF8) on recipe metadata
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
X-List-Received-Date: Mon, 17 Aug 2015 15:16:24 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Check if invalid characters are present on recipe's metadata. Fields
taken into account are: 'DESCRIPTION', 'SUMMARY', 'LICENSE' and 'SECTION'.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/insane.bbclass | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9c05c86..fc16540 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -11,6 +11,7 @@
 #  -Check if packages contains .debug directories or .so files
 #   where they should be in -dev or -dbg
 #  -Check if config.log contains traces to broken autoconf tests
+#  -Check invalid characters (non-utf8) on some package metadata
 #  -Ensure that binaries in base_[bindir|sbindir|libdir] do not link
 #   into exec_prefix
 #  -Check that scripts in base_[bindir|sbindir|libdir] do not reference
@@ -36,7 +37,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
-            version-going-backwards expanded-d \
+            version-going-backwards expanded-d invalid-chars \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
@@ -947,6 +948,24 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
                         sane = False
     return sane
 
+def package_qa_check_encoding(keys, encode, d):
+    def check_encoding(key,enc):
+        sane = True
+        value = d.getVar(key, True)
+        if value:
+            try:
+                s = unicode(value, enc)
+            except UnicodeDecodeError as e:
+                error_msg = "%s has non %s characters" % (key,enc)
+                sane = False
+                package_qa_handle_error("invalid-chars", error_msg, d)
+        return sane
+
+    for key in keys:
+        sane = check_encoding(key, encode)
+        if not sane:
+            break
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
@@ -956,6 +975,9 @@ python do_package_qa () {
 
     bb.build.exec_func("read_subpackage_metadata", d)
 
+    # Check non UTF-8 characters on recipe's metadata
+    package_qa_check_encoding(['DESCRIPTION', 'SUMMARY', 'LICENSE', 'SECTION'], 'utf-8', d)
+
     logdir = d.getVar('T', True)
     pkg = d.getVar('PN', True)
 
-- 
1.8.4.5


