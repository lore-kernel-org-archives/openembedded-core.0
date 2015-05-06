Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2A90B73EF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:52:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 07:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,379,1427785200"; d="scan'208";a="724675000"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2015 07:52:16 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 14:52:18 +0000
Message-Id: <63643169aebdc13a1e644c009a85ff8dc242a2dc.1430923708.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1430923708.git.anibal.limon@linux.intel.com>
References: <cover.1430923708.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1430923708.git.anibal.limon@linux.intel.com>
References: <cover.1430923708.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] license: Add support for handle INCOMPATIBLE_LICENSE in manifest creation
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
X-List-Received-Date: Wed, 06 May 2015 14:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When INCOMPATIBLE_LICENSE's is specified it need to be removed from
license.manifest and also avoid copy to target image.

Add ManifestVisitor that walk the license string searching for
INCOMPATIBLE_LICENSE's if found remove it.

[YOCTO #6765]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 29 ++++++++++++++++--
 meta/lib/oe/license.py       | 70 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 780b9d5..54ab123 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -29,6 +29,10 @@ python license_create_manifest() {
     import re
     import oe.packagedata
 
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
+    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
     build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
     if build_images_from_feeds == "1":
         return 0
@@ -52,6 +56,18 @@ python license_create_manifest() {
                         d.getVar('IMAGE_NAME', True), 'license.manifest')
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
+            if bad_licenses:
+                try:
+                    (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) = \
+                        oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
+                        bad_licenses, canonical_license, d)
+                except oe.license.LicenseError as exc:
+                    bb.fatal('%s: %s' % (d.getVar('P', True), exc))
+            else:
+                pkg_dic[pkg]["LICENSES"] = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
+                pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
+                pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
+
             license_file.write("PACKAGE NAME: %s\n" % pkg)
             license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
             license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
@@ -63,9 +79,7 @@ python license_create_manifest() {
             if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
                 continue
 
-            licenses = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
-            licenses = re.sub('  *', ' ', licenses)
-            for lic in licenses.split():
+            for lic in pkg_dic[pkg]["LICENSES"]:
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                                         pkg_dic[pkg]["PN"], "generic_%s" % 
                                         re.sub('\+', '', lic))
@@ -101,11 +115,20 @@ python license_create_manifest() {
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
                     if re.match("^generic_.*$", lic):
+                        generic_lic = re.search("^generic_(.*)$", lic).group(1)
+                        if oe.license.license_ok(canonical_license(d,
+                            generic_lic), bad_licenses) == False:
+                            continue
+
                         if not os.path.exists(rootfs_license):
                             os.link(pkg_license, rootfs_license)
 
                         os.symlink(os.path.join('..', lic), pkg_rootfs_license)
                     else:
+                        if oe.license.license_ok(canonical_license(d,
+                            lic), bad_licenses) == False:
+                            continue
+
                         os.link(pkg_license, pkg_rootfs_license)
 }
 
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index bc146a28..c2e523c 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -129,3 +129,73 @@ def is_included(licensestr, whitelist=None, blacklist=None):
         return False, excluded
     else:
         return True, included
+
+class ManifestVisitor(LicenseVisitor):
+    """Walk license tree (parsed from a string) removing the incompatible
+    licenses specified"""
+    def __init__(self, dont_want_licenses, canonical_license, d):
+        self._dont_want_licenses = dont_want_licenses
+        self._canonical_license = canonical_license
+        self._d = d
+        self._operators = []
+
+        self.licenses = []
+        self.licensestr = ''
+
+        LicenseVisitor.__init__(self)
+
+    def visit(self, node):
+        if isinstance(node, ast.Str):
+            lic = node.s
+
+            if license_ok(self._canonical_license(self._d, lic),
+                    self._dont_want_licenses) == True:
+                if self._operators:
+                    ops = []
+                    for op in self._operators:
+                        if op == '[':
+                            ops.append(op)
+                        elif op == ']':
+                            ops.append(op)
+                        else:
+                            if not ops:
+                                ops.append(op)
+                            elif ops[-1] in ['[', ']']:
+                                ops.append(op)
+                            else:
+                                ops[-1] = op 
+
+                    if ops[0] != ']':
+                        self.licensestr += ' '
+                    self.licensestr += ' '.join(ops)
+                    if len(ops) == 1:
+                        self.licensestr += ' '
+
+                self.licensestr += lic
+                self.licenses.append(lic)
+                self._operators = []
+        elif isinstance(node, ast.BitAnd):
+            self._operators.append("&")
+        elif isinstance(node, ast.BitOr):
+            self._operators.append("|")
+        elif isinstance(node, ast.List):
+            self._operators.append("[")
+        elif isinstance(node, ast.Load):
+            self.licensestr += ']'
+
+        self.generic_visit(node)
+
+def manifest_licenses(licensestr, dont_want_licenses, canonical_license, d):
+    """Given a license string and dont_want_licenses list,
+       return license string filtered and a list of licenses"""
+    manifest = ManifestVisitor(dont_want_licenses, canonical_license, d)
+
+    # Replace '()' to '[]' for handle in ast as List and Load types.
+    licensestr = licensestr.replace('(', '[').replace(')', ']')
+    try:
+        manifest.visit_string(licensestr)
+    except SyntaxError as exc:
+        raise LicenseSyntaxError(licensestr, exc)
+    manifest.licensestr = manifest.licensestr.replace('[', '(').replace(']', ')')
+
+    return (manifest.licensestr, manifest.licenses)
-- 
1.8.4.5


