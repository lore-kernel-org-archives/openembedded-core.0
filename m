Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfXF-0007rl-Rr
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:38 +0200
Received: by rex (Postfix, from userid 1000)
	id E9AEF2FEA1; Fri,  1 Jul 2011 16:17:29 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:24 +0100
Message-Id: <abd744765283d68eb8af2c2e5eda5a44e9cda7c3.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] insane.bbclass: Start to rework this so specific checks can be easily made warnings/errors
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:38 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

This patch means the warning/error handling can be controlled from local.conf
and/or from the distro level and no longer uses numbers but strings instead.

The system becomes extensible so that other classes can extend the path QA
checks at least.

It also removes all th duplicate error message code, we should have *one*
good error message.

Much work remains including making INSANE_SKIP take the classes of QA test
to skip but its a start.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass |  216 +++++++++++++++++--------------------------
 1 files changed, 83 insertions(+), 133 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 35809b9..a6f9c1e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -91,83 +91,39 @@ def package_qa_get_machine_dict():
        }
 
 
-# Known Error classes
-# 0 - non dev contains .so
-# 1 - package contains a dangerous RPATH
-# 2 - package depends on debug package
-# 3 - non dbg contains .so
-# 4 - wrong architecture
-# 5 - .la contains installed=yes or reference to the workdir
-# 6 - .pc contains reference to /usr/include or workdir
-# 7 - the desktop file is not valid
-# 8 - .la contains reference to the workdir
-# 9 - LDFLAGS ignored
-# 10 - Build paths in binaries
+WARN_QA ?= "dev-so rpaths debug-deps debug-files arch la2 pkgconfig desktop la ldflags perms"
+ERROR_QA ?= ""
+#ERROR_QA ?= "rpaths debug-deps debug-files arch pkgconfig perms"
 
 def package_qa_clean_path(path,d):
     """ Remove the common prefix from the path. In this case it is the TMPDIR"""
     return path.replace(bb.data.getVar('TMPDIR',d,True),"")
 
-def package_qa_make_fatal_error(error_class, name, path,d):
-    """
-    decide if an error is fatal
-
-    TODO: Load a whitelist of known errors
-    """
-    return False
-    return not error_class in [0, 5, 7, 8, 9]
-
-def package_qa_write_error(error_class, name, path, d):
-    """
-    Log the error
-    """
-
-    ERROR_NAMES =[
-        "non dev contains .so",
-        "package contains RPATH",
-        "package depends on debug package",
-        "non dbg contains .debug",
-        "wrong architecture",
-        "evil hides inside the .la",
-        "evil hides inside the .pc",
-        "the desktop file is not valid",
-        ".la contains reference to the workdir",
-        "LDFLAGS ignored",
-        "package contains reference to tmpdir paths",
-    ]
-
-    log_path = os.path.join( bb.data.getVar('T', d, True), "log.qa_package" )
-    f = file( log_path, "a+")
-    print >> f, "%s, %s, %s" % \
-             (ERROR_NAMES[error_class], name, package_qa_clean_path(path,d))
-    f.close()
-
-    logfile = bb.data.getVar('QA_LOGFILE', d, True)
+def package_qa_write_error(error, d):
+    logfile = d.getVar('QA_LOGFILE', True)
     if logfile:
-        p = bb.data.getVar('P', d, True)
+        p = d.getVar('P', True)
         f = file( logfile, "a+")
-        print >> f, "%s, %s, %s, %s" % \
-             (p, ERROR_NAMES[error_class], name, package_qa_clean_path(path,d))
+        print >> f, "%s: %s" % (p, error)
         f.close()
 
-def package_qa_handle_error(error_class, error_msg, name, path, d):
-    fatal = package_qa_make_fatal_error(error_class, name, path, d)
-    if fatal:
+def package_qa_handle_error(error_class, error_msg, d):
+    package_qa_write_error(error_msg, d)
+    if error_class in (d.getVar("ERROR_QA", True) or "").split():
         bb.error("QA Issue: %s" % error_msg)
+        return True
     else:
         bb.warn("QA Issue: %s" % error_msg)
-    package_qa_write_error(error_class, name, path, d)
-
-    return not fatal
+        return False
 
-def package_qa_check_rpath(file,name,d, elf):
+QAPATHTEST[rpaths] = "package_qa_check_rpath"
+def package_qa_check_rpath(file,name, d, elf, messages):
     """
     Check for dangerous RPATHs
     """
     if not elf:
-        return True
+        return
 
-    sane = True
     scanelf = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
     bad_dirs = [bb.data.getVar('TMPDIR', d, True) + "/work", bb.data.getVar('STAGING_DIR_TARGET', d, True)]
     bad_dir_test = bb.data.getVar('TMPDIR', d, True)
@@ -182,67 +138,56 @@ def package_qa_check_rpath(file,name,d, elf):
     for line in txt:
         for dir in bad_dirs:
             if dir in line:
-                error_msg = "package %s contains bad RPATH %s in file %s" % (name, line, file)
-                sane = sane + package_qa_handle_error(1, error_msg, name, file, d)
+                messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
-    return sane
-
-def package_qa_check_dev(path, name,d, elf):
+QAPATHTEST[dev-so] = "package_qa_check_dev"
+def package_qa_check_dev(path, name, d, elf, messages):
     """
     Check for ".so" library symlinks in non-dev packages
     """
 
-    sane = True
-
     if not name.endswith("-dev") and not name.endswith("-dbg") and path.endswith(".so") and os.path.islink(path):
-        error_msg = "non -dev/-dbg package contains symlink .so: %s path '%s'" % \
-                 (name, package_qa_clean_path(path,d))
-        sane = package_qa_handle_error(0, error_msg, name, path, d)
+        messages.append("non -dev/-dbg package contains symlink .so: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
 
-    return sane
-
-def package_qa_check_dbg(path, name,d, elf):
+QAPATHTEST[debug-files] = "package_qa_check_dbg"
+def package_qa_check_dbg(path, name, d, elf, messages):
     """
     Check for ".debug" files or directories outside of the dbg package
     """
 
-    sane = True
-
     if not "-dbg" in name:
         if '.debug' in path.split(os.path.sep):
-            error_msg = "non debug package contains .debug directory: %s path %s" % \
-                     (name, package_qa_clean_path(path,d))
-            sane = package_qa_handle_error(3, error_msg, name, path, d)
+            messages.append("non debug package contains .debug directory: %s path %s" % \
+                     (name, package_qa_clean_path(path,d)))
 
-    return sane
-
-def package_qa_check_perm(path,name,d, elf):
+QAPATHTEST[perms] = "package_qa_check_perm"
+def package_qa_check_perm(path,name,d, elf, messages):
     """
     Check the permission of files
     """
-    sane = True
-    return sane
+    return
 
-def package_qa_check_arch(path,name,d, elf):
+QAPATHTEST[arch] = "package_qa_check_arch"
+def package_qa_check_arch(path,name,d, elf, messages):
     """
     Check if archs are compatible
     """
     if not elf:
-        return True
+        return
 
-    sane = True
     target_os   = bb.data.getVar('TARGET_OS',   d, True)
     target_arch = bb.data.getVar('TARGET_ARCH', d, True)
 
     # FIXME: Cross package confuse this check, so just skip them
     for s in ['cross', 'nativesdk', 'cross-canadian']:
         if bb.data.inherits_class(s, d):
-            return True
+            return
 
     # avoid following links to /usr/bin (e.g. on udev builds)
     # we will check the files pointed to anyway...
     if os.path.islink(path):
-        return True
+        return
 
     #if this will throw an exception, then fix the dict above
     (machine, osabi, abiversion, littleendian, bits) \
@@ -250,50 +195,44 @@ def package_qa_check_arch(path,name,d, elf):
 
     # Check the architecture and endiannes of the binary
     if not machine == elf.machine():
-        error_msg = "Architecture did not match (%d to %d) on %s" % \
-                 (machine, elf.machine(), package_qa_clean_path(path,d))
-        sane = package_qa_handle_error(4, error_msg, name, path, d)
+        messages.append("Architecture did not match (%d to %d) on %s" % \
+                 (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not bits == elf.abiSize():
-        error_msg = "Bit size did not match (%d to %d) on %s" % \
-                 (bits, elf.abiSize(), package_qa_clean_path(path,d))
-        sane = package_qa_handle_error(4, error_msg, name, path, d)
+        messages.append("Bit size did not match (%d to %d) on %s" % \
+                 (bits, elf.abiSize(), package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-        error_msg = "Endiannes did not match (%d to %d) on %s" % \
-                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d))
-        sane = package_qa_handle_error(4, error_msg, name, path, d)
+        messages.append("Endiannes did not match (%d to %d) on %s" % \
+                 (littleendian, elf.isLittleEndian(), package_qa_clean_path(path,d)))
 
-    return sane
-
-def package_qa_check_desktop(path, name, d, elf):
+QAPATHTEST[desktop] = "package_qa_check_desktop"
+def package_qa_check_desktop(path, name, d, elf, messages):
     """
     Run all desktop files through desktop-file-validate.
     """
-    sane = True
     if path.endswith(".desktop"):
         desktop_file_validate = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'desktop-file-validate')
         output = os.popen("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
-            sane = package_qa_handle_error(7, l.strip(), name, path, d)
+            messages.append("Desktop file issue: " + l.strip())
 
-    return sane
-
-def package_qa_hash_style(path, name, d, elf):
+QAPATHTEST[ldflags] = "package_qa_hash_style"
+def package_qa_hash_style(path, name, d, elf, messages):
     """
     Check if the binary has the right hash style...
     """
 
     if not elf:
-        return True
+        return
 
     if os.path.islink(path):
-        return True
+        return
 
     gnu_hash = "--hash-style=gnu" in bb.data.getVar('LDFLAGS', d, True)
     if not gnu_hash:
         gnu_hash = "--hash-style=both" in bb.data.getVar('LDFLAGS', d, True)
     if not gnu_hash:
-        return True
+        return
 
     objdump = bb.data.getVar('OBJDUMP', d, True)
     env_path = bb.data.getVar('PATH', d, True)
@@ -314,31 +253,26 @@ def package_qa_hash_style(path, name, d, elf):
 	    sane = True
 
     if elf and not sane:
-        error_msg = "No GNU_HASH in the elf binary: '%s'" % path
-        return package_qa_handle_error(9, error_msg, name, path, d)
+        messages.append("No GNU_HASH in the elf binary: '%s'" % path)
 
-    return True
 
-def package_qa_check_buildpaths(path, name, d, elf):
+QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
+def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
-    sane = True
-
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
-        return True
+        return
 
     # Ignore symlinks
     if os.path.islink(path):
-        return True
+        return
 
     tmpdir = bb.data.getVar('TMPDIR', d, True)
     file_content = open(path).read()
     if tmpdir in file_content:
-        error_msg = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
-        sane = package_qa_handle_error(10, error_msg, name, path, d)
-    return sane
+        messages.append("File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d))
 
 def package_qa_check_license(workdir, d):
     """
@@ -439,24 +373,25 @@ def package_qa_check_staged(path,d):
                 file_content = open(path).read()
                 if workdir in file_content:
                     error_msg = "%s failed sanity test (workdir) in path %s" % (file,root)
-                    sane = package_qa_handle_error(8, error_msg, "staging", path, d)
+                    sane = package_qa_handle_error("la", error_msg, d)
             elif file.endswith(".pc"):
                 file_content = open(path).read()
                 if pkgconfigcheck in file_content:
                     error_msg = "%s failed sanity test (tmpdir) in path %s" % (file,root)
-                    sane = package_qa_handle_error(6, error_msg, "staging", path, d)
+                    sane = package_qa_handle_error("pkgconfig", error_msg, d)
 
     return sane
 
 # Walk over all files in a directory and call func
-def package_qa_walk(path, funcs, package,d):
+def package_qa_walk(path, warnfuncs, errorfuncs, package, d):
     import oe.qa
 
     #if this will throw an exception, then fix the dict above
     target_os   = bb.data.getVar('TARGET_OS',   d, True)
     target_arch = bb.data.getVar('TARGET_ARCH', d, True)
 
-    sane = True
+    warnings = []
+    errors = []
     for root, dirs, files in os.walk(path):
         for file in files:
             path = os.path.join(root,file)
@@ -465,11 +400,19 @@ def package_qa_walk(path, funcs, package,d):
                 elf.open()
             except:
                 elf = None
-            for func in funcs:
-                if not func(path, package,d, elf):
-                    sane = False
+            for func in warnfuncs:
+                func(path, package, d, elf, warnings)
+            for func in errorfuncs:
+                func(path, package, d, elf, errors)
 
-    return sane
+    for w in warnings:
+        bb.warn("QA Issue: %s" % w)
+        package_qa_write_error(w, d)
+    for e in errors:
+        bb.error("QA Issue: %s" % e)
+        package_qa_write_error(e, d)
+
+    return len(errors) == 0
 
 def package_qa_check_rdepends(pkg, pkgdest, d):
     sane = True
@@ -498,7 +441,7 @@ def package_qa_check_rdepends(pkg, pkgdest, d):
         for rdepend in rdepends:
             if "-dbg" in rdepend:
                 error_msg = "%s rdepends on %s" % (pkgname,rdepend)
-                sane = package_qa_handle_error(2, error_msg, pkgname, rdepend, d)
+                sane = package_qa_handle_error("debug-deps", error_msg, d)
 
     return sane
 
@@ -534,11 +477,18 @@ python do_package_qa () {
     if not packages:
         return
 
-    checks = [package_qa_check_rpath, package_qa_check_dev,
-              package_qa_check_perm, package_qa_check_arch,
-              package_qa_check_desktop, package_qa_hash_style,
-              package_qa_check_dbg]
-    #         package_qa_check_buildpaths, 
+    testmatrix = d.getVarFlags("QAPATHTEST")
+
+    g = globals()
+    warnchecks = []
+    for w in (d.getVar("WARN_QA", True) or "").split():
+        if w in testmatrix and testmatrix[w] in g:
+            warnchecks.append(g[testmatrix[w]])
+    errorchecks = []
+    for e in (d.getVar("ERROR_QA", True) or "").split():
+        if e in testmatrix and testmatrix[e] in g:
+            errorchecks.append(g[testmatrix[e]])
+
     walk_sane = True
     rdepends_sane = True
     for package in packages.split():
@@ -548,7 +498,7 @@ python do_package_qa () {
 
         bb.note("Checking Package: %s" % package)
         path = "%s/%s" % (pkgdest, package)
-        if not package_qa_walk(path, checks, package, d):
+        if not package_qa_walk(path, warnchecks, errorchecks, package, d):
             walk_sane  = False
         if not package_qa_check_rdepends(package, pkgdest, d):
             rdepends_sane = False
-- 
1.7.4.1



