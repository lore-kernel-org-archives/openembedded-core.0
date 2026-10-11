Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26BECA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:59:58 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32782.1791748795282806123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Jk5dfU8D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202610111959536a4c6384a6000207ba-rasvlc@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610111959536a4c6384a6000207ba
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=viQaNTlz9w20AkzgtcuQRL5nsTl8tmXlArXBmHHkunI=;
 b=Jk5dfU8D+e4ij/wJXZGsmLyfD+7L6QUu7WbLl2UZzirfIOy1KFA0kQMZtHFMX3CNxvbofs
 /LAcuMXBPAUh/PaNKaIKjLIrLEyltl/bHzYBr3gOiEuzoQQrn/0F+PJUr3HACBk0DJWILVCi
 xS6SPtBNL3qgFJrxaJSIrVktJmpsIY56KN6RAIjf6u7WFIXbLFMSX8eI+Tnzm7Va1pYEi+RG
 r86hynhJd2keo9eeUx8riYhVa0aA7QLtQGnYarwQiZiQxHDrRxrEn1EF7iWGEtiCCAXwMJ7S
 hzSNk9FZL+VQFJmCJono7IjGdLMbrautJNIwgwYZGnserdWMIVWOMMNA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 11/11] runqemu: retain port locks for older autobuilder branches
Date: Sun, 11 Oct 2026 21:59:16 +0200
Message-ID: <20261011195949.2118607-12-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247584

From: Adrian Freihofer <adrian.freihofer@siemens.com>

runqemu up to wrynose and blacksail takes a flock per slirp host port
before starting QEMU. On a shared autobuilder, a newer runqemu could
bind such a port before the older QEMU does, so that QEMU fails.

Make runqemu and QemuRunner skip locked ports and lock each port QEMU
binds. Pass the locks to QEMU so they are held as long as QEMU runs,
even if runqemu exits. Extend the selftests accordingly.

Revert this once those branches (wrynose and blacksail) are EOL or have
the QMP allocation backported.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |   2 +-
 meta/lib/oeqa/selftest/cases/runqemu.py | 188 +++++++++++++++++++-----
 meta/lib/oeqa/utils/qemurunner.py       |  68 +++++++--
 scripts/runqemu                         |  43 ++++--
 4 files changed, 240 insertions(+), 61 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 6d3be66188..5a5ec2a385 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3545,7 +3545,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         its client about a remapped host port, so it needs host == target.
         Since every parallel oe-selftest worker otherwise starts from the same
         default port, claim a block that is free right now and hold it for the
-        rest of the test.
+        rest of the test. Separate locks keep runqemu's legacy port locks free.
         """
         os.makedirs(self.SLIRP_PORT_LOCK_DIR, exist_ok=True)
         for start in range(1234, 20000, self.SLIRP_PORT_BLOCK_SIZE):
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 455a5f2be2..3ef7d35ebd 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -30,10 +30,17 @@ from oeqa.utils.qemurunner import QemuRunner
 
 @OETestTag("runqemu")
 class RunqemuSlirpTests(OESelftestTestCase):
-    """Exercise slirp forwarding without booting a guest."""
+    """Exercise forwarding and legacy arbitration without booting a guest."""
 
     @classmethod
     def setUpClass(cls):
+        """Locate the native QEMU and load the QMP client and runqemu classes.
+
+        Builds qemu-helper-native's sysroot once for the whole class, picks its
+        qemu-system binary, and imports the QMP client shipped with it. runqemu
+        is loaded as a module so its BaseConfig and RunQemuError can be used
+        directly.
+        """
         super().setUpClass()
         bitbake('qemu-helper-native -c addto_recipe_sysroot')
         bindir = get_bb_var('STAGING_BINDIR_NATIVE', 'qemu-helper-native')
@@ -46,15 +53,31 @@ class RunqemuSlirpTests(OESelftestTestCase):
         cls.runqemu_error = runqemu_module['RunQemuError']
 
     def setUpLocal(self):
+        """Start a bare QEMU with a slirp netdev and connect runqemu and the runner to it.
+
+        QEMU runs paused with no machine, so no guest boots. It exposes two QMP
+        sockets: an internal one used by runqemu's BaseConfig and a separate
+        monitor one used by the QemuRunner. Both see the same netdev, so
+        forwards added through either are visible to the other. Everything is
+        cleaned up after each test. Only the port-lock directory is mocked;
+        flock and QEMU's lock descriptor transfer remain real.
+        """
         directory = tempfile.TemporaryDirectory(prefix='slirp-selftest-')
         self.addCleanup(directory.cleanup)
+        self.port_lock_dir = os.path.join(directory.name, 'port-locks')
         self.config = self.base_config()
+        config_lockdir = patch.object(self.config, 'PORT_LOCK_DIR', self.port_lock_dir)
+        config_lockdir.start()
+        self.addCleanup(config_lockdir.stop)
         self.config.internal_qmp_path = os.path.join(directory.name, 'internal.sock')
         self.config.slirp_hostfwd_allowlist = []
         self.addCleanup(self.config.release_lock)
         self.runner = QemuRunner('', '', '', directory.name, directory.name,
                                  None, 30, directory.name, False, self.logger,
                                  use_slirp=True, workdir=directory.name)
+        runner_lockdir = patch.object(self.runner, 'PORT_LOCK_DIR', self.port_lock_dir)
+        runner_lockdir.start()
+        self.addCleanup(runner_lockdir.stop)
         self.addCleanup(self.runner.stop)
         monitor_path = os.path.join(directory.name, 'monitor.sock')
         self.process = subprocess.Popen([
@@ -85,66 +108,156 @@ class RunqemuSlirpTests(OESelftestTestCase):
             probe.listen()
         return probe
 
-    def _free_port(self):
-        probe = self._socket()
-        port = probe.getsockname()[1]
-        probe.close()
-        return port
+    def _occupied_port(self, protocol='tcp'):
+        """Return a port held by this test, so QEMU must reject it as a proposal."""
+        return self._socket(protocol).getsockname()[1]
+
+    # TODO: legacy-slirp-locks
+    def _lock(self, port):
+        lock = open(os.path.join(self.port_lock_dir, '%d.lock' % port), 'w')
+        self.addCleanup(lock.close)
+        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
+        return lock
+
+    def _assert_locked(self, port):
+        with open(os.path.join(self.port_lock_dir, '%d.lock' % port), 'w') as lock:
+            with self.assertRaises(BlockingIOError):
+                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
 
     def _startup_forward(self, port, protocol='tcp', guest_port=1234, host='127.0.0.1'):
         self.config.slirp_hostfwd_allowlist = [(protocol, host, port, '', guest_port)]
         self.config.add_slirp_hostfwds()
         return self.runner.get_host_port(guest_port, protocol=protocol)
 
+    def test_startup_legacy_reservation(self):
+        """Skip a startup port locked by an older runqemu and lock the replacement.
+
+        Older releases (wrynose, blacksail) reserve ports via flock on
+        /tmp/qemu-port-locks/<port>.lock. runqemu must not take a port whose
+        lock is held, must lock the port it picks instead, and the forward on
+        that port must accept connections.
+
+        The port is also occupied, so QEMU would reject it; the lock refusal
+        is checked on runqemu's own lock attempt instead.
+        """
+        port = self._occupied_port()
+        self._lock(port)
+        lockfile = os.path.join(self.port_lock_dir, '%d.lock' % port)
+        results = {}
+        acquire_lock = self.config.acquire_lock
+
+        def spy(path):
+            results.setdefault(path, acquire_lock(path))
+            return results[path]
+        with patch.object(self.config, 'acquire_lock', side_effect=spy):
+            actual = self._startup_forward(port)
+        self.assertIs(results[lockfile], False)
+        self.assertNotEqual(actual, port)
+        self._assert_locked(actual)
+        with socket.create_connection(('127.0.0.1', actual), timeout=5):
+            pass
+
     def test_startup_rejected_candidate(self):
-        """Move a startup forward away from a port QEMU cannot bind."""
+        """Release a rejected startup port's lock and lock the replacement.
+
+        The requested port is bound by another process, so its lock is free
+        but QEMU rejects hostfwd_add. runqemu must release the lock it took
+        for the rejected port (it must be lockable again afterwards), then
+        retry on the next port and keep that port's lock held.
+        """
         busy = self._socket()
         port = busy.getsockname()[1]
         actual = self._startup_forward(port)
         self.assertNotEqual(actual, port)
+        self._lock(port)
+        self._assert_locked(actual)
 
-    def test_protocols_share_owned_reservations(self):
-        """Allow TCP and UDP forwards to share a host port."""
-        for guest_port, owner in ((1234, 'runqemu'), (1235, 'qemurunner'), (1236, 'runqemu-dynamic')):
-            with self.subTest(owner=owner):
-                port = self._free_port()
-                if owner == 'runqemu':
-                    self.config.slirp_hostfwd_allowlist = [
-                        (protocol, '127.0.0.1', port, '', guest_port)
-                        for protocol in ('tcp', 'udp')]
-                    self.config.add_slirp_hostfwds()
-                elif owner == 'runqemu-dynamic':
-                    self.assertEqual(self._startup_forward(port, guest_port=guest_port), port)
-                else:
-                    self.assertEqual(self.runner.add_hostfwd(guest_port, port), port)
-                self.assertEqual(self.runner.get_host_port(guest_port), port)
-                if owner != 'runqemu':
-                    self.assertEqual(self.runner.add_hostfwd(guest_port, port, protocol='udp'), port)
-                self.assertEqual(self.runner.get_host_port(guest_port, protocol='UDP'), port)
+    def test_dynamic_legacy_reservation(self):
+        """Reject explicit legacy-reserved ports and skip them during allocation."""
+        port = self._occupied_port()
+        self._lock(port)
+        self.assertIsNone(self.runner.add_hostfwd(1234, port))
+        with patch('oeqa.utils.qemurunner.socket.socket') as probe, \
+             patch.object(self.runner, 'run_monitor') as monitor:
+            probe.return_value.getsockname.return_value = ('127.0.0.1', port)
+            with self.assertRaises(RuntimeError):
+                self.runner.add_hostfwd(1234, protocol='udp')
+            for call in monitor.call_args_list:
+                self.assertNotIn('hostfwd_add', call.args[1]['command-line'])
 
     def test_dynamic_rejected_candidates(self):
-        """Reject dynamic forwards when binding or monitor commands fail."""
+        """Release dynamic port locks when binding or monitor commands fail."""
         for protocol in ('tcp', 'udp'):
             with self.subTest(protocol=protocol):
                 busy = self._socket(protocol)
                 port = busy.getsockname()[1]
                 self.assertIsNone(self.runner.add_hostfwd(1234, port, protocol=protocol))
-        port = self._free_port()
+                self._lock(port)
+        port = self._occupied_port()
         for failure in (None, {}, {'error': {}}, {'return': '', 'error': {}},
                         {'return': 'Could not set up host forwarding rule'}, {'return': 0}):
             with self.subTest(response=failure):
                 def reply(command, arguments=None):
                     if arguments and arguments['command-line'].startswith('hostfwd_add'):
+                        self._assert_locked(port)
                         return failure
                     return self._monitor(command, arguments)
                 with patch.object(self.runner, 'run_monitor', side_effect=reply):
                     self.assertIsNone(self.runner.add_hostfwd(1234, port))
+                self._lock(port).close()
+        with patch.object(self.runner, 'run_monitor', side_effect=[{'return': ''}, RuntimeError('monitor disconnected')]):
+            with self.assertRaises(RuntimeError):
+                self.runner.add_hostfwd(1234, port)
+        self._lock(port)
+
+    def test_lock_cleanup(self):
+        """Release startup and dynamic port locks after QEMU and its clients stop."""
+        proposed = self._occupied_port()
+        startup_port = self._startup_forward(proposed)
+        self.assertNotEqual(startup_port, proposed)
+        dynamic_port = self.runner.add_hostfwd(4321, protocol='udp')
+        self._assert_locked(startup_port)
+        self._assert_locked(dynamic_port)
+        self._stop_qemu()
+        self.runner.stop()
+        self.config.release_lock()
+        self._lock(startup_port)
+        self._lock(dynamic_port)
+
+    def test_locks_survive_client_exit(self):
+        """Keep port locks in QEMU after runqemu and the runner close their copies.
+
+        Closing the clients' lock descriptors and monitor connection must not
+        release either forward's lock or UDP socket while QEMU is alive.
+        Both locks must become available once QEMU exits.
+        """
+        proposed = self._occupied_port('udp')
+        startup_port = self._startup_forward(proposed, protocol='udp')
+        self.assertNotEqual(startup_port, proposed)
+        dynamic_port = self.runner.add_hostfwd(4321, protocol='udp')
+        # TODO: legacy-slirp-locks: simulate client death.
+        self.config.release_lock()
+        for lock in self.runner._slirp_port_locks.values():
+            lock.close()
+        self.runner._slirp_port_locks.clear()
+        self.runner.qmp.close()
+        self.runner.qmp = None
+        self.assertIsNone(self.process.poll())
+        for port in (startup_port, dynamic_port):
+            self._assert_locked(port)
+            with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as probe:
+                with self.assertRaises(OSError):
+                    probe.bind(('127.0.0.1', port))
+        self._stop_qemu()
+        self._lock(startup_port)
+        self._lock(dynamic_port)
 
     def test_internal_monitor_timeouts(self):
-        self.config.SLIRP_QMP_TIMEOUT = 0.1
+        """Report stalled QMP exchanges and release the rejected forward's lock."""
+        self.config.SLIRP_QMP_TIMEOUT = 1
         for phase in ('greeting', 'capabilities', 'hostfwd'):
             with self.subTest(phase=phase), tempfile.TemporaryDirectory() as directory:
-                port = self._free_port()
+                port = self._occupied_port()
                 self.config.internal_qmp_path = os.path.join(directory, 'silent.sock')
                 self.config.slirp_hostfwd_allowlist = [('tcp', '127.0.0.1', port, '', 1234)]
                 with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as listener:
@@ -154,7 +267,7 @@ class RunqemuSlirpTests(OESelftestTestCase):
                     with ThreadPoolExecutor(max_workers=1) as executor:
                         future = executor.submit(self.config.add_slirp_hostfwds)
                         with listener.accept()[0] as peer:
-                            peer.settimeout(2)
+                            peer.settimeout(5)
                             with peer.makefile('rw') as stream:
                                 if phase != 'greeting':
                                     stream.write(json.dumps({'QMP': {}}) + '\n')
@@ -165,7 +278,9 @@ class RunqemuSlirpTests(OESelftestTestCase):
                                     stream.flush()
                                     self.assertEqual(json.loads(stream.readline())['execute'], 'human-monitor-command')
                                 with self.assertRaisesRegex(self.runqemu_error, 'Timed out communicating'):
-                                    future.result(timeout=2)
+                                    future.result(timeout=5)
+                if phase == 'hostfwd':
+                    self._lock(port)
 
     def test_private_internal_monitor(self):
         """Add a private forwarding monitor without replacing the requested monitor.
@@ -215,24 +330,24 @@ class RunqemuSlirpTests(OESelftestTestCase):
         """Preserve explicit bind addresses and resolve wildcard binds to localhost."""
         for guest_port, host, expected in ((1234, '127.0.0.2', '127.0.0.2'), (1235, '0.0.0.0', '127.0.0.1')):
             with self.subTest(host=host):
-                actual = self._startup_forward(self._free_port(), guest_port=guest_port, host=host)
+                actual = self._startup_forward(self._occupied_port(), guest_port=guest_port, host=host)
                 endpoint = self.runner._get_slirp_host_endpoint(guest_port)
                 self.assertEqual(endpoint, (expected, actual))
                 with socket.create_connection(endpoint, timeout=5):
                     pass
 
     def test_unsupported_protocol(self):
-        """Reject unsupported forwarding protocols."""
+        """Reject unsupported forwarding protocols without acquiring port locks."""
         with self.assertRaises(ValueError):
             self.runner.add_hostfwd(1234, protocol='sctp')
+        self.assertFalse(self.runner._slirp_port_locks)
 
     def test_explicit_forward_with_non_slirp_primary(self):
         """Manage slirp forwards independently of the primary networking mode."""
         self.runner.use_slirp = False
         for protocol in ('tcp', 'udp'):
             with self.subTest(protocol=protocol):
-                port = self._free_port()
-                self.assertEqual(self.runner.add_hostfwd(1234, port, protocol=protocol), port)
+                port = self.runner.add_hostfwd(1234, protocol=protocol)
                 self.assertEqual(self.runner.slirp_port_mappings[(protocol, 1234)], port)
                 self.assertEqual(self.runner.get_host_port(1234, protocol=protocol), port)
         port = self.runner.get_host_port(1236)
@@ -241,8 +356,9 @@ class RunqemuSlirpTests(OESelftestTestCase):
             pass
         response = self.runner.run_monitor('netdev_del', {'id': 'net0'})
         self.assertEqual(response, {'return': {}})
-        port = self._free_port()
+        port = self._occupied_port()
         self.assertIsNone(self.runner.add_hostfwd(1235, port))
+        self._lock(port)
         with self.assertRaisesRegex(RuntimeError, 'Failed to add a slirp tcp hostfwd'):
             self.runner.get_host_port(1235)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 81434dc117..edacb73330 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -16,6 +16,7 @@ import re
 import socket
 import select
 import errno
+import fcntl
 import string
 import threading
 import codecs
@@ -43,6 +44,7 @@ def getOutput(o):
         return ""
 
 class QemuRunner:
+    PORT_LOCK_DIR = '/tmp/qemu-port-locks'
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=False,
      serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None, native_sysroot=None):
@@ -78,6 +80,8 @@ class QemuRunner:
         self.tmpfsdir = tmpfsdir
         self.native_sysroot = native_sysroot
         self.kernel_messages_disabled = False
+        # TODO: legacy-slirp-locks
+        self._slirp_port_locks = {}
 
         self.runqemutime = 300
         if not workdir:
@@ -590,6 +594,10 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited = True
 
+        # TODO: legacy-slirp-locks
+        for lock in self._slirp_port_locks.values():
+            lock.close()
+        self._slirp_port_locks.clear()
         if hasattr(self, 'qmp') and self.qmp:
             self.qmp.close()
             self.qmp = None
@@ -710,21 +718,53 @@ class QemuRunner:
             raise ValueError("Unsupported slirp host forwarding protocol: %s" % protocol)
         candidates = [host_port] if host_port else []
         if not host_port:
-            for _ in range(10):
-                with socket.socket(socket.AF_INET, socket_type) as s:
-                    s.bind(('127.0.0.1', 0))
-                    candidates.append(s.getsockname()[1])
+            # Hold every probe open so the candidates are distinct.
+            probes = []
+            try:
+                for _ in range(10):
+                    probes.append(socket.socket(socket.AF_INET, socket_type))
+                    probes[-1].bind(('127.0.0.1', 0))
+                    candidates.append(probes[-1].getsockname()[1])
+            finally:
+                for probe in probes:
+                    probe.close()
+        forwarded_ports = set(self.slirp_port_mappings.values())
         for candidate in candidates:
-            result = self.run_monitor('human-monitor-command', {
-                'command-line': 'hostfwd_add %s:127.0.0.1:%d-:%d' % (protocol, candidate, target_port)})
-            output = result.get('return') if isinstance(result, dict) else None
-            # hostfwd_add prints nothing on success; on failure it prints a message like
-            # "Could not set up host forwarding rule ...". Check for empty output to determine success.
-            if isinstance(result, dict) and 'error' not in result and isinstance(output, str) and output.strip() == '':
-                self.logger.debug("Added %s hostfwd for target port %d on host port %d"
-                                 % (protocol, target_port, candidate))
-                return candidate
-            self.logger.debug("hostfwd_add for %s host port %d failed: %s" % (protocol, candidate, result))
+            lock = None
+            if candidate not in self._slirp_port_locks and candidate not in forwarded_ports:
+                # TODO: legacy-slirp-locks: wrynose and blacksail still lock ports.
+                lockdir = self.PORT_LOCK_DIR
+                os.makedirs(lockdir, exist_ok=True)
+                lock = open(os.path.join(lockdir, '%d.lock' % candidate), 'w')
+                try:
+                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
+                except OSError as error:
+                    lock.close()
+                    if error.errno not in (errno.EACCES, errno.EAGAIN):
+                        raise
+                    continue
+            accepted = False
+            try:
+                result = self.run_monitor('human-monitor-command', {
+                    'command-line': 'hostfwd_add %s:127.0.0.1:%d-:%d' % (protocol, candidate, target_port)})
+                output = result.get('return') if isinstance(result, dict) else None
+                accepted = isinstance(result, dict) and 'error' not in result and isinstance(output, str) and output.strip() == ''
+                if accepted:
+                    if lock:
+                        self._slirp_port_locks[candidate] = lock
+                        # TODO: legacy-slirp-locks: QEMU keeps the lock if we die.
+                        self.qmp.send_fd_scm(lock.fileno())
+                        response = self.run_monitor('getfd', {
+                            'fdname': 'legacy-slirp-lock-%d' % candidate})
+                        if not isinstance(response, dict) or 'error' in response or response.get('return') != {}:
+                            raise RuntimeError("QEMU could not retain port lock: %s" % response)
+                    self.logger.debug("Added %s hostfwd for target port %d on host port %d"
+                                     % (protocol, target_port, candidate))
+                    return candidate
+                self.logger.debug("hostfwd_add for %s host port %d failed: %s" % (protocol, candidate, result))
+            finally:
+                if lock and not accepted:
+                    lock.close()
         if host_port:
             return None
         raise RuntimeError(
diff --git a/scripts/runqemu b/scripts/runqemu
index 0e0c77076c..5f7f72aba9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -21,6 +21,7 @@ import signal
 import time
 import json
 import tempfile
+import array
 import shlex
 import socket
 import traceback
@@ -1225,6 +1226,9 @@ to your build configuration.
             if 'error' in response or response.get('return') != {}:
                 raise RunQemuError("Internal QMP negotiation failed: %s" % response)
 
+            # TODO: legacy-slirp-locks: wrynose and blacksail still lock ports.
+            lockdir = self.PORT_LOCK_DIR
+            self.make_lock_dir(lockdir)
             used_ports = set()
             hostfwd_added = []
             for proto, hostip, hostport, guestip, targetport in self.slirp_hostfwd_allowlist:
@@ -1232,17 +1236,36 @@ to your build configuration.
                 for _ in range(100):
                     while (proto, candidate) in used_ports:
                         candidate += 1
+                    lockfile = os.path.join(lockdir, '%d.lock' % candidate)
+                    new_lock = lockfile not in self.locks
+                    if new_lock and not self.acquire_lock(lockfile):
+                        candidate += 1
+                        continue
                     cmdline = 'hostfwd_add %s:%s:%d-%s:%d' % (proto, hostip, candidate, guestip, targetport)
-                    sockf.write(json.dumps({"execute": "human-monitor-command",
-                                            "arguments": {"command-line": cmdline}}) + '\n')
-                    sockf.flush()
-                    response = read_response()
-                    # hostfwd_add prints nothing on success; on failure it
-                    # prints a message like "Could not set up host forwarding
-                    # rule ..." which does NOT contain the word "error", so
-                    # check for empty output rather than absence of that word.
-                    result = response.get('return')
-                    if 'error' not in response and isinstance(result, str) and result.strip() == '':
+                    accepted = False
+                    try:
+                        sockf.write(json.dumps({"execute": "human-monitor-command",
+                                                "arguments": {"command-line": cmdline}}) + '\n')
+                        sockf.flush()
+                        response = read_response()
+                        # hostfwd_add returns empty output on success, and
+                        # diagnostic text or a QMP error on failure.
+                        result = response.get('return')
+                        accepted = 'error' not in response and isinstance(result, str) and result.strip() == ''
+                    finally:
+                        if new_lock and not accepted:
+                            self.release_lock(lockfile)
+                    if accepted:
+                        # TODO: legacy-slirp-locks: QEMU keeps the lock if runqemu dies.
+                        if new_lock:
+                            sock.sendmsg([b' '], [(socket.SOL_SOCKET, socket.SCM_RIGHTS,
+                                                  array.array('i', [self.locks[lockfile].fileno()]))])
+                            sockf.write(json.dumps({"execute": "getfd", "arguments": {
+                                "fdname": "legacy-slirp-lock-%d" % candidate}}) + '\n')
+                            sockf.flush()
+                            response = read_response()
+                            if 'error' in response or response.get('return') != {}:
+                                raise RunQemuError("QEMU could not retain port lock: %s" % response)
                         used_ports.add((proto, candidate))
                         hostfwd_added.append('hostfwd=%s:%s:%d-%s:%d' % (proto, hostip, candidate, guestip, targetport))
                         if candidate != hostport:
-- 
2.56.0


