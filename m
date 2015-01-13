Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD64872207
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 23:00:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 13 Jan 2015 14:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="511822614"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.144])
	by orsmga003.jf.intel.com with ESMTP; 13 Jan 2015 14:54:17 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 17:00:40 -0600
Message-Id: <bb45f07b598c084979e9f817bc295845b9cdc80d.1421189870.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421189870.git.alejandro.hernandez@linux.intel.com>
References: <cover.1421189870.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/1] insane.bbclass: Added QA test for expanded ${D}
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
X-List-Received-Date: Tue, 13 Jan 2015 23:00:35 -0000

Checks in FILES and pkg_* variables, solves common mistake of

using ${D} instead of $D and warns the user accordingly.

[YOCTO #6642]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/insane.bbclass | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b45374..af141e8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
-            version-going-backwards \
+            version-going-backwards expanded-d \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
@@ -906,6 +906,33 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 
     return sane
 
+QAPATHTEST[expanded-d] = "package_qa_check_expanded_d"
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
+            bbvar = d.getVar(var + "_" + pak)
+            if bbvar:
+                # Bitbake expands ${D} within bbvar during the previous step, so we check for its expanded value
+                if expanded_d in bbvar:
+                    if var == 'FILES':
+                        messages["expanded-d"] = "FILES in %s recipe should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference" % pak
+                        sane = False
+                    else:
+                        messages["expanded-d"] = "%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pak)
+                        sane = False
+    return sane
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
1.9.1


