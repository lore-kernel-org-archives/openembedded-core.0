Received: from ecbiz66.inmotionhosting.com ([69.174.114.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <juraj.hercek@jhksoftware.com>) id 1Rcych-0000pE-VR
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 13:16:48 +0100
Received: from mail.hck.sk ([87.197.106.197]:57547 helo=localhost.localdomain)
	by ecbiz66.inmotionhosting.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <juraj.hercek@jhksoftware.com>)
	id 1Rcxye-0008Qd-9J; Tue, 20 Dec 2011 06:35:24 -0500
From: Juraj Hercek <juraj.hercek@jhksoftware.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 12:34:57 +0100
Message-Id: <1324380897-11620-1-git-send-email-juraj.hercek@jhksoftware.com>
X-Mailer: git-send-email 1.7.2.5
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - ecbiz66.inmotionhosting.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - jhksoftware.com
Subject: [PATCH] package.bbclass: fix shared library symlink snapping
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
X-List-Received-Date: Tue, 20 Dec 2011 12:16:48 -0000

When PACKAGE_SNAP_LIB_SYMLINK is enabled, development packages (-dev)
contained dangling symbolic links which prevented usage of snapped
libraries on development machines with installed toolchain and snapped
-dev package(s).

Good solution to the problem mentioned above is to decouple shared
library object snapping from dependency computation and put it into
separate function which is executed before the package splitting is
done. This way we have all relevant files available and can do all
necessary queries to library files.

Signed-off-by: Juraj Hercek <juraj.hercek@jhksoftware.com>
---
 meta/classes/package.bbclass |   85 ++++++++++++++++++++++++++++++++++++-----
 1 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 39c1d4b..9acc745 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -11,6 +11,13 @@
 #
 # b) perform_packagecopy - Copy D into PKGD
 #
+# b.1) package_snap_lib_symlinks - snap lib symlinks when PACKAGE_SNAP_LIB_SYMLINKS is enabled.
+#      Runtime optimisation of shared object libraries is used when you use
+#      PACKAGE_SNAP_LIB_SYMLINKS = "1" in distribution configuration file. It
+#      causes removal of symbolic link indirection in final image thus speeding
+#      up loading of shared library object as well as saving inode and
+#      directory entry in file system.
+#
 # c) package_do_split_locales - Split out the locale files, updates FILES and PACKAGES
 #
 # d) split_and_strip_files - split the files into runtime and debug and strip them.
@@ -433,6 +440,72 @@ python perform_packagecopy () {
 	os.system('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar))
 }
 
+python package_snap_lib_symlinks () {
+	"""
+	Snapping of shared libraries symbolic links consists of 2 steps:
+	1) renaming shared library file so that its file name is equal to DT_SONAME
+	   See http://en.wikipedia.org/wiki/Soname for more information.
+	2) fixing of any dangling symbolic links that could be the result of previous step
+	"""
+	import re
+	import os.path as p
+
+	def get_soname(exefile):
+		cmd = d.getVar('OBJDUMP', True) + " -p " + exefile + " 2>/dev/null"
+		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
+		fd = os.popen(cmd)
+		lines = fd.readlines()
+		fd.close()
+		for l in lines:
+			m = re.match("\s+SONAME\s+([^\s]*)", l)
+			if m:
+				return m.group(1)
+		return p.basename(exefile)
+
+	def get_cached_soname(exefile):
+		realfile = p.realpath(exefile)
+		if get_cached_soname.cache.has_key(realfile):
+			return get_cached_soname.cache[realfile]
+		else:
+			soname = get_soname(realfile)
+			get_cached_soname.cache[realfile] = soname
+			return soname
+	get_cached_soname.cache = dict()
+
+	def is_cyclic_symlink(target, link):
+		link_normpath = p.normpath(link)
+		if p.isabs(target):
+			return p.normpath(target) == link_normpath
+		else:
+			return p.normpath(p.join(p.dirname(link), target)) == link_normpath
+
+	top = d.getVar('PKGD', True)
+	lib_re = re.compile("^.*\.so")
+	symlinks = list()
+	renames = list()
+	for root, dirs, files in os.walk(top):
+		for file in files:
+			path = p.join(root, file)
+			if p.islink(path):
+				link_target = os.readlink(path)
+				link_target_file = p.basename(link_target)
+				if lib_re.match(link_target_file):
+					soname = get_cached_soname(path)
+					if link_target_file != soname:
+						new_target = link_target.replace(link_target_file,soname)
+						if not is_cyclic_symlink(new_target, path):
+							symlinks.append((new_target, path))
+			elif os.access(path, os.X_OK) or lib_re.match(file):
+				soname = get_cached_soname(path)
+				if file != soname:
+					renames.append((path, p.join(root, soname)))
+	for old, new in renames:
+		os.rename(old, new)
+	for src, dst in symlinks:
+		os.unlink(dst)
+		os.symlink(src, dst)
+}
+
 # We generate a master list of directories to process, we start by
 # seeding this list with reasonable defaults, then load from
 # the fs-perms.txt files
@@ -1237,8 +1310,6 @@ python package_do_shlibs() {
 						sonames.append(this_soname)
 				if libdir_re.match(root):
 					needs_ldconfig = True
-				if snap_symlinks and (file != this_soname):
-					renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
 
 	def darwin_so(root, path, file):
 		fullpath = os.path.join(root, file)
@@ -1302,11 +1373,6 @@ python package_do_shlibs() {
 								needed[pkg].append(name)
 								#bb.note("Adding %s for %s" % (name, pkg))
 
-	if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
-		snap_symlinks = True
-	else:
-		snap_symlinks = False
-
 	if (d.getVar('USE_LDCONFIG', True) or "1") == "1":
 		use_ldconfig = True
 	else:
@@ -1327,7 +1393,6 @@ python package_do_shlibs() {
 
 		needed[pkg] = []
 		sonames = list()
-		renames = list()
 		top = os.path.join(pkgdest, pkg)
 		for root, dirs, files in os.walk(top):
 			for file in files:
@@ -1339,9 +1404,6 @@ python package_do_shlibs() {
 					darwin_so(root, dirs, file)
 				elif os.access(path, os.X_OK) or lib_re.match(file):
 					linux_so(root, dirs, file)
-		for (old, new) in renames:
-		    	bb.note("Renaming %s to %s" % (old, new))
-			os.rename(old, new)
 		shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
 		shver_file = os.path.join(shlibswork_dir, pkg + ".ver")
 		if len(sonames):
@@ -1664,6 +1726,7 @@ PACKAGE_PREPROCESS_FUNCS ?= ""
 PACKAGEFUNCS ?= "package_get_auto_pr \	
                 perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
+		${@['','package_snap_lib_symlinks'][d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == '1']} \
 		package_do_split_locales \
 		split_and_strip_files \
 		fixup_perms \
-- 
1.7.2.5



