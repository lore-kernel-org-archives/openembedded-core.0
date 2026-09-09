Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C04EC88E47
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83.1788990824619041170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=q1GHB/5A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260909215342d70c2075ae0002072b-sygomq@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260909215342d70c2075ae0002072b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6kEmu9tBHjNFywent13dwN8coUjgLxWrzm4ipLCBlJQ=;
 b=q1GHB/5AO9F3bKBbz34I0Prik/hiG/k/IUHICOPRcJDHrwdHTs+uwFW1iAolw8RAxUrfTT
 nMZcBtv9zJlKDolmav3JHMAqZY3towWrEg7seycxgLD8MViVjqP7SKRO9PJ2voBWMbWUjueA
 KX0nfYJQn0qHQfiBDVWDoS/U2uIjfRH8Jtm3142S1o0DZX6LCbCKQIyjFGjNDmbQsurZoAvk
 7k6LZRQhW8jmqqfN1bfC43oBXTFxKuyxOFTCqTcRE6upsKTPNaIdHp4s4xVtbs4VQo4TXpbd
 s7/UxqjQ4ufKuKVVv8jDDd9JUPZv+pF4PcmUhmFupT1wtwBa+UAlARsw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/15] runqemu-extract-sdk: refactor in Python
Date: Wed,  9 Sep 2026 23:53:06 +0200
Message-ID: <20260909215337.89106-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245510

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move the pseudo-backed rootfs extraction logic into a reusable Python
module while preserving the existing command interface.
Install the module with qemu-helper so the wrapper also works from an SDK.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../qemu/nativesdk-qemu-helper_1.0.bb         |   3 +
 scripts/lib/pseudo_rootfs_utils.py            | 113 +++++++++++++++++
 scripts/runqemu-extract-sdk                   | 116 ++++--------------
 3 files changed, 137 insertions(+), 95 deletions(-)
 create mode 100644 scripts/lib/pseudo_rootfs_utils.py

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index e1f343989a..0558a564bb 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -9,6 +9,7 @@ RDEPENDS:${PN} = "nativesdk-qemu nativesdk-unfs3 nativesdk-pseudo \
 LIC_FILES_CHKSUM = "file://${COREBASE}/scripts/runqemu;beginline=5;endline=10;md5=ac2b489a58739c7628a2604698db5e7f"
 
 SRC_URI = "file://${COREBASE}/scripts/runqemu \
+           file://${COREBASE}/scripts/lib/pseudo_rootfs_utils.py \
            file://${COREBASE}/scripts/runqemu-addptable2image \
            file://${COREBASE}/scripts/runqemu-gen-tapdevs \
            file://${COREBASE}/scripts/runqemu-ifup \
@@ -30,4 +31,6 @@ do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}${COREBASE}/scripts/oe-* ${D}${bindir}/
 	install -m 0755 ${S}${COREBASE}/scripts/runqemu* ${D}${bindir}/
+	# The runqemu-* wrappers import this module from their own directory.
+	install -m 0644 ${S}${COREBASE}/scripts/lib/pseudo_rootfs_utils.py ${D}${bindir}/
 }
diff --git a/scripts/lib/pseudo_rootfs_utils.py b/scripts/lib/pseudo_rootfs_utils.py
new file mode 100644
index 0000000000..89d082f672
--- /dev/null
+++ b/scripts/lib/pseudo_rootfs_utils.py
@@ -0,0 +1,113 @@
+#!/usr/bin/env python3
+#
+# Helpers for preparing pseudo-managed rootfs trees (NFS booting, SDK/rootfs
+# extraction, target deploy).
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+"""Extract rootfs tarballs and locate their pseudo state for NFS booting."""
+
+import os
+import subprocess
+from pathlib import Path
+
+
+class PseudoRootfsError(Exception):
+    """Raised when a pseudo-managed rootfs cannot be prepared or exported."""
+
+
+def pseudo_native_environment():
+    """Return the pseudo native environment (PSEUDO and OECORE_NATIVE_SYSROOT), from the
+    qemu-helper-native recipe which provides a pseudo binary usable outside a recipe sysroot."""
+    native_sysroot = os.environ.get('OECORE_NATIVE_SYSROOT')
+    if not native_sysroot:
+        try:
+            import bb.tinfoil
+        except ImportError as exc:
+            raise PseudoRootfsError(
+                'Unable to import bitbake.\n'
+                'Did you forget to source your build system environment setup script?') from exc
+        try:
+            with bb.tinfoil.Tinfoil() as tinfoil:
+                tinfoil.prepare(quiet=2)
+                native_sysroot = tinfoil.parse_recipe('qemu-helper-native').getVar('STAGING_DIR_NATIVE')
+        except Exception as exc:
+            raise PseudoRootfsError('Unable to set up the qemu-helper-native sysroot') from exc
+
+    if not native_sysroot or not os.path.exists(native_sysroot):
+        raise PseudoRootfsError("%s doesn't exist" % native_sysroot)
+
+    environment = {'OECORE_NATIVE_SYSROOT': native_sysroot}
+    environment['PSEUDO'] = os.path.join(native_sysroot, 'usr', 'bin', 'pseudo')
+    return environment
+
+
+def _tar_options(rootfs_tarball):
+    tar_extract_options = {
+        '.tar.xz': '-xJf',
+        '.tar.bz2': '-xjf',
+        '.tar.gz': '-xzf',
+        '.tar.zst': '--zstd -xf',
+        '.tar': '-xf',
+    }
+    for extension, option in tar_extract_options.items():
+        if rootfs_tarball.endswith(extension):
+            return ['--numeric-owner', *option.split()]
+    raise PseudoRootfsError(
+        'Unable to determine sdk tarball format\n'
+        'Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / .tar.zst')
+
+
+def pseudo_state_dir(rootfs_dir):
+    """Return the pseudo database location associated with an extracted rootfs."""
+    return os.path.realpath(rootfs_dir) + '.pseudo_state'
+
+
+def extract_sdk_rootfs(rootfs_tarball, rootfs_dir, pseudo_cmd, environment):
+    """Extract a rootfs tarball under pseudo and return its absolute directory.
+
+    pseudo_cmd is the pseudo invocation prefix, e.g. a recipe's own
+    [FAKEROOTCMD] or [pseudo, '-P', native_sysroot_usr] from
+    pseudo_native_environment(). environment supplies the matching pseudo
+    database/env vars (e.g. a parsed FAKEROOTENV, or pseudo_native_environment()
+    itself); PSEUDO_LOCALSTATEDIR/PSEUDO_INCLUDE_PATHS are always overridden
+    here to point at rootfs_dir's own pseudo state, regardless of what's
+    already set in environment.
+    """
+    if not os.path.exists(rootfs_tarball):
+        raise PseudoRootfsError("sdk tarball '%s' does not exist" % rootfs_tarball)
+
+    rootfs_tarball = os.path.realpath(rootfs_tarball)
+    rootfs_dir = os.path.realpath(rootfs_dir)
+    tar_options = _tar_options(rootfs_tarball)
+    state_dir = pseudo_state_dir(rootfs_dir)
+    debug_image = '-dbg' in os.path.basename(rootfs_tarball)
+
+    if os.path.exists(state_dir) and not debug_image:
+        raise PseudoRootfsError(
+            '%s already exists!\n'
+            'Please delete the rootfs tree and pseudo directory manually\n'
+            'if this is really what you want.' % state_dir)
+
+    os.makedirs(rootfs_dir, exist_ok=True)
+    os.makedirs(state_dir, exist_ok=True)
+    Path(state_dir, 'pseudo.pid').touch()
+
+    environment = dict(environment)
+    environment['PSEUDO_LOCALSTATEDIR'] = state_dir
+    environment['PSEUDO_INCLUDE_PATHS'] = rootfs_dir
+
+    command = list(pseudo_cmd) + ['tar', '-C', rootfs_dir] + tar_options + [rootfs_tarball]
+    print('Extracting rootfs tarball using pseudo...')
+    print(' '.join(command))
+    try:
+        subprocess.run(command, env=environment, check=True)
+    except subprocess.CalledProcessError as exc:
+        raise PseudoRootfsError('Failed to extract rootfs tarball') from exc
+
+    if len(os.listdir(rootfs_dir)) < 4:
+        print("Warning: I don't see many files in %s" % rootfs_dir)
+        print('Please double-check the extraction worked as intended')
+    else:
+        print('SDK image successfully extracted to %s' % rootfs_dir)
+    return rootfs_dir
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index db9813e1dc..87b5f89916 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -1,104 +1,30 @@
-#!/bin/bash
-#
-# This utility extracts an SDK image tarball using pseudo, and stores
-# the pseudo database in var/pseudo within the rootfs. If you want to
-# boot QEMU using an nfsroot, you *must* use this script to create the
-# rootfs to ensure it is done correctly with pseudo.
-#
-# Copyright (c) 2010 Intel Corp.
+#!/usr/bin/env python3
 #
 # SPDX-License-Identifier: GPL-2.0-only
-#
 
-function usage() {
-	echo "Usage: $0 <image-tarball> <extract-dir>"
-}
+import os
+import sys
 
-if [ $# -ne 2 ]; then
-	usage
-	exit 1
-fi
+sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), 'lib'))
 
-SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
-if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
-	echo "Error: Unable to find the oe-find-native-sysroot script"
-	echo "Did you forget to source your build system environment setup script?"
-	exit 1
-fi
-. $SYSROOT_SETUP_SCRIPT qemu-helper-native
-PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
+from pseudo_rootfs_utils import PseudoRootfsError, extract_sdk_rootfs, pseudo_native_environment
 
-ROOTFS_TARBALL=$1
-SDK_ROOTFS_DIR=$2
 
-if [ ! -e "$ROOTFS_TARBALL" ]; then
-	echo "Error: sdk tarball '$ROOTFS_TARBALL' does not exist"
-	usage
-	exit 1
-fi
+def main():
+    argv = sys.argv[1:]
+    if len(argv) != 2:
+        print('Usage: %s <image-tarball> <extract-dir>' % sys.argv[0])
+        return 1
+    try:
+        environment = pseudo_native_environment()
+        pseudo_cmd = [environment['PSEUDO'], '-P',
+                      os.path.join(environment['OECORE_NATIVE_SYSROOT'], 'usr')]
+        extract_sdk_rootfs(*argv, pseudo_cmd, environment)
+    except PseudoRootfsError as exc:
+        print('Error: %s' % exc)
+        return 1
+    return 0
 
-# Convert SDK_ROOTFS_DIR to a full pathname
-if [[ ${SDK_ROOTFS_DIR:0:1} != "/" ]]; then
-	SDK_ROOTFS_DIR=$(readlink -f $(pwd)/$SDK_ROOTFS_DIR)
-fi
 
-TAR_OPTS=""
-if [[ "$ROOTFS_TARBALL" =~ tar\.xz$ ]]; then
-	TAR_OPTS="--numeric-owner -xJf"
-fi
-if [[ "$ROOTFS_TARBALL" =~ tar\.bz2$ ]]; then
-	TAR_OPTS="--numeric-owner -xjf"
-fi
-if [[ "$ROOTFS_TARBALL" =~ tar\.gz$ ]]; then
-	TAR_OPTS="--numeric-owner -xzf"
-fi
-if [[ "$ROOTFS_TARBALL" =~ tar\.zst$ ]]; then
-	TAR_OPTS="--numeric-owner --zstd -xf"
-fi
-if [[ "$ROOTFS_TARBALL" =~ \.tar$ ]]; then
-	TAR_OPTS="--numeric-owner -xf"
-fi
-if [ -z "$TAR_OPTS" ]; then
-	echo "Error: Unable to determine sdk tarball format"
-	echo "Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / tar.zst"
-	exit 1
-fi
-
-if [ ! -d "$SDK_ROOTFS_DIR" ]; then
-	echo "Creating directory $SDK_ROOTFS_DIR"
-	mkdir -p "$SDK_ROOTFS_DIR"
-fi
-
-pseudo_state_dir="$SDK_ROOTFS_DIR/../$(basename "$SDK_ROOTFS_DIR").pseudo_state"
-pseudo_state_dir="$(readlink -f $pseudo_state_dir)"
-
-debug_image="`echo $ROOTFS_TARBALL | grep '\-dbg\.rootfs\.tar'`"
-
-if [ -e "$pseudo_state_dir" -a -z "$debug_image" ]; then
-	echo "Error: $pseudo_state_dir already exists!"
-	echo "Please delete the rootfs tree and pseudo directory manually"
-	echo "if this is really what you want."
-	exit 1
-fi
-
-mkdir -p "$pseudo_state_dir"
-touch "$pseudo_state_dir/pseudo.pid"
-PSEUDO_LOCALSTATEDIR="$pseudo_state_dir"
-export PSEUDO_LOCALSTATEDIR
-PSEUDO_INCLUDE_PATHS="$SDK_ROOTFS_DIR"
-export PSEUDO_INCLUDE_PATHS
-
-echo "Extracting rootfs tarball using pseudo..."
-echo "$PSEUDO $PSEUDO_OPTS tar -C \"$SDK_ROOTFS_DIR\" $TAR_OPTS \"$ROOTFS_TARBALL\""
-$PSEUDO $PSEUDO_OPTS tar -C "$SDK_ROOTFS_DIR" $TAR_OPTS "$ROOTFS_TARBALL"
-
-DIRCHECK=`ls -l "$SDK_ROOTFS_DIR" | wc -l`
-if [ "$DIRCHECK" -lt 5 ]; then
-	echo "Warning: I don't see many files in $SDK_ROOTFS_DIR"
-	echo "Please double-check the extraction worked as intended"
-	exit 0
-fi
-
-echo "SDK image successfully extracted to $SDK_ROOTFS_DIR"
-
-exit 0
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.55.0


