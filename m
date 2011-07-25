Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QlUaA-0006kQ-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 01:29:07 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2011 16:24:53 -0700
Received: by ywo7 with SMTP id 7so3696097ywo.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:24:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.184.228 with SMTP id s64mr6309245yhm.510.1311636292519;
	Mon, 25 Jul 2011 16:24:52 -0700 (PDT)
Received: by 10.236.108.9 with HTTP; Mon, 25 Jul 2011 16:24:52 -0700 (PDT)
Date: Mon, 25 Jul 2011 16:24:52 -0700
Message-ID: <CAPhnLPBkbaj6MzfnLKfkwKpDO4UwejH+cWa2V=4CCpv55CReaw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] license.bbclass: Splitting out licenses
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
X-List-Received-Date: Mon, 25 Jul 2011 23:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Adding a bit more functionality here:
1. Adding some more SPDX Maps to take care of + licenses
2. Strip out -native and -cross package license wrangling.
   If it doesn't go on the image, we shouldn't wrangle it.
3. Split out the license destination directory to a
   IMAGE_NAME time stamped dir in
   /tmp/deploy/licenses/${IMAGE_NAME}/<stamp>

I've removed the handler from my previous Pull as license
manifest needs more discussion and I don't want these
bug fixes to be held up by an added feature.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |  140 ++++++++++++++++++++++++------------------
 1 files changed, 81 insertions(+), 59 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3f93bf5..7e440e5 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -3,15 +3,16 @@
 # TODO:
 # - We should also enable the ability to put the generated license
directory onto the
 #  rootfs
-# - Gather up more generic licenses
 # - There is a real issue revolving around license naming standards.
See license names
 #  licenses.conf and compare them to the license names in the
recipes. You'll see some
 #  differences and that should be corrected.

-LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses"
+LICENSE_DIRECTORY ??= "${DEPLOY_DIR}/licenses/"
+IMAGE_LICENSE_DIRECTORY ?= ""
 LICSSTATEDIR = "${WORKDIR}/license-destdir/"

 addtask populate_lic after do_patch before do_package
+
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"

@@ -27,6 +28,8 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 SPDXLICENSEMAP[GPL] = "GPL-1"
 SPDXLICENSEMAP[GPLv2] = "GPL-2"
 SPDXLICENSEMAP[GPLv3] = "GPL-3"
+SPDXLICENSEMAP[GPLv2+] = "GPL-2+"
+SPDXLICENSEMAP[GPLv3+] = "GPL-3+"

 #LGPL variations
 SPDXLICENSEMAP[LGPL] = "LGPL-2"
@@ -49,6 +52,9 @@ SPDXLICENSEMAP[openssl] = "Openssl"
 #Other variations
 SPDXLICENSEMAP[AFL2.1] = "AFL-2"
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
+SPDXLICENSEMAP[zlib] = "Zlib"
+SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
+

 python do_populate_lic() {
     """
@@ -64,13 +70,11 @@ python do_populate_lic() {
             ast.NodeVisitor.generic_visit(self, node)

         def visit_Str(self, node):
-            #
             # Until I figure out what to do with
-            # the two modifiers I support (or greater = +
-            # and "with exceptions" being *
+            # "with exceptions" (*)
             # we'll just strip out the modifier and put
             # the base license.
-            find_license(node.s.replace("+", "").replace("*", ""))
+            find_license(node.s.replace("*", ""))
             ast.NodeVisitor.generic_visit(self, node)

         def visit_BinOp(self, node):
@@ -86,14 +90,14 @@ python do_populate_lic() {
         try:
             bb.copyfile(os.path.join(source, file_name),
os.path.join(destination, file_name))
         except:
-            bb.warn("%s: No generic license file exists for: %s at
%s" % (pn, file_name, source))
+            bb.note("%s: No generic license file exists for: %s at
%s" % (pn, file_name, source))
             pass

     def link_license(source, destination, file_name):
         try:
             os.symlink(os.path.join(source, file_name),
os.path.join(destination, "generic_" + file_name))
         except:
-            bb.warn("%s: Could not symlink: %s at %s to %s at %s" %
(pn, file_name, source, file_name, destination))
+            bb.note("%s: Could not symlink: %s at %s to %s at %s" %
(pn, file_name, source, file_name, destination))
             pass

     def find_license(license_type):
@@ -111,72 +115,90 @@ python do_populate_lic() {
                 copy_license(generic_directory, gen_lic_dest,
spdx_generic)
                 link_license(gen_lic_dest, destdir, spdx_generic)
             else:
-                # And here is where we warn people that their
licenses are lousy
-                bb.warn("%s: No generic license file exists for: %s
at %s" % (pn, license_type, generic_directory))
-                bb.warn("%s: There is also no SPDXLICENSEMAP for this
license type: %s at %s" % (pn, license_type, generic_directory))
+                # And here is where we tell people that their
licenses are lousy
+                bb.note("%s: No generic license file exists for: %s
at %s" % (pn, license_type, generic_directory))
+                bb.note("%s: There is also no SPDXLICENSEMAP for this
license type: %s at %s" % (pn, license_type, generic_directory))
                 pass
         elif os.path.isfile(os.path.join(generic_directory, license_type)):
             copy_license(generic_directory, gen_lic_dest, license_type)
             link_license(gen_lic_dest, destdir, license_type)

-    # All the license types for the package
-    license_types = bb.data.getVar('LICENSE', d, True)
-    # All the license files for the package
-    lic_files = bb.data.getVar('LIC_FILES_CHKSUM', d, True)
-    pn = bb.data.getVar('PN', d, True)
-    # The base directory we wrangle licenses to
-    destdir = os.path.join(bb.data.getVar('LICSSTATEDIR', d, True), pn)
-    # The license files are located in S/LIC_FILE_CHECKSUM.
-    srcdir = bb.data.getVar('S', d, True)
-    # Directory we store the generic licenses as set in the distro
configuration
-    generic_directory = bb.data.getVar('COMMON_LICENSE_DIR', d, True)
-
     try:
-        bb.mkdirhier(destdir)
+        bb.mkdirhier(bb.data.getVar('LICENSE_DIRECTORY', d, True))
+    except:
+        pass
+    file = open(bb.data.getVar('BNFILE', d, True))
+    bn = file.readline()
+    file.close()
+    bb.data.setVar('IMAGE_LICENSE_DIRECTORY',
os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d, True), bn), d)
+    try:
+        bb.mkdirhier(bb.data.getVar('IMAGE_LICENSE_DIRECTORY', d, True))
     except:
         pass

-    if not generic_directory:
-        raise bb.build.FuncFailed("COMMON_LICENSE_DIR is unset.
Please set this in your distro config")
-
-    if not lic_files:
-        # No recipe should have an invalid license file. This is checked else
-        # where, but let's be pedantic
-        bb.note(pn + ": Recipe file does not have license file information.")
-        return True
-
-    for url in lic_files.split():
-        (type, host, path, user, pswd, parm) = bb.decodeurl(url)
-        # We want the license file to be copied into the destination
-        srclicfile = os.path.join(srcdir, path)
-        ret = bb.copyfile(srclicfile, os.path.join(destdir,
os.path.basename(path)))
-        # If the copy didn't occur, something horrible went wrong and
we fail out
-        if ret is False or ret == 0:
-            bb.warn("%s could not be copied for some reason. It may
not exist. WARN for now." % srclicfile)
-
-    gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY',
d, True), "common-licenses")
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
+    # Let's stop polluting the wrangled licenses with packages that
don't go on the image
+    if not ("-native" in bb.data.getVar('PN', d, True) ) and  not
("-cross" in bb.data.getVar('PN', d, True)):
+        # All the license types for the package
+        license_types = bb.data.getVar('LICENSE', d, True)
+        # All the license files for the package
+        lic_files = bb.data.getVar('LIC_FILES_CHKSUM', d, True)
+        pn = bb.data.getVar('PN', d, True)
+        # The base directory we wrangle licenses to
+        destdir = os.path.join(bb.data.getVar('LICSSTATEDIR', d, True), pn)
+        # The license files are located in S/LIC_FILE_CHECKSUM.
+        srcdir = bb.data.getVar('S', d, True)
+        # Directory we store the generic licenses as set in the
distro configuration
+        generic_directory = bb.data.getVar('COMMON_LICENSE_DIR', d, True)
+
+        try:
+           bb.mkdirhier(destdir)
+        except:
+            pass
+
+        if not generic_directory:
+            raise bb.build.FuncFailed("COMMON_LICENSE_DIR is unset.
Please set this in your distro config")
+
+        if not lic_files:
+            # No recipe should have an invalid license file. This is
checked else
+            # where, but let's be pedantic
+            bb.note(pn + ": Recipe file does not have license file
information.")
+            return True
+
+        for url in lic_files.split():
+            (type, host, path, user, pswd, parm) = bb.decodeurl(url)
+            # We want the license file to be copied into the destination
+            srclicfile = os.path.join(srcdir, path)
+            ret = bb.copyfile(srclicfile, os.path.join(destdir,
os.path.basename(path)))
+            # If the copy didn't occur, something horrible went wrong
and we fail out
+            if ret is False or ret == 0:
+                bb.warn("%s could not be copied for some reason. It
may not exist. WARN for now." % srclicfile)
+
+        gen_lic_dest =
os.path.join(bb.data.getVar('IMAGE_LICENSE_DIRECTORY', d, True),
"common-licenses")
+
+        clean_licenses = ""
+
+        for x in license_types.replace("(", " ( ").replace(")", " ) ").split():
+            if ((x != "(") and (x != ")") and (x != "&") and (x != "|")):
+                clean_licenses += "'" + x + "'"
+            else:
+                clean_licenses += " " + x + " "
+
+        # lstrip any possible indents, since ast needs python syntax.
+        node = ast.parse(clean_licenses.lstrip())
+        v = LicenseVisitor()
+        v.visit(node)
+    else:
+        shutil.rmtree(os.path.join(bb.data.getVar('LICSSTATEDIR', d,
True), bb.data.getVar('PN', d, True)))
 }

 SSTATETASKS += "do_populate_lic"
+
 do_populate_lic[sstate-name] = "populate-lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
-do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
+do_populate_lic[sstate-outputdirs] = "${IMAGE_LICENSE_DIRECTORY}/"

 python do_populate_lic_setscene () {
-	sstate_setscene(d)
+    sstate_setscene(d)
 }
-addtask do_populate_lic_setscene

+addtask do_populate_lic_setscene
-- 
1.7.1


