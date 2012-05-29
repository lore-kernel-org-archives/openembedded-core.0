Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SZNx1-0006RE-9U
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 17:03:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4TEqrRO025578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 07:52:53 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 May 2012 07:52:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 22:53:08 +0800
Message-ID: <7668bfbc470f4d82617932d58a6acf4286822cd8.1338302685.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338302685.git.liezhi.yang@windriver.com>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] meta: replace os.popen with subprocess.Popen
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
X-List-Received-Date: Tue, 29 May 2012 15:03:18 -0000
Content-Type: text/plain

Replace os.popen with subprocess.Popen since the older function would
fail (more or less) silently if the executed program cannot be found

There are both bb.process.run() and bb.process.Popen() which wraps the
subprocess module, use it for simplifying the code.

Note: We don't need the "2>/dev/null" or "2>&1" since bb.process.run()
can handle it, it will raise exception when error occurs, we should
handle the exception ourselves if we want to ignore the error.

More info:
http://docs.python.org/library/subprocess.html#subprocess-replacements

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/debian.bbclass           |   12 ++++++++----
 meta/classes/distrodata.bbclass       |   12 ++++++------
 meta/classes/icecc.bbclass            |    6 +++---
 meta/classes/insane.bbclass           |   31 ++++++++++++++++++++-----------
 meta/classes/kernel.bbclass           |    2 +-
 meta/classes/metadata_scm.bbclass     |   12 +++++-------
 meta/classes/package.bbclass          |   16 ++++++++++------
 meta/recipes-core/busybox/busybox.inc |    3 ++-
 8 files changed, 55 insertions(+), 39 deletions(-)

diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 3637e2e..963d11c 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -60,10 +60,14 @@ python debian_package_name_hook () {
 				for f in files:
 					if so_re.match(f):
 						fp = os.path.join(root, f)
-						cmd = (d.getVar('BUILD_PREFIX', True) or "") + "objdump -p " + fp + " 2>/dev/null"
-						fd = os.popen(cmd)
-						lines = fd.readlines()
-						fd.close()
+						cmd = (d.getVar('BUILD_PREFIX', True) or "") + "objdump -p " + fp
+						try:
+							lines = ""
+							lines = bb.process.run(cmd)[0]
+						# Some ".so" maybe ascii text, e.g: /usr/lib64/libpthread.so,
+						# ingore those errors.
+						except Exception:
+							sys.exc_clear()
 						for l in lines:
 							m = re.match("\s+SONAME\s+([^\s]*)", l)
 							if m and not m.group(1) in sonames:
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index df6d300..7f9c83e 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -564,10 +564,10 @@ python do_checkpkg() {
 			gitproto = parm['protocol']
 		else:
 			gitproto = "git"
-		gitcmd = "git ls-remote %s://%s%s%s *tag* 2>&1" % (gitproto, gituser, host, path)
-		gitcmd2 = "git ls-remote %s://%s%s%s HEAD 2>&1" % (gitproto, gituser, host, path)
-		tmp = os.popen(gitcmd).read()
-		tmp2 = os.popen(gitcmd2).read()
+		gitcmd = "git ls-remote %s://%s%s%s *tag*" % (gitproto, gituser, host, path)
+		gitcmd2 = "git ls-remote %s://%s%s%s HEAD" % (gitproto, gituser, host, path)
+		tmp = bb.process.run(gitcmd)[0]
+		tmp2 = bb.process.run(gitcmd2)[0]
 		#This is for those repo have tag like: refs/tags/1.2.2
 		if tmp:
 			tmpline = tmp.split("\n")
@@ -613,9 +613,9 @@ python do_checkpkg() {
 		if 'rev' in parm:
 			pcurver = parm['rev']
 
-		svncmd = "svn info %s %s://%s%s/%s/ 2>&1" % (" ".join(options), svnproto, host, path, parm["module"])
+		svncmd = "svn info %s %s://%s%s/%s/" % (" ".join(options), svnproto, host, path, parm["module"])
 		print svncmd
-		svninfo = os.popen(svncmd).read()
+		svninfo = bb.process.run(svncmd)[0]
 		for line in svninfo.split("\n"):
 			if re.search("^Last Changed Rev:", line):
 				pupver = line.split(" ")[-1]
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index ae74050..64a182e 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -54,7 +54,7 @@ def create_path(compilers, bb, d):
         staging += "-kernel"
 
     #check if the icecc path is set by the user
-    icecc   = d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
+    icecc = d.getVar('ICECC_PATH') or bb.process.run("which icecc")[0][:-1]
 
     # Create the dir if necessary
     try:
@@ -151,9 +151,9 @@ def icc_path(bb,d):
 
 def icc_get_tool(bb, d, tool):
     if icc_is_native(bb, d):
-        return os.popen("which %s" % tool).read()[:-1]
+        return bb.process.run("which %s" % tool)[0][:-1]
     elif icc_is_kernel(bb, d):
-        return os.popen("which %s" % get_cross_kernel_cc(bb, d)).read()[:-1]
+        return bb.process.run("which %s" % get_cross_kernel_cc(bb, d))[0][:-1]
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
         target_sys = d.expand('${TARGET_SYS}')
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4d139e8..fa7b5f0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -154,14 +154,29 @@ def package_qa_check_rpath(file,name, d, elf, messages):
     if not bad_dirs[0] in d.getVar('WORKDIR', True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
 
-    output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
-    txt    = output.readline().split()
+    output, errors = bb.process.run("%s -B -F%%r#F '%s'" % (scanelf,file))
+    txt = output.split()
     for line in txt:
         for dir in bad_dirs:
             if dir in line:
                 messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
 
 QAPATHTEST[useless-rpaths] = "package_qa_check_useless_rpaths"
+
+def package_qa_get_objdump(d, path):
+    """
+    Get the result of objdump, ignore the errors since not all files can be objdumped
+    """
+    env_path = d.getVar('PATH', True)
+    objdump = d.getVar('OBJDUMP', True)
+
+    try:
+        lines = ""
+        lines = bb.process.run("LC_ALL=C PATH=%s %s -p '%s'" % (env_path, objdump, path))[0]
+    except Exception:
+        sys.exc_clear()
+    return lines
+
 def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     """
     Check for RPATHs that are useless but not dangerous
@@ -169,15 +184,12 @@ def package_qa_check_useless_rpaths(file, name, d, elf, messages):
     if not elf:
         return
 
-    objdump = d.getVar('OBJDUMP', True)
-    env_path = d.getVar('PATH', True)
-
     libdir = d.getVar("libdir", True)
     base_libdir = d.getVar("base_libdir", True)
 
     import re
     rpath_re = re.compile("\s+RPATH\s+(.*)")
-    for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, file), "r"):
+    for line in package_qa_get_objdump(d, file):
     	m = rpath_re.match(line)
 	if m:
 	   rpath = m.group(1)
@@ -369,7 +381,7 @@ def package_qa_check_desktop(path, name, d, elf, messages):
     """
     if path.endswith(".desktop"):
         desktop_file_validate = os.path.join(d.getVar('STAGING_BINDIR_NATIVE',True),'desktop-file-validate')
-        output = os.popen("%s %s" % (desktop_file_validate, path))
+        output, errors = bb.process.run("%s %s" % (desktop_file_validate, path))
         # This only produces output on errors
         for l in output:
             messages.append("Desktop file issue: " + l.strip())
@@ -392,14 +404,11 @@ def package_qa_hash_style(path, name, d, elf, messages):
     if not gnu_hash:
         return
 
-    objdump = d.getVar('OBJDUMP', True)
-    env_path = d.getVar('PATH', True)
-
     sane = False
     has_syms = False
 
     # If this binary has symbols, we expect it to have GNU_HASH too.
-    for line in os.popen("LC_ALL=C PATH=%s %s -p '%s' 2> /dev/null" % (env_path, objdump, path), "r"):
+    for line in package_qa_get_objdump(d, path):
         if "SYMTAB" in line:
             has_syms = True
         if "GNU_HASH" in line:
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 116e10b..d74361b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -349,7 +349,7 @@ python populate_packages_prepend () {
 		path = d.getVar("PATH", True)
 
 		cmd = "PATH=\"%s\" depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
-		f = os.popen(cmd, 'r')
+		f = bb.process.Popen(cmd, shell=True).stdout
 
 		deps = {}
 		pattern0 = "^(.*\.k?o):..*$"
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 62650be..5af593a 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -60,18 +60,16 @@ def base_get_metadata_svn_revision(path, d):
 	return revision
 
 def base_get_metadata_git_branch(path, d):
-	branch = os.popen('cd %s; git branch 2>&1 | grep "^* " | tr -d "* "' % path).read()
+	branch = bb.process.run('cd %s; git branch | grep "^* " | tr -d "* "' % path)[0]
 
 	if len(branch) != 0:
 		return branch
 	return "<unknown>"
 
 def base_get_metadata_git_revision(path, d):
-	f = os.popen("cd %s; git log -n 1 --pretty=oneline -- 2>&1" % path)
-	data = f.read()
-	if f.close() is None:        
-		rev = data.split(" ")[0]
-		if len(rev) != 0:
-			return rev
+	rev = bb.process.run("cd %s; git log -n 1 --pretty=oneline" % path)[0]
+	if len(rev) != 0:
+		rev = rev.split(" ")[0]
+		return rev
 	return "<unknown>"
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b2b59ec..7e01174 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1061,7 +1061,7 @@ python emit_pkgdata() {
 
 	def get_directory_size(dir):
 		if os.listdir(dir):
-			size = int(os.popen('du -sk %s' % dir).readlines()[0].split('\t')[0])
+			size = int(bb.process.run('du -sk %s' % dir)[0].split('\t')[0])
 		else:
 			size = 0
 		return size
@@ -1217,7 +1217,7 @@ python package_do_filedeps() {
 				rpfiles.append(os.path.join(root, file))
 
 		for files in chunks(rpfiles, 100):
-			dep_pipe = os.popen(rpmdeps + " " + " ".join(files))
+			dep_pipe = bb.process.Popen(rpmdeps + " " + " ".join(files), shell=True).stdout
 
 			process_deps(dep_pipe, pkg, provides_files, requires_files)
 
@@ -1259,11 +1259,15 @@ python package_do_shlibs() {
 
 	def linux_so(root, path, file):
 		needs_ldconfig = False
-		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file)) + " 2>/dev/null"
+		cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(os.path.join(root, file))
 		cmd = "PATH=\"%s\" %s" % (d.getVar('PATH', True), cmd)
-		fd = os.popen(cmd)
-		lines = fd.readlines()
-		fd.close()
+		try:
+			lines = ""
+			lines = bb.process.run(cmd)[0]
+		# Some ".so" maybe ascii text, e.g: /usr/lib64/libpthread.so,
+		# ingore those errors.
+		except Exception:
+			sys.exc_clear()
 		for l in lines:
 			m = re.match("\s+NEEDED\s+([^\s]*)", l)
 			if m:
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1613878..b4487eb 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -215,7 +215,8 @@ python package_do_filedeps_append () {
 	# Load/backup original set
 	filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
 
-	dep_pipe = os.popen('sed -e "s,^,%s/%s%s Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox, pkgdest, pkg, f_busybox_links))
+	dep_pipe = bb.process.Popen('sed -e "s,^,%s/%s%s Provides: ," %s/%s%s' % \
+		(pkgdest, pkg, f_busybox, pkgdest, pkg, f_busybox_links), shell=True).stdout
 
 	process_deps(dep_pipe, pkg, provides_files, requires_files)
 
-- 
1.7.1



