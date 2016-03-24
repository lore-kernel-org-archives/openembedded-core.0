Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 536EE6FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 01:38:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 18:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="917593330"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 18:38:12 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 19:39:11 -0600
Message-Id: <1458783551-757-4-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458783551-757-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1458783551-757-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv3 3/3] icecc.bbclass: replace icc with icecc
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
X-List-Received-Date: Thu, 24 Mar 2016 01:38:12 -0000

Make this class more clear and consistent, and avoid
confusion with the Intel C compiler (icc); the changes
affect function names, and calls to those functions

[YOCTO #8934]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/icecc.bbclass | 56 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index b4f1be5..e1c06c4 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -63,7 +63,7 @@ def create_path(compilers, bb, d):
     Create Symlinks for the icecc in the staging directory
     """
     staging = os.path.join(d.expand('${STAGING_BINDIR}'), "ice")
-    if icc_is_kernel(bb, d):
+    if icecc_is_kernel(bb, d):
         staging += "-kernel"
 
     #check if the icecc path is set by the user
@@ -90,13 +90,13 @@ def create_path(compilers, bb, d):
 
     return staging
 
-def use_icc(bb,d):
+def use_icecc(bb,d):
     if d.getVar('ICECC_DISABLED', False) == "1":
         # don't even try it, when explicitly disabled
         return "no"
 
     # allarch recipes don't use compiler
-    if icc_is_allarch(bb, d):
+    if icecc_is_allarch(bb, d):
         return "no"
 
     pn = d.getVar('PN', True)
@@ -137,29 +137,29 @@ def use_icc(bb,d):
 
     return "yes"
 
-def icc_is_allarch(bb, d):
+def icecc_is_allarch(bb, d):
     return d.getVar("PACKAGE_ARCH", True) == "all" or bb.data.inherits_class('allarch', d)
 
-def icc_is_kernel(bb, d):
+def icecc_is_kernel(bb, d):
     return \
         bb.data.inherits_class("kernel", d);
 
-def icc_is_native(bb, d):
+def icecc_is_native(bb, d):
     return \
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
 # Don't pollute allarch signatures with TARGET_FPU
-icc_version[vardepsexclude] += "TARGET_FPU"
-def icc_version(bb, d):
-    if use_icc(bb, d) == "no":
+icecc_version[vardepsexclude] += "TARGET_FPU"
+def icecc_version(bb, d):
+    if use_icecc(bb, d) == "no":
         return ""
 
     parallel = d.getVar('ICECC_PARALLEL_MAKE', False) or ""
     if not d.getVar('PARALLEL_MAKE', False) == "" and parallel:
         d.setVar("PARALLEL_MAKE", parallel)
 
-    if icc_is_native(bb, d):
+    if icecc_is_native(bb, d):
         archive_name = "local-host-env"
     elif d.expand('${HOST_PREFIX}') == "":
         bb.fatal(d.expand("${PN}"), " NULL prefix")
@@ -169,7 +169,7 @@ def icc_version(bb, d):
         target_sys = d.expand('${TARGET_SYS}')
         float = d.getVar('TARGET_FPU', False) or "hard"
         archive_name = prefix + distro + "-"        + target_sys + "-" + float
-        if icc_is_kernel(bb, d):
+        if icecc_is_kernel(bb, d):
             archive_name += "-kernel"
 
     import socket
@@ -178,29 +178,29 @@ def icc_version(bb, d):
 
     return tar_file
 
-def icc_path(bb,d):
-    if use_icc(bb, d) == "no":
+def icecc_path(bb,d):
+    if use_icecc(bb, d) == "no":
         # don't create unnecessary directories when icecc is disabled
         return
 
-    if icc_is_kernel(bb, d):
+    if icecc_is_kernel(bb, d):
         return create_path( [get_cross_kernel_cc(bb,d), ], bb, d)
 
     else:
         prefix = d.expand('${HOST_PREFIX}')
         return create_path( [prefix+"gcc", prefix+"g++"], bb, d)
 
-def icc_get_external_tool(bb, d, tool):
+def icecc_get_external_tool(bb, d, tool):
     external_toolchain_bindir = d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')
     target_prefix = d.expand('${TARGET_PREFIX}')
     return os.path.join(external_toolchain_bindir, '%s%s' % (target_prefix, tool))
 
 # Don't pollute native signatures with target TUNE_PKGARCH through STAGING_BINDIR_TOOLCHAIN
-icc_get_tool[vardepsexclude] += "STAGING_BINDIR_TOOLCHAIN"
-def icc_get_tool(bb, d, tool):
-    if icc_is_native(bb, d):
+icecc_get_tool[vardepsexclude] += "STAGING_BINDIR_TOOLCHAIN"
+def icecc_get_tool(bb, d, tool):
+    if icecc_is_native(bb, d):
         return bb.utils.which(os.getenv("PATH"), tool)
-    elif icc_is_kernel(bb, d):
+    elif icecc_is_kernel(bb, d):
         return bb.utils.which(os.getenv("PATH"), get_cross_kernel_cc(bb, d))
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
@@ -209,17 +209,17 @@ def icc_get_tool(bb, d, tool):
         if os.path.isfile(tool_bin):
             return tool_bin
         else:
-            external_tool_bin = icc_get_external_tool(bb, d, tool)
+            external_tool_bin = icecc_get_external_tool(bb, d, tool)
             if os.path.isfile(external_tool_bin):
                 return external_tool_bin
             else:
                 return ""
 
-def icc_get_and_check_tool(bb, d, tool):
+def icecc_get_and_check_tool(bb, d, tool):
     # Check that g++ or gcc is not a symbolic link to icecc binary in
     # PATH or icecc-create-env script will silently create an invalid
     # compiler environment package.
-    t = icc_get_tool(bb, d, tool)
+    t = icecc_get_tool(bb, d, tool)
     if t and os.popen("readlink -f %s" % t).read()[:-1] == get_icecc(d):
         bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
         return ""
@@ -246,27 +246,27 @@ def set_icecc_env():
     return
 
 set_icecc_env() {
-    if [ "${@use_icc(bb, d)}" = "no" ]
+    if [ "${@use_icecc(bb, d)}" = "no" ]
     then
         return
     fi
-    ICECC_VERSION="${@icc_version(bb, d)}"
+    ICECC_VERSION="${@icecc_version(bb, d)}"
     if [ "x${ICECC_VERSION}" = "x" ]
     then
         bbwarn "Cannot use icecc: could not get ICECC_VERSION"
         return
     fi
 
-    ICE_PATH="${@icc_path(bb, d)}"
+    ICE_PATH="${@icecc_path(bb, d)}"
     if [ "x${ICE_PATH}" = "x" ]
     then
         bbwarn "Cannot use icecc: could not get ICE_PATH"
         return
     fi
 
-    ICECC_CC="${@icc_get_and_check_tool(bb, d, "gcc")}"
-    ICECC_CXX="${@icc_get_and_check_tool(bb, d, "g++")}"
-    # cannot use icc_get_and_check_tool here because it assumes as without target_sys prefix
+    ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
+    ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
+    # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
     ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
     then
-- 
2.7.3


