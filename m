Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 3233C7997C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 02:58:37 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 5F64222033B;
	Fri, 14 Sep 2018 14:58:37 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:58:12 +1200
Message-Id: <20180914025817.7315-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180914025817.7315-1-douglas.royds@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180914025817.7315-1-douglas.royds@taitradio.com>
Subject: [PATCH v2 1/6] Reproducible: Tidy class description
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
X-List-Received-Date: Fri, 14 Sep 2018 02:58:39 -0000

Tidy whitespace, delete commented-out lines

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 49 +++++++++++--------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 268b5fb8f1..4e8850fb83 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -1,33 +1,32 @@
-#
 # reproducible_build.bbclass
 #
-# This bbclass is mainly responsible to determine SOURCE_DATE_EPOCH on a per recipe base.
-# We need to set a recipe specific SOURCE_DATE_EPOCH in each recipe environment for various tasks.
-# One way would be to modify all recipes one-by-one to specify SOURCE_DATE_EPOCH explicitly, 
-# but that is not realistic as there are hundreds (probably thousands) of recipes in various meta-layers.
-# Therefore we do it this class. 
-# After sources are unpacked but before they are patched, we try to determine the value for SOURCE_DATE_EPOCH.
+# Sets SOURCE_DATE_EPOCH in each component's build environment.
+# Upstream components (generally) respect this environment variable,
+# using it in place of the "current" date and time.
+# See https://reproducible-builds.org/specs/source-date-epoch/
+#
+# After sources are unpacked but before they are patched, we set a reproducible value for SOURCE_DATE_EPOCH.
+# This value should be reproducible for anyone who builds the same revision from the same sources.
 #
-# There are 4 ways to determine SOURCE_DATE_EPOCH:
+# There are 4 ways we determine SOURCE_DATE_EPOCH:
 #
-# 1. Use value from __source_date_epoch.txt file if this file exists. 
-#    This file was most likely created in the previous build by one of the following methods 2,3,4. 
-#    In principle, it could actually provided by a recipe via SRC_URI
+# 1. Use the value from __source_date_epoch.txt file if this file exists.
+#    This file was most likely created in the previous build by one of the following methods 2,3,4.
+#    Alternatively, it can be provided by a recipe via SRC_URI.
 #
-# If the file does not exist, first try to determine the value for SOURCE_DATE_EPOCH:
+# If the file does not exist:
 #
-# 2. If we detected a folder .git, use .git last commit date timestamp, as git does not allow checking out
-#    files and preserving their timestamps.
+# 2. If there is a git checkout, use the last git commit timestamp.
+#    Git does not preserve file timestamps on checkout.
 #
 # 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
-#    This will work fine for any well kept repository distributed via tarballs.
+#    This works for well-kept repositories distributed via tarball.
 #
-# 4. If the above steps fail, we need to check all package source files and use the youngest file of the source tree.
+# 4. If the above steps fail, use the modification time of the youngest file in the source tree.
 #
-# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe ${WORKDIR}/source_date_epoch folder
-# in a text file "__source_date_epoch.txt'. If this file is found by other recipe task, the value is exported in
-# the SOURCE_DATE_EPOCH variable in the task environment. This is done in an anonymous python function, 
-# so SOURCE_DATE_EPOCH is guaranteed to exist for all tasks the may use it (do_configure, do_compile, do_package, ...)
+# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's ${SDE_FILE}.
+# If this file is found by other tasks, the value is exported in the SOURCE_DATE_EPOCH variable.
+# SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
 
 BUILD_REPRODUCIBLE_BINARIES ??= '1'
 inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'reproducible_build_simple', '')}
@@ -67,9 +66,8 @@ def find_git_folder(path):
     for root, dirs, files in os.walk(path, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
-            #bb.warn("found root:%s" % (str(root)))
             return root
-     
+
 def get_source_date_epoch_git(d, path):
     source_date_epoch = 0
     if "git://" in d.getVar('SRC_URI'):
@@ -79,15 +77,13 @@ def get_source_date_epoch_git(d, path):
             if os.path.isdir(os.path.join(gitpath,".git")):
                 try:
                     source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=path))
-                    #bb.warn("JB *** gitpath:%s sde: %d" % (gitpath,source_date_epoch))
                     bb.debug(1, "git repo path:%s sde: %d" % (gitpath,source_date_epoch))
                 except subprocess.CalledProcessError as grepexc:
-                    #bb.warn( "Expected git repository not found, (path: %s) error:%d" % (gitpath, grepexc.returncode))
                     bb.debug(1, "Expected git repository not found, (path: %s) error:%d" % (gitpath, grepexc.returncode))
         else:
             bb.warn("Failed to find a git repository for path:%s" % (path))
     return source_date_epoch
-            
+
 python do_create_source_date_epoch_stamp() {
     path = d.getVar('S')
     if not os.path.isdir(path):
@@ -98,8 +94,7 @@ python do_create_source_date_epoch_stamp() {
     if os.path.isfile(epochfile):
         bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
         return
- 
-    # Try to detect/find a git repository
+
     source_date_epoch = get_source_date_epoch_git(d, path)
     if source_date_epoch == 0:
         source_date_epoch = get_source_date_epoch_known_files(d, path)
-- 
2.17.1


