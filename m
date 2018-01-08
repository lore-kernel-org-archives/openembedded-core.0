Return-Path: <michael.blaettler@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A7E70785D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 07:55:24 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w087gtiv009518
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 08:42:55 +0100
Received: from dev.vm6.ccp.siemens.com (MD1F3VPC.ad001.siemens.net
	[139.16.77.75])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w087gtGa015214;
	Mon, 8 Jan 2018 08:42:55 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 372F8330A964;
	Mon,  8 Jan 2018 08:42:55 +0100 (CET)
From: =?UTF-8?q?Michael=20Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 08:42:39 +0100
Message-Id: <20180108074239.13009-2-michael.blaettler@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108074239.13009-1-michael.blaettler@siemens.com>
References: <20180108074239.13009-1-michael.blaettler@siemens.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package.bbclass: variable to influence link style
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
X-List-Received-Date: Mon, 08 Jan 2018 07:55:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using separate debug file, gdb needs to match the debug file and
the binary. To match them, there can either be a .gnu_debuglink section
in the binary or a build-id embedded in the debug file and binary.
Until now, only the debuglink option was available. The problem with the
debuglink is, that it contains a checksum of the debug information.
Since the debug information depends on build path and many other things
reproducible binaries were not possible. The build-id can be set via
compiler flag and can be generated from ${PF} or other variables to
ensure reproducibility.

This commit introduces a new variable PACKAGE_DEBUG_SPLIT_LINK_STYLE
which specifies the link option between debug infos and binary. If
build-id is uesed as link option, the id can be defined with the
BUILD_ID variable.

Signed-off-by: Michael Blättler <michael.blaettler@siemens.com>
---
 meta/classes/package.bbclass          | 21 +++++++++++++++------
 meta/conf/bitbake.conf                |  9 ++++++++-
 meta/recipes-bsp/u-boot/u-boot.inc    |  3 +++
 meta/recipes-core/glibc/glibc_2.26.bb |  4 ++++
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dc759699f..41b50c199d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -345,7 +345,7 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
     return debugfiles.keys()
 
 
-def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
+def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, create_debuglink, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
     # two files are linked to reference each other.
@@ -390,10 +390,11 @@ def splitdebuginfo(file, debugfile, debugsrcdir, sourcefile, d):
         bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     # Set the debuglink to have the view of the file path on the target
-    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
-    (retval, output) = oe.utils.getstatusoutput(cmd)
-    if retval:
-        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
+    if create_debuglink:
+        cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
+        (retval, output) = oe.utils.getstatusoutput(cmd)
+        if retval:
+            bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
 
     if newmode:
         os.chmod(file, origmode)
@@ -906,6 +907,14 @@ python split_and_strip_files () {
         debuglibdir = ""
         debugsrcdir = "/usr/src/debug"
 
+    # Default to debuglink
+    if d.getVar('PACKAGE_DEBUG_SPLIT_LINK_STYLE') == 'debuglink':
+        create_debuglink = True
+    elif d.getVar('PACKAGE_DEBUG_SPLIT_LINK_STYLE') == 'build-id':
+        create_debuglink = False
+    else:  # default and 'both'
+        create_debuglink = True
+
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     bb.utils.remove(sourcefile)
 
@@ -1027,7 +1036,7 @@ python split_and_strip_files () {
             bb.utils.mkdirhier(os.path.dirname(fpath))
             #bb.note("Split %s -> %s" % (file, fpath))
             # Only store off the hard link reference if we successfully split!
-            splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
+            splitdebuginfo(file, fpath, debugsrcdir, sourcefile, create_debuglink, d)
 
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93afb13166..fc2f77fb54 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -578,8 +578,15 @@ LINKER_HASH_STYLE_mipsarch = "sysv"
 
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE') != 'gnu']}"
 
+BUILD_ID ??= "sha1"
+
+# Enable build-id if PACKAGE_DEBUG_SPLIT_LINK_STYLE equals 'build-id' or 'both'
+DEBUG_LINK_BUILDID ?= "${@['', '-Wl,--build-id=${BUILD_ID}']\
+                          [d.getVar('PACKAGE_DEBUG_SPLIT_LINK_STYLE') == 'build-id' or \
+                           d.getVar('PACKAGE_DEBUG_SPLIT_LINK_STYLE') == 'both']}"
+
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${DEBUG_LINK_BUILDID}"
 #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-O1"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c2bcf99840..7281a54571 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -72,6 +72,9 @@ do_compile () {
 	unset CFLAGS
 	unset CPPFLAGS
 
+	# Set LDFLAGS again in case a build-id is used to link debug files and binary
+	export LDFLAGS="${DEBUG_LINK_BUILDID}"
+
 	if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
 	then
 		echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 04d97734b3..866e4c65ea 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -113,6 +113,10 @@ rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
 do_compile () {
 	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
 	unset LDFLAGS
+
+	# Set LDFLAGS again in case a build-id is used to link debug files and binary
+	export LDFLAGS="${DEBUG_LINK_BUILDID}"
+
 	base_do_compile
 	(
 		cd ${S}/sunrpc/rpcsvc
-- 
2.11.0


