Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyM-0007Da-K3
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:26 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:05 -0800 (PST)
Received: by 10.216.173.7 with SMTP id u7mr1131638wel.50.1298799005086;
	Sun, 27 Feb 2011 01:30:05 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m6sm1286580wej.10.2011.02.27.01.30.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:04 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:38 +0100
Message-Id: <39657dc954bd716eec9bc0c815f81c20222ad51d.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 29/50] Revise stripping and splitting of debug information
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:54 -0000

From: Mark Hatle <mark.hatle@windriver.com>

We now support two styles of debug information generation, the '.debug' style,
which is the same as previously implemented.  This style simply splits the
debug information and makes it available in the same general directory.

  /bin/foo -> /bin/.debug/foo

The new 'debug-file-directory' style splits the debug information and places
it into the single debug-file-directory, /usr/lib/debug:

  /bin/foo -> /usr/lib/debug/bin/foo.debug

Both also find and copy all referenced source code to a new /usr/src/debug
directory.  This allows the -dbg files to be used for stand-a-lone debugging
on or off the target device.

File stripping is now handled as a seperate operation from file splitting.
This allows us to split the debug information, but also leave it in the
original file -- or prevent the debug information from being split.

Also enhance the comments within local.conf.sample to provide a better
understanding of the control the user has over debug file generation.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/insane.bbclass  |    4 +-
 meta/classes/package.bbclass |  233 +++++++++++++++++++++++++++++++++++++-----
 meta/conf/bitbake.conf       |    9 ++-
 meta/conf/local.conf.sample  |   31 ++++++
 4 files changed, 246 insertions(+), 31 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5d3ef92..b376470 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -192,8 +192,8 @@ def package_qa_check_dev(path, name,d, elf):
 
     sane = True
 
-    if not name.endswith("-dev") and path.endswith(".so") and os.path.islink(path):
-        error_msg = "non -dev package contains symlink .so: %s path '%s'" % \
+    if not name.endswith("-dev") and not name.endswith("-dbg") and path.endswith(".so") and os.path.islink(path):
+        error_msg = "non -dev/-dbg package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d))
         sane = package_qa_handle_error(0, error_msg, name, path, d)
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 02c2dd3..86e24bc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -165,32 +165,88 @@ python () {
         d.setVar("PACKAGERDEPTASK", "")
 }
 
-def runstrip(file, d):
-    # Function to strip a single file, called from split_and_strip_files below
+def splitfile(file, debugfile, debugsrcdir, d):
+    # Function to split a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
-    # is necessary for this stuff to work, hence the addition to do_package[depends]
+    # is split and the split off portions go to debugfile.
+    #
+    # The debug information is then processed for src references.  These
+    # references are copied to debugsrcdir, if defined.
 
     import commands, stat
 
+    dvar = bb.data.getVar('PKGD', d, True)
     pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
+    objcopy = bb.data.getVar("OBJCOPY", d, True)
+    debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
+    workdir = bb.data.expand("${WORKDIR}", d)
+    sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
-    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
+    # We ignore kernel modules, we don't generate debug info files.
+    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
+	return 0
 
-    if ret:
-        bb.error("runstrip: 'file %s' failed (forced strip)" % file)
+    newmode = None
+    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
+        origmode = os.stat(file)[stat.ST_MODE]
+        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
+        os.chmod(file, newmode)
 
-    if "not stripped" not in result:
-        bb.debug(1, "runstrip: skip %s" % file)
-        return 0
+    # We need to extract the debug src information here...
+    if debugsrcdir:
+	os.system("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workdir, debugsrcdir, sourcefile, file))
 
-    # If the file is in a .debug directory it was already stripped,
-    # don't do it again...
-    if os.path.dirname(file).endswith(".debug"):
-        bb.note("Already ran strip")
-        return 0
+    bb.mkdirhier(os.path.dirname(debugfile))
+
+    os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
+
+    # Set the debuglink to have the view of the file path on the target
+    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
 
+    if newmode:
+        os.chmod(file, origmode)
+
+    return 0
+
+def splitfile2(debugsrcdir, d):
+    # Function to split a single file, called from split_and_strip_files below
+    #
+    # The debug src information processed in the splitfile2 is further procecessed
+    # and copied to the destination here.
+
+    import commands, stat
+
+    dvar = bb.data.getVar('PKGD', d, True)
+    pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
     strip = bb.data.getVar("STRIP", d, True)
     objcopy = bb.data.getVar("OBJCOPY", d, True)
+    debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
+    workdir = bb.data.expand("${WORKDIR}", d)
+    sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
+
+    if debugsrcdir:
+       bb.mkdirhier(debugsrcdir)
+
+       processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
+       processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
+
+       os.system(processdebugsrc % (sourcefile, workdir, dvar, debugsrcdir))
+
+       # The copy by cpio may have resulted in some empty directories!  Remove these
+       for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
+          for d in dirs:
+              dir = os.path.join(root, d)
+              #bb.note("rmdir -p %s" % dir)
+              os.system("rmdir -p %s 2>/dev/null" % dir)
+
+def runstrip(file, d):
+    # Function to strip a single file, called from split_and_strip_files below
+    # A working 'file' (one which works on the target architecture)
+
+    import commands, stat
+
+    pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
+    strip = bb.data.getVar("STRIP", d, True)
 
     # Handle kernel modules specifically - .debug directories here are pointless
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -202,21 +258,22 @@ def runstrip(file, d):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
+    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
+
+    if ret:
+        bb.error("runstrip: 'file %s' failed" % file)
+        return 0
+
     extraflags = ""
     if ".so" in file and "shared" in result:
         extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
     elif "shared" in result or "executable" in result:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
-    bb.mkdirhier(os.path.join(os.path.dirname(file), ".debug"))
-    debugfile=os.path.join(os.path.dirname(file), ".debug", os.path.basename(file))
-
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
-    os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
     ret = os.system("%s%s" % (pathprefix, stripcmd))
-    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
 
     if newmode:
         os.chmod(file, origmode)
@@ -224,7 +281,7 @@ def runstrip(file, d):
     if ret:
         bb.error("runstrip: '%s' strip command failed" % stripcmd)
 
-    return 1
+    return 0
 
 #
 # Package data handling routines
@@ -333,10 +390,24 @@ python perform_packagecopy () {
 }
 
 python split_and_strip_files () {
-	import stat
+	import commands, stat, errno
 
 	dvar = bb.data.getVar('PKGD', d, True)
 
+	# We default to '.debug' style
+	if bb.data.getVar('PACKAGE_DEBUG_SPLIT_STYLE', d, True) == 'debug-file-directory':
+		# Single debug-file-directory style debug info
+		debugappend = ".debug"
+		debugdir = ""
+		debuglibdir = "/usr/lib/debug"
+		debugsrcdir = "/usr/src/debug"
+	else:
+		# Original Poky, a.k.a. ".debug", style debug info
+		debugappend = ""
+		debugdir = "/.debug"
+		debuglibdir = ""
+		debugsrcdir = "/usr/src/debug"
+
 	os.chdir(dvar)
 
 	def isexec(path):
@@ -344,16 +415,124 @@ python split_and_strip_files () {
 			s = os.stat(path)
 		except (os.error, AttributeError):
 			return 0
-		return (s[stat.ST_MODE] & stat.S_IEXEC)
+		return ((s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH))
+
+	# Return 0 - not elf, 1 - ELF & not stripped, 2 - ELF & stripped
+	def isELF(path):
+		pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
+		ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, path))
+
+		if ret:
+			bb.error("split_and_strip_files: 'file %s' failed" % path)
+			return 0
+
+		# Not stripped
+		if "ELF" in result and "not stripped" in result:
+			return 1
+
+		# Stripped
+		if "ELF" in result:
+			return 2
+
+		return 0;
+
+	#
+	# First lets process debug splitting
+	#
+	if (bb.data.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', d, True) != '1'):
+		file_links = {}
 
-	# Figure out which packages we want to process
-	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, True) != '1'):
 		for root, dirs, files in os.walk(dvar):
 			for f in files:
 				file = os.path.join(root, f)
-				if not os.path.islink(file) and not os.path.isdir(file) and isexec(file):
-					runstrip(file, d)
+				# Skip debug files, it must be executable, and must be a file (or link)
+				if not (debugappend != "" and file.endswith(debugappend)) and not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and isexec(file) and os.path.isfile(file):
+					src = file[len(dvar):]
+					dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+					fpath = dvar + dest
+					# Preserve symlinks in debug area...
+					if os.path.islink(file):
+						target = os.readlink(file)
+						if not os.path.isabs(target):
+							target = os.path.join(os.path.dirname(file), target)
+						if isELF(target):
+							ltarget = os.readlink(file)
+							lpath = os.path.dirname(ltarget)
+							lbase = os.path.basename(ltarget)
+							ftarget = ""
+							if lpath and lpath != ".":
+								ftarget += lpath + debugdir + "/"
+							ftarget += lbase + debugappend
+							bb.mkdirhier(os.path.dirname(fpath))
+							#bb.note("Symlink %s -> %s" % (fpath, ftarget))
+							os.symlink(ftarget, fpath)
+						continue
+
+					# If the file is elf we need to check it for hard links
+					elf_file = isELF(file)
+					if elf_file:
+						# Preserve hard links in debug area...
+						s = os.stat(file)
+						if s.st_nlink > 1:
+							file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+							if file_reference not in file_links:
+								# If this is new, and already stripped we avoid recording it
+								# as we'll be unable to set the hard link later, because it
+								# won't be split/stripped...
+								if elf_file != 2:
+									file_links[file_reference] = fpath
+							else:
+								bb.mkdirhier(os.path.dirname(fpath))
+								#bb.note("Link %s -> %s" % (fpath, file_links[file_reference]))
+								os.link(file_links[file_reference], fpath)
+								continue
+
+						if elf_file == 2:
+							bb.warn("File '%s' was already stripped, this will prevent future debugging!" % (src))
+							continue
 
+						# Split and Strip
+						bb.mkdirhier(os.path.dirname(fpath))
+						#bb.note("Split %s -> %s" % (file, fpath))
+						splitfile(file, fpath, debugsrcdir, d)
+
+		# Process the debugsrcdir if requested...
+		splitfile2(debugsrcdir, d)
+
+		# The above may have generated dangling symlinks 
+		for root, dirs, files in os.walk(dvar):
+			for f in files:
+				file = os.path.join(root, f)
+				# We ONLY strip dangling links if they're debug generated!
+				if (debugappend != "" and file.endswith(debugappend)) or (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])):
+					try:
+						s = os.stat(file)
+					except OSError, (err, strerror):
+						if err != errno.ENOENT:
+							raise
+						#bb.note("Remove dangling link %s" % file)
+						os.unlink(file)
+
+	#
+	# End of debug splitting
+	#
+
+	#
+	# Now lets go back over things and strip them
+	#
+	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, True) != '1'):	
+		for root, dirs, files in os.walk(dvar):
+			for f in files:
+				file = os.path.join(root, f)
+				# if not a debugfile, is executable, is a file, and not a symlink
+				if not (debugappend != "" and file.endswith(debugappend)) and not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and isexec(file) and os.path.isfile(file) and not os.path.islink(file):
+					elf_file = isELF(file)
+					if elf_file and elf_file != 2:
+						#bb.note("Strip %s" % file)
+						runstrip(file, d)
+	#
+	# End of strip
+	#
 }
 
 python populate_packages () {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cba918e..cf99a81 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -242,9 +242,14 @@ SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPV})"
 
-FILES_${PN}-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
+DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
             ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
-            ${libdir}/matchbox-panel/.debug"
+            ${libdir}/matchbox-panel/.debug /usr/src/debug"
+
+DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
+
+FILES_${PN}-dbg = "${@bb.data.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][bb.data.getVar('PACKAGE_DEBUG_SPLIT_STYLE', d, 1) == 'debug-file-directory'], d, 1)}"
+
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
 RRECOMMENDS_${PN}-dbg = "${PN} (= ${EXTENDPV})"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 65b5087..434c684 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -104,6 +104,37 @@ USER_CLASSES ?= "image-mklibs image-prelink"
 # <build directory>/tmp
 #TMPDIR = "${POKYBASE}/build/tmp"
 
+# The following are used to control options related to debugging.
+#
+# Uncomment this to change the optimization to make debugging easer, at the 
+# possible cost of performance.
+# DEBUG_BUILD = "1"
+#
+# Uncomment this to disable the stripping of the installed binaries
+# INHIBIT_PACKAGE_STRIP = "1"
+#
+# Uncomment this to disable the split of the debug information into -dbg files
+# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+#
+# When splitting debug information, the following controls the results of the
+# file splitting.
+#
+#  .debug (default):
+#    When splitting the debug information will be placed into
+#    a .debug directory in the same dirname of the binary produced:
+#      /bin/foo -> /bin/.debug/foo
+#
+#  debug-file-directory:
+#    When splitting the debug information will be placed into
+#    a central debug-file-directory, /usr/lib/debug:
+#      /bin/foo -> /usr/lib/debug/bin/foo.debug
+#
+#    Any source code referenced in the debug symbols will be copied
+#    and made available within the /usr/src/debug directory
+#
+PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
+# PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
+
 # Uncomment these to build a package such that you can use gprof to profile it.
 # NOTE: This will only work with 'linux' targets, not
 # 'linux-uclibc', as uClibc doesn't provide the necessary
-- 
1.6.6.1



