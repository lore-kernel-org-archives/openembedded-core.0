Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbDlY-0008Nz-Jo
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 17:30:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5RFQh6s015883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 08:26:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 27 Jun 2011 08:26:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 10:26:57 -0500
Message-ID: <fc7bff2638f87440cc991bed6eedcd4d2e75f3ae.1309188064.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309188064.git.mark.hatle@windriver.com>
References: <cover.1309188064.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/2] classes/package.bbclass: Add fixup_perms (V2)
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
X-List-Received-Date: Mon, 27 Jun 2011 15:30:25 -0000
Content-Type: text/plain

Add a new function that is responsible for fixing directory and file
permissions, owners and groups during the packaging process.  This will fix
various issues where two packages may create the same directory and end up
with different permissions, owner and/or group.

The issue being resolved is that if two packages conflict in their ownership
of a directory, the first installed into the rootfs sets the permissions.
This leads to a least potentially non-deterministic filesystems, at worst
security defects.

The user can specify their own settings via the configuration files
specified in FILESYSTEM_PERMS_TABLES.  If this is not defined, it will
fall back to loading files/fs-perms.txt from BBPATH.  The format of this
file is documented within the file.

By default all of the system directories, specified in bitbake.conf, will
be fixed to be 0755, root, root.

The fs-perms.txt contains a few default entries to correct documentation,
locale, headers and debug sources.  It was discovered these are often
incorrect due to being directly copied from the build user environment.

The entries needed to match the base-files package have also been added.

Also tweak a couple of warnings to provide more diagnostic information.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |  253 ++++++++++++++++++++++++++++++++++++++++--
 meta/files/fs-perms.txt      |   69 ++++++++++++
 2 files changed, 312 insertions(+), 10 deletions(-)
 create mode 100644 meta/files/fs-perms.txt

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8f91c95..0161c68 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -16,24 +16,26 @@
 # d) split_and_strip_files - split the files into runtime and debug and strip them.
 #    Debug files include debug info split, and associated sources that end up in -dbg packages
 #
-# e) populate_packages - Split the files in PKGD into separate packages in PKGDEST/<pkgname>
+# e) fixup_perms - Fix up permissions in the package before we split it.
+#
+# f) populate_packages - Split the files in PKGD into separate packages in PKGDEST/<pkgname>
 #    Also triggers the binary stripping code to put files in -dbg packages.
 #
-# f) package_do_filedeps - Collect perfile run-time dependency metadata
+# g) package_do_filedeps - Collect perfile run-time dependency metadata
 #    The data is stores in FILER{PROVIDES,DEPENDS}_file_pkg variables with
 #    a list of affected files in FILER{PROVIDES,DEPENDS}FLIST_pkg
 #
-# g) package_do_shlibs - Look at the shared libraries generated and autotmatically add any 
+# h) package_do_shlibs - Look at the shared libraries generated and autotmatically add any 
 #    depenedencies found. Also stores the package name so anyone else using this library 
 #    knows which package to depend on.
 #
-# h) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
+# i) package_do_pkgconfig - Keep track of which packages need and provide which .pc files
 #
-# i) read_shlibdeps - Reads the stored shlibs information into the metadata
+# j) read_shlibdeps - Reads the stored shlibs information into the metadata
 #
-# j) package_depchains - Adds automatic dependencies to -dbg and -dev packages
+# k) package_depchains - Adds automatic dependencies to -dbg and -dev packages
 #
-# k) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later 
+# l) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later 
 #    packaging steps
 
 inherit packagedata
@@ -237,7 +239,7 @@ def splitfile2(debugsrcdir, d):
        # We need to ignore files that are not actually ours
        # we do this by only paying attention to items from this package
        processdebugsrc += "fgrep -z '%s' | "
-       processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
+       processdebugsrc += "(cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)"
 
        os.system(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
 
@@ -410,10 +412,239 @@ python perform_packagecopy () {
 	os.system('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar))
 }
 
+# We generate a master list of directories to process, we start by
+# seeding this list with reasonable defaults, then load from
+# the fs-perms.txt files
+python fixup_perms () {
+	import os, pwd, grp
+
+	# init using a string with the same format as a line as documented in
+	# the fs-perms.txt file
+	# <path> <mode> <uid> <gid> <walk> <fmode> <fuid> <fgid>
+	# <path> link <link target>
+	#
+	# __str__ can be used to print out an entry in the input format
+	#
+	# if fs_perms_entry.path is None:
+	#	an error occured
+	# if fs_perms_entry.link, you can retrieve:
+	#	fs_perms_entry.path = path
+	#	fs_perms_entry.link = target of link
+	# if not fs_perms_entry.link, you can retrieve:
+	#	fs_perms_entry.path = path
+	#	fs_perms_entry.mode = expected dir mode or None
+	#	fs_perms_entry.uid = expected uid or -1
+	#	fs_perms_entry.gid = expected gid or -1
+	#	fs_perms_entry.walk = 'true' or something else
+	#	fs_perms_entry.fmode = expected file mode or None
+	#	fs_perms_entry.fuid = expected file uid or -1
+	#	fs_perms_entry_fgid = expected file gid or -1
+	class fs_perms_entry():
+		def __init__(self, line):
+			lsplit = line.split()
+			if len(lsplit) == 3 and lsplit[1].lower() == "link":
+				self._setlink(lsplit[0], lsplit[2])
+			elif len(lsplit) == 8:
+				self._setdir(lsplit[0], lsplit[1], lsplit[2], lsplit[3], lsplit[4], lsplit[5], lsplit[6], lsplit[7])
+			else:
+				bb.error("Fixup Perms: invalid config line %s" % line)
+				self.path = None
+				self.link = None
+
+		def _setdir(self, path, mode, uid, gid, walk, fmode, fuid, fgid):
+			self.path = os.path.normpath(path)
+			self.link = None
+			self.mode = self._procmode(mode)
+			self.uid  = self._procuid(uid)
+			self.gid  = self._procgid(gid)
+			self.walk = walk.lower()
+			self.fmode = self._procmode(fmode)
+			self.fuid = self._procuid(fuid)
+			self.fgid = self._procgid(fgid)
+
+		def _setlink(self, path, link):
+			self.path = os.path.normpath(path)
+			self.link = link
+
+		def _procmode(self, mode):
+			if not mode or (mode and mode == "-"):
+				return None
+			else:
+				return int(mode,8)
+
+		# Note uid/gid -1 has special significance in os.chown
+		def _procuid(self, uid):
+			if uid is None or uid == "-":
+				return -1
+			elif uid.isdigit():
+				return int(uid)
+			else:
+				return pwd.getpwnam(uid).pw_uid
+
+		def _procgid(self, gid):
+			if gid is None or gid == "-":
+				return -1
+			elif gid.isdigit():
+				return int(gid)
+			else:
+				return grp.getgrnam(gid).gr_gid
+
+		# Use for debugging the entries
+		def __str__(self):
+			if self.link:
+				return "%s link %s" % (self.path, self.link)
+			else:
+				mode = "-"
+				if self.mode:
+					mode = "0%o" % self.mode
+				fmode = "-"
+				if self.fmode:
+					fmode = "0%o" % self.fmode
+				uid = self._mapugid(self.uid)
+				gid = self._mapugid(self.gid)
+				fuid = self._mapugid(self.fuid)
+				fgid = self._mapugid(self.fgid)
+				return "%s %s %s %s %s %s %s %s" % (self.path, mode, uid, gid, self.walk, fmode, fuid, fgid)
+
+		def _mapugid(self, id):
+			if id is None or id == -1:
+				return "-"
+			else:
+				return "%d" % id
+
+	# Fix the permission, owner and group of path
+	def fix_perms(path, mode, uid, gid, dir):
+		if mode:
+			#bb.note("Fixup Perms: chmod 0%o %s" % (mode, dir))
+			os.chmod(path, mode)
+		# -1 is a special value that means don't change the uid/gid
+		# if they are BOTH -1, don't bother to chown
+		if not (uid == -1 and gid == -1):
+			#bb.note("Fixup Perms: chown %d:%d %s" % (uid, gid, dir))
+			os.chown(path, uid, gid)
+
+	# Return a list of configuration files based on either the default
+	# files/fs-perms.txt or the contents of FILESYSTEM_PERMS_TABLES
+	# paths are resolved via BBPATH
+	def get_fs_perms_list(d):
+		str = ""
+		fs_perms_tables = bb.data.getVar('FILESYSTEM_PERMS_TABLES', d, True)
+		if not fs_perms_tables:
+			fs_perms_tables = 'files/fs-perms.txt'
+		for conf_file in fs_perms_tables.split():
+			str += " %s" % bb.which(bb.data.getVar('BBPATH', d, True), conf_file)
+		return str
+
+
+
+	dvar = bb.data.getVar('PKGD', d, True)
+
+	fs_perms_table = {}
+
+	# By default all of the standard directories specified in
+	# bitbake.conf will get 0755 root:root.
+	target_path_vars = [	'base_prefix',
+				'prefix',
+				'exec_prefix',
+				'base_bindir',
+				'base_sbindir',
+				'base_libdir',
+				'datadir',
+				'sysconfdir',
+				'servicedir',
+				'sharedstatedir',
+				'localstatedir',
+				'infodir',
+				'mandir',
+				'docdir',
+				'bindir',
+				'sbindir',
+				'libexecdir',
+				'libdir',
+				'includedir',
+				'oldincludedir' ]
+
+	for path in target_path_vars:
+		dir = bb.data.getVar(path, d, True) or ""
+		if dir == "":
+			continue
+		fs_perms_table[dir] = fs_perms_entry(bb.data.expand("%s 0755 root root false - - -" % (dir), d))
+
+	# Now we actually load from the configuration files
+	for conf in get_fs_perms_list(d).split():
+		if os.path.exists(conf):
+			f = open(conf)
+			for line in f:
+				if line.startswith('#'):
+					continue
+				lsplit = line.split()
+				if len(lsplit) == 0:
+					continue
+				if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
+					bb.error("Fixup perms: %s invalid line: %s" % (conf, line))
+					continue
+				entry = fs_perms_entry(bb.data.expand(line, d))
+				if entry and entry.path:
+					fs_perms_table[entry.path] = entry
+			f.close()
+
+	# Debug -- list out in-memory table
+	#for dir in fs_perms_table:
+	#	bb.note("Fixup Perms: %s: %s" % (dir, str(fs_perms_table[dir])))
+
+	# We process links first, so we can go back and fixup directory ownership
+	# for any newly created directories
+	for dir in fs_perms_table:
+		if not fs_perms_table[dir].link:
+			continue
+
+		origin = dvar + dir
+		if not (os.path.exists(origin) and os.path.isdir(origin) and not os.path.islink(origin)):
+			continue
+
+		link = fs_perms_table[dir].link
+		if link[0] == "/":
+			target = dvar + link
+			ptarget = link
+		else:
+			target = os.path.join(os.path.dirname(origin), link)
+			ptarget = os.path.join(os.path.dirname(dir), link)
+		if os.path.exists(target):
+			bb.error("Fixup Perms: Unable to correct directory link, target already exists: %s -> %s" % (dir, ptarget))
+			continue
+
+		# Create path to move directory to, move it, and then setup the symlink
+		bb.mkdirhier(os.path.dirname(target))
+		#bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
+		os.rename(origin, target)
+		#bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
+		os.symlink(link, origin)
+
+	for dir in fs_perms_table:
+		if fs_perms_table[dir].link:
+			continue
+
+		origin = dvar + dir
+		if not (os.path.exists(origin) and os.path.isdir(origin)):
+			continue
+
+		fix_perms(origin, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
+
+		if fs_perms_table[dir].walk == 'true':
+			for root, dirs, files in os.walk(origin):
+				for dr in dirs:
+					each_dir = os.path.join(root, dr)
+					fix_perms(each_dir, fs_perms_table[dir].mode, fs_perms_table[dir].uid, fs_perms_table[dir].gid, dir)
+				for f in files:
+					each_file = os.path.join(root, f)
+					fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
+}
+
 python split_and_strip_files () {
 	import commands, stat, errno
 
 	dvar = bb.data.getVar('PKGD', d, True)
+	pn = bb.data.getVar('PN', d, True)
 
 	# We default to '.debug' style
 	if bb.data.getVar('PACKAGE_DEBUG_SPLIT_STYLE', d, True) == 'debug-file-directory':
@@ -551,7 +782,7 @@ python split_and_strip_files () {
 			if file_list[file].startswith("ELF: "):
 				elf_file = int(file_list[file][5:])
 				if elf_file & 2:
-					bb.warn("File '%s' was already stripped, this will prevent future debugging!" % (src))
+					bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (src, pn))
 					continue
 
 				# Split the file...
@@ -690,7 +921,7 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.warn("the following files were installed but not shipped in any package:")
+		bb.warn("the following files were installed but not shipped in any package: %s" % pn)
 		for f in unshipped:
 			bb.warn("  " + f)
 
@@ -1373,6 +1604,7 @@ PACKAGEFUNCS ?= "package_get_auto_pr \
                 ${PACKAGE_PREPROCESS_FUNCS} \
 		package_do_split_locales \
 		split_and_strip_files \
+		fixup_perms \
 		populate_packages \
 		package_do_filedeps \
 		package_do_shlibs \
@@ -1400,6 +1632,7 @@ python do_package () {
 	for f in (bb.data.getVar('PACKAGEFUNCS', d, True) or '').split():
 		bb.build.exec_func(f, d)
 }
+
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
 addtask package before do_build after do_install
 
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
new file mode 100644
index 0000000..f5a2b69
--- /dev/null
+++ b/meta/files/fs-perms.txt
@@ -0,0 +1,69 @@
+# This file contains a list of files and directories with known permissions.
+# It is used by the packaging class to ensure that the permissions, owners and
+# group of listed files and directories are in sync across the system.
+#
+# The format of this file 
+#
+#<path>	<mode>	<uid>	<gid>	<walk>	<fmode>	<fuid>	<fgid>
+#
+# or
+#
+#<path> link <target>
+#
+# <path>: directory path
+# <mode>: mode for directory
+# <uid>:  uid for directory
+# <gid>:  gid for directory
+# <walk>: recursively walk the directory?  true or false
+# <fmode>: if walking, new mode for files
+# <fuid>:  if walking, new uid for files
+# <fgid>:  if walking, new gid for files
+# <target>: turn the directory into a symlink point to target
+#
+# in mode, uid or gid, a "-" means don't change any existing values
+#
+# /usr/src		0755	root	root	false	-	-	-
+# /usr/share/man	0755	root	root	true	0644	root	root
+
+# Note: all standard config directories are automatically assigned "0755 root root false - - -"
+
+# Documentation should always be corrected
+${mandir}		0755	root	root	true	0644	root	root
+${infodir}		0755	root	root	true	0644	root	root
+${docdir}		0755	root	root	true	0644	root	root
+${datadir}/gtk-doc	0755	root	root	true	0644	root	root
+
+# Fixup locales
+${datadir}/locale	0755	root	root	true	0644	root	root
+
+# Cleanup headers
+${includedir}		0755	root	root	true	0644	root	root
+${oldincludedir}	0755	root	root	true	0644	root	root
+
+# Cleanup debug src
+/usr/src/debug		0755	root	root	true	0644	root	root
+
+# Items from base-files
+# Links
+${localstatedir}/cache	link	volatile/cache
+${localstatedir}/run	link	volatile/run
+${localstatedir}/log	link	volatile/log
+${localstatedir}/lock	link	volatile/lock
+${localstatedir}/tmp	link	volatile/tmp
+
+# Special permissions from base-files
+# Set 1777
+/tmp				01777	root	root	false - - -
+${localstatedir}/volatile/lock	01777	root	root	false - - -
+${localstatedir}/volatile/tmp	01777	root	root	false - - -
+
+# Set 2775
+/home				02755	root	root	false - - -
+${prefix}/src			02755	root	root	false - - -
+${localstatedir}/local		02755	root	root	false - - -
+
+# Set 3755
+/srv				0755	root	root	false - - -
+
+# Set 4775
+/var/mail			02755	root	root	false - - -
-- 
1.7.3.4



