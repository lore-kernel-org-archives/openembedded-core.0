Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A174C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:48 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.644.1789670320670501724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=hxHA9oKH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260917183838b9bb64f11e00020763-7eloik@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260917183838b9bb64f11e00020763
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=goaqqBNm5D0ir7dqkBQRzoVfAJxxIbl9oNOv+n2VvFU=;
 b=hxHA9oKHKg2CPzfNISnQzfsi1ZwzJzGFOIIZyp0me3ZGSPhTD11wPoiPAAryqEcICN76sK
 72AHUD604R+Pj6ru+jYtCqmjcQditZlHCwsQXV5a1/c0X6EnikzWeJHf21KGI++81H1Y86mM
 7KyYPyojWSSw2dVFTb8XORqvELL8CE4E9gJf4AH8Mvs/iqz5tsp1Vy5pqYdLOvMOaBmFU76q
 bm5EjBIEVNHxWQ7TYcR0MFZSkpv4OeQKxlaRe64jaffPDHMdsquDtnNvtC1GdMxxGseZ2a39
 zdgL3x+6qk6x1SfK1CRiWwQ4/GumWmdFU0Vs8i6K5snMHWDcuVse4wqA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 7/7] oe-selftest: devtool ide-sdk: make slirp tests port collision proof
Date: Thu, 17 Sep 2026 20:37:59 +0200
Message-ID: <20260917183832.998361-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246087

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The hostfwd=tcp: entries in QB_SLIRP_OPT are only a wishlist for the
debug server ports: runqemu moves forward to the next free host port
whenever the wished-for one is already taken, e.g. by a parallel
oe-selftest worker's qemu. Only the ssh port can be recovered afterwards.
The debug server ones silently pointed the debugger at nothing instead.
lldb-server's spawned gdbserver cannot cope with a moved port at all:
its client is told the target port to reconnect to and there is no hook
to tell it about a remapped host one.

If the test allocates a pool of host ports that is free right beforehand
and holds it for the debug servers, runqemu is expected to grant every
wish in it 1:1, since nothing else can take one of them in between.
Reserve such a block and pass it to the first devtool ide-sdk invocation,
which bakes the ports into QB_SLIRP_OPT before the image is built.

The debug server ports are therefore already final at that point, with
no remapping left to resolve. devtool ide-sdk still has to be re-run
once qemu is up regardless, and needs the same block passed again: not
because of these ports, but because it is the only invocation that knows
the live qemu IP and the ssh port, which is not covered by the
reservation and can still be moved by runqemu's own port picking, e.g.
against a second worker's default 2222.

The reservation keeps its own lock directory rather than runqemu's,
since holding runqemu's locks is exactly what would make it consider the
reserved ports taken and move the forwards away again.

Having the Linux kernel itself arbitrate the ports, by requesting them
from qemu dynamically via QMP once it is running, would be a more
robust fix and remove the need for this pool altogether, but that is a
bigger refactoring of the runqemu/qemu integration than warranted here.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 490a1d0bf0..5bb191ff47 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -5,9 +5,11 @@
 #
 
 import errno
+import fcntl
 import os
 import re
 import shutil
+import socket
 import subprocess
 import tempfile
 import threading
@@ -3066,6 +3068,12 @@ class RunCmdBackground:
 class DevtoolIdeSdkTests(DevtoolBase):
 
     MAGIC_STRING_ORIG = "Magic: 123456789"
+    SLIRP_PORT_BLOCK_SIZE = 32
+    # runqemu locks /tmp/qemu-port-locks itself while picking the slirp host
+    # ports, so the reservation below needs a lock directory of its own:
+    # holding runqemu's locks would make it consider the reserved ports taken
+    # and move the forwards away again.
+    SLIRP_PORT_LOCK_DIR = '/tmp/oe-selftest-ide-sdk-port-locks'
 
     def setUp(self):
         super().setUp()
@@ -3520,6 +3528,50 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn('hostfwd=tcp:127.0.0.1:2222-:22', bbappend_content,
                       'SSH slirp port forward missing from QB_SLIRP_OPT')
 
+    def _reserve_slirp_port_block(self):
+        """Reserve a block of host ports for this test's debug servers and return its first port.
+
+        runqemu moves a QB_SLIRP_OPT forward to the next host port whenever the
+        wished-for one is already taken, and lldb-server's spawned gdbserver
+        has no way to tell its client about a remapped host port, so the wishes
+        have to be granted 1:1. Every parallel oe-selftest worker otherwise
+        starts from the same default port, so claim a block that is free right
+        now and hold it for the rest of the test.
+        """
+        os.makedirs(self.SLIRP_PORT_LOCK_DIR, exist_ok=True)
+        for start in range(1234, 20000, self.SLIRP_PORT_BLOCK_SIZE):
+            block = range(start, start + self.SLIRP_PORT_BLOCK_SIZE)
+            # runqemu forwards these for ssh/telnet, handing one of them to a
+            # debug server as well would collide.
+            if 2222 in block or 2323 in block:
+                continue
+            locks = []
+            for port in block:
+                lock = open(os.path.join(self.SLIRP_PORT_LOCK_DIR, '%d.lock' % port), 'w')
+                try:
+                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
+                except OSError:
+                    lock.close()
+                    break
+                locks.append(lock)
+                # The lock only coordinates with other ide-sdk selftests, so
+                # confirm nothing unrelated is holding the port either.
+                with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as probe:
+                    try:
+                        probe.bind(('127.0.0.1', port))
+                    except OSError:
+                        break
+            else:
+                for lock in locks:
+                    self.addCleanup(lock.close)
+                self.logger.debug('Reserved slirp host ports %d-%d',
+                                  start, start + self.SLIRP_PORT_BLOCK_SIZE - 1)
+                return start
+            for lock in locks:
+                lock.close()
+        self.fail('Could not reserve %d consecutive free host ports'
+                  % self.SLIRP_PORT_BLOCK_SIZE)
+
     def _verify_nfs_debug_rootfs(self, testimage, nfs):
         """Verify the NFS debug rootfs was extracted and its runqemu launch helper generated."""
         nfs_rootfs = os.path.join(self.workspacedir, 'nfs-exports', testimage, nfs)
@@ -3607,7 +3659,13 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._meson_recipe_name, "meson.build", testimage)
         package_opts = self._ide_sdk_package_opts()
         nfs_opts = ' --nfs=%s' % nfs_export if nfs else ''
-        runCmd('devtool ide-sdk %s -c --ide=code --ide=none %s%s' % (testimage, package_opts, nfs_opts),
+        # runqemu only grants a QB_SLIRP_OPT wish while the host port is free,
+        # and lldb-server's spawned gdbserver needs host == target, so give the
+        # debug servers a block no parallel worker uses (see
+        # _reserve_slirp_port_block); both invocations must agree on it.
+        port_opts = ' -G %d' % self._reserve_slirp_port_block() if slirp else ''
+        runCmd('devtool ide-sdk %s -c --ide=code --ide=none %s%s%s' % (
+            testimage, package_opts, nfs_opts, port_opts),
                output_log=self._cmd_logger)
 
         if slirp:
@@ -3651,8 +3709,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             # not known at the time of the initial ide-sdk invocation.
             # --skip-bitbake also skips the NFS rootfs (re-)extraction, which
             # would otherwise wipe the directory the target has mounted.
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s --skip-bitbake --ide=code --ide=none %s%s' % (
-                testimage, target_options, package_opts, nfs_opts)
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s --skip-bitbake --ide=code --ide=none %s%s%s' % (
+                testimage, target_options, package_opts, nfs_opts, port_opts)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
             # Verify the debugger is available and functional on host
-- 
2.55.0


