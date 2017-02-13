Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 260306010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:58 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546697"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:50 +0200
Message-Id: <2d2fa7f15ed2fb2e478d7eea3331c7b949936dbd.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/36] package_rpm.bbclass: correctly map RRECOMMENDS and RSUGGESTS to rpm tags
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:58 -0000

Previously they were swapped, not sure why. Their meaning, as far as rpm
world goes, is different:

- Recommends is a soft dependency and will be installed by default; there is
an option not to do that.

- Suggests is a suggestion to be picked up and presented to end user by
package management tools; it has no special meaning otherwise.

OE packages use RRECOMMENDS, which should be mapped to Recommends rpm tag,
so that the packages will be picked up as dependencies.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 36625fe02cc..95a8b147c4e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -452,10 +452,8 @@ python write_specfile () {
         if splitrpostrm:
             print_deps(splitrdepends, "Requires(postun)", spec_preamble_bottom, d)
 
-        # Suggests in RPM are like recommends in OE-core!
-        print_deps(splitrrecommends, "Suggests", spec_preamble_bottom, d)
-        # While there is no analog for suggests... (So call them recommends for now)
-        print_deps(splitrsuggests,  "Recommends", spec_preamble_bottom, d)
+        print_deps(splitrrecommends, "Recommends", spec_preamble_bottom, d)
+        print_deps(splitrsuggests,  "Suggests", spec_preamble_bottom, d)
         print_deps(splitrprovides,  "Provides", spec_preamble_bottom, d)
         print_deps(splitrobsoletes, "Obsoletes", spec_preamble_bottom, d)
 
@@ -562,10 +560,8 @@ python write_specfile () {
     if srcrpostrm:
         print_deps(srcrdepends, "Requires(postun)", spec_preamble_top, d)
 
-    # Suggests in RPM are like recommends in OE-core!
-    print_deps(srcrrecommends, "Suggests", spec_preamble_top, d)
-    # While there is no analog for suggests... (So call them recommends for now)
-    print_deps(srcrsuggests, "Recommends", spec_preamble_top, d)
+    print_deps(srcrrecommends, "Recommends", spec_preamble_top, d)
+    print_deps(srcrsuggests, "Suggests", spec_preamble_top, d)
     print_deps(srcrprovides, "Provides", spec_preamble_top, d)
     print_deps(srcrobsoletes, "Obsoletes", spec_preamble_top, d)
     
-- 
2.11.0


