Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8598E6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:15:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2N6Fo7M026924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Mar 2016 23:15:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 23:15:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<bruce.ashfield@gmail.com>, <mark.hatle@windriver.com>
Date: Wed, 23 Mar 2016 02:15:42 -0400
Message-ID: <33e2a988b2639c965d4b733148a9eb20619b8a66.1458713426.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458713426.git.hongxu.jia@windriver.com>
References: <cover.1458713426.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 01/15] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Wed, 23 Mar 2016 06:15:55 -0000
Content-Type: text/plain

Tweak DEBUG_FLAGS to use "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
as source target path in DWARF. While use gdb to debug binary, it could
work with sources in dbg package.

While -fdebug-prefix-map is used for compiling, we do not need invoking
debugedit to edit DWARF at do_package time, but list where sources files
are.

The copydebugsources uses the list to copy sources to dbg package. It
works whether -fdebug-prefix-map used or not.

[YOCTO #9305]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package.bbclass | 24 ++++++++++++++++++++----
 meta/conf/bitbake.conf       |  3 +--
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ef80e50..b2f5868 100644
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
@@ -312,8 +321,6 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
     dvar = d.getVar('PKGD', True)
     objcopy = d.getVar("OBJCOPY", True)
     debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
-    workdir = d.getVar("WORKDIR", True)
-    workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or os.path.dirname(os.path.dirname(workdir))
 
     # We ignore kernel modules, we don't generate debug info files.
     if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
@@ -327,7 +334,7 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-        cmd = "'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (debugedit, workparentdir, debugsrcdir, sourcefile, file)
+        cmd = "'%s' -i -l '%s' '%s'" % (debugedit, sourcefile, file)
         (retval, output) = oe.utils.getstatusoutput(cmd)
         if retval:
             bb.fatal("debugedit failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
@@ -366,6 +373,13 @@ def copydebugsources(debugsrcdir, d):
         workparentdir = os.path.dirname(os.path.dirname(workdir))
         workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
 
+        # If build path exists in sourcefile, it means toolchain did not use
+        # -fdebug-prefix-map to compile
+        if checkbuildpath(sourcefile, d):
+            localsrc_prefix = workparentdir + "/"
+        else:
+            localsrc_prefix = "/usr/src/debug/"
+
         nosuchdir = []
         basepath = dvar
         for p in debugsrcdir.split("/"):
@@ -379,9 +393,11 @@ def copydebugsources(debugsrcdir, d):
         # We need to ignore files that are not actually ours
         # we do this by only paying attention to items from this package
         processdebugsrc += "fgrep -zw '%s' | "
+        # Remove prefix in the source paths
+        processdebugsrc += "sed 's#%s##g' | "
         processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
 
-        cmd = processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir)
+        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
         (retval, output) = oe.utils.getstatusoutput(cmd)
         # Can "fail" if internal headers/transient sources are attempted
         #if retval:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7ed5ffb..6bd6075 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -550,8 +550,7 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 # Optimization flags.
 ##################################################################
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types \
-                -fdebug-prefix-map=${B}=/usr/src/${BPN} \
-                -fdebug-prefix-map=${S}=/usr/src/${BPN} \
+                -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
                 -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                 -fdebug-prefix-map=${STAGING_DIR_HOST}= \
 "
-- 
1.9.1


