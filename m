Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 388C460030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:20:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2014 08:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,508,1413270000"; d="scan'208";a="617991134"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.54])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2014 09:01:01 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 11:00:14 -0600
Message-Id: <8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417623235.git.alejandro.hernandez@linux.intel.com>
References: <cover.1417623235.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] insane.bbclass: Added QA test for unexpanded ${D}
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
X-List-Received-Date: Wed, 03 Dec 2014 17:20:32 -0000

Checks in FILES and pkg_* variables ,solves common mistake
of using ${D} instead of $D and warns the user accordingly.

[YOCTO #6642]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/insane.bbclass | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b45374..419c89b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -906,6 +906,39 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 
     return sane
 
+def package_qa_check_unexpanded_d(d):
+    """
+    Check for unexpanded D variable in pkg_* and FILES
+    variables, warn the user to use it correctly.
+    """
+
+    sane = True
+
+    # Get variables for current package
+    pkg = d.getVar('PN', True)
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('OVERRIDES', pkg)
+    bb.data.update_data(localdata)
+
+    # Go through all variables and check if unexpanded D is found, warn the user accordingly
+    for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
+        bbvar = localdata.getVar(var, False)
+        if bbvar:
+            if "${D}" in bbvar:
+                if var == 'FILES':
+                    bb.error("FILES should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference")
+                    sane = False
+                else:
+                    bb.error("%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pkg))
+                    sane = False
+    return sane
+
+# Actual task to check for ${D
+python do_qa_check_unexpanded_d(){
+    package_qa_check_unexpanded_d(d)
+}
+addtask qa_check_unexpanded_d before do_compile
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
@@ -1000,7 +1033,6 @@ python do_package_qa () {
         if not package_qa_check_deps(package, pkgdest, skip, d):
             deps_sane = False
 
-
     if 'libdir' in d.getVar("ALL_QA", True).split():
         package_qa_check_libdir(d)
 
-- 
1.9.1


