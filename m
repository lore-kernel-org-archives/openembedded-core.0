Return-Path: <michael.blaettler@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id CE852600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 07:43:31 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w1Q7hWQF015486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 08:43:32 +0100
Received: from dev.vm6.ccp.siemens.com (MD1F3VPC.ad001.siemens.net
	[139.16.116.120])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w1Q7hVik013380;
	Mon, 26 Feb 2018 08:43:31 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 96E793605BBD;
	Mon, 26 Feb 2018 08:43:31 +0100 (CET)
From: =?UTF-8?q?Michael=20Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 08:43:28 +0100
Message-Id: <20180226074328.15999-1-michael.blaettler@siemens.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] package.bbclass: variable to influence link style
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
X-List-Received-Date: Mon, 26 Feb 2018 07:43:33 -0000
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
 meta/classes/insane.bbclass           | 41 +++++++++++++++++++++++++++++++++++
 meta/classes/package.bbclass          | 21 +++++++++++++-----
 meta/conf/bitbake.conf                |  9 +++++++-
 meta/recipes-bsp/u-boot/u-boot.inc    |  3 +++
 meta/recipes-core/glibc/glibc_2.26.bb |  4 ++++
 5 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7407b29f86..4e20a6056e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -17,6 +17,8 @@
 #  -Check that scripts in base_[bindir|sbindir|libdir] do not reference
 #   files under exec_prefix
 #  -Check if the package name is upper case
+#  -Ensure GDB can link the debug information with the binary by the
+#   specified linkstyle.
 
 QA_SANE = "True"
 
@@ -28,6 +30,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn \
+            debug-linkstyle \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -514,6 +517,44 @@ def package_qa_hash_style(path, name, d, elf, messages):
     if has_syms and not sane:
         package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
 
+QAPATHTEST[debug-linkstyle] = "package_qa_debug_split_link_style"
+def package_qa_debug_split_link_style(path, name, d, elf, messages):
+    """
+    Check if the binary has the correct symbol for GDB to link debug information
+    to its corresponding binary.
+    """
+
+    # Skip if elf file is an object file or static library or if the debug information
+    # is not splited.
+    if not elf or not elf.isDynamic() or d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') == '1':
+        return
+
+    if os.path.islink(path):
+        return
+
+    link_style = d.getVar('PACKAGE_DEBUG_SPLIT_LINK_STYLE')
+
+    check_debuglink = True
+    if path.find(".debug") != -1:
+        check_debuglink = False  # do not check for debuglink in debug binaries
+
+    section_headers = elf.run_objdump("-h", d)
+
+    has_buildid = False
+    has_debuglink = False
+    for header in section_headers.split("\n"):
+        has_buildid |= ".note.gnu.build-id" in header
+        has_debuglink |= ".gnu_debuglink" in header
+
+    if link_style == "build-id":
+        sane = has_buildid and not has_debuglink
+    elif link_style == "both":
+        sane = has_buildid and (has_debuglink or not check_debuglink)
+    else:
+        sane = (has_debuglink or not check_debuglink)
+
+    if not sane:
+        package_qa_add_message(messages, "debug-linkstyle", "No or invalid link type in: '%s'" % path)
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
 def package_qa_check_buildpaths(path, name, d, elf, messages):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e7e93a067a..e2925bb2a9 100644
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
 
@@ -1031,7 +1040,7 @@ python split_and_strip_files () {
             bb.utils.mkdirhier(os.path.dirname(fpath))
             #bb.note("Split %s -> %s" % (file, fpath))
             # Only store off the hard link reference if we successfully split!
-            splitdebuginfo(file, fpath, debugsrcdir, sourcefile, d)
+            splitdebuginfo(file, fpath, debugsrcdir, sourcefile, create_debuglink, d)
 
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7007a6e9b6..225cf954a8 100644
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
index 464b65434e..2b1bc45e8d 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -116,6 +116,10 @@ rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
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


