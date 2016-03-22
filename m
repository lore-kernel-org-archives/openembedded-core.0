Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBEB86FFA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:13:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2MCCpPd005365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 05:12:51 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 05:12:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Tue, 22 Mar 2016 08:12:29 -0400
Message-ID: <106023d3fcea3a639f3ef6d68265739359f22252.1458638728.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/16] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 22 Mar 2016 12:13:11 -0000
Content-Type: text/plain

Tweak DEBUG_FLAGS to use "/usr/src/debug" as source target path
in DWARF. While use gdb to debug binary, it could work with
sources in dbg package.

While -fdebug-prefix-map is used for compiling, we do not need
invoking debugedit to edit DWARF at do_package time, but list
where sources files are.

The copydebugsources uses the list to copy sources to dbg package.
It works whether -fdebug-prefix-map used or not.

[YOCTO #9305]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package.bbclass | 31 +++++++++++++++++++++++++------
 meta/conf/bitbake.conf       |  3 +--
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ef80e50..478a1d9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -300,6 +300,15 @@ def get_conffiles(pkg, d):
     os.chdir(cwd)
     return conf_list
 
+def checkbuildpath(file, d):
+    tmpdir = d.getVar('TMPDIR', True)
+    with open(file) as f:
+        file_content = f.read()
+        if tmpdir in file_content:
+            return True
+
+    return False
+
 def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
@@ -313,7 +322,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
     workdir = d.getVar("WORKDIR", True)
-    workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(os.path.dirname(workdir))
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -327,7 +335,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
+        cmd = "'%s' -i -l '%s' '%s'" % (debugedit, sourcefile, file)
         (retval, output) = oe.utils.getstatusoutput(cmd)
         if retval:
             bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
@@ -363,8 +371,14 @@ def copydebugsources(debugsrcdir, d):
         objcopy = d.getVar("OBJCOPY", True)
         debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
         workdir = d.getVar("WORKDIR", True)
-        workparentdir = os.path.dirname(os.path.dirname(workdir))
-        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
+
+        # If build path exists in sourcefile, it means toolchain did not use
+        # -fdebug-prefix-map to compile
+        if checkbuildpath(sourcefile, d):
+            localsrc_word = workdir
+        else:
+            localsrc_word = "/usr/src/debug"
+        localsrc_prefix = localsrc_word + '/'
 
         nosuchdir = []
         basepath = dvar
@@ -379,17 +393,22 @@ def copydebugsources(debugsrcdir, d):
         # We need to ignore files that are not actually ours
         # we do this by only paying attention to items from this package
         processdebugsrc += "fgrep -zw '%s' | "
+        # Remove prefix in the source paths
+        processdebugsrc += "sed 's#%s##g' | "
+
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
-        cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
+        cmd = processdebugsrc % (sourcefile, localsrc_word, localsrc_prefix, workdir, dvar, debugsrcdir)
         (retval, output) = oe.utils.getstatusoutput(cmd)
+
         # Can "fail" if internal headers/transient sources are attempted
         #if retval:
         #    bb.fatal("debug source copy failed with exit code %s (cmd was %s)" % (retval, cmd))
 
         # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
         # Work around this by manually finding and copying any symbolic links that made it through.
-        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
+        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workdir, dvar, debugsrcdir)
+
         (retval, output) = oe.utils.getstatusoutput(cmd)
         if retval:
             bb.fatal("debugsrc symlink fixup failed with exit code %s (cmd was %s)" % (retval, cmd))
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7ed5ffb..838ee81 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -550,8 +550,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
-                -fdebug-prefix-map=${B}=/usr/src/${BPN} \
-                -fdebug-prefix-map=${S}=/usr/src/${BPN} \
+                -fdebug-prefix-map=${WORKDIR}=/usr/src/debug \
                 -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                 -fdebug-prefix-map=${STAGING_DIR_HOST}= \
 "
-- 
1.9.1


