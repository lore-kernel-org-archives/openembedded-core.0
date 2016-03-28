Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3F46FF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2S8JDxq011177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Mar 2016 01:19:13 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:47 -0400
Message-ID: <ff32532a209902db6637c34b408e77abf7a1fda6.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/17] conf/bitbake.conf package.bbclass: improve dbg package sources generation from work-shared
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:26 -0000
Content-Type: text/plain

Previously, the dbg package could not generate sources if they
are in work-shared dir (toolchain, kernel).

The fix add a new fdebug-prefix-map to remap work-shared dir
and collect sources to dbg package.

[YOCTO #9305]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package.bbclass | 100 +++++++++++++++++++++++++++++++------------
 meta/conf/bitbake.conf       |   1 +
 2 files changed, 73 insertions(+), 28 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdbe96d..f862d0b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -300,6 +300,14 @@ def get_conffiles(pkg, d):
     os.chdir(cwd)
     return conf_list
 
+def checkworkshared(file, d):
+    with open(file) as f:
+        file_content = f.read()
+        if "work-shared" in file_content:
+            return True
+
+    return False
+
 def checkbuildpath(file, d):
     tmpdir = d.getVar('TMPDIR', True)
     with open(file) as f:
@@ -309,6 +317,50 @@ def checkbuildpath(file, d):
 
     return False
 
+def collectsources(sourcefile, prefix_new, prefix_old, dest, d):
+    bb.utils.mkdirhier(dest)
+
+    # List all available sources
+    cmd =  "LC_ALL=C ; sort -z -u '%s' | " % sourcefile
+
+    # Filter out <internal> and <built-in>
+    cmd +=  "egrep -v -z '(<internal>|<built-in>)$' | "
+
+    # We need to ignore files that are not actually ours
+    # we do this by only paying attention to items from this package
+    cmd += "fgrep -zw '%s' | " % prefix_new
+
+    # Remove prefix in the source paths
+    cmd += "sed 's#%s/##g' | " % prefix_new
+
+    # If sources in WORKDIR, it ignores work-shared;
+    # If sources in work-shared, it filters nothing;
+    cmd += " sed -z '/work-shared/d' | "
+
+    # Enter dir prefix_old to copy sources
+    cmd += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s' 2>/dev/null)" % (prefix_old, dest)
+
+    (retval, output) = oe.utils.getstatusoutput(cmd)
+    # Can "fail" if internal headers/transient sources are attempted
+    #if retval:
+    #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
+
+# cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
+# Work around this by manually finding and copying any symbolic links that made it through.
+def dereferencesymlink(prefix_old, dest, d):
+    # Enter dir dest, list all available symlinks that were removed prefix dest
+    cmd = "find %s -type l -print0 -delete | sed 's#%s/##g' | " % (dest, dest)
+
+    # If sources in WORKDIR, it ignores work-shared;
+    # If sources in work-shared, it filters nothing;
+    cmd += " sed '/work-shared/d' | "
+
+    # Enter dir prefix_old to copy sources to dest
+    cmd += "(cd '%s'; cpio -pd0mL --no-preserve-owner '%s' 2>/dev/null)" % (prefix_old, dest)
+    (retval, output) = oe.utils.getstatusoutput(cmd)
+    if retval:
+        bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
@@ -370,15 +422,6 @@ def copydebugsources(debugsrcdir, d):
         objcopy = d.getVar("OBJCOPY", True)
         debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
         workdir = d.getVar("WORKDIR", True)
-        workparentdir = os.path.dirname(os.path.dirname(workdir))
-        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
-
-        # If build path exists in sourcefile, it means toolchain did not use
-        # -fdebug-prefix-map to compile
-        if checkbuildpath(sourcefile, d):
-            localsrc_prefix = workparentdir + "/"
-        else:
-            localsrc_prefix = "/usr/src/debug/"
 
         nosuchdir = []
         basepath = dvar
@@ -389,26 +432,27 @@ def copydebugsources(debugsrcdir, d):
         bb.utils.mkdirhier(basepath)
         cpath.updatecache(basepath)
 
-        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
-        # We need to ignore files that are not actually ours
-        # we do this by only paying attention to items from this package
-        processdebugsrc += "fgrep -zw '%s' | "
-        # Remove prefix in the source paths
-        processdebugsrc += "sed 's#%s##g' | "
-        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
-
-        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        # Can "fail" if internal headers/transient sources are attempted
-        #if retval:
-        #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
+        # Collect sources in work-shared
+        if checkworkshared(sourcefile, d):
+            if checkbuildpath(sourcefile, d):
+                prefix_new = prefix_old = d.expand("${TMPDIR}/work-shared")
+            else:
+                prefix_old = d.expand("${TMPDIR}/work-shared")
+                prefix_new = d.expand("/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/work-shared")
+            dest = "%s%s" % (dvar, d.expand("/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/work-shared"))
+            collectsources(sourcefile, prefix_new, prefix_old, dest, d)
+            dereferencesymlink(prefix_old, dest, d)
 
-        # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
-        # Work around this by manually finding and copying any symbolic links that made it through.
-        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
-        (retval, output) = oe.utils.getstatusoutput(cmd)
-        if retval:
-            bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
+        # If build path exists in sourcefile, it means toolchain did not use
+        # -fdebug-prefix-map to compile
+        if checkbuildpath(sourcefile, d):
+            prefix_new = prefix_old = workdir
+        else:
+            prefix_old = workdir
+            prefix_new = d.expand("/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")
+        dest = "%s%s" % (dvar, d.expand("/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"))
+        collectsources(sourcefile, prefix_new, prefix_old, dest, d)
+        dereferencesymlink(prefix_old, dest, d)
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
         cmd = "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0eb288e..007ae0f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -550,6 +550,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
+                -fdebug-prefix-map=${TMPDIR}/work-shared=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/work-shared \
                 -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
                 -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                 -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-- 
1.9.1


