Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 584E8731D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 09:02:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2016 02:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,470,1464678000"; d="scan'208";a="1008236805"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2016 02:02:15 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2016 12:02:11 +0300
Message-Id: <1470301332-6878-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470301332-6878-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470301332-6878-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package.bbclass: better handling of middle-path dir symlinks
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
X-List-Received-Date: Thu, 04 Aug 2016 09:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For example in a directory structure like this
    .
    ├── symlink -> foo/bar
    └── foo
        └── bar
            └── file
'file' could be referenced by specifying e.g. 'foo/bar/file' or
'symlink/file'.  In cases like this populate_packages() might crash if
the file was referenced (in FILES) via the symlinked directory. The
outcome depends on how the user defined FILES_pn.  This patch should
make the function behave more consistently. It looks for files which are
referenced via symlinked directories and handles them separately,
failing if their parent directory is a non-existent path. For example,
defining FILES_{PN} = "symlink/file" causes a build failure because
symlinks target 'foo/bar' is not included at all.

[YOCTO #9827]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/package.bbclass | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d6204cf..df010e1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -259,14 +259,27 @@ def files_from_filevars(filevars):
                 continue
         files.append(f)
 
-    for f in files:
+    symlink_paths = []
+    for ind, f in enumerate(files):
+        # Handle directory symlinks. Truncate path to the lowest level symlink
+        parent = ''
+        for dirname in f.split('/')[:-1]:
+            parent = os.path.join(parent, dirname)
+            if dirname == '.':
+                continue
+            if cpath.islink(parent):
+                symlink_paths.append(f)
+                files[ind] = parent
+                f = parent
+                break
+
         if not cpath.islink(f):
             if cpath.isdir(f):
                 newfiles = [ os.path.join(f,x) for x in os.listdir(f) ]
                 if newfiles:
                     files += newfiles
 
-    return files
+    return files, symlink_paths
 
 # Called in package_<rpm,ipk,deb>.bbclass to get the correct list of configuration files
 def get_conffiles(pkg, d):
@@ -281,7 +294,7 @@ def get_conffiles(pkg, d):
     if conffiles == None:
         conffiles = ""
     conffiles = conffiles.split()
-    conf_orig_list = files_from_filevars(conffiles)
+    conf_orig_list = files_from_filevars(conffiles)[0]
 
     # Remove links and directories from conf_orig_list to get conf_list which only contains normal files
     conf_list = []
@@ -1111,7 +1124,7 @@ python populate_packages () {
             filesvar.replace("//", "/")
 
         origfiles = filesvar.split()
-        files = files_from_filevars(origfiles)
+        files, symlink_paths = files_from_filevars(origfiles)
 
         if autodebug and pkg.endswith("-dbg"):
             files.extend(debug)
@@ -1160,6 +1173,15 @@ python populate_packages () {
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
+        # Check if symlink paths exist
+        for file in symlink_paths:
+            if not os.path.exists(os.path.join(root,file)):
+                bb.fatal("File '%s' cannot be packaged into '%s' because its "
+                         "parent directory structure does not exist. One of "
+                         "its parent directories is a symlink whose target "
+                         "directory is not included in the package." %
+                         (file, pkg))
+
     os.umask(oldumask)
     os.chdir(workdir)
 
-- 
2.6.6


