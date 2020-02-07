Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6041260EAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 20:20:09 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017KK8FR028724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 14:20:10 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:20:08 -0600
Message-Id: <20200207202008.132026-4-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
References: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 3/3] package.bbclass: Support stripping and debug copy of static libraries
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
X-List-Received-Date: Fri, 07 Feb 2020 20:20:09 -0000

By default, we won't copy and strip static libraries.  However, this
functionality can be useful in some cases where people are doing
development on the target, and don't generally want the larger debug
capable static libraries.  To enable the new functionality set:

    PACKAGE_DEBUG_STATIC_SPLIT = '1'

Add a new function splitstaticdebuginfo.  Thus function will copy the
unmodified static library into the specific debug directory location.
By keeping an unmodified version, it is possible for a user trying
to debug something to use -L /usr/lib/.debug-static and their existing
build commands to switch from stripped to full debug versions.

The PACKAGE_DEBUG_SPLIT_STYLE will select between two different
approaches, /usr/lib/debug-static or <path>/.debug-static.

Additionally you can now choose to strip static libraries to conserve
space.  If either 'PACKAGE_DEBUG_STATIC_SPLIT' or 'PACKAGE_STRIP_STATIC'
is set to 1, the static library will be stripped.  (This is not on by
default, as it could make diagnosing static library usage difficult in
some cases.)

Add to insane.bbclass a skip to the staticdev warning for the specific
-dbg package versions.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/insane.bbclass  |  2 +-
 meta/classes/package.bbclass | 67 ++++++++++++++++++++++++++++++++++--
 meta/conf/bitbake.conf       |  2 +-
 3 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 795c7b9212..7425b8cbd5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -182,7 +182,7 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     libgcc.a, libgcov.a will be skipped in their packages
     """
 
-    if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a"):
+    if not name.endswith("-pic") and not name.endswith("-staticdev") and not name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_nonshared.a") and not '/usr/lib/debug-static/' in path and not '/.debug-static/' in path:
         package_qa_add_message(messages, "staticdev", "non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7080d63287..1efc396ac6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -416,6 +416,49 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     return (file, sources)
 
+def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d):
+    # Unlike the function above, there is no way to split a static library
+    # two components.  So to get similar results we will copy the unmodified
+    # static library (containing the debug symbols) into a new directory.
+    # We will then strip (preserving symbols) the static library in the
+    # typical location.
+    #
+    # return a mapping of files:debugsources
+
+    import stat
+    import shutil
+
+    src = file[len(dvar):]
+    dest = debugstaticlibdir + os.path.dirname(src) + debugstaticdir + "/" + os.path.basename(src) + debugstaticappend
+    debugfile = dvar + dest
+    sources = []
+
+    # Copy the file...
+    bb.utils.mkdirhier(os.path.dirname(debugfile))
+    #bb.note("Copy %s -> %s" % (file, debugfile))
+
+    dvar = d.getVar('PKGD')
+
+    newmode = None
+    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+        origmode = os.stat(file)[stat.ST_MODE]
+        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
+        os.chmod(file, newmode)
+
+    # We need to extract the debug src information here...
+    if debugsrcdir:
+        sources = source_info(file, d)
+
+    bb.utils.mkdirhier(os.path.dirname(debugfile))
+
+    # Copy the unmodified item to the debug directory
+    shutil.copy2(file, debugfile)
+
+    if newmode:
+        os.chmod(file, origmode)
+
+    return (file, sources)
+
 def copydebugsources(debugsrcdir, sources, d):
     # The debug src information written out to sourcefile is further processed
     # and copied to the destination here.
@@ -916,25 +959,37 @@ python split_and_strip_files () {
     if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
         # Single debug-file-directory style debug info
         debugappend = ".debug"
+        debugstaticappend = ""
         debugdir = ""
+        debugstaticdir = ""
         debuglibdir = "/usr/lib/debug"
+        debugstaticlibdir = "/usr/lib/debug-static"
         debugsrcdir = "/usr/src/debug"
     elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-without-src':
         # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
         debugappend = ""
+        debugstaticappend = ""
         debugdir = "/.debug"
+        debugstaticdir = "/.debug-static"
         debuglibdir = ""
+        debugstaticlibdir = ""
         debugsrcdir = ""
     elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
         debugappend = ""
+        debugstaticappend = ""
         debugdir = "/.debug"
+        debugstaticdir = "/.debug-static"
         debuglibdir = ""
+        debugstaticlibdir = ""
         debugsrcdir = "/usr/src/debug"
     else:
         # Original OE-core, a.k.a. ".debug", style debug info
         debugappend = ""
+        debugstaticappend = ""
         debugdir = "/.debug"
+        debugstaticdir = "/.debug-static"
         debuglibdir = ""
+        debugstaticlibdir = ""
         debugsrcdir = "/usr/src/debug"
 
     #
@@ -1051,8 +1106,11 @@ python split_and_strip_files () {
         results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
 
         if debugsrcdir and not targetos.startswith("mingw"):
-            for file in staticlibs:
-                results.append( (file, source_info(file, d, fatal=False)) )
+            if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
+                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
+            else:
+                for file in staticlibs:
+                    results.append( (file,source_info(file, d)) )
 
         sources = set()
         for r in results:
@@ -1121,6 +1179,9 @@ python split_and_strip_files () {
             sfiles.append((file, elf_file, strip))
         for f in kernmods:
             sfiles.append((f, 16, strip))
+        if (d.getVar('PACKAGE_STRIP_STATIC') == '1' or d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
+            for f in staticlibs:
+                sfiles.append((f, 16, strip))
 
         oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
@@ -1188,7 +1249,7 @@ python populate_packages () {
             dir = os.sep
         for f in (files + dirs):
             path = "." + os.path.join(dir, f)
-            if "/.debug/" in path or path.endswith("/.debug"):
+            if "/.debug/" in path or "/.debug-static/" in path or path.endswith("/.debug"):
                 debug.append(path)
 
     for pkg in packages:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b4621f9b9..954c06b313 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -325,7 +325,7 @@ FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
 SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
-FILES_${PN}-dbg = "/usr/lib/debug /usr/src/debug"
+FILES_${PN}-dbg = "/usr/lib/debug /usr/lib/debug-static /usr/src/debug"
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-- 
2.17.1


