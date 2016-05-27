Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC7365CBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 06:26:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 26 May 2016 23:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,372,1459839600"; d="scan'208";a="985728710"
Received: from klingler-mobl5.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.30.221])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 23:26:12 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2016 09:26:10 +0300
Message-Id: <1464330370-6856-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] license.bbclass: do not process LICENSE_pn variables
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
X-List-Received-Date: Fri, 27 May 2016 06:26:14 -0000

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
index 69335d6..eacf9e8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -376,20 +376,6 @@ def find_license_files(d):
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
@@ -487,7 +473,7 @@ def find_license_files(d):
 
     v = FindVisitor()
     try:
-        v.visit_string(license_types)
+        v.visit_string(d.getVar('LICENSE', True))
     except oe.license.InvalidLicense as exc:
         bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
     except SyntaxError:
-- 
2.6.6


