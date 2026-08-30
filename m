Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5163C624A4
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17273.1788126560348587257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=KMmDK5nW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202608302149180d856f9c8f00020704-xzd_2u@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608302149180d856f9c8f00020704
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TjpKwxplJ65szEK4WRHX/4jOzQfhjUMVS3QU3vc4uxY=;
 b=KMmDK5nWQBjZ2rvVRtNPoJejUWuDG5tZuqxRAmM3dzWoF/7fv8vRHSoH+0JnaeOXym5Wch
 jP63V+oDAdHQMjCslFpn2O222O2ecTGmUhyxigz9idMTX5+fCXp+9xoSDGcPhfutwwFv0+cC
 0maIc+YvglZy6orGE9I7CnMevVg6398ljYdVqDp8Nq8aoZBsCWk6PIrRuEoifA+xYcsyOyoE
 UHZoEEjYNORi6tkLeDYsfU4HWyZGAsf9uk0W4KDQQ361aSKKQ4icbHTjB8T3EeQTKfpJEzI6
 NfoZzd2+0XldqsO+1v4WyBbeyZR8k6e5u/wWeQraErzdHiUDQcRkvWKQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 16/25] runqemu-export-rootfs: refactor in Python
Date: Sun, 30 Aug 2026 23:48:38 +0200
Message-ID: <20260830214912.1346063-17-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244715

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move the userspace NFS export lifecycle into the reusable runqemu helper
module while preserving the existing command interface.

AI-Generated: Uses GitHub Copilot

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/runqemu_utils.py  | 122 ++++++++++++++++++++++++++++++++
 scripts/runqemu-export-rootfs | 126 ++--------------------------------
 2 files changed, 128 insertions(+), 120 deletions(-)

diff --git a/scripts/lib/runqemu_utils.py b/scripts/lib/runqemu_utils.py
index dff0ca8d3a..c36e30d76b 100644
--- a/scripts/lib/runqemu_utils.py
+++ b/scripts/lib/runqemu_utils.py
@@ -7,6 +7,7 @@
 """Extract and export rootfs tarballs for NFS booting."""
 
 import os
+import signal
 import subprocess
 import sys
 
@@ -122,3 +123,124 @@ def extract_sdk_main(argv=None):
         print('Error: %s' % exc)
         return 1
     return 0
+
+
+_NFS_ACTIONS = ('start', 'stop', 'restart')
+
+
+def _nfs_paths(instance):
+    state_dir = os.path.join(os.path.expanduser('~'), '.runqemu-sdk')
+    os.makedirs(state_dir, exist_ok=True)
+    return {
+        'exports': os.path.join(state_dir, 'exports%s' % instance),
+        'nfs_pid': os.path.join(state_dir, 'nfs%s.pid' % instance),
+    }
+
+
+def _nfs_ports(instance):
+    nfs_port = int(os.environ.get('NFSD_PORT', 3049 + 2 * instance))
+    mount_port = int(os.environ.get('MOUNTD_PORT', 3048 + 2 * instance))
+    return nfs_port, mount_port
+
+
+def _export_usage():
+    return 'Usage: %s {%s} <nfs-export-dir>' % (
+        sys.argv[0], '|'.join(_NFS_ACTIONS))
+
+
+def export_rootfs(action, rootfs_dir):
+    """Start, stop, or restart the userspace NFS server for *rootfs_dir*."""
+    if action not in _NFS_ACTIONS:
+        raise RunQemuRootfsError("Unknown command '%s'" % action)
+    if not os.path.isdir(rootfs_dir):
+        raise RunQemuRootfsError("'%s' does not exist" % rootfs_dir)
+
+    rootfs_dir = os.path.realpath(rootfs_dir)
+    state_dir = pseudo_state_dir(rootfs_dir)
+    if not os.path.isdir(state_dir):
+        raise RunQemuRootfsError(
+            '%s does not exist.\n'
+            'Did you create the export directory using runqemu-extract-sdk?' % state_dir)
+
+    if action == 'restart':
+        export_rootfs('stop', rootfs_dir)
+        return export_rootfs('start', rootfs_dir)
+
+    instance = int(os.environ.get('NFS_INSTANCE', '0'))
+    paths = _nfs_paths(instance)
+    if action == 'stop':
+        if os.path.exists(paths['nfs_pid']):
+            print('Stopping rpc.nfsd')
+            with open(paths['nfs_pid']) as pid_file:
+                pid = pid_file.read().strip()
+            try:
+                os.kill(int(pid), signal.SIGTERM)
+            except (ValueError, ProcessLookupError):
+                # A stale PID file must not stop the cleanup below.
+                print('rpc.nfsd is not running')
+            os.unlink(paths['nfs_pid'])
+        else:
+            print('No PID file, not stopping rpc.nfsd')
+        if os.path.exists(paths['exports']):
+            print('Removing exports file')
+            os.unlink(paths['exports'])
+        return
+
+    environment = native_environment()
+    native_sysroot = environment.get('OECORE_NATIVE_SYSROOT')
+    pseudo = environment.get('PSEUDO')
+    if not native_sysroot or not pseudo:
+        raise RunQemuRootfsError('qemu-helper-native did not provide pseudo')
+
+    unfsd = os.path.join(native_sysroot, 'usr', 'bin', 'unfsd')
+    if not os.path.exists(unfsd):
+        raise RunQemuRootfsError(
+            'Unable to find unfsd binary in %s/usr/bin/\n'
+            "This shouldn't happen - something is missing from your toolchain installation"
+            % native_sysroot)
+
+    nfs_port, mount_port = _nfs_ports(instance)
+    environment['PSEUDO_LOCALSTATEDIR'] = state_dir
+    with open(paths['exports'], 'w') as exports_file:
+        exports_file.write('%s (rw,no_root_squash,no_all_squash,insecure)\n' % rootfs_dir)
+
+    command = [pseudo, '-P', os.path.join(native_sysroot, 'usr'), unfsd,
+               '-p', '-i', paths['nfs_pid'], '-e', paths['exports'],
+               '-n', str(nfs_port), '-m', str(mount_port)]
+    print('Creating exports file...')
+    print('Starting User Mode nfsd')
+    print('  %s' % ' '.join(command))
+    try:
+        subprocess.run(command, env=environment, check=True)
+    except subprocess.CalledProcessError as exc:
+        raise RunQemuRootfsError('Error starting nfsd') from exc
+
+    if not os.path.exists(paths['nfs_pid']):
+        raise RunQemuRootfsError('rpc.nfsd did not start correctly')
+    with open(paths['nfs_pid']) as pid_file:
+        try:
+            os.kill(int(pid_file.read()), 0)
+        except OSError as exc:
+            raise RunQemuRootfsError('rpc.nfsd did not start correctly') from exc
+
+    print('')
+    print('On your target please remember to add the following options for NFS')
+    print('nfsroot=IP_ADDRESS:%s,nfsvers=3,port=%s,udp,mountport=%s' %
+          (rootfs_dir, nfs_port, mount_port))
+
+
+def export_rootfs_main(argv=None):
+    argv = sys.argv[1:] if argv is None else argv
+    if len(argv) != 2:
+        print(_export_usage())
+        return 1
+    if argv[0] not in _NFS_ACTIONS:
+        print("Unknown command '%s'" % argv[0])
+        print(_export_usage())
+        return 1
+    try:
+        export_rootfs(*argv)
+    except RunQemuRootfsError as exc:
+        print('Error: %s' % exc)
+        return 1
+    return 0
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 6a8acd0d5a..dde364d37e 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -1,127 +1,13 @@
-#!/bin/bash
-#
-# Copyright (c) 2005-2009 Wind River Systems, Inc.
+#!/usr/bin/env python3
 #
 # SPDX-License-Identifier: GPL-2.0-only
-#
 
-usage() {
-	echo "Usage: $0 {start|stop|restart} <nfs-export-dir>"
-}
+import os
+import sys
 
-if [ $# != 2 ]; then
-	usage
-	exit 1
-fi
+sys.path.insert(0, os.path.join(os.path.dirname(os.path.realpath(__file__)), 'lib'))
 
-if [[ "$1" != "start" && "$1" != "stop" && "$1" != "restart" ]]; then
-	echo "Unknown command '$1'"
-	usage
-	exit 1
-fi
+from runqemu_utils import export_rootfs_main
 
-if [ ! -d "$2" ]; then
-	echo "Error: '$2' does not exist"
-	usage
-	exit 1
-fi
-# Ensure the nfs-export-dir is an absolute path
-NFS_EXPORT_DIR=$(cd "$2" && pwd)
 
-SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
-if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
-	echo "Error: Unable to find the oe-find-native-sysroot script"
-	echo "Did you forget to source your build environment setup script?"
-	exit 1
-fi
-. $SYSROOT_SETUP_SCRIPT qemu-helper-native
-
-if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
-	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
-
-	echo "This shouldn't happen - something is missing from your toolchain installation"
-	exit 1
-fi
-
-if [ ! -d ~/.runqemu-sdk ]; then
-	mkdir -p ~/.runqemu-sdk
-fi
-
-NFS_INSTANCE=${NFS_INSTANCE:=0}
-EXPORTS=~/.runqemu-sdk/exports$NFS_INSTANCE
-RMTAB=~/.runqemu-sdk/rmtab$NFS_INSTANCE
-NFSPID=~/.runqemu-sdk/nfs$NFS_INSTANCE.pid
-MOUNTPID=~/.runqemu-sdk/mount$NFS_INSTANCE.pid
-
-PSEUDO_OPTS="-P $OECORE_NATIVE_SYSROOT/usr"
-PSEUDO_LOCALSTATEDIR="$NFS_EXPORT_DIR/../$(basename $NFS_EXPORT_DIR).pseudo_state"
-export PSEUDO_LOCALSTATEDIR
-
-if [ ! -d "$PSEUDO_LOCALSTATEDIR" ]; then
-	echo "Error: $PSEUDO_LOCALSTATEDIR does not exist."
-	echo "Did you create the export directory using runqemu-extract-sdk?"
-	exit 1	
-fi
-
-# NFS server port number
-NFSD_PORT=${NFSD_PORT:=$[ 3049 + 2 * $NFS_INSTANCE ]}
-# mountd port number
-MOUNTD_PORT=${MOUNTD_PORT:=$[ 3048 + 2 * $NFS_INSTANCE ]}
-
-## For debugging you would additionally add
-## --debug all
-UNFSD_OPTS="-p -i $NFSPID -e $EXPORTS -n $NFSD_PORT -m $MOUNTD_PORT"
-
-# See how we were called.
-case "$1" in
-  start)
-	echo "Creating exports file..."
-	echo "$NFS_EXPORT_DIR (rw,no_root_squash,no_all_squash,insecure)" > $EXPORTS
-
-	echo "Starting User Mode nfsd"
-	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS"
-	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS
-	if [ ! $? = 0 ]; then
-		echo "Error starting nfsd"
-		exit 1
-	fi
-	# Check to make sure everything started ok.
-	if [ ! -f $NFSPID ]; then
-		echo "rpc.nfsd did not start correctly"
-		exit 1
-	fi
-	ps -fp `cat $NFSPID` > /dev/null 2> /dev/null
-	if [ ! $? = 0 ]; then
-		echo "rpc.nfsd did not start correctly"
-		exit 1
-	fi
-	echo " "
-	echo "On your target please remember to add the following options for NFS"
-	echo "nfsroot=IP_ADDRESS:$NFS_EXPORT_DIR,nfsvers=3,port=$NFSD_PORT,udp,mountport=$MOUNTD_PORT"
-	;;
-  stop)
-	if [ -f "$NFSPID" ]; then
-		echo "Stopping rpc.nfsd"
-		kill `cat $NFSPID`
-		rm -f $NFSPID
-	else
-		echo "No PID file, not stopping rpc.nfsd"
-	fi
-	if [ -f "$EXPORTS" ]; then
-		echo "Removing exports file"
-		rm -f $EXPORTS
-	fi
-	;;
-  restart)
-	$0 stop $NFS_EXPORT_DIR
-	$0 start $NFS_EXPORT_DIR 
-	if [ ! $? = 0 ]; then
-		exit 1
-	fi
-	;;
-  *)
-	echo "$0 {start|stop|restart} <nfs-export-dir>"
-	;;
-esac
-
-exit 0
+sys.exit(export_rootfs_main())
-- 
2.55.0


