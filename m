Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DF1E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:03:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.1334.1733940233898945415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3v-0005dr-Us; Wed, 11 Dec 2024 19:03:51 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3u-002u05-3C;
	Wed, 11 Dec 2024 19:03:51 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3v-008vkh-2D;
	Wed, 11 Dec 2024 19:03:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org,
	yocto@pengutronix.de
Subject: [PATCH v2 1/2] icecc: convert set_icecc_env to python prefuncs
Date: Wed, 11 Dec 2024 19:03:46 +0100
Message-Id: <20241211180348.2128102-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208601

Since bitbake commit f24bbaaddb36 ("data: Add support for new
BB_HASH_CODEPARSER_VALS for cache optimisation") the icecc fails with [1]:

ERROR: /Yocto/poky/meta/recipes-core/meta/target-sdk-provides-dummy.bb: no-pn NULL prefix
WARNING: /Yocto/poky/meta/recipes-core/meta/target-sdk-provides-dummy.bb: Exception during build_dependencies for set_icecc_env

The reason for this is the bb.fatal() within the icecc_version().
icecc_version() is called during the "${@}" python variable expansion
while bitbake is running the build_dependencies() for the
set_icecc_env() function.

To avoid this behaviour set_icecc_env() should be converted into a
python function which gets called during task[prefuncs] [2], which is
done by this commit.

[1] https://lists.yoctoproject.org/g/yocto/topic/icecc_support_broken/103429714
[2] https://lists.openembedded.org/g/openembedded-core/topic/110009272

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v2:
- drop no-pn check and instead convert set_icecc_env to a python based
  task[prefuncs]

v1: https://lists.openembedded.org/g/openembedded-core/topic/110009272

 meta/classes/icecc.bbclass | 200 +++++++++++++++++--------------------
 1 file changed, 91 insertions(+), 109 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 159cae20f8ca..8fe9739f870d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -304,145 +304,127 @@ def icecc_get_and_check_tool(bb, d, tool):
     else:
         return t
 
-wait_for_file() {
-    local TIME_ELAPSED=0
-    local FILE_TO_TEST=$1
-    local TIMEOUT=$2
-    until [ -f "$FILE_TO_TEST" ]
-    do
-        TIME_ELAPSED=$(expr $TIME_ELAPSED + 1)
-        if [ $TIME_ELAPSED -gt $TIMEOUT ]
-        then
-            return 1
-        fi
-        sleep 1
-    done
-}
-
-def set_icecc_env():
-    # dummy python version of set_icecc_env
-    return
-
 set_icecc_env[vardepsexclude] += "KERNEL_CC"
-set_icecc_env() {
-    if [ "${@use_icecc(bb, d)}" = "no" ]
-    then
+python set_icecc_env() {
+    import os
+    import subprocess
+
+    if use_icecc(bb, d) == "no":
         return
-    fi
-    ICECC_VERSION="${@icecc_version(bb, d)}"
-    if [ "x${ICECC_VERSION}" = "x" ]
-    then
-        bbwarn "Cannot use icecc: could not get ICECC_VERSION"
+    ICECC_VERSION = icecc_version(bb, d)
+    if not ICECC_VERSION:
+        bb.warn("Cannot use icecc: could not get ICECC_VERSION")
         return
-    fi
 
-    ICE_PATH="${@icecc_path(bb, d)}"
-    if [ "x${ICE_PATH}" = "x" ]
-    then
-        bbwarn "Cannot use icecc: could not get ICE_PATH"
+    ICE_PATH = icecc_path(bb, d)
+    if not ICE_PATH:
+        bb.warn("Cannot use icecc: could not get ICE_PATH")
         return
-    fi
 
-    ICECC_BIN="${@get_icecc(d)}"
-    if [ -z "${ICECC_BIN}" ]; then
-        bbwarn "Cannot use icecc: icecc binary not found"
+    ICECC_BIN = get_icecc(d)
+    if not ICECC_BIN:
+        bb.warn("Cannot use icecc: icecc binary not found")
         return
-    fi
-    if [ -z "$(which patchelf patchelf-uninative)" ]; then
-        bbwarn "Cannot use icecc: patchelf not found"
+
+    if (not bb.utils.which(os.getenv("PATH"), "patchelf") and
+        not bb.utils.which(os.getenv("PATH"), "patchelf-uninative")):
+        bb.warn("Cannot use icecc: patchelf not found")
         return
-    fi
 
-    ICECC_CC="${@icecc_get_and_check_tool(bb, d, "gcc")}"
-    ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
+    ICECC_CC = icecc_get_and_check_tool(bb, d, "gcc")
+    ICECC_CXX = icecc_get_and_check_tool(bb, d, "g++")
     # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
-    ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
-    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
-    then
-        bbnote "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
+    ICECC_WHICH_AS = bb.utils.which(os.getenv('PATH'), 'as')
+    if (not os.access(ICECC_CC, os.X_OK) or
+        not os.access(ICECC_CXX, os.X_OK)):
+        bb.note("Cannot use icecc: could not get ICECC_CC or ICECC_CXX")
+        return
+
+    cmd = []
+    try:
+        cmd = [ICECC_CC, '-dumpversion']
+        ICE_VERSION = subprocess.check_output(cmd).decode("utf-8").strip()
+    except subprocess.CalledProcessError as e:
+        bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
         return
-    fi
 
-    ICE_VERSION="$($ICECC_CC -dumpversion)"
-    ICECC_VERSION=$(echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g")
-    if [ ! -x "${ICECC_ENV_EXEC}" ]
-    then
-        bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
+    ICECC_VERSION = ICECC_VERSION.replace("@VERSION@", ICE_VERSION)
+
+    if not os.access(d.getVar('ICECC_ENV_EXEC'), os.X_OK):
+        bb.warn("Cannot use icecc: invalid ICECC_ENV_EXEC")
         return
-    fi
 
     # Create symlinks to icecc and wrapper-scripts in the recipe-sysroot directory
-    mkdir -p $ICE_PATH/symlinks
-    if [ -n "${KERNEL_CC}" ]; then
-        compilers="${@get_cross_kernel_cc(bb,d)}"
-    else
-        compilers="${HOST_PREFIX}gcc ${HOST_PREFIX}g++"
-    fi
-    for compiler in $compilers; do
-        ln -sf $ICECC_BIN $ICE_PATH/symlinks/$compiler
-        cat <<-__EOF__ > $ICE_PATH/$compiler
-		#!/bin/sh -e
-		export ICECC_VERSION=$ICECC_VERSION
-		export ICECC_CC=$ICECC_CC
-		export ICECC_CXX=$ICECC_CXX
-		$ICE_PATH/symlinks/$compiler "\$@"
-		__EOF__
-        chmod 775 $ICE_PATH/$compiler
-    done
-
-    ICECC_AS="$(${ICECC_CC} -print-prog-name=as)"
+    symlink_path = os.path.join(ICE_PATH, "symlinks")
+    bb.utils.mkdirhier(symlink_path)
+    compilers = []
+    if d.getVar('KERNEL_CC'):
+        compilers.append(get_cross_kernel_cc(bb,d))
+    else:
+        host_prefix = d.getVar('HOST_PREFIX')
+        compilers.extend([host_prefix + 'gcc', host_prefix + 'g++'])
+
+    for compiler in compilers:
+        try:
+            os.symlink(ICECC_BIN, symlink_path + '/' + compiler)
+        except FileExistsError:
+            pass
+        wrapper_script = os.path.join(ICE_PATH, compiler)
+        with open(wrapper_script, 'w') as fd:
+            fd.write("#!/bin/sh -e\n")
+            fd.write("export ICECC_VERSION={}\n".format(ICECC_VERSION))
+            fd.write("export ICECC_CC={}\n".format(ICECC_CC))
+            fd.write("export ICECC_CXX={}\n".format(ICECC_CXX))
+            fd.write("{} \"$@\"\n".format(os.path.join(ICE_PATH, "symlinks", compiler)))
+        os.chmod(wrapper_script, 0o755)
+
+    try:
+        cmd = [ICECC_CC, '-print-prog-name=as']
+        ICECC_AS = subprocess.check_output(cmd).decode("utf-8").strip()
+    except subprocess.CalledProcessError as e:
+        bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
+        return
     # for target recipes should return something like:
     # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
     # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
-    if [ "$(dirname "${ICECC_AS}")" = "." ]
-    then
-        ICECC_AS="${ICECC_WHICH_AS}"
-    fi
+    if not os.path.dirname(ICECC_AS):
+        ICECC_AS = ICECC_WHICH_AS
 
-    if [ ! -f "${ICECC_VERSION}.done" ]
-    then
-        mkdir -p "$(dirname "${ICECC_VERSION}")"
+    if not os.path.isfile(ICECC_VERSION + ".done"):
+        bb.utils.mkdirhier(os.path.dirname(ICECC_VERSION))
 
         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
-        if flock -n "${ICECC_VERSION}.lock" \
-            ${ICECC_ENV_EXEC} ${ICECC_ENV_DEBUG} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
-        then
-            touch "${ICECC_VERSION}.done"
-        elif ! wait_for_file "${ICECC_VERSION}.done" 30
-        then
-            # locking failed so wait for ${ICECC_VERSION}.done to appear
-            bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
+        lock = bb.utils.lockfile(ICECC_VERSION + '.lock')
+        try:
+            cmd = [d.getVar('ICECC_ENV_EXEC')]
+            if d.getVar('ICECC_ENV_DEBUG'):
+                cmd.append(d.getVar('ICECC_ENV_DEBUG'))
+            cmd.extend([ICECC_CC, ICECC_CXX, ICECC_AS, ICECC_VERSION])
+            subprocess.check_output(cmd)
+            cmd = ['touch', ICECC_VERSION + '.done']
+            subprocess.check_output(cmd)
+        except subprocess.CalledProcessError as e:
+            bb.warn("icecc: '{}' returned {}:\n{}".format(cmd, e.returncode, e.output.decode("utf-8")))
+            bb.utils.unlockfile(lock)
             return
-        fi
-    fi
+        bb.utils.unlockfile(lock)
 
     # Don't let ccache find the icecream compiler links that have been created, otherwise
     # it can end up invoking icecream recursively.
-    export CCACHE_PATH="$PATH"
-    export CCACHE_DISABLE="1"
-
-    export PATH="$ICE_PATH:$PATH"
+    d.setVar('CCACHE_PATH', d.getVar('PATH'))
+    d.setVar('CCACHE_DISABLE', '1')
 
-    bbnote "Using icecc path: $ICE_PATH"
-    bbnote "Using icecc tarball: $ICECC_VERSION"
-}
-
-do_configure:prepend() {
-    set_icecc_env
-}
+    d.prependVar('PATH', ICE_PATH + ':')
 
-do_compile:prepend() {
-    set_icecc_env
+    bb.note("Using icecc path: {}".format(ICE_PATH))
+    bb.note("Using icecc tarball: {}".format(ICECC_VERSION))
 }
 
-do_compile_kernelmodules:prepend() {
-    set_icecc_env
-}
-
-do_install:prepend() {
-    set_icecc_env
-}
+do_configure[prefuncs] += "set_icecc_env"
+do_compile[prefuncs] += "set_icecc_env"
+do_compile_kernelmodules[prefuncs] += "set_icecc_env"
+do_install[prefuncs] += "set_icecc_env"
 
 # Icecream is not (currently) supported in the extensible SDK
 ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
-- 
2.39.5


