Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC06073285
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 13:32:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 03 Aug 2016 06:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,465,1464678000"; d="scan'208";a="1029002127"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2016 06:32:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 16:32:14 +0300
Message-Id: <1470231135-2058-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470231135-2058-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470231135-2058-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 1/2] license.bbclass: do not process LICENSE_pn variables
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
X-List-Received-Date: Wed, 03 Aug 2016 13:32:50 -0000

The loop iterating over LICENSE_pn variables has never worked. In
addition, the LICENSE variable is supposed to contain all licenses
defined in LICENSE_pn variables. Thus, it is simpler just to use LICENSE
as the data we get is essentially the same.

[YOCTO #9499]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/license.bbclass | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 26c297d..598c8af 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -386,20 +386,6 @@ def find_license_files(d):
     import shutil
     import oe.license
 
-    pn = d.getVar('PN', True)
-    for package in d.getVar('PACKAGES', True):
-        if d.getVar('LICENSE_' + package, True):
-            license_types = license_types + ' & ' + \
-                            d.getVar('LICENSE_' + package, True)
-
-    #If we get here with no license types, then that means we have a recipe 
-    #level license. If so, we grab only those.
-    try:
-        license_types
-    except NameError:        
-        # All the license types at the recipe level
-        license_types = d.getVar('LICENSE', True)
- 
     # All the license files for the package
     lic_files = d.getVar('LIC_FILES_CHKSUM', True)
     pn = d.getVar('PN', True)
@@ -497,7 +483,7 @@ def find_license_files(d):
 
     v = FindVisitor()
     try:
-        v.visit_string(license_types)
+        v.visit_string(d.getVar('LICENSE', True))
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     except SyntaxError:
-- 
2.6.6


