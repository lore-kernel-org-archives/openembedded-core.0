Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 736B26E268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:38:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9cBB8014796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 02:38:11 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 02:38:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Thu, 23 Apr 2015 17:38:15 +0800
Message-ID: <92ce281f37748218692be482b3393e81b4b817ec.1429781137.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429781137.git.jackie.huang@windriver.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] license.bbclass: allow copying license not in common licenses
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
X-List-Received-Date: Thu, 23 Apr 2015 09:38:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Some package like linux-firmware has many licenses that aren't in any
way common, and new ones will be added from time to time, in order to
avoid adding bunch of such common license files that are only applicable
to a specific package, NO_GENERIC_LIC is added to allow copying license
not in common licenses, it should be used in the recipe as:

NO_GENERIC_LIC[<license_name>] = "<license file in fetched source>"

e.g.
NO_GENERIC_LIC[Firmware-Abilis] = "LICENCE.Abilis.txt"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/license.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 73a0e97..990f704 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -222,7 +222,9 @@ def find_license_files(d):
             pass
         spdx_generic = None
         license_source = None
-        # If the generic does not exist we need to check to see if there is an SPDX mapping to it
+        # If the generic does not exist we need to check to see if there is an SPDX mapping to it,
+        # unless NO_GENERIC_LIC is set.
+
         for lic_dir in license_source_dirs:
             if not os.path.isfile(os.path.join(lic_dir, license_type)):
                 if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
@@ -241,6 +243,14 @@ def find_license_files(d):
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
 
             lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic)))
+
+        elif d.getVarFlag('NO_GENERIC_LIC', license_type):
+            # if NO_GENERIC_LIC is set, we copy the license files from the fetched source
+            # of the package rather than the license_source_dirs.
+            for (basename, path) in lic_files_paths:
+                if d.getVarFlag('NO_GENERIC_LIC', license_type) == basename:
+                    lic_files_paths.append(("generic_" + license_type, path))
+                    break
         else:
             # And here is where we warn people that their licenses are lousy
             bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
-- 
1.9.1


