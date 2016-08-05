Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6F712770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:04:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 05 Aug 2016 09:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,474,1464678000"; d="scan'208";a="744697738"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2016 09:04:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 19:04:15 +0300
Message-Id: <1470413055-3662-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] license: improve handling of license files with identical basenames
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
X-List-Received-Date: Fri, 05 Aug 2016 16:04:45 -0000

Previously, find_license_files() in license.bbclass just blindly assumed
that all different licenses specified in LIC_FILES_CHKSUM have unique
filenames. As a consequence, only the last one of these similarly named
license files was copied and the rest were "lost". This patch changes
the behavior so that all license files get copied. However, if multiple
identically names files are found, they are names to <file>.0, <file>.1
etc.

The patch also changes the handling of NO_GENERIC_LICENSE slightly.
Previously, only basenames of NO_GENERIC_LICENSE and LIC_FILES_CHKSUM
were compared when searching for the correct license file. After this
patch NO_GENERIC_LICENSE must have the full path, matching what is
specified in LIC_FILES_CHKSUM. This is required in order to be able
handle identical filenames (basenames) consistently. For example, if
you have:
LICENSE = "my-custom-license"
LIC_FILES_CHKSUM = "file://src/LICENCE;md5=d41d8cd98f00b204e9800998ecf8427e"

you must specify:
NO_GENERIC_LICENSE[my-custom-license] = "src/LICENCE"

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/license.bbclass | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 26c297d..1313fda 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -385,6 +385,7 @@ def find_license_files(d):
     """
     import shutil
     import oe.license
+    from collections import defaultdict, OrderedDict
 
     pn = d.getVar('PN', True)
     for package in d.getVar('PACKAGES', True):
@@ -409,6 +410,8 @@ def find_license_files(d):
     generic_directory = d.getVar('COMMON_LICENSE_DIR', True)
     # List of basename, path tuples
     lic_files_paths = []
+    # Entries from LIC_FILES_CHKSUM
+    lic_chksums = {}
     license_source_dirs = []
     license_source_dirs.append(generic_directory)
     try:
@@ -438,7 +441,6 @@ def find_license_files(d):
         license_source = None
         # If the generic does not exist we need to check to see if there is an SPDX mapping to it,
         # unless NO_GENERIC_LICENSE is set.
-
         for lic_dir in license_source_dirs:
             if not os.path.isfile(os.path.join(lic_dir, license_type)):
                 if d.getVarFlag('SPDXLICENSEMAP', license_type, True) != None:
@@ -452,6 +454,7 @@ def find_license_files(d):
                 license_source = lic_dir
                 break
 
+        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type, True)
         if spdx_generic and license_source:
             # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
             # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)
@@ -463,13 +466,11 @@ def find_license_files(d):
             if d.getVarFlag('NO_GENERIC_LICENSE', license_type, True):
                 bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
 
-        elif d.getVarFlag('NO_GENERIC_LICENSE', license_type, True):
+        elif non_generic_lic and non_generic_lic in lic_chksums:
             # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
             # of the package rather than the license_source_dirs.
-            for (basename, path) in lic_files_paths:
-                if d.getVarFlag('NO_GENERIC_LICENSE', license_type, True) == basename:
-                    lic_files_paths.append(("generic_" + license_type, path))
-                    break
+            lic_files_paths.append(("generic_" + license_type,
+                                    os.path.join(srcdir, non_generic_lic)))
         else:
             # Add explicity avoid of CLOSED license because this isn't generic
             if license_type != 'CLOSED':
@@ -492,8 +493,8 @@ def find_license_files(d):
         except bb.fetch.MalformedUrl:
             raise bb.build.FuncFailed("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF', True), url))
         # We want the license filename and path
-        srclicfile = os.path.join(srcdir, path)
-        lic_files_paths.append((os.path.basename(path), srclicfile))
+        chksum = parm['md5'] if 'md5' in parm else parm['sha256']
+        lic_chksums[path] = chksum
 
     v = FindVisitor()
     try:
@@ -503,6 +504,19 @@ def find_license_files(d):
     except SyntaxError:
         bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF', True)))
 
+    # Add files from LIC_FILES_CHKSUM to list of license files
+    lic_chksum_paths = defaultdict(OrderedDict)
+    for path, chksum in lic_chksums.items():
+        lic_chksum_paths[os.path.basename(path)][chksum] = os.path.join(srcdir, path)
+    for basename, files in lic_chksum_paths.items():
+        if len(files) == 1:
+            lic_files_paths.append((basename, list(files.values())[0]))
+        else:
+            # If there are multiple different license files with identical
+            # basenames we rename them to <file>.0, <file>.1, ...
+            for i, path in enumerate(files.values()):
+                lic_files_paths.append(("%s.%d" % (basename, i), path))
+
     return lic_files_paths
 
 def return_spdx(d, license):
-- 
2.6.6


