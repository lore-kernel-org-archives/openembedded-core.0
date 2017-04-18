Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D153D71B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 22:17:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 18 Apr 2017 15:17:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,219,1488873600"; d="scan'208";a="91069402"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.141])
	by fmsmga005.fm.intel.com with ESMTP; 18 Apr 2017 15:17:38 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 17:22:02 -0500
Message-Id: <1492554122-29692-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] package_rpm.bbclass: Dosen't filter Conflicts if found in Provides
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
X-List-Received-Date: Tue, 18 Apr 2017 22:17:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This filter was add to make compilence with debian packaging but in
package_deb.bbclass is allowed to have the same values in Conflicts and
Provides.

With this filtering errors in recipe meta-data are hidden and could end
on install two packages that conflicts [2].

Reviewing the RPM spec from Fedora doesn't have anything that denies to
use the both Conflicts and Provides with the same value [3], also in
debian manual section 7.6.2 of [4] this behaviour is allowed to force
the removal of the conflicted package and RPM is compilence with this
behaviour after remove the filtering this is seen [5].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4b611b66743a5ec220aef34d796af63029bb5fd9
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9349#c9
[3]
https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch-advanced-packaging.html
[4] https://www.debian.org/doc/debian-policy/ch-relationships.html
[5] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9349#c12

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 07ab5cd..084546f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -433,19 +433,6 @@ python write_specfile () {
         print_deps(splitrsuggests,  "Suggests", spec_preamble_bottom, d)
         print_deps(splitrprovides,  "Provides", spec_preamble_bottom, d)
         print_deps(splitrobsoletes, "Obsoletes", spec_preamble_bottom, d)
-
-        # conflicts can not be in a provide!  We will need to filter it.
-        if splitrconflicts:
-            depends_dict = bb.utils.explode_dep_versions2(splitrconflicts)
-            newdeps_dict = {}
-            for dep in depends_dict:
-                if dep not in splitrprovides:
-                    newdeps_dict[dep] = depends_dict[dep]
-            if newdeps_dict:
-                splitrconflicts = bb.utils.join_deps(newdeps_dict)
-            else:
-                splitrconflicts = ""
-
         print_deps(splitrconflicts,  "Conflicts", spec_preamble_bottom, d)
 
         spec_preamble_bottom.append('')
@@ -541,19 +528,6 @@ python write_specfile () {
     print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
     print_deps(srcrprovides + (" /bin/sh" if srcname.startswith("nativesdk-") else ""), "Provides", spec_preamble_top, d)
     print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
-    
-    # conflicts can not be in a provide!  We will need to filter it.
-    if srcrconflicts:
-        depends_dict = bb.utils.explode_dep_versions2(srcrconflicts)
-        newdeps_dict = {}
-        for dep in depends_dict:
-            if dep not in srcrprovides:
-                newdeps_dict[dep] = depends_dict[dep]
-        if newdeps_dict:
-            srcrconflicts = bb.utils.join_deps(newdeps_dict)
-        else:
-            srcrconflicts = ""
-
     print_deps(srcrconflicts, "Conflicts", spec_preamble_top, d)
 
     spec_preamble_top.append('')
-- 
2.1.4


