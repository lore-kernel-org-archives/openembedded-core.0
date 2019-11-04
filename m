Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id A451C7F7C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 04:52:50 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 6C82C220235;
	Mon,  4 Nov 2019 17:52:50 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 17:52:45 +1300
Message-Id: <20191104045245.19085-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104011638.26010-1-douglas.royds@taitradio.com>
References: <20191104011638.26010-1-douglas.royds@taitradio.com>
Subject: [PATCH v2] insane: file-rdeps: Readability only
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
X-List-Received-Date: Mon, 04 Nov 2019 04:52:51 -0000

Mostly just longer (and hopefully more meaningful) variable names.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/insane.bbclass | 81 +++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9605ac2bae..f80abebbac 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -707,57 +707,60 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     package_qa_handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
-            ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
+            ignored_executable_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
             if bb.data.inherits_class('nativesdk', d):
-                ignored_file_rdeps |= set(['/bin/bash', '/usr/bin/perl', 'perl'])
-            # For Saving the FILERDEPENDS
-            filerdepends = {}
-            rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
-            for key in rdep_data:
-                if key.startswith("FILERDEPENDS_"):
-                    for subkey in bb.utils.explode_deps(rdep_data[key]):
-                        if subkey not in ignored_file_rdeps and \
-                                not subkey.startswith('perl('):
-                            # We already know it starts with FILERDEPENDS_
-                            filerdepends[subkey] = key[13:]
-
-            if filerdepends:
-                done = rdepends[:]
-                # Add the rprovides of itself
-                if pkg not in done:
-                    done.insert(0, pkg)
+                ignored_executable_rdeps |= set(['/bin/bash', '/usr/bin/perl', 'perl'])
+
+            # A dictionary of libs (or other providers) and one executable that depends on each
+            unsatisfied_rdepends = {}
+            current_pkg_rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
+            for executable_that_rdepends in current_pkg_rdep_data:
+                if executable_that_rdepends.startswith("FILERDEPENDS_"):
+                    for target_dependency in bb.utils.explode_deps(current_pkg_rdep_data[executable_that_rdepends]):
+                        if target_dependency not in ignored_executable_rdeps \
+                           and not target_dependency.startswith('perl('):
+                            unsatisfied_rdepends[target_dependency] = executable_that_rdepends[len('FILERDEPENDS_'):]
+
+            if unsatisfied_rdepends:
+                rdep_packages_to_consider = rdepends[:]
+                # Each package effectively rprovides itself
+                if pkg not in rdep_packages_to_consider:
+                    rdep_packages_to_consider.insert(0, pkg)
 
                 # The python is not a package, but python-core provides it, so
                 # skip checking /usr/bin/python if python is in the rdeps, in
                 # case there is a RDEPENDS_pkg = "python" in the recipe.
-                for py in [ d.getVar('MLPREFIX') + "python", "python" ]:
-                    if py in done:
-                        filerdepends.pop("/usr/bin/python",None)
-                        done.remove(py)
-                for rdep in done:
-                    # The file dependencies may contain package names, e.g.,
-                    # perl
-                    filerdepends.pop(rdep,None)
-
-                    # For Saving the FILERPROVIDES, RPROVIDES and FILES_INFO
-                    rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
-                    for key in rdep_data:
+                for python_package in [ d.getVar('MLPREFIX') + "python", "python" ]:
+                    if python_package in rdep_packages_to_consider:
+                        unsatisfied_rdepends.pop("/usr/bin/python",None)
+                        rdep_packages_to_consider.remove(python_package)
+
+                for dependent_package in rdep_packages_to_consider:
+                    # Dependencies might contain package names, e.g. perl
+                    unsatisfied_rdepends.pop(dependent_package,None)
+
+                    dependent_pkg_rdep_data = oe.packagedata.read_subpkgdata(dependent_package, d)
+                    for key in dependent_pkg_rdep_data:
                         if key.startswith("FILERPROVIDES_") or key.startswith("RPROVIDES_"):
-                            for subkey in bb.utils.explode_deps(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
-                        # Add the files list to the rprovides
+                            for satisfied_lib_or_provider in bb.utils.explode_deps(dependent_pkg_rdep_data[key]):
+                                unsatisfied_rdepends.pop(satisfied_lib_or_provider,None)
+
+                        # FILES_INFO lists all files this dependent package provides
                         if key == "FILES_INFO":
                             # Use eval() to make it as a dict
-                            for subkey in eval(rdep_data[key]):
-                                filerdepends.pop(subkey,None)
-                    if not filerdepends:
+                            for potential_provider_file in eval(dependent_pkg_rdep_data[key]):
+                                unsatisfied_rdepends.pop(potential_provider_file,None)
+
+                    if not unsatisfied_rdepends:
                         # Break if all the file rdepends are met
                         break
-            if filerdepends:
-                for key in filerdepends:
+
+            if unsatisfied_rdepends:
+                for key in unsatisfied_rdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in RDEPENDS_%s?" % \
-                            (filerdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
+                            (unsatisfied_rdepends[key].replace("_%s" % pkg, "").replace("@underscore@", "_"), pkg, key, pkg)
                     package_qa_handle_error("file-rdeps", error_msg, d)
+
 package_qa_check_rdepends[vardepsexclude] = "OVERRIDES"
 
 def package_qa_check_deps(pkg, pkgdest, d):
-- 
2.17.1


