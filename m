Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1S13a3-0003WW-51
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 23:25:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 14:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111668404"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2012 14:16:10 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 14:17:38 -0800
Message-Id: <ccf71508a19ca420d7694335c1890140d9d7fa79.1330121220.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <7fb99be3893199165558e9d7bb1638c2d572cff2.1330121220.git.elizabeth.flanagan@intel.com>
References: <7fb99be3893199165558e9d7bb1638c2d572cff2.1330121220.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1330121220.git.elizabeth.flanagan@intel.com>
References: <cover.1330121220.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/3] license.bbclass: Gather Pkg level licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 22:25:35 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

We should look for LICENSE at a package level first. If it's
not found, we should use the recipe level LICENSE. This adds a
bit more granularity to license manifests where needed.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 10a937b..11908d9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -140,8 +140,20 @@ python do_populate_lic() {
     import shutil
     import oe.license
 
-    # All the license types for the package
-    license_types = d.getVar('LICENSE', True)
+    pn = d.getVar('PN', True)
+    for package in d.getVar('PACKAGES', True):
+        if d.getVar('LICENSE_' + pn + '-' + package, True):
+            license_types = license_types + ' & ' + \
+                            d.getVar('LICENSE_' + pn + '-' + package, True)
+
+    #If we get here with no license types, then that means we have a recipe 
+    #level license. If so, we grab only those.
+    try:
+        license_types
+    except NameError:        
+        # All the license types at the recipe level
+        license_types = d.getVar('LICENSE', True)
+ 
     # All the license files for the package
     lic_files = d.getVar('LIC_FILES_CHKSUM', True)
     pn = d.getVar('PN', True)
-- 
1.7.1



