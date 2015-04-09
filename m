Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0C7606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 21:55:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2015 14:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,552,1422950400"; d="scan'208";a="553809158"
Received: from carloses-mobl.amr.corp.intel.com (HELO
	aehernan-DevStation.lar.corp.intel.com) ([10.252.254.35])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2015 14:55:55 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 16:55:58 -0500
Message-Id: <952f6c899d02d946e1c934b03e7aec192e627569.1428616369.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428616369.git.alejandro.hernandez@linux.intel.com>
References: <cover.1428616369.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v3 1/1] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Thu, 09 Apr 2015 21:55:56 -0000

Adds symlink-to-sysroot check to QA_WARN to detect symlinks that
point to locations under TMPDIR, which are most likely broken.

Changes filerdepends from set() to dict(), hence methods for adding
or deleting items had to change too. Now it keeps track of key:value
relationship, flags the QA issue; warning the user about which
file/package causes the problem, making it easier to debug.

[YOCTO #7126]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/insane.bbclass | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ab7ca3b..3592575 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -30,7 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
-            unknown-configure-option \
+            unknown-configure-option symlink-to-sysroot \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -612,7 +612,6 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
             if target.startswith(tmpdir):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
                 messages["symlink-to-sysroot"] = "Symlink %s in %s points to TMPDIR" % (trimmed, name)
-
 def package_qa_check_license(workdir, d):
     """
     Check for changes in the license files 
@@ -811,13 +810,14 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             if bb.data.inherits_class('nativesdk', d):
                 ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl'])
             # For Saving the FILERDEPENDS
-            filerdepends = set()
+            filerdepends = {}
             rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
             for key in rdep_data:
                 if key.startswith("FILERDEPENDS_"):
                     for subkey in rdep_data[key].split():
-                        filerdepends.add(subkey)
-            filerdepends -= ignored_file_rdeps
+                        if subkey not in ignored_file_rdeps:
+                            # We already know it starts with FILERDEPENDS_
+                            filerdepends[subkey] = key[13:]
 
             if filerdepends:
                 next = rdepends
@@ -849,31 +849,27 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 # case there is a RDEPENDS_pkg = "python" in the recipe.
                 for py in [ d.getVar('MLPREFIX', True) + "python", "python" ]:
                     if py in done:
-                        filerdepends.discard("/usr/bin/python")
+                        filerdepends.pop("/usr/bin/python",None)
                         done.remove(py)
                 for rdep in done:
                     # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
-                    rdep_rprovides = set()
                     rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
                     for key in rdep_data:
                         if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_"):
                             for subkey in rdep_data[key].split():
-                                rdep_rprovides.add(subkey)
+                                filerdepends.pop(subkey,None)
                         # Add the files list to the rprovides
                         if key == "FILES_INFO":
                             # Use eval() to make it as a dict
                             for subkey in eval(rdep_data[key]):
-                                rdep_rprovides.add(subkey)
-                    filerdepends -= rdep_rprovides
+                                filerdepends.pop(subkey,None)
                     if not filerdepends:
                         # Break if all the file rdepends are met
                         break
-                    else:
-                        # Clear it for the next loop
-                        rdep_rprovides.clear()
             if filerdepends:
-                error_msg = "%s requires %s, but no providers in its RDEPENDS" % \
-                            (pkg, ', '.join(str(e) for e in filerdepends))
+                for key in filerdepends:
+                    error_msg = "%s contained in package %s requires %s, but no providers found in its RDEPENDS" % \
+                            (filerdepends[key],pkg, key)
                 sane = package_qa_handle_error("file-rdeps", error_msg, d)
 
     return sane
-- 
1.9.1


