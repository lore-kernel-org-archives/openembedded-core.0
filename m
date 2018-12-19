Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 87AA579F02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 22:59:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 6AF3122062C;
	Thu, 20 Dec 2018 11:59:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 11:59:47 +1300
Message-Id: <20181219225948.30700-5-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219225948.30700-1-douglas.royds@taitradio.com>
References: <20181219225948.30700-1-douglas.royds@taitradio.com>
Subject: [PATCH 4/5] icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
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
X-List-Received-Date: Wed, 19 Dec 2018 23:00:00 -0000

The python function icecc_path() was being invoked inline by set_icecc_env(),
meaning that it was being invoked at recipe-parsing time.
As a side-effect, icecc_path() was creating the recipe-sysroot directory and
symlinking icecc into it. Because this was done at parsing time (rather than
configure time), we were generating otherwise-empty WORKDIRs for *all* parsed
recipes, and for all virtual classes (-native, -nativesdk).
In my build, this generated more than 800 of these otherwise-empty WORKDIRs.

I have simplified icecc_path() to return only the intended path to the icecc
symlinks in the recipe-sysroot, with no side-effect.
We then create the directory and the icecc symlinks at configure time.

Because get_cross_kernel_cc() is still invoked at parse-time,
it needs a guard-clause for the non-kernel case.
We are now finding the host icecc at do_configure time,
so icecc needs to be in the HOSTTOOLS. I have made this non-fatal,
so that we can still inherit icecc without icecc installed.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 62 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 2171e11db0..49597175ca 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -38,6 +38,8 @@ BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
+HOSTTOOLS_NONFATAL += "icecc"
+
 # This version can be incremented when changes are made to the environment that
 # invalidate the version on the compile nodes. Changing it will cause a new
 # environment to be created.
@@ -98,9 +100,11 @@ DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
 get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
-    kernel_cc = d.getVar('KERNEL_CC')
+    if not icecc_is_kernel(bb, d):
+        return None
 
     # evaluate the expression by the shell if necessary
+    kernel_cc = d.getVar('KERNEL_CC')
     if '`' in kernel_cc or '$(' in kernel_cc:
         import subprocess
         kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True).decode("utf-8")[:-1]
@@ -113,38 +117,6 @@ def get_cross_kernel_cc(bb,d):
 def get_icecc(d):
     return d.getVar('ICECC_PATH') or bb.utils.which(os.getenv("PATH"), "icecc")
 
-def create_path(compilers, bb, d):
-    """
-    Create Symlinks for the icecc in the staging directory
-    """
-    staging = os.path.join(d.expand('${STAGING_BINDIR}'), "ice")
-    if icecc_is_kernel(bb, d):
-        staging += "-kernel"
-
-    #check if the icecc path is set by the user
-    icecc = get_icecc(d)
-
-    # Create the dir if necessary
-    try:
-        os.stat(staging)
-    except:
-        try:
-            os.makedirs(staging)
-        except:
-            pass
-
-    for compiler in compilers:
-        gcc_path = os.path.join(staging, compiler)
-        try:
-            os.stat(gcc_path)
-        except:
-            try:
-                os.symlink(icecc, gcc_path)
-            except:
-                pass
-
-    return staging
-
 def use_icecc(bb,d):
     if d.getVar('ICECC_DISABLED') == "1":
         # don't even try it, when explicitly disabled
@@ -248,12 +220,11 @@ def icecc_path(bb,d):
         # don't create unnecessary directories when icecc is disabled
         return
 
+    staging = os.path.join(d.expand('${STAGING_BINDIR}'), "ice")
     if icecc_is_kernel(bb, d):
-        return create_path( [get_cross_kernel_cc(bb,d), ], bb, d)
+        staging += "-kernel"
 
-    else:
-        prefix = d.expand('${HOST_PREFIX}')
-        return create_path( [prefix+"gcc", prefix+"g++"], bb, d)
+    return staging
 
 def icecc_get_external_tool(bb, d, tool):
     external_toolchain_bindir = d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')
@@ -350,6 +321,23 @@ set_icecc_env() {
         return
     fi
 
+    ICECC_BIN="${@get_icecc(d)}"
+    if [ -z "${ICECC_BIN}" ]; then
+        bbwarn "Cannot use icecc: icecc binary not found"
+        return
+    fi
+
+    # Create symlinks to icecc in the recipe-sysroot directory
+    mkdir -p ${ICE_PATH}
+    if [ -n "${KERNEL_CC}" ]; then
+        compilers="${@get_cross_kernel_cc(bb,d)}"
+    else
+        compilers="${HOST_PREFIX}gcc ${HOST_PREFIX}g++"
+    fi
+    for compiler in $compilers; do
+        ln -sf ${ICECC_BIN} ${ICE_PATH}/$compiler
+    done
+
     ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
     ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
     # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
-- 
2.17.1


