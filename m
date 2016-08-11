Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 96378771EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475659"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:02 +1200
Message-Id: <303d3026c3bd97ad624ef6add479c67af6cb9213.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/10] lib/oe/copy_buildsystem: fix merging sstate directories for eSDK
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:31 -0000

When we don't have uninative enabled there's more merging to be done in
the default configuration (SDK_EXT_TYPE = "full" which by default means
SDK_INCLUDE_TOOLCHAIN = "1") and there are likely files that already
exist in the sstate feed we're assembling, so we need to take care to
merge the directory contents rather than just moving the directories
over. Additionally we now only run this if uninative genuinely isn't
enabled (i.e. NATIVELSBSTRING is different to the fixed value of
"universal".)

In the process of fixing this I discovered an unusual behaviour in
os.rename() - when we're merging these feeds we're dealing with
hard-linked sstate artifacts, and whilst os.rename() is supposed to
silently overwrite an existing destination (permissions allowing), if
you have the source and destination as hardlinks to the same file then
the os.rename() call will just silently fail. As a result the code now
just checks if the destination exists and deletes the source if so
(since we know it will be the same file, we don't need to check in this
case.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 4d3faf6..3d5a746 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -201,21 +201,25 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
         write_sigs_file(merged_output, arch_order, merged)
 
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring="", filterfile=None):
+    import shutil
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING', True)
     bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
-    if fixedlsbstring:
+    if fixedlsbstring and nativelsbstring != fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
             destdir = os.path.join(output_sstate_cache, fixedlsbstring)
-            bb.utils.mkdirhier(destdir)
-
-            dirlist = os.listdir(nativedir)
-            for i in dirlist:
-                src = os.path.join(nativedir, i)
-                dest = os.path.join(destdir, i)
-                os.rename(src, dest)
+            for root, _, files in os.walk(nativedir):
+                for fn in files:
+                    src = os.path.join(root, fn)
+                    dest = os.path.join(destdir, os.path.relpath(src, nativedir))
+                    if os.path.exists(dest):
+                        # Already exists, and it'll be the same file, so just delete it
+                        os.unlink(src)
+                    else:
+                        bb.utils.mkdirhier(os.path.dirname(dest))
+                        shutil.move(src, dest)
 
 def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, logfile=None):
     import subprocess
-- 
2.5.5


