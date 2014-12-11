Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 59789601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 22:42:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2014 14:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="497510248"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.147])
	by orsmga003.jf.intel.com with ESMTP; 11 Dec 2014 14:38:09 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Dec 2014 16:40:43 -0600
Message-Id: <4bedbe90e0589179b7c6010818a63596a9502671.1418337489.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418337489.git.alejandro.hernandez@linux.intel.com>
References: <cover.1418337489.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] insane.bbclass: Added QA test for expanded ${D}
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
X-List-Received-Date: Thu, 11 Dec 2014 22:42:11 -0000

Checks in FILES and pkg_* variables, solves common mistake of

using ${D} instead of $D and warns the user accordingly.

[YOCTO #6642]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/insane.bbclass | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b45374..8224124 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
-            version-going-backwards \
+            version-going-backwards expanded_d \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
@@ -906,6 +906,34 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 
     return sane
 
+QAPATHTEST[expanded_d] = "package_qa_check_expanded_d"
+def package_qa_check_expanded_d(path,name,d,elf,messages):
+    """
+    Check for the expanded D (${D}) value in pkg_* and FILES
+    variables, warn the user to use it correctly.
+    """
+
+    sane = True
+    expanded_d = d.getVar('D',True)
+
+    # Get packages for current recipe and iterate
+    packages = d.getVar('PACKAGES', True).split(" ")
+    for pak in packages:
+    # Go through all variables and check if expanded D is found, warn the user accordingly
+        for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
+            # Variables are actually var_${PN}
+            bbvar = d.getVar(var + "_" + pak)
+            if bbvar:
+                # Bitbake expands ${D} within bbvar during the previous step, so we check for its expanded value
+                if expanded_d in bbvar:
+                    if var == 'FILES':
+                        messages["expanded_d"] = "FILES should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference"
+                        sane = False
+                    else:
+                        messages["expanded_d"] = "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pak)
+                        sane = False
+    return sane
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
1.9.1


