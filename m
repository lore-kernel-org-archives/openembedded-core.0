Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id D5B4E74998
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=22876; q=dns/txt;
	s=iport; t=1522776258; x=1523985858;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=EKH07yMyZaNly7iel5DrG9+kz3OsJJi/zU7n3eNPuJo=;
	b=K9kd6HVFZZmIV0CMgFfWCsLddF9gQwOISGrQX2k0GrTymayg2tM2SUvV
	XN8t6xzVz7+woN7/hSergoq5M+zyo9g9hJu50kS8G2PmrZ/k6E5qeRwjI
	n5vFDPIE8jAWuFNqSJa9wu7Vy7fIi+JMTihiX7QaSEsK4pF5c2B6DxmMe o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DQAABQuMNa/4cNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNCgVAoi1+NBIJpGpJVFIFmC4FYASGDCQKEQiE0GAECAQE?=
	=?us-ascii?q?BAQEBAmsohSMGeRBRVxmFDawCEYM8iESCJYdhghOBDIJQhFwMhg8ChyKETwE?=
	=?us-ascii?q?LVoonQQiIH4YQAow1hkCJFgIREwGBJRw4gVJNIxU6gkOCIBeONh8wAS+ODQE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.48,402,1517875200"; d="scan'208";a="377260858"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 17:23:58 +0000
Received: from kamensky-w541.cisco.com ([10.82.174.186]) (authenticated bits=0)
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w33HNck5010603
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 3 Apr 2018 17:23:57 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 10:23:37 -0700
Message-Id: <1522776217-23250-6-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
References: <1522776217-23250-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [PATCH v2 5/5] crosstap: replace script with new python based implementation
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
X-List-Received-Date: Tue, 03 Apr 2018 17:24:17 -0000

New crosstap python implementation is total replacement for
crosstap shell script, that has superseding capabilities.
New script support cross compiling of SystemTap scripts
for user-land, by using supplied image rootfs. Whereas old
script could only deal with scripts against kernel. New script
has more complex logic and additional capabilities.

As invocation interface new script support old "legacy"
mode and provides alternative new regular options interface
to access additional functionality.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 scripts/crosstap | 586 ++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 450 insertions(+), 136 deletions(-)

diff --git a/scripts/crosstap b/scripts/crosstap
index 39739bb..e33fa4a 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -1,15 +1,22 @@
-#!/bin/bash
+#!/usr/bin/env python3
 #
-# Run a systemtap script on remote target
+# Build a systemtap script for a given image, kernel
 #
-# Examples (run on build host, target is 192.168.1.xxx):
-#   $ source oe-init-build-env"
-#   $ cd ~/my/systemtap/scripts"
+# Effectively script extracts needed information from set of
+# 'bitbake -e' commands and contructs proper invocation of stap on
+# host to build systemtap script for a given target.
 #
-#   $ crosstap root@192.168.1.xxx myscript.stp"
-#   $ crosstap root@192.168.1.xxx myscript-with-args.stp 99 ninetynine"
+# By default script will compile scriptname.ko that could be copied
+# to taget and activated with 'staprun scriptname.ko' command. Or if
+# --remote user@hostname option is specified script will build, load
+# execute script on target.
 #
-# Copyright (c) 2012, Intel Corporation.
+# This script is very similar and inspired by crosstap shell script.
+# The major difference that this script supports user-land related
+# systemtap script, whereas crosstap could deal only with scripts
+# related to kernel.
+#
+# Copyright (c) 2018, Cisco Systems.
 # All rights reserved.
 #
 # This program is free software; you can redistribute it and/or modify
@@ -25,131 +32,438 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-function usage() {
-    echo "Usage: $0 <user@hostname> <sytemtap-script> [additional systemtap-script args]"
-}
-
-function setup_usage() {
-    echo ""
-    echo "'crosstap' requires a local sdk build of the target system"
-    echo "(or a build that includes 'tools-profile') in order to build"
-    echo "kernel modules that can probe the target system."
-    echo ""
-    echo "Practically speaking, that means you need to do the following:"
-    echo "  - If you're running a pre-built image, download the release"
-    echo "    and/or BSP tarballs used to build the image."
-    echo "  - If you're working from git sources, just clone the metadata"
-    echo "    and BSP layers needed to build the image you'll be booting."
-    echo "  - Make sure you're properly set up to build a new image (see"
-    echo "    the BSP README and/or the widely available basic documentation"
-    echo "    that discusses how to build images)."
-    echo "  - Build an -sdk version of the image e.g.:"
-    echo "      $ bitbake core-image-sato-sdk"
-    echo "  OR"
-    echo "  - Build a non-sdk image but include the profiling tools:"
-    echo "      [ edit local.conf and add 'tools-profile' to the end of"
-    echo "        the EXTRA_IMAGE_FEATURES variable ]"
-    echo "      $ bitbake core-image-sato"
-    echo ""
-    echo "  [ NOTE that 'crosstap' needs to be able to ssh into the target"
-    echo "    system, which isn't enabled by default in -minimal images. ]"
-    echo ""
-    echo "Once you've build the image on the host system, you're ready to"
-    echo "boot it (or the equivalent pre-built image) and use 'crosstap'"
-    echo "to probe it (you need to source the environment as usual first):"
-    echo ""
-    echo "    $ source oe-init-build-env"
-    echo "    $ cd ~/my/systemtap/scripts"
-    echo "    $ crosstap root@192.168.1.xxx myscript.stp"
-    echo ""
-}
-
-function systemtap_target_arch() {
-    SYSTEMTAP_TARGET_ARCH=$1
-    case $SYSTEMTAP_TARGET_ARCH in
-        i?86)
-            SYSTEMTAP_TARGET_ARCH="i386"
-            ;;
-        x86?64*)
-            SYSTEMTAP_TARGET_ARCH="x86_64"
-            ;;
-        arm*)
-            SYSTEMTAP_TARGET_ARCH="arm"
-            ;;
-        powerpc*)
-            SYSTEMTAP_TARGET_ARCH="powerpc"
-            ;;
-        *)
-            ;;
-    esac
-}
-
-if [ $# -lt 2 ]; then
-	usage
-	exit 1
-fi
-
-if [ -z "$BUILDDIR" ]; then
-    echo "Error: Unable to find the BUILDDIR environment variable."
-    echo "Did you forget to source your build system environment setup script?"
-    exit 1
-fi
-
-pushd $PWD
-cd $BUILDDIR
-BITBAKE_VARS=`bitbake -e virtual/kernel`
-popd
-
-STAGING_BINDIR_TOOLCHAIN=$(echo "$BITBAKE_VARS" | grep ^STAGING_BINDIR_TOOLCHAIN \
-  | cut -d '=' -f2 | cut -d '"' -f2)
-STAGING_BINDIR_TOOLPREFIX=$(echo "$BITBAKE_VARS" | grep ^TARGET_PREFIX \
-  | cut -d '=' -f2 | cut -d '"' -f2)
-TARGET_ARCH=$(echo "$BITBAKE_VARS" | grep ^TRANSLATED_TARGET_ARCH \
-  | cut -d '=' -f2 | cut -d '"' -f2)
-TARGET_KERNEL_BUILDDIR=$(echo "$BITBAKE_VARS" | grep ^B= \
-  | cut -d '=' -f2 | cut -d '"' -f2)
-
-# Build and populate the recipe-sysroot-native with systemtap-native
-pushd $PWD
-cd $BUILDDIR
-BITBAKE_VARS=`bitbake -e systemtap-native`
-popd
-SYSTEMTAP_HOST_INSTALLDIR=$(echo "$BITBAKE_VARS" | grep ^STAGING_DIR_NATIVE \
-  | cut -d '=' -f2 | cut -d '"' -f2)
-
-systemtap_target_arch "$TARGET_ARCH"
-
-if [ ! -d $TARGET_KERNEL_BUILDDIR ] ||
-   [ ! -f $TARGET_KERNEL_BUILDDIR/vmlinux ]; then
-    echo -e "\nError: No target kernel build found."
-    echo -e "Did you forget to create a local build of your image?"
-    setup_usage
-    exit 1
-fi
-
-if [ ! -f $SYSTEMTAP_HOST_INSTALLDIR/usr/bin/stap ]; then
-    echo -e "\nError: Native (host) systemtap not found."
-    echo -e "Did you accidentally build a local non-sdk image? (or forget to"
-    echo -e "add 'tools-profile' to EXTRA_IMAGE_FEATURES in your local.conf)?"
-    echo -e "You can also: bitbake -c addto_recipe_sysroot systemtap-native"
-    setup_usage
-    exit 1
-fi
-
-target_user_hostname="$1"
-full_script_name="$2"
-script_name=$(basename "$2")
-script_base=${script_name%.*}
-shift 2
-
-${SYSTEMTAP_HOST_INSTALLDIR}/usr/bin/stap \
-  -a ${SYSTEMTAP_TARGET_ARCH} \
-  -B CROSS_COMPILE="${STAGING_BINDIR_TOOLCHAIN}/${STAGING_BINDIR_TOOLPREFIX}" \
-  -r ${TARGET_KERNEL_BUILDDIR} \
-  -I ${SYSTEMTAP_HOST_INSTALLDIR}/usr/share/systemtap/tapset \
-  -R ${SYSTEMTAP_HOST_INSTALLDIR}/usr/share/systemtap/runtime \
-  --remote=$target_user_hostname \
-  -m $script_base \
-   $full_script_name "$@"
-
-exit 0
+import sys
+import re
+import subprocess
+import os
+import optparse
+
+class Stap(object):
+    def __init__(self, script, module, remote):
+        self.script = script
+        self.module = module
+        self.remote = remote
+        self.stap = None
+        self.sysroot = None
+        self.runtime = None
+        self.tapset = None
+        self.arch = None
+        self.cross_compile = None
+        self.kernel_release = None
+        self.target_path = None
+        self.target_ld_library_path = None
+
+        if not self.remote:
+            if not self.module:
+                # derive module name from script
+                self.module = os.path.basename(self.script)
+                if self.module[-4:] == ".stp":
+                    self.module = self.module[:-4]
+                    # replace - if any with _
+                    self.module = self.module.replace("-", "_")
+
+    def command(self, args):
+        ret = []
+        ret.append(self.stap)
+
+        if self.remote:
+            ret.append("--remote")
+            ret.append(self.remote)
+        else:
+            ret.append("-p4")
+            ret.append("-m")
+            ret.append(self.module)
+
+        ret.append("-a")
+        ret.append(self.arch)
+
+        ret.append("-B")
+        ret.append("CROSS_COMPILE=" + self.cross_compile)
+
+        ret.append("-r")
+        ret.append(self.kernel_release)
+
+        ret.append("-I")
+        ret.append(self.tapset)
+
+        ret.append("-R")
+        ret.append(self.runtime)
+
+        if self.sysroot:
+            ret.append("--sysroot")
+            ret.append(self.sysroot)
+
+            ret.append("--sysenv=PATH=" + self.target_path)
+            ret.append("--sysenv=LD_LIBRARY_PATH=" + self.target_ld_library_path)
+
+        ret = ret + args
+
+        ret.append(self.script)
+        return ret
+
+    def additional_environment(self):
+        ret = {}
+        ret["SYSTEMTAP_DEBUGINFO_PATH"] = "+:.debug:build"
+        return ret
+
+    def environment(self):
+        ret = os.environ.copy()
+        additional = self.additional_environment()
+        for e in additional:
+            ret[e] = additional[e]
+        return ret
+
+    def display_command(self, args):
+        additional_env = self.additional_environment()
+        command = self.command(args)
+
+        print("#!/bin/sh")
+        for e in additional_env:
+            print("export %s=\"%s\"" % (e, additional_env[e]))
+        print(" ".join(command))
+
+class BitbakeEnvInvocationException(Exception):
+    def __init__(self, message):
+        self.message = message
+
+class BitbakeEnv(object):
+    BITBAKE="bitbake"
+
+    def __init__(self, package):
+        self.package = package
+        self.cmd = BitbakeEnv.BITBAKE + " -e " + self.package
+        self.popen = subprocess.Popen(self.cmd, shell=True,
+                                      stdout=subprocess.PIPE,
+                                      stderr=subprocess.STDOUT)
+        self.__lines = self.popen.stdout.readlines()
+        self.popen.wait()
+
+        self.lines = []
+        for line in self.__lines:
+                self.lines.append(line.decode('utf-8'))
+
+    def get_vars(self, vars):
+        if self.popen.returncode:
+            raise BitbakeEnvInvocationException(
+                "\nFailed to execute '" + self.cmd +
+                "' with the following message:\n" +
+                ''.join(self.lines))
+
+        search_patterns = []
+        retdict = {}
+        for var in vars:
+            # regular not exported variable
+            rexpr = "^" + var + "=\"(.*)\""
+            re_compiled = re.compile(rexpr)
+            search_patterns.append((var, re_compiled))
+
+            # exported variable
+            rexpr = "^export " + var + "=\"(.*)\""
+            re_compiled = re.compile(rexpr)
+            search_patterns.append((var, re_compiled))
+
+            for line in self.lines:
+                for var, rexpr in search_patterns:
+                    m = rexpr.match(line)
+                    if m:
+                        value = m.group(1)
+                        retdict[var] = value
+
+        # fill variables values in order how they were requested
+        ret = []
+        for var in vars:
+            ret.append(retdict.get(var))
+
+        # if it is single value list return it as scalar, not the list
+        if len(ret) == 1:
+            ret = ret[0]
+
+        return ret
+
+class ParamDiscovery(object):
+    SYMBOLS_CHECK_MESSAGE = """
+WARNING: image '%s' does not have dbg-pkgs IMAGE_FEATURES enabled and no
+"image-combined-dbg" in inherited classes is specified. As result the image
+does not have symbols for user-land processes DWARF based probes. Consider
+adding 'dbg-pkgs' to EXTRA_IMAGE_FEATURES or adding "image-combined-dbg" to
+USER_CLASSES. I.e add this line 'USER_CLASSES += "image-combined-dbg"' to
+local.conf file.
+
+Or you may use IMAGE_GEN_DEBUGFS="1" option, and then after build you need
+recombine/unpack image and image-dbg tarballs and pass resulting dir location
+with --sysroot option.
+"""
+
+    def __init__(self, image):
+        self.image = image
+
+        self.image_rootfs = None
+        self.image_features = None
+        self.image_gen_debugfs = None
+        self.inherit = None
+        self.base_bindir = None
+        self.base_sbindir = None
+        self.base_libdir = None
+        self.bindir = None
+        self.sbindir = None
+        self.libdir = None
+
+        self.staging_bindir_toolchain = None
+        self.target_prefix = None
+        self.target_arch = None
+        self.target_kernel_builddir = None
+
+        self.staging_dir_native = None
+
+        self.image_combined_dbg = False
+
+    def discover(self):
+        if self.image:
+            benv_image = BitbakeEnv(self.image)
+            (self.image_rootfs,
+             self.image_features,
+             self.image_gen_debugfs,
+             self.inherit,
+             self.base_bindir,
+             self.base_sbindir,
+             self.base_libdir,
+             self.bindir,
+             self.sbindir,
+             self.libdir
+            ) = benv_image.get_vars(
+                 ("IMAGE_ROOTFS",
+                  "IMAGE_FEATURES",
+                  "IMAGE_GEN_DEBUGFS",
+                  "INHERIT",
+                  "base_bindir",
+                  "base_sbindir",
+                  "base_libdir",
+                  "bindir",
+                  "sbindir",
+                  "libdir"
+                  ))
+
+        benv_kernel = BitbakeEnv("virtual/kernel")
+        (self.staging_bindir_toolchain,
+         self.target_prefix,
+         self.target_arch,
+         self.target_kernel_builddir
+        ) = benv_kernel.get_vars(
+             ("STAGING_BINDIR_TOOLCHAIN",
+              "TARGET_PREFIX",
+              "TRANSLATED_TARGET_ARCH",
+              "B"
+            ))
+
+        benv_systemtap = BitbakeEnv("systemtap-native")
+        (self.staging_dir_native
+        ) = benv_systemtap.get_vars(["STAGING_DIR_NATIVE"])
+
+        if self.inherit:
+            if "image-combined-dbg" in self.inherit.split():
+                self.image_combined_dbg = True
+
+    def check(self, sysroot_option):
+        ret = True
+        if self.image_rootfs:
+            sysroot = self.image_rootfs
+            if not os.path.isdir(self.image_rootfs):
+                print("ERROR: Cannot find '" + sysroot +
+                      "' directory. Was '" + self.image + "' image built?")
+                ret = False
+
+        stap = self.staging_dir_native + "/usr/bin/stap"
+        if not os.path.isfile(stap):
+            print("ERROR: Cannot find '" + stap +
+                  "'. Was 'systemtap-native' built?")
+            ret = False
+
+        if not os.path.isdir(self.target_kernel_builddir):
+            print("ERROR: Cannot find '" + self.target_kernel_builddir +
+                  "' directory. Was 'kernel/virtual' built?")
+            ret = False
+
+        if not sysroot_option and self.image_rootfs:
+            dbg_pkgs_found = False
+
+            if self.image_features:
+                image_features = self.image_features.split()
+                if "dbg-pkgs" in image_features:
+                    dbg_pkgs_found = True
+
+            if not dbg_pkgs_found \
+               and not self.image_combined_dbg:
+                print(ParamDiscovery.SYMBOLS_CHECK_MESSAGE % (self.image))
+
+        if not ret:
+            print("")
+
+        return ret
+
+    def __map_systemtap_arch(self):
+        a = self.target_arch
+        ret = a
+        if   re.match('(athlon|x86.64)$', a):
+            ret = 'x86_64'
+        elif re.match('i.86$', a):
+            ret = 'i386'
+        elif re.match('arm$', a):
+            ret = 'arm'
+        elif re.match('aarch64$', a):
+            ret = 'arm64'
+        elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):
+            ret = 'mips'
+        elif re.match('p(pc|owerpc)(|64)', a):
+            ret = 'powerpc'
+        return ret
+
+    def fill_stap(self, stap):
+        stap.stap = self.staging_dir_native + "/usr/bin/stap"
+        if not stap.sysroot:
+            if self.image_rootfs:
+                if self.image_combined_dbg:
+                    stap.sysroot = self.image_rootfs + "-dbg"
+                else:
+                    stap.sysroot = self.image_rootfs
+        stap.runtime = self.staging_dir_native + "/usr/share/systemtap/runtime"
+        stap.tapset = self.staging_dir_native + "/usr/share/systemtap/tapset"
+        stap.arch = self.__map_systemtap_arch()
+        stap.cross_compile = self.staging_bindir_toolchain + "/" + \
+                             self.target_prefix
+        stap.kernel_release = self.target_kernel_builddir
+
+        # do we have standard that tells in which order these need to appear
+        target_path = []
+        if self.sbindir:
+            target_path.append(self.sbindir)
+        if self.bindir:
+            target_path.append(self.bindir)
+        if self.base_sbindir:
+            target_path.append(self.base_sbindir)
+        if self.base_bindir:
+            target_path.append(self.base_bindir)
+        stap.target_path = ":".join(target_path)
+
+        target_ld_library_path = []
+        if self.libdir:
+            target_ld_library_path.append(self.libdir)
+        if self.base_libdir:
+            target_ld_library_path.append(self.base_libdir)
+        stap.target_ld_library_path = ":".join(target_ld_library_path)
+
+
+def main():
+    usage = """usage: %prog -s <systemtap-script> [options] [-- [systemtap options]]
+
+%prog cross compile given SystemTap script against given image, kernel
+
+It needs to run in environtment set for bitbake - it uses bitbake -e
+invocations to retrieve information to construct proper stap cross build
+invocation arguments. It assumes that systemtap-native is built in given
+bitbake workspace.
+
+Anything after -- option is passed directly to stap.
+
+Legacy script invocation style supported but depreciated:
+  %prog <user@hostname> <sytemtap-script> [systemtap options]
+
+To enable most out of systemtap the following site.conf or local.conf
+configuration is recommended:
+
+# enables symbol + target binaries rootfs-dbg in workspace
+IMAGE_GEN_DEBUGFS = "1"
+IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
+USER_CLASSES += "image-combined-dbg"
+
+# enables kernel debug symbols
+KERNEL_EXTRA_FEATURES_append = " features/debug/debug-kernel.scc"
+
+# minimal, just run-time systemtap configuration in target image
+PACKAGECONFIG_pn-systemtap = "monitor"
+
+# add systemtap run-time into target image if it is not there yet
+IMAGE_INSTALL_append = " systemtap"
+"""
+    option_parser = optparse.OptionParser(usage=usage)
+
+    option_parser.add_option("-s", "--script", dest="script",
+                             help="specify input script FILE name",
+                             metavar="FILE")
+
+    option_parser.add_option("-i", "--image", dest="image",
+                             help="specify image name for which script should be compiled")
+
+    option_parser.add_option("-r", "--remote", dest="remote",
+                             help="specify username@hostname of remote target to run script "
+                             "optional, it assumes that remote target can be accessed through ssh")
+
+    option_parser.add_option("-m", "--module", dest="module",
+                             help="specify module name, optional, has effect only if --remote is not used, "
+                             "if not specified module name will be derived from passed script name")
+
+    option_parser.add_option("-y", "--sysroot", dest="sysroot",
+                             help="explicitely specify image sysroot location. May need to use it in case "
+                             "when IMAGE_GEN_DEBUGFS=\"1\" option is used and recombined with symbols "
+                             "in different location",
+                             metavar="DIR")
+
+    option_parser.add_option("-o", "--out", dest="out",
+                             action="store_true",
+                             help="output shell script that equvivalent invocation of this script with "
+                             "given set of arguments, in given bitbake environment. It could be stored in "
+                             "separate shell script and could be repeated without incuring bitbake -e "
+                             "invocation overhead",
+                             default=False)
+
+    option_parser.add_option("-d", "--debug", dest="debug",
+                             action="store_true",
+                             help="enable debug output. Use this option to see resulting stap invocation",
+                             default=False)
+
+    # is invocation follow syntax from orignal crosstap shell script
+    legacy_args = False
+
+    # check if we called the legacy way
+    if len(sys.argv) >= 3:
+        if sys.argv[1].find("@") != -1 and os.path.exists(sys.argv[2]):
+            legacy_args = True
+
+            # fill options values for legacy invocation case
+            options = optparse.Values
+            options.script = sys.argv[2]
+            options.remote = sys.argv[1]
+            options.image = None
+            options.module = None
+            options.sysroot = None
+            options.out = None
+            options.debug = None
+            remaining_args = sys.argv[3:]
+
+    if not legacy_args:
+        (options, remaining_args) = option_parser.parse_args()
+
+    if not options.script or not os.path.exists(options.script):
+        print("'-s FILE' option is missing\n")
+        option_parser.print_help()
+    else:
+        stap = Stap(options.script, options.module, options.remote)
+        discovery = ParamDiscovery(options.image)
+        discovery.discover()
+        if not discovery.check(options.sysroot):
+            option_parser.print_help()
+        else:
+            stap.sysroot = options.sysroot
+            discovery.fill_stap(stap)
+
+            if options.out:
+                stap.display_command(remaining_args)
+            else:
+                cmd = stap.command(remaining_args)
+                env = stap.environment()
+
+                if options.debug:
+                    print(" ".join(cmd))
+
+                os.execve(cmd[0], cmd, env)
+
+main()
-- 
2.7.4


