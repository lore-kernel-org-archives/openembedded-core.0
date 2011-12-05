Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXg0a-0008Qe-1l
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 22:23:39 +0100
Received: by ywb20 with SMTP id 20so4737681ywb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H0Xtj9/2HW9+51zoU6QlTz51ME869FOQv/VQWouIjRQ=;
	b=AZ/kYyWIzZl0Rz0DioSX5jhi4WUgsJX2CBR8sRGRFMsDnFvQwVbD3EQX1NyMnGKfLT
	fBpbOvHbP2gJjrjtj3rNgA4O+VKjHtoM5HepxQK1QsZU5qcvfrX/qyOYTLgNC5Sa7Aj4
	84wXB2TDZqxebccmcB4RPxj4Sqn8caxd31rmM=
Received: by 10.236.190.197 with SMTP id e45mr14981557yhn.101.1323119804541;
	Mon, 05 Dec 2011 13:16:44 -0800 (PST)
Received: from auron.mgc.mentorg.com (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id i22sm33253970yhm.10.2011.12.05.13.16.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 13:16:44 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 14:16:27 -0700
Message-Id: <1323119789-23067-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
References: <1323119789-23067-1-git-send-email-kergoth@gmail.com>
Subject: [PATCH 2/4] license: split license parsing into oe.license
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
X-List-Received-Date: Mon, 05 Dec 2011 21:23:39 -0000

In addition to moving this functionality to oe.license, makes the string
preparation more picky before passing it off to the ast compilation. This
ensures that LICENSE entries like 'GPL/BSD' are seen as invalid (due to the
presence of the unsupported '/').

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/license.bbclass      |   59 ++++++++++++------------------------
 meta/lib/oe/license.py            |   32 ++++++++++++++++++++
 meta/lib/oe/tests/test_license.py |   38 +++++++++++++++++++++++
 3 files changed, 90 insertions(+), 39 deletions(-)
 create mode 100644 meta/lib/oe/license.py
 create mode 100644 meta/lib/oe/tests/test_license.py

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4d036b1..8c6e2d2 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -1,17 +1,17 @@
 # Populates LICENSE_DIRECTORY as set in distro config with the license files as set by
-# LIC_FILES_CHKSUM. 
+# LIC_FILES_CHKSUM.
 # TODO:
 # - We should also enable the ability to put the generated license directory onto the
 #  rootfs
 # - Gather up more generic licenses
-# - There is a real issue revolving around license naming standards. See license names 
+# - There is a real issue revolving around license naming standards. See license names
 #  licenses.conf and compare them to the license names in the recipes. You'll see some
 #  differences and that should be corrected.
 
 LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"
 
-addtask populate_lic after do_patch before do_package 
+addtask populate_lic after do_patch before do_package
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
@@ -20,7 +20,7 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 # break the non-standardized license names that we find in LICENSE, we'll set
 # up a bunch of VarFlags to accomodate non-SPDX license names.
 #
-# We should really discuss standardizing this field, but that's a longer term goal. 
+# We should really discuss standardizing this field, but that's a longer term goal.
 # For now, we can do this and it should grab the most common LICENSE naming variations.
 
 #GPL variations
@@ -57,37 +57,25 @@ python do_populate_lic() {
     import os
     import bb
     import shutil
-    import ast
-
-    class LicenseVisitor(ast.NodeVisitor):
-        def generic_visit(self, node):
-            ast.NodeVisitor.generic_visit(self, node)
+    import oe.license
 
+    class FindVisitor(oe.license.LicenseVisitor):
         def visit_Str(self, node):
             #
             # Until I figure out what to do with
             # the two modifiers I support (or greater = +
             # and "with exceptions" being *
-            # we'll just strip out the modifier and put 
+            # we'll just strip out the modifier and put
             # the base license.
             find_license(node.s.replace("+", "").replace("*", ""))
-            ast.NodeVisitor.generic_visit(self, node)
-
-        def visit_BinOp(self, node):
-            op = node.op
-            if isinstance(op, ast.BitOr): 
-                x = LicenseVisitor()
-                x.visit(node.left)
-                x.visit(node.right)
-            else:               
-                ast.NodeVisitor.generic_visit(self, node)
+            self.generic_visit(node)
 
     def copy_license(source, destination, file_name):
         try:
             bb.copyfile(os.path.join(source, file_name), os.path.join(destination, file_name))
         except:
             bb.warn("%s: No generic license file exists for: %s at %s" % (pn, file_name, source))
-            pass 
+            pass
 
     def link_license(source, destination, file_name):
         try:
@@ -108,8 +96,8 @@ python do_populate_lic() {
                 # Great, there is an SPDXLICENSEMAP. We can copy!
                 bb.note("We need to use a SPDXLICENSEMAP for %s" % (license_type))
                 spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
-                copy_license(generic_directory, gen_lic_dest, spdx_generic)            
-                link_license(gen_lic_dest, destdir, spdx_generic)            
+                copy_license(generic_directory, gen_lic_dest, spdx_generic)
+                link_license(gen_lic_dest, destdir, spdx_generic)
             else:
                 # And here is where we warn people that their licenses are lousy
                 bb.warn("%s: No generic license file exists for: %s at %s" % (pn, license_type, generic_directory))
@@ -117,7 +105,7 @@ python do_populate_lic() {
                 pass
         elif os.path.isfile(os.path.join(generic_directory, license_type)):
             copy_license(generic_directory, gen_lic_dest, license_type)
-            link_license(gen_lic_dest, destdir, license_type)            
+            link_license(gen_lic_dest, destdir, license_type)
 
     # All the license types for the package
     license_types = d.getVar('LICENSE', True)
@@ -130,7 +118,7 @@ python do_populate_lic() {
     srcdir = d.getVar('S', True)
     # Directory we store the generic licenses as set in the distro configuration
     generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
-    
+
     try:
         bb.mkdirhier(destdir)
     except:
@@ -153,21 +141,14 @@ python do_populate_lic() {
         # If the copy didn't occur, something horrible went wrong and we fail out
         if ret is False or ret == 0:
             bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % srclicfile)
- 
+
     gen_lic_dest = os.path.join(d.getVar('LICENSE_DIRECTORY', True), "common-licenses")
-    
-    clean_licenses = ""
-
-    for x in license_types.replace("(", " ( ").replace(")", " ) ").split():
-        if ((x != "(") and (x != ")") and (x != "&") and (x != "|")):
-            clean_licenses += "'" + x + "'"
-        else:
-            clean_licenses += " " + x + " "
-
-    # lstrip any possible indents, since ast needs python syntax.
-    node = ast.parse(clean_licenses.lstrip())
-    v = LicenseVisitor()
-    v.visit(node)
+
+    v = FindVisitor()
+    try:
+        v.visit_string(license_types)
+    except oe.license.InvalidLicense as exc:
+        bb.fatal("%s: %s" % (d.getVar('PF', True), exc))
 }
 
 SSTATETASKS += "do_populate_lic"
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
new file mode 100644
index 0000000..b230d3e
--- /dev/null
+++ b/meta/lib/oe/license.py
@@ -0,0 +1,32 @@
+# vi:sts=4:sw=4:et
+"""Code for parsing OpenEmbedded license strings"""
+
+import ast
+import re
+
+class InvalidLicense(StandardError):
+    def __init__(self, license):
+        self.license = license
+        StandardError.__init__(self)
+
+    def __str__(self):
+        return "invalid license '%s'" % self.license
+
+license_operator = re.compile('([&|() ])')
+license_pattern = re.compile('[a-zA-Z0-9.+_\-]+$')
+
+class LicenseVisitor(ast.NodeVisitor):
+    """Syntax tree visitor which can accept OpenEmbedded license strings"""
+    def visit_string(self, licensestr):
+        new_elements = []
+        elements = filter(lambda x: x.strip(), license_operator.split(licensestr))
+        for pos, element in enumerate(elements):
+            if license_pattern.match(element):
+                if pos > 0 and license_pattern.match(elements[pos-1]):
+                    new_elements.append('&')
+                element = '"' + element + '"'
+            elif not license_operator.match(element):
+                raise InvalidLicense(element)
+            new_elements.append(element)
+
+        self.visit(ast.parse(' '.join(new_elements)))
diff --git a/meta/lib/oe/tests/test_license.py b/meta/lib/oe/tests/test_license.py
new file mode 100644
index 0000000..cb949fc
--- /dev/null
+++ b/meta/lib/oe/tests/test_license.py
@@ -0,0 +1,38 @@
+import unittest
+import oe.license
+
+class SeenVisitor(oe.license.LicenseVisitor):
+    def __init__(self):
+        self.seen = []
+        oe.license.LicenseVisitor.__init__(self)
+
+    def visit_Str(self, node):
+        self.seen.append(node.s)
+
+class TestSingleLicense(unittest.TestCase):
+    licenses = [
+        "GPLv2",
+        "LGPL-2.0",
+        "Artistic",
+        "MIT",
+        "GPLv3+",
+        "FOO_BAR",
+    ]
+    invalid_licenses = ["GPL/BSD"]
+
+    @staticmethod
+    def parse(licensestr):
+        visitor = SeenVisitor()
+        visitor.visit_string(licensestr)
+        return visitor.seen
+
+    def test_single_licenses(self):
+        for license in self.licenses:
+            licenses = self.parse(license)
+            self.assertListEqual(licenses, [license])
+
+    def test_invalid_licenses(self):
+        for license in self.invalid_licenses:
+            with self.assertRaises(oe.license.InvalidLicense) as cm:
+                self.parse(license)
+            self.assertEqual(cm.exception.license, license)
-- 
1.7.8



