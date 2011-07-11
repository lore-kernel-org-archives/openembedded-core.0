Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QgPhs-0005Xv-Ga
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:16:05 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2011 16:12:06 -0700
Received: by wye20 with SMTP id 20so2993000wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:12:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.50.2 with SMTP id y2mr4496333web.77.1310425924912; Mon, 11
	Jul 2011 16:12:04 -0700 (PDT)
Received: by 10.216.155.16 with HTTP; Mon, 11 Jul 2011 16:12:04 -0700 (PDT)
Date: Mon, 11 Jul 2011 16:12:04 -0700
Message-ID: <CAPhnLPDJB0VrLZjLC5jmvxdwp7k1sOZMio1ADSm8Jgfk=WYKpA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] license.bbclass: License Manifests and more.
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
X-List-Received-Date: Mon, 11 Jul 2011 23:16:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Adding a bit more functionality here:

1. Adding some more SPDX Maps to take care of + licenses
2. Adding an event handler that waits for BuildComplete
   and creates a license manifest file.
3. Strip out -native and -cross package license wrangling.
   If it doesn't go on the image, we shouldn't wrangle it.
4. Split out the license destination directory to a IMAGE_NAME
   time stamped dir in /tmp/deploy/licenses/${IMAGE_NAME}/<stamp>

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |  179 ++++++++++++++++++++++++++++--------------
 1 files changed, 120 insertions(+), 59 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3f93bf5..d5f6220 100644
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
@@ -49,6 +52,47 @@ SPDXLICENSEMAP[openssl] = "Openssl"
 #Other variations
 SPDXLICENSEMAP[AFL2.1] = "AFL-2"
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
+SPDXLICENSEMAP[zlib] = "Zlib"
+SPDXLICENSEMAP[EPLv1.0] = "EPL-1"
+
+# We use an event handler to detect the BuildComplete event. From here, we
+# gather up all the licenses and add them to a license manifest.
+
+python run_lic_manifest(){
+    import bb.build
+    import bb.event
+    import bb.data
+    import stat, os
+
+    if isinstance(e, bb.event.BuildCompleted):
+        try:
+            file = open(bb.data.getVar('BNFILE', e.data, True))
+            bn = file.readline()
+            file.close()
+            manifestdir =
os.path.join(os.path.join(bb.data.getVar('LICENSE_DIRECTORY', e.data,
True),
+
bb.data.getVar('IMAGE_LICENSE_DIRECTORY', e.data, True)),
+                                       bn)
+
+            file =
open(os.path.join(bb.data.getVar('LICENSE_DIRECTORY', e.data, True),
+                                                     bn +
"_license_manifest"), 'w')
+            packages = os.listdir(manifestdir)
+            packages = [filename for filename in packages if
(filename[0] != '.')
+                                                              or
(filename[0] != 'common-licenses')
+                                                              or
(filename[0] != bn + "_license_manifest")]
+            for package in packages:
+                if stat.S_ISDIR(os.lstat(os.path.join(manifestdir,
package)).st_mode):
+                   file.write("Package Name: " + package + "\n")
+                   file.write("----------------------------\n")
+                   for license in
os.listdir(os.path.join(os.path.join(manifestdir, package))):
+                       if
stat.S_ISLNK(os.lstat(os.path.join(os.path.join(manifestdir,
+
    package),
+
license)).st_mode):
+                           file.write(license.replace("generic_", "") + "\n")
+                   file.write("\n")
+            file.close()
+        except:
+            bb.note("The license manifest creation failed.")
+}

 python do_populate_lic() {
     """
@@ -64,13 +108,11 @@ python do_populate_lic() {
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
@@ -86,14 +128,14 @@ python do_populate_lic() {
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
@@ -111,72 +153,91 @@ python do_populate_lic() {
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
+addhandler run_lic_manifest
-- 
1.7.1


