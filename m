Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 82B5F731DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:26:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2016 09:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023783543"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.136])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 09:26:49 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 17:26:41 +0100
Message-Id: <5e6cdf1c7dc3acf0c262a6c34318e4bb103a2129.1472747098.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1472747098.git.joshua.g.lock@intel.com>
References: <cover.1472747098.git.joshua.g.lock@intel.com>
Subject: [PATCH v3 2/3] oe.path: preserve xattr in copytree() and copyhardlinktree()
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
X-List-Received-Date: Thu, 01 Sep 2016 16:26:49 -0000

Pass appropriate options to tar invocations in copytree() and
copyhardlinktree() to ensure that any extended attributes on the files
are preserved during the copy.

We have to drop the use cpio in "Copy-pass" mode in copyhardlinktree()
because cpio doesn't support extended attributes on files. Instead we
revert back to using cp with different patterns depending on whether
or not the directory contains dot files.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/path.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 3c07df3..631c3b4 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -65,7 +65,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
 
     bb.utils.mkdirhier(dst)
-    cmd = 'tar -cf - -C %s -p . | tar -xf - -C %s' % (src, dst)
+    cmd = "tar --xattrs --xattrs-include='*' -cf - -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
 def copyhardlinktree(src, dst):
@@ -77,9 +77,14 @@ def copyhardlinktree(src, dst):
     if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
         # Need to copy directories only with tar first since cp will error if two 
         # writers try and create a directory at the same time
-        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
+        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
-        cmd = 'cd %s; find . -print0 | cpio --null -pdlu %s' % (src, dst)
+        if os.path.isdir(src):
+            import glob
+            if len(glob.glob('%s/.??*' % src)) > 0:
+                src = src + '/.??* '
+            src = src + '/*'
+        cmd = 'cp -afl --preserve=xattr %s %s' % (src, dst)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
         copytree(src, dst)
-- 
2.7.4


