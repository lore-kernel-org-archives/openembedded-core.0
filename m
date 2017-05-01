Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4B17071DE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327302"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:59:00 -0700
Message-Id: <1493672344-21965-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 2/6] base.bbclass: initial support for binary reproducibility
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

Conditionally set some environment variables in order to achieve
improved binary reproducibility. Providing BUILD_REPRODUCIBLE_BINARIES is
set to "1", we set the following environment variables:

export PYTHONHASHSEED=0
export PERL_HASH_SEED=0
export TZ="UTC"

We also export and set SOURCE_DATE_EPOCH. The value for this variable
is obtained after source code for a recipe has been unpacked, but before it is
patched. If the code comes from a GIT repo, we get the timestamp from the top
commit. (This usually corresponds to the mktime of "changelog".)
Otherwise we go through all files and get the timestamp from the youngest
one. We create a timestamp for each recipe. The timestamp is stored in the file
'src_date_epoch.txt'. Later on, each task reads this file and sets SOURCE_DATE_EPOCH
based on the value found in the file.

[YOCTO#11178]
[YOCTO#11179]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/base.bbclass | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e29821f..f2b2d97 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,6 +10,52 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
+def get_git_src_date_epoch(d, path):
+    import subprocess
+    saved_cwd = os.getcwd()
+    os.chdir(path)
+    src_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct']))
+    os.chdir(saved_cwd)
+    return src_date_epoch
+
+def create_src_date_epoch_stamp(d):
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
+        path = d.getVar('S')
+        src_date_epoch = 0
+        filename_dbg = None
+
+        if path.endswith('/git'):
+            src_date_epoch = get_git_src_date_epoch(d, path)
+        else:
+            exclude = set(["temp", "licenses", "patches", "recipe-sysroot-native", "recipe-sysroot" ])
+            for root, dirs, files in os.walk(path, topdown=True):
+                dirs[:] = [d for d in dirs if d not in exclude]
+                if root.endswith('/git'):
+                    src_date_epoch = get_git_src_date_epoch(d, root)
+                    break
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
+        f = open(os.path.join(path,'src_date_epoch.txt'), 'w')
+        f.write(str(src_date_epoch))
+        f.close()
+
+        if filename_dbg != None:
+            bb.debug(1," src_date_epoch %d derived from: %s" % (src_date_epoch, filename_dbg))
+
+
 OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license"
 OE_IMPORTS[type] = "list"
 
@@ -173,6 +219,7 @@ python base_do_unpack() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('WORKDIR'))
+        create_src_date_epoch_stamp(d)
     except bb.fetch2.BBFetchException as e:
         bb.fatal(str(e))
 }
@@ -383,9 +430,43 @@ def set_packagetriplet(d):
 
     settriplet(d, "PKGMLTRIPLETS", archs, tos, tvs)
 
+
+export PYTHONHASHSEED
+export PERL_HASH_SEED
+export SOURCE_DATE_EPOCH
+
+BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH PYTHONHASHSEED PERL_HASH_SEED "
+
 python () {
     import string, re
 
+    # Create reproducible_environment
+
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
+        import subprocess
+        d.setVar('PYTHONHASHSEED', '0')
+        d.setVar('PERL_HASH_SEED', '0')
+        d.setVar('TZ', 'UTC')
+
+        path = d.getVar('S')
+        epochfile = os.path.join(path,'src_date_epoch.txt')
+        if os.path.isfile(epochfile):
+            f = open(epochfile, 'r')
+            src_date_epoch = f.read()
+            f.close()
+            bb.debug(1, "src_date_epoch stamp found ---> stamp %s" % src_date_epoch)
+            d.setVar('SOURCE_DATE_EPOCH', src_date_epoch)
+        else:
+            bb.debug(1, "src_date_epoch stamp not found.")
+            d.setVar('SOURCE_DATE_EPOCH', '0')
+    else:
+        if 'PYTHONHASHSEED' in os.environ:
+            del os.environ['PYTHONHASHSEED']
+        if 'PERL_HASH_SEED' in os.environ:
+            del os.environ['PERL_HASH_SEED']
+        if 'SOURCE_DATE_EPOCH' in os.environ:
+            del os.environ['SOURCE_DATE_EPOCH']
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
@@ -678,6 +759,7 @@ python () {
             bb.warn("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?! The recipe may as well mark itself as machine specific directly." % d.getVar("PN"))
 }
 
+
 addtask cleansstate after do_clean
 python do_cleansstate() {
         sstate_clean_cachefiles(d)
-- 
2.7.4


