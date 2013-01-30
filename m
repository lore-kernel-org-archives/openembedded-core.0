Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ycm-0002FG-Nw
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:53 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE662u007211; Wed, 30 Jan 2013 14:06:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id slwTehqC3pP5; Wed, 30 Jan 2013 14:06:11 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE64S4007195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:06 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE0-00083n-Ta; Wed, 30 Jan 2013 14:01:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:07 +0000
Message-Id: <c04dd25b3f0dbf7caf5b16ad625d15557ede0c19.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/17] package: Create global package file list and use throughout PACKAGEFUNCS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 14:45:15 -0000

Currently we do a signficant amount of tree traversal in many different places
which in inefficient. We can assume that the files don't change and cache the
file list which gives an efficiency improvement which this patch does using
a global variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass |   11 +++---
 meta/classes/debian.bbclass       |   28 +++++++------
 meta/classes/insane.bbclass       |    4 +-
 meta/classes/package.bbclass      |   78 +++++++++++++++++++------------------
 4 files changed, 60 insertions(+), 61 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4b80f07..a6fbd68 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -199,12 +199,11 @@ python buildhistory_emit_pkghistory() {
         pkgdestpkg = os.path.join(pkgdest, pkg)
         filelist = []
         pkginfo.size = 0
-        for root, dirs, files in os.walk(pkgdestpkg):
-            relpth = os.path.relpath(root, pkgdestpkg)
-            for f in files:
-                fstat = os.lstat(os.path.join(root, f))
-                pkginfo.size += fstat.st_size
-                filelist.append(os.sep + os.path.join(relpth, f))
+        for f in pkgfiles[pkg]:
+            relpth = os.path.relpath(f, pkgdestpkg)
+            fstat = os.lstat(f)
+            pkginfo.size += fstat.st_size
+            filelist.append(os.sep + relpth)
         filelist.sort()
         pkginfo.filelist = " ".join(filelist)
 
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 45f01e4..d7ea151 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -51,23 +51,21 @@ python debian_package_name_hook () {
         sonames = []
         has_bins = 0
         has_libs = 0
-        pkg_dir = os.path.join(pkgdest, orig_pkg)
-        for root, dirs, files in os.walk(pkg_dir):
-            if bin_re.match(root) and files:
+        for file in pkgfiles[orig_pkg]:
+            root = os.path.dirname(file)
+            if bin_re.match(root):
                 has_bins = 1
-            if lib_re.match(root) and files:
+            if lib_re.match(root):
                 has_libs = 1
-                for f in files:
-                    if so_re.match(f):
-                        fp = os.path.join(root, f)
-                        cmd = (d.getVar('TARGET_PREFIX', True) or "") + "objdump -p " + fp + " 2>/dev/null"
-                        fd = os.popen(cmd)
-                        lines = fd.readlines()
-                        fd.close()
-                        for l in lines:
-                            m = re.match("\s+SONAME\s+([^\s]*)", l)
-                            if m and not m.group(1) in sonames:
-                                sonames.append(m.group(1))
+                if so_re.match(os.path.basename(file)):
+                    cmd = (d.getVar('TARGET_PREFIX', True) or "") + "objdump -p " + file + " 2>/dev/null"
+                    fd = os.popen(cmd)
+                    lines = fd.readlines()
+                    fd.close()
+                    for l in lines:
+                        m = re.match("\s+SONAME\s+([^\s]*)", l)
+                        if m and not m.group(1) in sonames:
+                            sonames.append(m.group(1))
 
         bb.debug(1, 'LIBNAMES: pkg %s libs %d bins %d sonames %s' % (orig_pkg, has_libs, has_bins, sonames))
         soname = None
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 015abd5..f532a53 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -660,9 +660,7 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
 
     warnings = []
     errors = []
-    for root, dirs, files in os.walk(path):
-        for file in files:
-            path = os.path.join(root,file)
+    for path in pkgfiles[package]:
             elf = oe.qa.ELFFile(path)
             try:
                 elf.open()
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1ccac9c..5f6cf80 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1049,9 +1049,7 @@ python package_fixsymlinks () {
         dangling_links[pkg] = []
         pkg_files[pkg] = []
         inst_root = os.path.join(pkgdest, pkg)
-        for root, dirs, files in os.walk(inst_root):
-            for f in files:
-                path = os.path.join(root, f)
+        for path in pkgfiles[pkg]:
                 rpath = path[len(inst_root):]
                 pkg_files[pkg].append(rpath)
                 try:
@@ -1061,7 +1059,7 @@ python package_fixsymlinks () {
                         raise
                     target = os.readlink(path)
                     if target[0] != '/':
-                        target = os.path.join(root[len(inst_root):], target)
+                        target = os.path.join(os.path.dirname(path)[len(inst_root):], target)
                     dangling_links[pkg].append(os.path.normpath(target))
 
     newrdepends = {}
@@ -1307,12 +1305,8 @@ python package_do_filedeps() {
 
         provides_files = []
         requires_files = []
-        rpfiles = []
-        for root, dirs, files in os.walk(pkgdest + "/" + pkg):
-            for file in files:
-                rpfiles.append(os.path.join(root, file))
 
-        for files in chunks(rpfiles, 100):
+        for files in chunks(pkgfiles[pkg], 100):
             dep_pipe = os.popen(rpmdeps + " " + " ".join(files))
 
             process_deps(dep_pipe, pkg, provides_files, requires_files)
@@ -1362,9 +1356,9 @@ python package_do_shlibs() {
     # Take shared lock since we're only reading, not writing
     lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
 
-    def linux_so(root, path, file):
+    def linux_so(file):
         needs_ldconfig = False
-        cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
+        cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
         cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
         fd = os.popen(cmd)
         lines = fd.readlines()
@@ -1381,15 +1375,14 @@ python package_do_shlibs() {
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or -1 == private_libs.find(this_soname):
                         sonames.append(this_soname)
-                if libdir_re.match(root):
+                if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
-                if snap_symlinks and (file != this_soname):
-                    renames.append((os.path.join(root, file), os.path.join(root, this_soname)))
+                if snap_symlinks and (os.path.basename(file) != this_soname):
+                    renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return needs_ldconfig
 
-    def darwin_so(root, path, file):
-        fullpath = os.path.join(root, file)
-        if not os.path.exists(fullpath):
+    def darwin_so(file):
+        if not os.path.exists(file):
             return
 
         def get_combinations(base):
@@ -1414,7 +1407,7 @@ python package_do_shlibs() {
                 if not combo in sonames:
                     sonames.append(combo)
         if file.endswith('.dylib') or file.endswith('.so'):
-            lafile = fullpath.replace(os.path.join(pkgdest, pkg), d.getVar('PKGD', True))
+            lafile = file.replace(os.path.join(pkgdest, pkg), d.getVar('PKGD', True))
             # Drop suffix
             lafile = lafile.rsplit(".",1)[0]
             lapath = os.path.dirname(lafile)
@@ -1427,7 +1420,7 @@ python package_do_shlibs() {
             lafile = lapath + '/' + combo + '.la'
 
             #bb.note("Foo2: %s" % lafile)
-            #bb.note("Foo %s %s" % (file, fullpath))
+            #bb.note("Foo %s" % file)
             if os.path.exists(lafile):
                 fd = open(lafile, 'r')
                 lines = fd.readlines()
@@ -1475,17 +1468,14 @@ python package_do_shlibs() {
         needed[pkg] = []
         sonames = list()
         renames = list()
-        top = os.path.join(pkgdest, pkg)
-        for root, dirs, files in os.walk(top):
-            for file in files:
+        for file in pkgfiles[pkg]:
                 soname = None
-                path = os.path.join(root, file)
-                if os.path.islink(path):
+                if os.path.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-                    darwin_so(root, dirs, file)
-                elif os.access(path, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(root, dirs, file)
+                    darwin_so(file)
+                elif os.access(file, os.X_OK) or lib_re.match(file):
+                    ldconfig = linux_so(file)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
@@ -1594,18 +1584,15 @@ python package_do_pkgconfig () {
     for pkg in packages.split():
         pkgconfig_provided[pkg] = []
         pkgconfig_needed[pkg] = []
-        top = os.path.join(pkgdest, pkg)
-        for root, dirs, files in os.walk(top):
-            for file in files:
+        for file in pkgfiles[pkg]:
                 m = pc_re.match(file)
                 if m:
                     pd = bb.data.init()
                     name = m.group(1)
                     pkgconfig_provided[pkg].append(name)
-                    path = os.path.join(root, file)
-                    if not os.access(path, os.R_OK):
+                    if not os.access(file, os.R_OK):
                         continue
-                    f = open(path, 'r')
+                    f = open(file, 'r')
                     lines = f.readlines()
                     f.close()
                     for l in lines:
@@ -1844,16 +1831,19 @@ def gen_packagevar(d):
     return " ".join(ret)
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-PACKAGEFUNCS ?= " \
+# Functions for setting up PKGD
+PACKAGEBUILDPKGD ?= " \
                 perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
-                package_do_split_locales \
                 split_and_strip_files \
                 fixup_perms \
-                populate_packages \
+                package_do_split_locales \
+                populate_packages"
+# Functions which process metadata based on split packages
+PACKAGEFUNCS ?= " \
+                package_fixsymlinks \
                 package_name_hook \
                 package_get_auto_pr \
-                package_fixsymlinks \
                 package_do_filedeps \
                 package_do_shlibs \
                 package_do_pkgconfig \
@@ -1883,6 +1873,20 @@ python do_package () {
         bb.error("WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package")
         return
 
+    for f in (d.getVar('PACKAGEBUILDPKGD', True) or '').split():
+        bb.build.exec_func(f, d)
+
+    # Build global list of files in each split package
+    global pkgfiles
+    pkgfiles = {}
+    packages = d.getVar('PACKAGES', True).split()
+    pkgdest = d.getVar('PKGDEST', True)
+    for pkg in packages:
+        pkgfiles[pkg] = []
+        for walkroot, dirs, files in os.walk(pkgdest + "/" + pkg):
+            for file in files:
+                pkgfiles[pkg].append(walkroot + os.sep + file)
+
     for f in (d.getVar('PACKAGEFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
 }
-- 
1.7.10.4



