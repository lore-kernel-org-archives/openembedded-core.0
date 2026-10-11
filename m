Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF376CA9ED2
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:59:58 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32781.1791748795226074486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=tVRUPiSz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20261011195952168f7d1eb40002070d-vtryde@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261011195952168f7d1eb40002070d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1d4HjYt7MP8wF7neRuwv9J8KvolG/6RXWXA6DkrvTPs=;
 b=tVRUPiSzhg2PJkro8HmhyRkEzjNb3MdwwN0OtIf7CsJJV9rb7YO5ABGUuEymb/E+NtMyMy
 p4COLN4EUDxsHhJ+I2I5liNoDbrakmeGt6gXhNOdMhw1adF2qoypsjSPaJ5QBGqt1Wrnpbqp
 GAM2R+oojHI2o+JMZ0a0YsmSeVdpsE/jaS7ioPJHILTJHiYQ8kmH+bBmv2Brzv1rXvdqFWrK
 tN5PO/Iruq/Mu3uJvBZHe52r13KBlU1ohpPhfzYW/mSyIaSuISFKZkJgfZ59ZXQIaOkz92uw
 Lq66MFrjaHVrtCx2hycZgn3fFKLyctq31oIAgf/zZi34Irp0mKIyLwDg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/11] oe-selftest: devtool ide-sdk: allocate slirp debug server ports via qemu
Date: Sun, 11 Oct 2026 21:59:13 +0200
Message-ID: <20261011195949.2118607-9-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247583

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The ide-sdk tests assumed every slirp port forwarding gets its requested
host port. With several QEMU instances running in parallel, runqemu may
move a port forwarding to another host port.

After booting QEMU, read the effective forwards from QemuRunner, write
them back into QB_SLIRP_OPT and regenerate the debugger configurations
with devtool ide-sdk --skip-bitbake.

Each test still reserves a block of debug server ports, so parallel
tests do not request the same ports. This only coordinates the tests;
QEMU decides which host port is actually free. Warn if a forward was
moved anyway. This should not happen, and points to another process
holding a port from the reserved block which is probably unexpected.

The gdbserver spawned by lldb-server is reached by the lldb client on
its target port number, so it needs a forward with equal host and
target port. Add that forward explicitly if it is missing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 91 +++++++++++++++++++++----
 1 file changed, 78 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 265f2147a4..6d3be66188 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3082,10 +3082,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
 
     MAGIC_STRING_ORIG = "Magic: 123456789"
     SLIRP_PORT_BLOCK_SIZE = 32
-    # runqemu locks /tmp/qemu-port-locks itself while picking the slirp host
-    # ports, so the reservation below needs a lock directory of its own:
-    # holding runqemu's locks would make it consider the reserved ports taken
-    # and move the forwards away again.
     SLIRP_PORT_LOCK_DIR = '/tmp/oe-selftest-ide-sdk-port-locks'
 
     def setUp(self):
@@ -3544,12 +3540,12 @@ class DevtoolIdeSdkTests(DevtoolBase):
     def _reserve_slirp_port_block(self):
         """Reserve a block of host ports for this test's debug servers and return its first port.
 
-        runqemu moves a QB_SLIRP_OPT forward to the next host port whenever the
-        wished-for one is already taken, and lldb-server's spawned gdbserver
-        has no way to tell its client about a remapped host port, so the wishes
-        have to be granted 1:1. Every parallel oe-selftest worker otherwise
-        starts from the same default port, so claim a block that is free right
-        now and hold it for the rest of the test.
+        A QB_SLIRP_OPT port forward only stays 1:1 while the wished-for host
+        port is free, and lldb-server's spawned gdbserver has no way to tell
+        its client about a remapped host port, so it needs host == target.
+        Since every parallel oe-selftest worker otherwise starts from the same
+        default port, claim a block that is free right now and hold it for the
+        rest of the test.
         """
         os.makedirs(self.SLIRP_PORT_LOCK_DIR, exist_ok=True)
         for start in range(1234, 20000, self.SLIRP_PORT_BLOCK_SIZE):
@@ -3585,6 +3581,45 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.fail('Could not reserve %d consecutive free host ports'
                   % self.SLIRP_PORT_BLOCK_SIZE)
 
+    def _apply_slirp_port_mappings(self, testimage, qemu):
+        """Rewrite the image bbappend's QB_SLIRP_OPT with qemu's effective port mappings.
+
+        QB_SLIRP_OPT is only a wishlist: runqemu moves a forward to another
+        host port whenever qemu cannot bind the wished-for one (e.g. because
+        a parallel oe-selftest worker's qemu holds it). Writing the mappings
+        the running qemu reports back into QB_SLIRP_OPT is what lets the
+        subsequent `devtool ide-sdk --skip-bitbake` run generate debugger
+        configs pointing at the ports that actually work.
+        """
+        mappings = qemu.slirp_port_mappings
+        self.assertTrue(mappings, 'Running qemu reported no slirp port mappings')
+
+        bbappend = os.path.join(self.workspacedir, 'appends', testimage + '.bbappend')
+        with open(bbappend) as f:
+            content = f.read()
+
+        def remap(m):
+            protocol = m.group(2)
+            wished_port, target_port = int(m.group(3)), int(m.group(4))
+            self.assertIn((protocol, target_port), mappings,
+                          'qemu is not forwarding wished-for %s target port %d' % (protocol, target_port))
+            host_port = mappings[(protocol, target_port)]
+            if host_port != wished_port:
+                # The reserved block (see _reserve_slirp_port_block) should
+                # make this unreachable; if it still happens, something else
+                # grabbed a port from the block between the reservation and
+                # qemu's own bind.
+                self.logger.warning(
+                    'Slirp %s host port for target %d moved from the reserved '
+                    '%d to %d: the reserved port block was not exclusive '
+                    'after all.', protocol, target_port, wished_port, host_port)
+            return '%s%d-:%d' % (m.group(1), host_port, target_port)
+
+        new_content = re.sub(r'(hostfwd=([a-z]+):[^:]*:)(\d+)-:(\d+)', remap, content)
+        with open(bbappend, 'w') as f:
+            f.write(new_content)
+        return mappings
+
     def _verify_nfs_debug_rootfs(self, testimage, nfs):
         """Verify the NFS debug rootfs was extracted and its runqemu launch helper generated."""
         nfs_rootfs = os.path.join(self.workspacedir, 'nfs-exports', testimage, nfs)
@@ -3680,9 +3715,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._meson_recipe_name, "meson.build", testimage)
         package_opts = self._ide_sdk_package_opts()
         nfs_opts = ' --nfs=%s' % nfs_export if nfs else ''
-        # runqemu only grants a QB_SLIRP_OPT wish while the host port is free,
-        # and lldb-server's spawned gdbserver needs host == target, so give the
-        # debug servers a block no parallel worker uses (see
+        # A reserved block keeps the QB_SLIRP_OPT wishlist 1:1, which
+        # lldb-server's spawned gdbserver depends on (see
         # _reserve_slirp_port_block); both invocations must agree on it.
         port_opts = ' -G %d' % self._reserve_slirp_port_block() if slirp else ''
         runCmd('devtool ide-sdk %s -c --ide=code --ide=none %s%s%s' % (
@@ -3723,6 +3757,10 @@ class DevtoolIdeSdkTests(DevtoolBase):
             if slirp:
                 self.assertIsNotNone(qemu.port, 'No SSH port for the slirp target')
                 target_options = '-t root@%s -P %s' % (qemu.ip, qemu.port)
+                # The wished-for ports in QB_SLIRP_OPT are only known to have
+                # been honoured now that qemu is up, so feed its effective
+                # mappings back in before regenerating the debugger configs.
+                self._apply_slirp_port_mappings(testimage, qemu)
             else:
                 target_options = '-t root@%s -c' % qemu.ip
 
@@ -4763,6 +4801,19 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
             self.assertTrue(task,
                             f"Configuration '{config_name}' preLaunchTask should not be empty")
 
+    def _ensure_1to1_hostfwd(self, qemu, lldb_server_cmd):
+        """Ensure the --gdbserver-port in lldb_server_cmd is forwarded host==target."""
+        match = re.search(r'--gdbserver-port (\d+)', lldb_server_cmd)
+        self.assertIsNotNone(match,
+                             "lldb-server start command should specify --gdbserver-port")
+        port = int(match.group(1))
+        if not qemu.slirp_port_mappings:
+            return
+        if qemu.slirp_port_mappings.get(('tcp', port)) == port:
+            return
+        self.assertEqual(qemu.add_hostfwd(port, port), port,
+                         "Could not forward lldb-server gdbserver port %d 1:1" % port)
+
     def _find_source_break_line(self, tempdir, source_file, marker):
         """Find the 1-based line number of `marker` in tempdir/source_file
 
@@ -5016,6 +5067,14 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         connect_cmd = next((c for c in init_commands if "platform connect" in c), None)
         self.assertIsNotNone(connect_cmd, "initCommands should contain a platform connect command")
 
+        # Once a debug session is started, the lldb client automatically
+        # reconnects to lldb-server's spawned gdbserver sub-instance using the
+        # raw --gdbserver-port target port number, with no hook to tell it to
+        # use a different (remapped) host port -- unlike the platform connect
+        # port above, which is resolved from the effective mapping. So this
+        # port needs an explicit host==target slirp forward.
+        self._ensure_1to1_hostfwd(qemu, ssh_cmd[-1])
+
         lldb_binary = self._lldb_native_binary()
 
         self.logger.debug("Starting lldb-server via SSH: %s", " ".join(ssh_cmd))
@@ -5093,6 +5152,12 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         self.assertExists(lldb_server_script)
         self.assertExists(lldb_script)
 
+        # See the comment in _lldb_server_debugging_once() about why this
+        # port specifically needs an explicit host==target slirp forward.
+        with open(lldb_server_script) as f:
+            lldb_server_script_content = f.read()
+        self._ensure_1to1_hostfwd(qemu, lldb_server_script_content)
+
         # Start lldb-server (script exits once the port is ready)
         r = runCmd(lldb_server_script, output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
-- 
2.56.0


