Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C96073546
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 02:08:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1H28Iq9004501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:08:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Feb 2015 18:08:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 10:08:12 +0800
Message-ID: <5aa29c45e9ace0826705fc81f4a5cc664d5d6ba0.1424138791.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1424138791.git.Qi.Chen@windriver.com>
References: <cover.1424138791.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 1/4] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Tue, 17 Feb 2015 02:08:21 -0000
Content-Type: text/plain

Allow globs in CONFFILES.

This patch changes the way of CONFFILES handling. After this  change,
the CONFFILES can take the same form as FILES. That means, we don't
have to list a bunch of files for CONFFILES. It will just be expanded
like the FILES variable.

We don't assume default value for CONFFILES in OE. But distro vendors could
provide a default value for CONFFILES in their distro configuration file
like below.

    CONFFILES = "${sysconfdir}"

In this way, files under /etc are treated as configuration files by
default. Of course, setting CONFFILES in recipes take precedence over
the CONFFILES. For example, if the recipe author decides that package A
should only treat files under ${sysconfdir}/default/ as config files,
he/she can write like this.

    CONFFILES_A = "${sysconfdir}/default"

[YOCTO #5200]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/package.bbclass     | 79 +++++++++++++++++++++++++++++++---------
 meta/classes/package_deb.bbclass |  2 +-
 meta/classes/package_ipk.bbclass |  2 +-
 meta/classes/package_rpm.bbclass |  2 +-
 4 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f6c92cb..9f64ed7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -239,6 +239,66 @@ python () {
         d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 }
 
+# Get a list of files from file vars by searching files under current working directory
+# The list contains symlinks, directories and normal files.
+def files_from_filevars(filevars):
+    import os,glob
+    cpath = oe.cachedpath.CachedPath()
+    files = []
+    for f in filevars:
+        if os.path.isabs(f):
+            f = '.' + f
+        if not f.startswith("./"):
+            f = './' + f
+        globbed = glob.glob(f)
+        if globbed:
+            if [ f ] != globbed:
+                files += globbed
+                continue
+        files.append(f)
+
+    for f in files:
+        if not cpath.islink(f):
+            if cpath.isdir(f):
+                newfiles = [ os.path.join(f,x) for x in os.listdir(f) ]
+                if newfiles:
+                    files += newfiles
+
+    return files
+
+# Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
+def get_conffiles(pkg, d):
+    pkgdest = d.getVar('PKGDEST', True)
+    root = os.path.join(pkgdest, pkg)
+    cwd = os.getcwd()
+    os.chdir(root)
+
+    conffiles = d.getVar('CONFFILES_%s' % pkg, True);
+    if conffiles == None:
+        conffiles = d.getVar('CONFFILES', True)
+    if conffiles == None:
+        conffiles = ""
+    conffiles = conffiles.split()
+    conf_orig_list = files_from_filevars(conffiles)
+
+    # Remove links and directories from conf_orig_list to get conf_list which only contains normal files
+    conf_list = []
+    for f in conf_orig_list:
+        if os.path.isdir(f):
+            continue
+        if os.path.islink(f):
+            continue
+        if not os.path.exists(f):
+            continue
+        conf_list.append(f)
+
+    # Remove the leading './'
+    for i in range(0, len(conf_list)):
+        conf_list[i] = conf_list[i][1:]
+
+    os.chdir(cwd)
+    return conf_list
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
@@ -1009,26 +1069,9 @@ python populate_packages () {
             filesvar.replace("//", "/")
 
         origfiles = filesvar.split()
-        files = []
-        for file in origfiles:
-            if os.path.isabs(file):
-                file = '.' + file
-            if not file.startswith("./"):
-                file = './' + file
-            globbed = glob.glob(file)
-            if globbed:
-                if [ file ] != globbed:
-                    files += globbed
-                    continue
-            files.append(file)
+        files = files_from_filevars(origfiles)
 
         for file in files:
-            if not cpath.islink(file):
-                if cpath.isdir(file):
-                    newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
-                    if newfiles:
-                        files += newfiles
-                        continue
             if (not cpath.islink(file)) and (not cpath.exists(file)):
                 continue
             if file in seen:
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5b5f7e2..9d7c59b 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -262,7 +262,7 @@ python do_package_deb () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 44fd3eb..dba6804 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -226,7 +226,7 @@ python do_package_ipk () {
             scriptfile.close()
             os.chmod(os.path.join(controldir, script), 0755)
 
-        conffiles_str = localdata.getVar("CONFFILES", True)
+        conffiles_str = ' '.join(get_conffiles(pkg, d))
         if conffiles_str:
             try:
                 conffiles = open(os.path.join(controldir, 'conffiles'), 'w')
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 92ddf7a..b87e634 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -324,7 +324,7 @@ python write_specfile () {
 
         bb.data.update_data(localdata)
 
-        conffiles = (localdata.getVar('CONFFILES', True) or "").split()
+        conffiles = get_conffiles(pkg, d)
         dirfiles = localdata.getVar('DIRFILES', True)
         if dirfiles is not None:
             dirfiles = dirfiles.split()
-- 
1.9.1


