Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvoDk-0006TT-8s
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 13:05:26 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so1429170pad.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 03:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=m85chG4h30QNKbH/EBui4QpusNJBuWgpx2cVq/C+Ouk=;
	b=S6L0KE6IIbiFaobVRfd5cZkzU8Pujs2ch49kZpmJmP3gJAIak3FqNUSM4eeotZ2Omj
	CL03l263Kr1uIH+1T/z8/2LQ5gNeiuOmhKW6C6a+szwn+lMmpEgzmJHTswqjDpw1tAPq
	JA9EaQEV80Oh5xjKTv2Znz7SR3ZXAT+mIv4UrEI/WgKUTkqcFr91ViIHZcVSxv7t5etf
	dknGHVurrh18EC5acwRihszwAOJzFxn3Pv6LryHTxoCvWBTqDRhC1/7hPTX1uYiWL2nr
	80JZ3ccSlb6VCKJ9E12dGM7dwPbF3PLVJ/8r5eD++VShlfi08Bo2w6ROgyVd8tWFf3qW
	VmUg==
X-Received: by 10.66.82.35 with SMTP id f3mr12822893pay.49.1358423400665;
	Thu, 17 Jan 2013 03:50:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id na7sm950011pbc.48.2013.01.17.03.49.58
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:49:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 12:49:43 +0100
Message-Id: <286aaed6cc74027d215f59124f0c3577d2200e2f.1358423316.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1358423316.git.Martin.Jansa@gmail.com>
References: <cover.1358423316.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1358423316.git.Martin.Jansa@gmail.com>
References: <cover.1358423316.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] license.bbclass: extract functionality to find license files to separate function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 12:05:29 -0000

* move it from do_populate_lic to find_license_files so we can reuse it
  to populate license in package itself

[YOCTO #3743]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 44 ++++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 68f45f5..63d081f 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -88,6 +88,25 @@ python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
     """
+    lic_files_paths = find_license_files(d)
+
+    # The base directory we wrangle licenses to
+    destdir = os.path.join(d.getVar('LICSSTATEDIR', True), d.getVar('PN', True))
+    copy_license_files(lic_files_paths, destdir)
+}
+
+def copy_license_files(lic_files_paths, destdir):
+    bb.mkdirhier(destdir)
+    for (basename, path) in lic_files_paths:
+        ret = bb.copyfile(path, os.path.join(destdir, basename))
+        # If the copy didn't occur, something horrible went wrong and we fail out
+        if not ret:
+            bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % path)
+
+def find_license_files(d):
+    """
+    Creates list of files used in LIC_FILES_CHKSUM and generic LICENSE files.
+    """
     import shutil
     import oe.license
 
@@ -108,12 +127,12 @@ python do_populate_lic() {
     # All the license files for the package
     lic_files = d.getVar('LIC_FILES_CHKSUM', True)
     pn = d.getVar('PN', True)
-    # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR', True), pn)
     # The license files are located in S/LIC_FILE_CHECKSUM.
     srcdir = d.getVar('S', True)
     # Directory we store the generic licenses as set in the distro configuration
     generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
+    # List of basename, path tuples
+    lic_files_paths = []
     license_source_dirs = []
     license_source_dirs.append(generic_directory)
     try:
@@ -159,20 +178,12 @@ python do_populate_lic() {
             # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
 
-            bb.copyfile(os.path.join(license_source, spdx_generic), os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type))
-            if not os.path.isfile(os.path.join(os.path.join(d.getVar('LICSSTATEDIR', True), pn), "generic_" + license_type)):
-            # If the copy didn't occur, something horrible went wrong and we fail out
-                bb.warn("%s for %s could not be copied for some reason. It may not exist. WARN for now." % (spdx_generic, pn))
+            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic)))
         else:
             # And here is where we warn people that their licenses are lousy
             bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
             pass
 
-    try:
-        bb.mkdirhier(destdir)
-    except:
-        pass
-
     if not generic_directory:
         raise bb.build.FuncFailed("COMMON_LICENSE_DIR is unset. Please set this in your distro config")
 
@@ -180,16 +191,13 @@ python do_populate_lic() {
         # No recipe should have an invalid license file. This is checked else
         # where, but let's be pedantic
         bb.note(pn + ": Recipe file does not have license file information.")
-        return True
+        return lic_files_paths
 
     for url in lic_files.split():
         (type, host, path, user, pswd, parm) = bb.decodeurl(url)
-        # We want the license file to be copied into the destination
+        # We want the license filename and path
         srclicfile = os.path.join(srcdir, path)
-        ret = bb.copyfile(srclicfile, os.path.join(destdir, os.path.basename(path)))
-        # If the copy didn't occur, something horrible went wrong and we fail out
-        if not ret:
-            bb.warn("%s could not be copied for some reason. It may not exist. WARN for now." % srclicfile)
+        lic_files_paths.append((os.path.basename(path), srclicfile))
 
     v = FindVisitor()
     try:
@@ -199,7 +207,7 @@ python do_populate_lic() {
     except SyntaxError:
         bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
 
-}
+    return lic_files_paths
 
 def return_spdx(d, license):
     """
-- 
1.8.1.1



