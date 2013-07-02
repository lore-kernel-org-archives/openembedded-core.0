Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51C7F6AE6E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:02:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2013 07:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="363530369"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.242])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 07:02:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:02:40 +0100
Message-Id: <6d4348dcbbb37e2489f4b625c04beda5d0ad0848.1372773662.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372773662.git.paul.eggleton@linux.intel.com>
References: <cover.1372773662.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372773662.git.paul.eggleton@linux.intel.com>
References: <cover.1372773662.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] classes/package: print command output when commands fail
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
X-List-Received-Date: Tue, 02 Jul 2013 14:02:57 -0000

When external commands such as debugedit fail, it can be useful to see
their output, so use oe.utils.getstatusoutput() instead of
subprocess.call() to capture this and print it on failure.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8e6029a..5c2d1c6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -236,7 +236,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     #
     # sourcefile is also generated containing a list of debugsources
 
-    import stat, subprocess
+    import stat
 
     dvar = d.getVar('PKGD', True)
     objcopy = d.getVar("OBJCOPY", True)
@@ -257,22 +257,22 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # We need to extract the debug src information here...
     if debugsrcdir:
         cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
-        retval = subprocess.call(cmd, shell=True)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
         if retval:
-            bb.fatal("debugedit failed with exit code %s (cmd was %s)" % (retval, cmd))
+            bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
 
     cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
-    retval = subprocess.call(cmd, shell=True)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
     if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)" % (retval, cmd))
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     # Set the debuglink to have the view of the file path on the target
     cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
-    retval = subprocess.call(cmd, shell=True)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
     if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)" % (retval, cmd))
+        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     if newmode:
         os.chmod(file, origmode)
@@ -283,7 +283,7 @@ def copydebugsources(debugsrcdir, d):
     # The debug src information written out to sourcefile is further procecessed
     # and copied to the destination here.
 
-    import stat, subprocess
+    import stat
 
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     if debugsrcdir and os.path.isfile(sourcefile):
@@ -311,7 +311,7 @@ def copydebugsources(debugsrcdir, d):
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
         cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
-        retval = subprocess.call(cmd, shell=True)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
         # Can "fail" if internal headers/transient sources are attempted
         #if retval:
         #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
@@ -319,9 +319,9 @@ def copydebugsources(debugsrcdir, d):
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
-        retval = subprocess.call(cmd, shell=True)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
         if retval:
-            bb.fatal("empty directory removal failed with exit code %s (cmd was %s)" % (retval, cmd))
+            bb.fatal("empty directory removal failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
         # Also remove debugsrcdir if its empty
         for p in nosuchdir[::-1]:
@@ -446,7 +446,6 @@ python package_do_split_locales() {
 }
 
 python perform_packagecopy () {
-    import subprocess
     dest = d.getVar('D', True)
     dvar = d.getVar('PKGD', True)
 
@@ -454,9 +453,9 @@ python perform_packagecopy () {
     # files to operate on
     # Preserve sparse files and hard links
     cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar)
-    retval = subprocess.call(cmd, shell=True)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
     if retval:
-        bb.fatal("file copy failed with exit code %s (cmd was %s)" % (retval, cmd))
+        bb.fatal("file copy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     # replace RPATHs for the nativesdk binaries, to make them relocatable
     if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d):
@@ -916,7 +915,7 @@ python split_and_strip_files () {
 }
 
 python populate_packages () {
-    import glob, re, subprocess
+    import glob, re
 
     workdir = d.getVar('WORKDIR', True)
     outdir = d.getVar('DEPLOY_DIR', True)
-- 
1.8.1.2


