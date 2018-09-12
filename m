Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id E41EA79558
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:36:16 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 22341220337;
	Wed, 12 Sep 2018 13:27:12 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:27:04 +1200
Message-Id: <20180912012707.30046-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180912012707.30046-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
Subject: [PATCH 3/6] Reproducible: Rename ambiguous "path" var to sourcedir or workdir as appropriate
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
X-List-Received-Date: Wed, 12 Sep 2018 01:36:30 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 37 +++++++++++++------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index e118cfde01..3f3790dfe3 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -49,11 +49,11 @@ do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
 addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
-def get_source_date_epoch_from_known_files(d, path):
+def get_source_date_epoch_from_known_files(d, sourcedir):
     source_date_epoch = None
     known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
     for file in known_files:
-        filepath = os.path.join(path,file)
+        filepath = os.path.join(sourcedir, file)
         if os.path.isfile(filepath):
             mtime = int(os.lstat(filepath).st_mtime)
             # There may be more than one "known_file" present, if so, use the youngest one
@@ -61,37 +61,38 @@ def get_source_date_epoch_from_known_files(d, path):
                 source_date_epoch = mtime
     return source_date_epoch
 
-def find_git_folder(path):
+def find_git_folder(workdir):
     exclude = set(["temp", "license-destdir", "patches", "recipe-sysroot-native", "recipe-sysroot", "pseudo", "build", "image", "sysroot-destdir"])
-    for root, dirs, files in os.walk(path, topdown=True):
+    for root, dirs, files in os.walk(workdir, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
             return root
 
-def get_source_date_epoch_from_git(d, path):
+def get_source_date_epoch_from_git(d, sourcedir):
     source_date_epoch = None
     if "git://" in d.getVar('SRC_URI'):
-        gitpath = find_git_folder(d.getVar('WORKDIR'))
-        if gitpath != None:
+        workdir = d.getVar('WORKDIR')
+        gitpath = find_git_folder(workdir)
+        if gitpath:
             import subprocess
             if os.path.isdir(os.path.join(gitpath,".git")):
                 try:
-                    source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=path))
+                    source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=sourcedir))
                     bb.debug(1, "git repo path:%s sde: %d" % (gitpath,source_date_epoch))
                 except subprocess.CalledProcessError as grepexc:
                     bb.debug(1, "Expected git repository not found, (path: %s) error:%d" % (gitpath, grepexc.returncode))
         else:
-            bb.warn("Failed to find a git repository for path:%s" % (path))
+            bb.warn("Failed to find a git repository for path:%s" % workdir)
     return source_date_epoch
 
-def get_source_date_epoch_from_youngest_file(d, path):
+def get_source_date_epoch_from_youngest_file(d, sourcedir):
     # Do it the hard way: check all files and find the youngest one...
     source_date_epoch = None
     newest_file = None
     # Just in case S = WORKDIR
     exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
                    "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
-    for root, dirs, files in os.walk(path, topdown=True):
+    for root, dirs, files in os.walk(sourcedir, topdown=True):
         files = [f for f in files if not f[0] == '.']
         dirs[:] = [d for d in dirs if d not in exclude]
 
@@ -110,9 +111,9 @@ def get_source_date_epoch_from_youngest_file(d, path):
     return source_date_epoch
 
 python do_create_source_date_epoch_stamp() {
-    path = d.getVar('S')
-    if not os.path.isdir(path):
-        bb.warn("Unable to determine source_date_epoch! path:%s" % path)
+    sourcedir = d.getVar('S')
+    if not os.path.isdir(sourcedir):
+        bb.warn("Unable to determine source_date_epoch! path:%s" % sourcedir)
         return
 
     epochfile = d.getVar('SDE_FILE')
@@ -121,16 +122,16 @@ python do_create_source_date_epoch_stamp() {
         return
 
     source_date_epoch = (
-        get_source_date_epoch_from_git(d, path) or
-        get_source_date_epoch_from_known_files(d, path) or
-        get_source_date_epoch_from_youngest_file(d, path) or
+        get_source_date_epoch_from_git(d, sourcedir) or
+        get_source_date_epoch_from_known_files(d, sourcedir) or
+        get_source_date_epoch_from_youngest_file(d, sourcedir) or
         0       # Last resort
     )
     if source_date_epoch == 0:
         # empty folder, not a single file ...
         # kernel source do_unpack is special cased
         if not bb.data.inherits_class('kernel', d):
-            bb.debug(1, "Unable to determine source_date_epoch! path:%s" % path)
+            bb.debug(1, "Unable to determine source_date_epoch! path:%s" % sourcedir)
 
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     with open(epochfile, 'w') as f:
-- 
2.17.1


