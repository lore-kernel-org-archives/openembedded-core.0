Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 542 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Sep 2018 01:36:15 UTC
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 2D7D279550
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:36:15 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 0D28022032A;
	Wed, 12 Sep 2018 13:27:12 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:27:03 +1200
Message-Id: <20180912012707.30046-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180912012707.30046-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
Subject: [PATCH 2/6] Reproducible: Refactor: get_source_date_epoch_from_youngest_file()
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
X-List-Received-Date: Wed, 12 Sep 2018 01:36:27 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 59 ++++++++++++++-----------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 4e8850fb83..e118cfde01 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -49,15 +49,15 @@ do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
 addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
-def get_source_date_epoch_known_files(d, path):
-    source_date_epoch = 0
+def get_source_date_epoch_from_known_files(d, path):
+    source_date_epoch = None
     known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
     for file in known_files:
         filepath = os.path.join(path,file)
         if os.path.isfile(filepath):
             mtime = int(os.lstat(filepath).st_mtime)
             # There may be more than one "known_file" present, if so, use the youngest one
-            if mtime > source_date_epoch:
+            if not source_date_epoch or mtime > source_date_epoch:
                 source_date_epoch = mtime
     return source_date_epoch
 
@@ -68,8 +68,8 @@ def find_git_folder(path):
         if '.git' in dirs:
             return root
 
-def get_source_date_epoch_git(d, path):
-    source_date_epoch = 0
+def get_source_date_epoch_from_git(d, path):
+    source_date_epoch = None
     if "git://" in d.getVar('SRC_URI'):
         gitpath = find_git_folder(d.getVar('WORKDIR'))
         if gitpath != None:
@@ -84,24 +84,13 @@ def get_source_date_epoch_git(d, path):
             bb.warn("Failed to find a git repository for path:%s" % (path))
     return source_date_epoch
 
-python do_create_source_date_epoch_stamp() {
-    path = d.getVar('S')
-    if not os.path.isdir(path):
-        bb.warn("Unable to determine source_date_epoch! path:%s" % path)
-        return
-
-    epochfile = d.getVar('SDE_FILE')
-    if os.path.isfile(epochfile):
-        bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
-        return
-
-    source_date_epoch = get_source_date_epoch_git(d, path)
-    if source_date_epoch == 0:
-        source_date_epoch = get_source_date_epoch_known_files(d, path)
-    if source_date_epoch == 0:
+def get_source_date_epoch_from_youngest_file(d, path):
     # Do it the hard way: check all files and find the youngest one...
-        filename_dbg = None
-        exclude = set(["temp", "license-destdir", "patches", "recipe-sysroot-native", "recipe-sysroot", "pseudo", "build", "image", "sysroot-destdir"])
+    source_date_epoch = None
+    newest_file = None
+    # Just in case S = WORKDIR
+    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
+                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
     for root, dirs, files in os.walk(path, topdown=True):
         files = [f for f in files if not f[0] == '.']
         dirs[:] = [d for d in dirs if d not in exclude]
@@ -112,13 +101,31 @@ python do_create_source_date_epoch_stamp() {
                 mtime = int(os.lstat(filename).st_mtime)
             except ValueError:
                 mtime = 0
-                if mtime > source_date_epoch:
+            if not source_date_epoch or mtime > source_date_epoch:
                 source_date_epoch = mtime
-                    filename_dbg = filename
+                newest_file = filename
+
+    if newest_file != None:
+        bb.debug(1," SOURCE_DATE_EPOCH %d derived from: %s" % (source_date_epoch, newest_file))
+    return source_date_epoch
 
-        if filename_dbg != None:
-            bb.debug(1," SOURCE_DATE_EPOCH %d derived from: %s" % (source_date_epoch, filename_dbg))
+python do_create_source_date_epoch_stamp() {
+    path = d.getVar('S')
+    if not os.path.isdir(path):
+        bb.warn("Unable to determine source_date_epoch! path:%s" % path)
+        return
+
+    epochfile = d.getVar('SDE_FILE')
+    if os.path.isfile(epochfile):
+        bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
+        return
 
+    source_date_epoch = (
+        get_source_date_epoch_from_git(d, path) or
+        get_source_date_epoch_from_known_files(d, path) or
+        get_source_date_epoch_from_youngest_file(d, path) or
+        0       # Last resort
+    )
     if source_date_epoch == 0:
         # empty folder, not a single file ...
         # kernel source do_unpack is special cased
-- 
2.17.1


