Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 9B1167955B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 01:36:30 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 4E63A220348;
	Wed, 12 Sep 2018 13:27:12 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:27:07 +1200
Message-Id: <20180912012707.30046-7-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180912012707.30046-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
Subject: [PATCH 6/6] Reproducible: Consistent debug logging
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
X-List-Received-Date: Wed, 12 Sep 2018 01:36:41 -0000

Log both the source of the source_date_epoch and the resulting
source_date_epoch in all cases.

Also, now that we are determining the source_date_epoch successfully for both
yocto and non-yocto kernels, remove the inherits_class('kernel') exception.
We will log a failure to find a source_date_epoch for kernels as well.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index a81f249790..4f3680a376 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -51,6 +51,7 @@ addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 def get_source_date_epoch_from_known_files(d, sourcedir):
     source_date_epoch = None
+    newest_file = None
     known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
     for file in known_files:
         filepath = os.path.join(sourcedir, file)
@@ -59,6 +60,9 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
             # There may be more than one "known_file" present, if so, use the youngest one
             if not source_date_epoch or mtime > source_date_epoch:
                 source_date_epoch = mtime
+                newest_file = filepath
+    if newest_file:
+        bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
     return source_date_epoch
 
 def find_git_folder(d, sourcedir):
@@ -93,7 +97,7 @@ def get_source_date_epoch_from_git(d, sourcedir):
         if gitpath:
             import subprocess
             source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
-            bb.debug(1, "git repo path: %s sde: %d" % (gitpath, source_date_epoch))
+            bb.debug(1, "git repository: %s" % gitpath)
     return source_date_epoch
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
@@ -117,14 +121,14 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
                 source_date_epoch = mtime
                 newest_file = filename
 
-    if newest_file != None:
-        bb.debug(1," SOURCE_DATE_EPOCH %d derived from: %s" % (source_date_epoch, newest_file))
+    if newest_file:
+        bb.debug(1, "Newest file found: %s" % newest_file)
     return source_date_epoch
 
 python do_create_source_date_epoch_stamp() {
     epochfile = d.getVar('SDE_FILE')
     if os.path.isfile(epochfile):
-        bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
+        bb.debug(1, "Reusing SOURCE_DATE_EPOCH from: %s" % epochfile)
         return
 
     sourcedir = d.getVar('S')
@@ -136,10 +140,9 @@ python do_create_source_date_epoch_stamp() {
     )
     if source_date_epoch == 0:
         # empty folder, not a single file ...
-        # kernel source do_unpack is special cased
-        if not bb.data.inherits_class('kernel', d):
-            bb.debug(1, "Unable to determine source_date_epoch! path:%s" % sourcedir)
+        bb.debug(1, "No files found to determine SOURCE_DATE_EPOCH")
 
+    bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     with open(epochfile, 'w') as f:
         f.write(str(source_date_epoch))
@@ -155,6 +158,6 @@ python () {
         if os.path.isfile(epochfile):
             with open(epochfile, 'r') as f:
                 source_date_epoch = f.read()
-            bb.debug(1, "source_date_epoch stamp found ---> stamp %s" % source_date_epoch)
+            bb.debug(1, "SOURCE_DATE_EPOCH: %s" % source_date_epoch)
         d.setVar('SOURCE_DATE_EPOCH', source_date_epoch)
 }
-- 
2.17.1


