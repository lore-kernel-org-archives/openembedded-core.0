Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D57EE77F6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 02:03:00 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 28 May 2017 19:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,412,1491289200"; d="scan'208";a="107709381"
Received: from iho2-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.160.82])
	by fmsmga005.fm.intel.com with ESMTP; 28 May 2017 19:03:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 14:01:56 +1200
Message-Id: <17fedf4f271ace8731f5bc38aa372af18d74d326.1496022724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1496022724.git.paul.eggleton@linux.intel.com>
References: <cover.1496022724.git.paul.eggleton@linux.intel.com>
Subject: [pyro][PATCH 1/1] scriptutils: fix fetch_uri() to work with RSS
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
X-List-Received-Date: Mon, 29 May 2017 02:03:01 -0000

Since recipe-specific sysroots were implemented, devtool add and devtool
upgrade operations that fetch from a URL that requires native sysroot
dependencies will fail to work as there is no recipe-specific sysroot
set up for them during fetching. An example was any URL pointing to a
tarball compressed with xz, e.g. devtool upgrade on gnutls.

The most expedient way to fix this is to set up a dummy recipe-specific
sysroot to use for the fetch/unpack operations. We do this in the same
manner as bitbake -b does, so we're just taking all of the sysroot
components available and creating a sysroot from those rather than
ensuring the correct dependencies are there - this means that we're
still going to have problems if e.g. xz-native hasn't been built yet,
but that issue will be trickier to solve and is tracked separately.

Fixes [YOCTO #11474].

(From OE-Core master rev: 559151e783759af78b5cdd76cdbb9ce325a391e6)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/scriptutils.py | 65 +++++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 4ccbe5c..92b601c 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -21,6 +21,8 @@ import logging
 import glob
 import argparse
 import subprocess
+import tempfile
+import shutil
 
 def logger_create(name, stream=None):
     logger = logging.getLogger(name)
@@ -78,32 +80,47 @@ def git_convert_standalone_clone(repodir):
 
 def fetch_uri(d, uri, destdir, srcrev=None):
     """Fetch a URI to a local directory"""
-    import bb.data
-    bb.utils.mkdirhier(destdir)
-    localdata = bb.data.createCopy(d)
-    localdata.setVar('BB_STRICT_CHECKSUM', '')
-    localdata.setVar('SRCREV', srcrev)
-    ret = (None, None)
-    olddir = os.getcwd()
+    import bb
+    tmpparent = d.getVar('BASE_WORKDIR')
+    bb.utils.mkdirhier(tmpparent)
+    tmpworkdir = tempfile.mkdtemp(dir=tmpparent)
     try:
-        fetcher = bb.fetch2.Fetch([uri], localdata)
-        for u in fetcher.ud:
-            ud = fetcher.ud[u]
-            ud.ignore_checksums = True
-        fetcher.download()
-        for u in fetcher.ud:
-            ud = fetcher.ud[u]
-            if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR').rstrip(os.sep):
-                raise Exception('Local path is download directory - please check that the URI "%s" is correct' % uri)
-        fetcher.unpack(destdir)
-        for u in fetcher.ud:
-            ud = fetcher.ud[u]
-            if ud.method.recommends_checksum(ud):
-                md5value = bb.utils.md5_file(ud.localpath)
-                sha256value = bb.utils.sha256_file(ud.localpath)
-                ret = (md5value, sha256value)
+        bb.utils.mkdirhier(destdir)
+        localdata = bb.data.createCopy(d)
+
+        # Set some values to allow extend_recipe_sysroot to work here we're we are not running from a task
+        localdata.setVar('WORKDIR', tmpworkdir)
+        localdata.setVar('BB_RUNTASK', 'do_fetch')
+        localdata.setVar('PN', 'dummy')
+        localdata.setVar('BB_LIMITEDDEPS', '1')
+        bb.build.exec_func("extend_recipe_sysroot", localdata)
+
+        # Set some values for the benefit of the fetcher code
+        localdata.setVar('BB_STRICT_CHECKSUM', '')
+        localdata.setVar('SRCREV', srcrev)
+        ret = (None, None)
+        olddir = os.getcwd()
+        try:
+            fetcher = bb.fetch2.Fetch([uri], localdata)
+            for u in fetcher.ud:
+                ud = fetcher.ud[u]
+                ud.ignore_checksums = True
+            fetcher.download()
+            for u in fetcher.ud:
+                ud = fetcher.ud[u]
+                if ud.localpath.rstrip(os.sep) == localdata.getVar('DL_DIR').rstrip(os.sep):
+                    raise Exception('Local path is download directory - please check that the URI "%s" is correct' % uri)
+            fetcher.unpack(destdir)
+            for u in fetcher.ud:
+                ud = fetcher.ud[u]
+                if ud.method.recommends_checksum(ud):
+                    md5value = bb.utils.md5_file(ud.localpath)
+                    sha256value = bb.utils.sha256_file(ud.localpath)
+                    ret = (md5value, sha256value)
+        finally:
+            os.chdir(olddir)
     finally:
-        os.chdir(olddir)
+        shutil.rmtree(tmpworkdir)
     return ret
 
 def run_editor(fn):
-- 
2.9.4


