Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0543872F42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875739"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:47 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:36 +0200
Message-Id: <f121141138f51c9307fea97196b9ceae83b4ab6e.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 19/39] package_rpm.bbclass: correctly map RRECOMMENDS and RSUGGESTS to rpm tags
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:55 -0000

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
index 07eb974f736..480c6d58d39 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -450,10 +450,8 @@ python write_specfile () {
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
 
@@ -560,10 +558,8 @@ python write_specfile () {
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


