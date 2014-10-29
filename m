Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F142E70CFB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 18:33:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 11:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,278,1413270000"; d="scan'208";a="627816992"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 11:33:54 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:34:15 -0600
Message-Id: <1414607656-12144-4-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] license_class: Added LICENSE_PRIORITY support
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
X-List-Received-Date: Wed, 29 Oct 2014 18:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now you can specify LICENSE_PRIORITY for license manifest creation.

This means that if you have LICENSE expression with OR's only one
license is selected based on LICENSE_PRIORITY and INCOMPATIBLE_LICENSE.

[YOCTO #6757]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 47 ++++++++++++++++++++++++++++++++++++++------
 meta/conf/documentation.conf |  1 +
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c11ef1c..a055660 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -33,10 +33,45 @@ python license_create_manifest() {
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
     bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
 
+    priority_licenses = (d.getVar("LICENSE_PRIORITY", True) or "").split()
+    priority_licenses = map(lambda l: canonical_license(d, l), priority_licenses)
+    priority_licenses.reverse()
+
+    # Get license priority based on index,
+    # INCOMPATIBLE_LICENSE entries have negative weight.
+    # Licenses not listed have a weight of 0.
+    # LICENSE_PRIORITY entries have a positive weight.
+    def get_license_priority(license):
+        # If you want to exclude license named generically 'X', we
+        # surely want to exclude 'X+' as well.  In consequence, we
+        # will exclude a trailing '+' character from LICENSE in
+        # case INCOMPATIBLE_LICENSE is not a 'X+' license.
+        for bl in bad_licenses:
+            lic = license
+            if not re.search('\+$', bl):
+                lic = re.sub('\+', '', license)
+
+            if lic == bl:
+                return -1 * (bad_licenses.index(lic) + 1)
+
+        if license in priority_licenses:
+            return priority_licenses.index(license) + 1
+        else:
+            return 0
+
     # Handles an "or" or two license sets provided by
-    # flattened_licenses(), pick one that works if possible.
-    def choose_lic_set(a, b):
-        return a if all(license_ok(bad_licenses, lic) for lic in a) else b
+    # flattened_licenses(), pick one that works based on
+    # LICENSE_PRIORITY and INCOMPATIBLE_LICENSE.
+    def choose_lic_set(alpha, beta):
+        alpha_canonical = [canonical_license(d, l) for l in alpha]
+        beta_canonical = [canonical_license(d, l) for l in beta]
+        alpha_weight = sum(get_license_priority(a) for a in alpha_canonical)
+        beta_weight = sum(get_license_priority(b) for b in beta_canonical)
+
+        if alpha_weight >= beta_weight:
+            return alpha
+        else:
+            return beta
 
     build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
     if build_images_from_feeds == "1":
@@ -80,12 +115,12 @@ python license_create_manifest() {
             license_file.write("LICENSE:")
 
             try:
-                licenses = oe.license.flattened_licenses(pkg_dic[pkg]["LICENSE"]
-                            , choose_lic_set)
+                pkg_dic[pkg]["FLATTENED_LICENSE"] = oe.license.flattened_licenses(
+                            pkg_dic[pkg]["LICENSE"], choose_lic_set)
             except oe.license.LicenseError as exc:
                 bb.fatal('%s: %s' % (d.getVar('P', True), exc))
 
-            for lic in licenses:
+            for lic in pkg_dic[pkg]["FLATTENED_LICENSE"]:
                 lic = re.sub('\+', '', lic)
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                                         pkg_dic[pkg]["PN"], "generic_%s" % lic)
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 66ec093..d2b3057 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -220,6 +220,7 @@ IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the generated image."
 IMAGE_TYPES[doc] = "Specifies the complete list of supported image types by default."
 INC_PR[doc] = "Helps define the recipe revision for recipes that share a common include file."
 INCOMPATIBLE_LICENSE[doc] = "Specifies a space-separated list of license names (as they would appear in LICENSE) that should be excluded from the build."
+LICENSE_PRIORITY[doc] = "Space separated list of licenses in priority order, highest to lowest."
 INHIBIT_DEFAULT_DEPS[doc] = "Prevents the default dependencies, namely the C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] = "If set to "1", causes the build to not strip binaries in resulting packages."
 INHERIT[doc] = "Causes the named class to be inherited at this point during parsing. The variable is only valid in configuration files."
-- 
1.9.1


