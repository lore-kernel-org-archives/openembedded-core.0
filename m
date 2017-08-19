Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AAF2B77AB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:07:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 11:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="139546291"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 11:07:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 11:06:53 -0700
Message-Id: <1503166017-3945-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
References: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v4 1/5] reproducible_build.bbclass: initial support for binary reproducibility
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
X-List-Received-Date: Sat, 19 Aug 2017 18:07:14 -0000

Conditionally set some environment variables in order to achieve
improved binary reproducibility. Providing BUILD_REPRODUCIBLE_BINARIES is
set to "1", we set the following environment variables:

export PYTHONHASHSEED=0
export PERL_HASH_SEED=0
export TZ="UTC"

Additionally, we export and set SOURCE_DATE_EPOCH. This is the most crucial step to
achieve binary reproducibility. The value for this variable (timestamp) is
obtained after source code for a recipe has been unpacked, but before it is patched.
If the code sources come from a GIT repo, we get the timestamp from the top
commit. (GIT repo does not preserve file mktime timestamps). It is not safe to assume
folders named "git" contain git repositories, so we check for presence of .git folder
in ${S}. Otherwise, if GIT repo is not present, we get mtime from known files such as
NEWS, ChangeLog, etc. If this also fails, we go through all files and get the timestamp
from the youngest one. We create an individual timestamp for each recipe.
The timestamp is stored in the file '__source_date_epoch.txt'. Later on, each task
reads this file and sets SOURCE_DATE_EPOCH based on the value found in the file.

The file __source_date_epoch.txt file is re-used if found. This can be the file
we previously created ourselves, or it can be a file provided by a user via
a recipe.

[YOCTO#11178]
[YOCTO#11179]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/base.bbclass               |   4 ++
 meta/classes/reproducible_build.bbclass | 107 ++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/classes/reproducible_build.bbclass

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8c86977..bf79eb9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -9,6 +9,7 @@ inherit utils
 inherit utility-tasks
 inherit metadata_scm
 inherit logging
+inherit reproducible_build
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license"
 OE_IMPORTS[type] = "list"
@@ -166,6 +167,7 @@ python base_do_unpack() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('WORKDIR'))
+        create_src_date_epoch_stamp(d)
     except bb.fetch2.BBFetchException as e:
         bb.fatal(str(e))
 }
@@ -386,6 +388,7 @@ def set_packagetriplet(d):
 
     settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
 
+
 python () {
     import string, re
 
@@ -685,6 +688,7 @@ python () {
             bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN"))
 }
 
+
 addtask cleansstate after do_clean
 python do_cleansstate() {
         sstate_clean_cachefiles(d)
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
new file mode 100644
index 0000000..daea92b
--- /dev/null
+++ b/meta/classes/reproducible_build.bbclass
@@ -0,0 +1,107 @@
+
+BUILD_REPRODUCIBLE_BINARIES ??= "0"
+BUILD_REPRODUCIBLE_BINARIES[export] = "1"
+
+# Unix timestamp
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??= ""
+
+def get_src_date_epoch_quick(d, path):
+    import subprocess
+    src_date_epoch = 0
+    saved_cwd = os.getcwd()
+    os.chdir(path)
+    if os.path.isdir(".git"):
+        try:
+            src_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct']))
+        except subprocess.CalledProcessError as grepexc:
+            bb.warn("Not a git repository in .git folder? error:%d" % (grepexc.returncode))
+    else:
+        known_files = set(["NEWS", "ChangeLog", "Changelog", "CHANGES"])
+
+        for file in known_files:
+            if os.path.isfile(file):
+                mtime = int(os.path.getmtime(file))
+
+                # There may be more than one "known_file" present.
+                # If so, use the youngest one
+                if mtime > src_date_epoch:
+                    src_date_epoch = mtime
+
+    os.chdir(saved_cwd)
+    return src_date_epoch
+
+
+def create_src_date_epoch_stamp(d):
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
+        path = d.getVar('S')
+
+        epochfile = os.path.join(d.getVar('WORKDIR'),'__source_date_epoch.txt')
+        if os.path.isfile(epochfile):
+            bb.debug(1, " path: %s reusing __source_date_epoch.txt" % epochfile)
+            return
+
+        filename_dbg = None
+        src_date_epoch = get_src_date_epoch_quick(d, path)
+
+        if src_date_epoch == 0:
+            exclude = set(["temp", "licenses", "patches", "recipe-sysroot-native", "recipe-sysroot", "pseudo"])
+            for root, dirs, files in os.walk(path, topdown=True):
+                files = [f for f in files if not f[0] == '.']
+                dirs[:] = [d for d in dirs if d not in exclude]
+
+                for fname in files:
+                    filename = os.path.join(root, fname)
+                    try:
+                        mtime = int(os.path.getmtime(filename))
+                    except:
+                        mtime = 0
+                    if mtime > src_date_epoch:
+                        src_date_epoch = mtime
+                        filename_dbg = filename
+
+        # Most likely an empty folder
+        if src_date_epoch == 0:
+            bb.warn("Unable to determine src_date_epoch! path:%s" % path)
+
+        f = open(os.path.join(d.getVar('WORKDIR'),'__source_date_epoch.txt'), 'w')
+        f.write(str(src_date_epoch))
+        f.close()
+
+        if filename_dbg != None:
+            bb.debug(1," SOURCE_DATE_EPOCH %d derived from: %s" % (src_date_epoch, filename_dbg))
+            #bb.warn(" SOURCE_DATE_EPOCH %d derived from: %s" % (src_date_epoch, filename_dbg))
+
+export PYTHONHASHSEED
+export PERL_HASH_SEED
+export SOURCE_DATE_EPOCH
+
+BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH PYTHONHASHSEED PERL_HASH_SEED "
+
+python () {
+    import string, re
+
+    # Create reproducible_environment
+
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
+        import subprocess
+        d.setVar('PYTHONHASHSEED', '0')
+        d.setVar('PERL_HASH_SEED', '0')
+        d.setVar('TZ', 'UTC')
+        epochfile = os.path.join(d.getVar('WORKDIR'),'__source_date_epoch.txt')
+        if os.path.isfile(epochfile):
+            f = open(epochfile, 'r')
+            src_date_epoch = f.read()
+            f.close()
+            bb.debug(1, "source_date_epoch stamp found ---> stamp %s" % src_date_epoch)
+            d.setVar('SOURCE_DATE_EPOCH', src_date_epoch)
+        else:
+            bb.debug(1, "source_date_epoch stamp not found.")
+            d.setVar('SOURCE_DATE_EPOCH', '0')
+    else:
+        if 'PYTHONHASHSEED' in os.environ:
+            del os.environ['PYTHONHASHSEED']
+        if 'PERL_HASH_SEED' in os.environ:
+            del os.environ['PERL_HASH_SEED']
+        if 'SOURCE_DATE_EPOCH' in os.environ:
+            del os.environ['SOURCE_DATE_EPOCH']
+}
-- 
2.7.4


