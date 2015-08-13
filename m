Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D93AC73D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 17:05:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2015 10:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,671,1432623600"; d="scan'208";a="768232448"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2015 10:04:00 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 08:58:01 +0000
Message-Id: <f8156831aad61e12b2fc6ed1d4857d2b55e1bdf7.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/2] insane.bbclass: Check non-ASCII characters on metadata
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
X-List-Received-Date: Thu, 13 Aug 2015 17:05:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Check if non-ASCII characters are present on recipe's metadata. Fields
taken into account: 'DESCRIPTION', 'SUMMARY', 'LICENSE' and 'SECTION'.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/insane.bbclass | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9c05c86..d560eed 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -11,6 +11,7 @@
 #  -Check if packages contains .debug directories or .so files
 #   where they should be in -dev or -dbg
 #  -Check if config.log contains traces to broken autoconf tests
+#  -Check non-ascii characters on some package metadata
 #  -Ensure that binaries in base_[bindir|sbindir|libdir] do not link
 #   into exec_prefix
 #  -Check that scripts in base_[bindir|sbindir|libdir] do not reference
@@ -36,7 +37,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
-            version-going-backwards expanded-d \
+            version-going-backwards expanded-d non-ascii \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
@@ -947,6 +948,24 @@ def package_qa_check_expanded_d(path,name,d,elf,messages):
                         sane = False
     return sane
 
+def package_qa_check_ascii_encoding(keys, d):
+    def check_ascii_encoding(key):
+        sane = True
+        value = d.getVar(key, True)
+        if value:
+            try:
+                s = unicode(value)
+            except UnicodeDecodeError as e:
+                error_msg = "%s has non-ASCII characters" % key
+                sane = False
+                package_qa_handle_error("non-ascii", error_msg, d)
+        return sane
+
+    for key in keys:
+        sane = check_ascii_encoding(key)
+        if not sane:
+            break
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
@@ -956,6 +975,9 @@ python do_package_qa () {
 
     bb.build.exec_func("read_subpackage_metadata", d)
 
+    # Check non-ascii characters on recipe's metadata
+    package_qa_check_ascii_encoding(['DESCRIPTION', 'SUMMARY', 'LICENSE', 'SECTION'], d)
+
     logdir = d.getVar('T', True)
     pkg = d.getVar('PN', True)
 
-- 
1.8.4.5


