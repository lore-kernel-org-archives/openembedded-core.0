Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZWds-0007x8-95
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 01:15:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MNBqql018370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 16:11:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 16:11:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 18:23:27 -0500
Message-ID: <da73d7372f0d641c67b0134ee2b23c6791bb43fe.1308784531.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308784531.git.mark.hatle@windriver.com>
References: <cover.1308784531.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/4] classes/package.bbclass: Add fixup_perms
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
X-List-Received-Date: Wed, 22 Jun 2011 23:15:28 -0000
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

Also tweak a couple of warnings to provide more diagnostic information.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |  168 +++++++++++++++++++++++++++++++++++++++---
 meta/files/fs-perms.txt      |   39 ++++++++++
 2 files changed, 197 insertions(+), 10 deletions(-)
 create mode 100644 meta/files/fs-perms.txt

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8f91c95..3727868 100644
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
 
@@ -410,10 +412,154 @@ python perform_packagecopy () {
 	os.system('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar))
 }
 
+# We generate a master list of directories to process, we start by
+# seeding this list with reasonable defaults, then load from
+# the fs-perms.txt files
+python fixup_perms () {
+	import stat, pwd, grp
+
+	def get_fs_perms_list(d):
+		str = ""
+		fs_perms_tables = bb.data.getVar('FILESYSTEM_PERMS_TABLES', d, True)
+		if not fs_perms_tables:
+			fs_perms_tables = 'files/fs-perms.txt'
+		for fs_perms_table in fs_perms_tables.split():
+			str += " %s" % bb.which(bb.data.getVar('BBPATH', d, True), fs_perms_table)
+		return str
+
+	def set_fs_perms_table(line, d):
+		line = bb.data.expand(line, d)
+		lsplit = line.split()
+		dir = lsplit[0]
+		if lsplit[1] is "-":
+			fs_perms_mode[dir] = -1
+		else:
+			fs_perms_mode[dir] = int(lsplit[1],8)
+		if lsplit[2] is "-":
+			fs_perms_uid[dir] = -1
+		elif lsplit[2].isdigit():
+			fs_perms_uid[dir] = int(lsplit[2])
+		else:
+			fs_perms_uid[dir] = pwd.getpwnam(lsplit[2]).pw_uid
+		if lsplit[3] is "-":
+			fs_perms_gid[dir] = -1
+		elif lsplit[3].isdigit():
+			fs_perms_gid[dir] = int(lsplit[3])
+		else:
+			fs_perms_gid[dir] = grp.getgrnam(lsplit[3]).gr_gid
+		if lsplit[4].lower() == 'true':
+			fs_perms_walk[dir] = 'true'
+		else:
+			fs_perms_walk[dir] = 'false'
+		if lsplit[5] is "-":
+			fs_perms_fmode[dir] = -1
+		else:
+			fs_perms_fmode[dir] = int(lsplit[5],8)
+		if lsplit[6] is "-":
+			fs_perms_fuid[dir] = -1
+		elif lsplit[6].isdigit():
+			fs_perms_fuid[dir] = int(lsplit[6])
+		else:
+			fs_perms_fuid[dir] = pwd.getpwnam(lsplit[6]).pw_uid
+		if lsplit[7] is "-":
+			fs_perms_fgid[dir] = -1
+		elif lsplit[7].isdigit():
+			fs_perms_fgid[dir] = int(lsplit[7])
+		else:
+			fs_perms_fgid[dir] = grp.getgrnam(lsplit[7]).gr_gid
+
+	dvar = bb.data.getVar('PKGD', d, True)
+
+	fs_perms_mode = {}
+	fs_perms_uid = {}
+	fs_perms_gid = {}
+	fs_perms_walk = {}
+	fs_perms_fmode = {}
+	fs_perms_fuid = {}
+	fs_perms_fgid = {}
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
+		dir = bb.data.getVar(path, d, True)
+		if not dir or dir is "":
+			continue
+		set_fs_perms_table("%s 0755 root root false - - -" % dir, d)
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
+				if len(lsplit) != 8:
+					bb.error("Fixup perms: %s invalid line: %s" % (conf, line))
+					continue
+				set_fs_perms_table(line, d)
+			f.close()
+
+	# Debug -- list out in-memory table
+	#for dir in fs_perms_mode:
+	#	bb.note("%s 0%o %d %d %s 0%o %d %d" % \
+	#		(dir, fs_perms_mode[dir], fs_perms_uid[dir], fs_perms_gid[dir], fs_perms_walk[dir], \
+	#			fs_perms_fmode[dir], fs_perms_fuid[dir], fs_perms_fgid[dir]))
+
+	for dir in fs_perms_mode:
+		if (dir and os.path.exists(dvar + dir) and os.path.isdir(dvar + dir)):
+			#bb.note("Fixup Perms: %s 0%o %d %d" % (dir, fs_perms_mode[dir], fs_perms_uid[dir], fs_perms_gid[dir]))
+			if fs_perms_mode[dir] != -1:
+				os.chmod(dvar + dir, fs_perms_mode[dir])
+			if fs_perms_uid[dir] != -1 and fs_perms_gid[dir] != -1:
+				os.chown(dvar + dir, fs_perms_uid[dir], fs_perms_gid[dir])
+
+			if fs_perms_walk[dir] == 'true':
+				for root, dirs, files in os.walk(dvar + dir):
+					for dr in dirs:
+						each_dir = os.path.join(root, dr)
+						#bb.note("Fixup Perms: %s 0%o %d %d" % (each_dir.replace(dvar, "", 1), fs_perms_mode[dir], fs_perms_uid[dir], fs_perms_gid[dir]))
+						if fs_perms_mode[dir] != -1:
+							os.chmod(each_dir, fs_perms_mode[dir])
+						if fs_perms_uid[dir] != -1 and fs_perms_gid[dir] != -1:
+							os.chown(each_dir, fs_perms_uid[dir], fs_perms_gid[dir])
+					for f in files:
+						each_file = os.path.join(root, f)
+						#bb.note("Fixup Perms: %s 0%o %d %d" % (each_file.replace(dvar, "", 1), fs_perms_fmode[dir], fs_perms_fuid[dir], fs_perms_fgid[dir]))
+						if fs_perms_fmode[dir] != -1:
+							os.chmod(each_file, fs_perms_fmode[dir])
+						if fs_perms_uid[dir] != -1 and fs_perms_gid[dir] != -1:
+							os.chown(each_file, fs_perms_fuid[dir], fs_perms_fgid[dir])
+}
+
 python split_and_strip_files () {
 	import commands, stat, errno
 
 	dvar = bb.data.getVar('PKGD', d, True)
+	pn = bb.data.getVar('PN', d, True)
 
 	# We default to '.debug' style
 	if bb.data.getVar('PACKAGE_DEBUG_SPLIT_STYLE', d, True) == 'debug-file-directory':
@@ -551,7 +697,7 @@ python split_and_strip_files () {
 			if file_list[file].startswith("ELF: "):
 				elf_file = int(file_list[file][5:])
 				if elf_file & 2:
-					bb.warn("File '%s' was already stripped, this will prevent future debugging!" % (src))
+					bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (src, pn))
 					continue
 
 				# Split the file...
@@ -690,7 +836,7 @@ python populate_packages () {
 				unshipped.append(path)
 
 	if unshipped != []:
-		bb.warn("the following files were installed but not shipped in any package:")
+		bb.warn("the following files were installed but not shipped in any package: %s" % pn)
 		for f in unshipped:
 			bb.warn("  " + f)
 
@@ -1373,6 +1519,7 @@ PACKAGEFUNCS ?= "package_get_auto_pr \
                 ${PACKAGE_PREPROCESS_FUNCS} \
 		package_do_split_locales \
 		split_and_strip_files \
+		fixup_perms \
 		populate_packages \
 		package_do_filedeps \
 		package_do_shlibs \
@@ -1400,6 +1547,7 @@ python do_package () {
 	for f in (bb.data.getVar('PACKAGEFUNCS', d, True) or '').split():
 		bb.build.exec_func(f, d)
 }
+
 do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK} ${D}"
 addtask package before do_build after do_install
 
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
new file mode 100644
index 0000000..f00bff3
--- /dev/null
+++ b/meta/files/fs-perms.txt
@@ -0,0 +1,39 @@
+# This file contains a list of files and directories with known permissions.
+# It is used by the packaging class to ensure that the permissions, owners and
+# group of listed files and directories are in sync across the system.
+#
+# The format of this file 
+#
+#<path>	<mode>	<uid>	<gid>	<walk>	<fmode>	<fuid>	<fgid>
+#
+# <path>: directory path
+# <mode>: mode for directory
+# <uid>:  uid for directory
+# <gid>:  gid for directory
+# <walk>: recursively walk the directory?  true or false
+# <fmode>: if walking, new mode for files
+# <fuid>:  if walking, new uid for files
+# <fgid>:  if walking, new gid for files
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
-- 
1.7.3.4



