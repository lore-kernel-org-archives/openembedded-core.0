Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyO-0007Da-1l
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:28 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:06 -0800 (PST)
Received: by 10.216.179.144 with SMTP id h16mr3529513wem.64.1298799006432;
	Sun, 27 Feb 2011 01:30:06 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u2sm1286003weh.12.2011.02.27.01.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:06 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:40 +0100
Message-Id: <4ecb520c107cfbae5928979a147b787cd2558bdf.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 30/50] package.bbclass: Refactor split and strip function
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Refactor the function to eliminate additional interations/walks of the
filesystem..

Elimiate multiple runs of the external 'file' command as well.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |  242 +++++++++++++++++++++++++-----------------
 1 files changed, 144 insertions(+), 98 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 86e24bc..59a0601 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -184,7 +184,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-	return 0
+	return 1
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -239,9 +239,14 @@ def splitfile2(debugsrcdir, d):
               #bb.note("rmdir -p %s" % dir)
               os.system("rmdir -p %s 2>/dev/null" % dir)
 
-def runstrip(file, d):
+def runstrip(file, elftype, d):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
+    #
+    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
+    # us what type of file we're processing...
+    # 4 - executable
+    # 8 - shared library
 
     import commands, stat
 
@@ -258,16 +263,12 @@ def runstrip(file, d):
         newmode = origmode | stat.S_IWRITE | stat.S_IREAD
         os.chmod(file, newmode)
 
-    ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, file))
-
-    if ret:
-        bb.error("runstrip: 'file %s' failed" % file)
-        return 0
-
     extraflags = ""
-    if ".so" in file and "shared" in result:
+    # .so and shared library
+    if ".so" in file and elftype & 8:
         extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
-    elif "shared" in result or "executable" in result:
+    # shared or executable:
+    elif elftype & 8 or elftype & 4:
         extraflags = "--remove-section=.comment --remove-section=.note"
 
     stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
@@ -410,109 +411,158 @@ python split_and_strip_files () {
 
 	os.chdir(dvar)
 
-	def isexec(path):
-		try:
-			s = os.stat(path)
-		except (os.error, AttributeError):
-			return 0
-		return ((s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH))
-
-	# Return 0 - not elf, 1 - ELF & not stripped, 2 - ELF & stripped
+	# Return type (bits):
+	# 0 - not elf
+	# 1 - ELF
+	# 2 - stripped
+	# 4 - executable
+	# 8 - shared library
 	def isELF(path):
+		type = 0
 		pathprefix = "export PATH=%s; " % bb.data.getVar('PATH', d, True)
 		ret, result = commands.getstatusoutput("%sfile '%s'" % (pathprefix, path))
 
 		if ret:
 			bb.error("split_and_strip_files: 'file %s' failed" % path)
-			return 0
+			return type
 
 		# Not stripped
-		if "ELF" in result and "not stripped" in result:
-			return 1
-
-		# Stripped
 		if "ELF" in result:
-			return 2
+			type |= 1
+			if "not stripped" not in result:
+				type |= 2
+			if "executable" in result:
+				type |= 4
+			if "shared" in result:
+				type |= 8
+		return type
 
-		return 0;
 
 	#
-	# First lets process debug splitting
+	# First lets figure out all of the files we may have to process ... do this only once!
 	#
-	if (bb.data.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', d, True) != '1'):
-		file_links = {}
-
+	file_list = {}
+	file_links = {}
+	if (bb.data.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', d, True) != '1') and \
+	   (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, True) != '1'):
 		for root, dirs, files in os.walk(dvar):
 			for f in files:
 				file = os.path.join(root, f)
-				# Skip debug files, it must be executable, and must be a file (or link)
-				if not (debugappend != "" and file.endswith(debugappend)) and not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and isexec(file) and os.path.isfile(file):
-					src = file[len(dvar):]
-					dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
-					fpath = dvar + dest
-					# Preserve symlinks in debug area...
-					if os.path.islink(file):
-						target = os.readlink(file)
-						if not os.path.isabs(target):
-							target = os.path.join(os.path.dirname(file), target)
-						if isELF(target):
-							ltarget = os.readlink(file)
-							lpath = os.path.dirname(ltarget)
-							lbase = os.path.basename(ltarget)
-							ftarget = ""
-							if lpath and lpath != ".":
-								ftarget += lpath + debugdir + "/"
-							ftarget += lbase + debugappend
-							bb.mkdirhier(os.path.dirname(fpath))
-							#bb.note("Symlink %s -> %s" % (fpath, ftarget))
-							os.symlink(ftarget, fpath)
-						continue
-
-					# If the file is elf we need to check it for hard links
-					elf_file = isELF(file)
-					if elf_file:
-						# Preserve hard links in debug area...
+				# Only process files (and symlinks)... Skip files that are obviously debug files
+				if not (debugappend != "" and file.endswith(debugappend)) and \
+				   not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and \
+				   os.path.isfile(file):
+					try:
 						s = os.stat(file)
-						if s.st_nlink > 1:
-							file_reference = "%d_%d" % (s.st_dev, s.st_ino)
-							if file_reference not in file_links:
-								# If this is new, and already stripped we avoid recording it
-								# as we'll be unable to set the hard link later, because it
-								# won't be split/stripped...
-								if elf_file != 2:
-									file_links[file_reference] = fpath
+					except OSError, (err, strerror):
+						if err != errno.ENOENT:
+							raise
+						# Skip broken symlinks
+						continue
+					# Is the item excutable?  Then we need to process it.
+					if (s[stat.ST_MODE] & stat.S_IXUSR) or \
+					   (s[stat.ST_MODE] & stat.S_IXGRP) or \
+					   (s[stat.ST_MODE] & stat.S_IXOTH):
+						# If it's a symlink, and points to an ELF file, we capture the readlink target
+						if os.path.islink(file):
+							target = os.readlink(file)
+							if not os.path.isabs(target):
+								ltarget = os.path.join(os.path.dirname(file), target)
 							else:
-								bb.mkdirhier(os.path.dirname(fpath))
-								#bb.note("Link %s -> %s" % (fpath, file_links[file_reference]))
-								os.link(file_links[file_reference], fpath)
-								continue
+								ltarget = target
 
-						if elf_file == 2:
-							bb.warn("File '%s' was already stripped, this will prevent future debugging!" % (src))
+							if isELF(ltarget):
+								#bb.note("Sym: %s (%d)" % (ltarget, isELF(ltarget)))
+								file_list[file] = "sym: " + target
 							continue
+						# It's a file (or hardlink), not a link
+						# ...but is it ELF, and is it already stripped?
+						elf_file = isELF(file)
+						if elf_file & 1:
+							# Check if it's a hard link to something else
+							if s.st_nlink > 1:
+								file_reference = "%d_%d" % (s.st_dev, s.st_ino)
+								# Hard link to something else
+								file_list[file] = "hard: " + file_reference
+								continue
 
-						# Split and Strip
-						bb.mkdirhier(os.path.dirname(fpath))
-						#bb.note("Split %s -> %s" % (file, fpath))
-						splitfile(file, fpath, debugsrcdir, d)
+							file_list[file] = "ELF: %d" % elf_file
 
-		# Process the debugsrcdir if requested...
-		splitfile2(debugsrcdir, d)
 
-		# The above may have generated dangling symlinks 
-		for root, dirs, files in os.walk(dvar):
-			for f in files:
-				file = os.path.join(root, f)
-				# We ONLY strip dangling links if they're debug generated!
-				if (debugappend != "" and file.endswith(debugappend)) or (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])):
-					try:
-						s = os.stat(file)
-					except OSError, (err, strerror):
-						if err != errno.ENOENT:
-							raise
-						#bb.note("Remove dangling link %s" % file)
-						os.unlink(file)
+	#
+	# First lets process debug splitting
+	#
+	if (bb.data.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', d, True) != '1'):
+		for file in file_list:
+			src = file[len(dvar):]
+			dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+			fpath = dvar + dest
+			# Preserve symlinks in debug area...
+			if file_list[file].startswith("sym: "):
+				ltarget = file_list[file][5:]
+				lpath = os.path.dirname(ltarget)
+				lbase = os.path.basename(ltarget)
+				ftarget = ""
+				if lpath and lpath != ".":
+					ftarget += lpath + debugdir + "/"
+				ftarget += lbase + debugappend
+				bb.mkdirhier(os.path.dirname(fpath))
+				#bb.note("Symlink %s -> %s" % (fpath, ftarget))
+				os.symlink(ftarget, fpath)
+				continue
+
+			# Preserve hard links in debug area...
+			file_reference = ""
+			if file_list[file].startswith("hard: "):
+				file_reference = file_list[file][6:]
+				if file_reference not in file_links:
+					# If this is a new file, add it as a reference, and
+					# update it's type, so we can fall through and split
+					file_list[file] = "ELF: %d" % (isELF(file))
+				else:
+					target = file_links[file_reference][len(dvar):]
+					ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
+					bb.mkdirhier(os.path.dirname(fpath))
+					#bb.note("Link %s -> %s" % (fpath, ftarget))
+					os.link(ftarget, fpath)
+					continue
 
+			# It's ELF...
+			if file_list[file].startswith("ELF: "):
+				elf_file = int(file_list[file][5:])
+				if elf_file & 2:
+					bb.warn("File '%s' was already stripped, this will prevent future debugging!" % (src))
+					continue
+
+				# Split the file...
+				bb.mkdirhier(os.path.dirname(fpath))
+				#bb.note("Split %s -> %s" % (file, fpath))
+				# Only store off the hard link reference if we successfully split!
+				if splitfile(file, fpath, debugsrcdir, d) == 0 and file_reference != "":
+					file_links[file_reference] = file
+
+		# The above may have generated dangling symlinks, remove them!
+		# Dangling symlinks are a result of something NOT being split, such as a stripped binary.
+		# This should be a rare occurance, but we want to clean up anyway.
+		for file in file_list:
+			if file_list[file].startswith("sym: "):
+				src = file[len(dvar):]
+				dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+				fpath = dvar + dest
+				try:
+					s = os.stat(fpath)
+				except OSError, (err, strerror):
+					if err != errno.ENOENT:
+						raise
+					#bb.note("Remove dangling link %s -> %s" % (fpath, os.readlink(fpath)))
+					os.unlink(fpath)
+					# This could leave an empty debug directory laying around
+					# take care of the obvious case...
+					os.system("rmdir %s 2>/dev/null" % os.path.dirname(fpath))
+
+		# Process the debugsrcdir if requested...
+		# This copies and places the referenced sources for later debugging...
+		splitfile2(debugsrcdir, d)
 	#
 	# End of debug splitting
 	#
@@ -521,15 +571,11 @@ python split_and_strip_files () {
 	# Now lets go back over things and strip them
 	#
 	if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, True) != '1'):	
-		for root, dirs, files in os.walk(dvar):
-			for f in files:
-				file = os.path.join(root, f)
-				# if not a debugfile, is executable, is a file, and not a symlink
-				if not (debugappend != "" and file.endswith(debugappend)) and not (debugdir != "" and debugdir in os.path.dirname(file[len(dvar):])) and isexec(file) and os.path.isfile(file) and not os.path.islink(file):
-					elf_file = isELF(file)
-					if elf_file and elf_file != 2:
-						#bb.note("Strip %s" % file)
-						runstrip(file, d)
+		for file in file_list:
+			if file_list[file].startswith("ELF: "):
+				elf_file = int(file_list[file][5:])
+				#bb.note("Strip %s" % file)
+				runstrip(file, elf_file, d)
 	#
 	# End of strip
 	#
-- 
1.6.6.1



