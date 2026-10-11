Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2130DCA9ED5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32873.1791748795181030790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=QuX0AJbO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202610111959531a2fddd9f30002073e-lnthqb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202610111959531a2fddd9f30002073e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RU+/5Lk/ATMRHlDcCL5Zo/YlJ/OjtO2OPfkLrcFjHFM=;
 b=QuX0AJbOTZrctuqaIi6AzODImlM+P2+hcB54cbLUJTG2Kpo5o61r8Zmecuocw7Dl+qnWKP
 Mn7q6nfYdXs+cn/H0q+Ky8EDmvOPM6a89mK1ry96pcdruLQLiBBqUsmmRRZqY207Y13AsMQV
 Hguab3BPAqcAC6/69pD5oBf/Rd11MpKSKRoEbaon/pN57BC9tUb5y92npUxYqu33+OjL4Pd6
 7v3s4SzXivgX0VK2AYY4qW2L61pucn0ymzGcLlL3N7gsXd/y3DICFDA44/aczQVhIgrgQA5U
 k2GOirqiofVJpu6yb0JTeDLliNIHFtBGG/k1sJVNhTqI0L1iRXfKz+vw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 10/11] oe-selftest: runqemu: cover slirp forwarding via QMP
Date: Sun, 11 Oct 2026 21:59:15 +0200
Message-ID: <20261011195949.2118607-11-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247592

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Test runqemu and QemuRunner slirp forwarding against a native QEMU
started with -machine none, so no image is needed and the tests run in
seconds. Cover moved forwards, TCP/UDP sharing a host port, bind
addresses, failing and silent monitors, MAC slot allocation and the
devtool port block reservation.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 233 ++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index bfa76812ae..455a5f2be2 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -7,11 +7,244 @@
 import os
 import re
 import time
+import fcntl
+import glob
+import json
+import runpy
+import shutil
+import socket
+import stat
+import subprocess
+import sys
+import tempfile
+from concurrent.futures import ThreadPoolExecutor
+from types import SimpleNamespace
+from unittest.mock import patch
 import oe.types
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars
+from oeqa.utils.qemurunner import QemuRunner
+
+
+@OETestTag("runqemu")
+class RunqemuSlirpTests(OESelftestTestCase):
+    """Exercise slirp forwarding without booting a guest."""
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        bitbake('qemu-helper-native -c addto_recipe_sysroot')
+        bindir = get_bb_var('STAGING_BINDIR_NATIVE', 'qemu-helper-native')
+        cls.qemu_binary = sorted(glob.glob(os.path.join(bindir, 'qemu-system-*')))[0]
+        sys.path.append(os.path.join(os.path.dirname(os.path.dirname(bindir)), 'usr/lib/qemu-python'))
+        from qmp.legacy import QEMUMonitorProtocol
+        cls.monitor_protocol = QEMUMonitorProtocol
+        runqemu_module = runpy.run_path(shutil.which('runqemu'))
+        cls.base_config = runqemu_module['BaseConfig']
+        cls.runqemu_error = runqemu_module['RunQemuError']
+
+    def setUpLocal(self):
+        directory = tempfile.TemporaryDirectory(prefix='slirp-selftest-')
+        self.addCleanup(directory.cleanup)
+        self.config = self.base_config()
+        self.config.internal_qmp_path = os.path.join(directory.name, 'internal.sock')
+        self.config.slirp_hostfwd_allowlist = []
+        self.addCleanup(self.config.release_lock)
+        self.runner = QemuRunner('', '', '', directory.name, directory.name,
+                                 None, 30, directory.name, False, self.logger,
+                                 use_slirp=True, workdir=directory.name)
+        self.addCleanup(self.runner.stop)
+        monitor_path = os.path.join(directory.name, 'monitor.sock')
+        self.process = subprocess.Popen([
+            self.qemu_binary, '-machine', 'none', '-nodefaults', '-display', 'none',
+            '-S', '-netdev', 'user,id=net0',
+            '-qmp', 'unix:%s,server=on,wait=off' % self.config.internal_qmp_path,
+            '-qmp', 'unix:%s,server=on,wait=off' % monitor_path,
+        ], stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
+        self.addCleanup(self._stop_qemu)
+        self.config.add_slirp_hostfwds()
+        self.runner.qmp = self.monitor_protocol(monitor_path)
+        self.runner.qmp.settimeout(5)
+        self.assertIn('QMP', self.runner.qmp.connect())
+
+    def _stop_qemu(self):
+        if self.process.poll() is None:
+            self.process.terminate()
+        self.process.communicate(timeout=10)
+
+    def _monitor(self, command, arguments=None, timeout=60):
+        return self.runner.qmp.cmd_raw(command, arguments)
+
+    def _socket(self, protocol='tcp'):
+        probe = socket.socket(socket.AF_INET, socket.SOCK_STREAM if protocol == 'tcp' else socket.SOCK_DGRAM)
+        self.addCleanup(probe.close)
+        probe.bind(('127.0.0.1', 0))
+        if protocol == 'tcp':
+            probe.listen()
+        return probe
+
+    def _free_port(self):
+        probe = self._socket()
+        port = probe.getsockname()[1]
+        probe.close()
+        return port
+
+    def _startup_forward(self, port, protocol='tcp', guest_port=1234, host='127.0.0.1'):
+        self.config.slirp_hostfwd_allowlist = [(protocol, host, port, '', guest_port)]
+        self.config.add_slirp_hostfwds()
+        return self.runner.get_host_port(guest_port, protocol=protocol)
+
+    def test_startup_rejected_candidate(self):
+        """Move a startup forward away from a port QEMU cannot bind."""
+        busy = self._socket()
+        port = busy.getsockname()[1]
+        actual = self._startup_forward(port)
+        self.assertNotEqual(actual, port)
+
+    def test_protocols_share_owned_reservations(self):
+        """Allow TCP and UDP forwards to share a host port."""
+        for guest_port, owner in ((1234, 'runqemu'), (1235, 'qemurunner'), (1236, 'runqemu-dynamic')):
+            with self.subTest(owner=owner):
+                port = self._free_port()
+                if owner == 'runqemu':
+                    self.config.slirp_hostfwd_allowlist = [
+                        (protocol, '127.0.0.1', port, '', guest_port)
+                        for protocol in ('tcp', 'udp')]
+                    self.config.add_slirp_hostfwds()
+                elif owner == 'runqemu-dynamic':
+                    self.assertEqual(self._startup_forward(port, guest_port=guest_port), port)
+                else:
+                    self.assertEqual(self.runner.add_hostfwd(guest_port, port), port)
+                self.assertEqual(self.runner.get_host_port(guest_port), port)
+                if owner != 'runqemu':
+                    self.assertEqual(self.runner.add_hostfwd(guest_port, port, protocol='udp'), port)
+                self.assertEqual(self.runner.get_host_port(guest_port, protocol='UDP'), port)
+
+    def test_dynamic_rejected_candidates(self):
+        """Reject dynamic forwards when binding or monitor commands fail."""
+        for protocol in ('tcp', 'udp'):
+            with self.subTest(protocol=protocol):
+                busy = self._socket(protocol)
+                port = busy.getsockname()[1]
+                self.assertIsNone(self.runner.add_hostfwd(1234, port, protocol=protocol))
+        port = self._free_port()
+        for failure in (None, {}, {'error': {}}, {'return': '', 'error': {}},
+                        {'return': 'Could not set up host forwarding rule'}, {'return': 0}):
+            with self.subTest(response=failure):
+                def reply(command, arguments=None):
+                    if arguments and arguments['command-line'].startswith('hostfwd_add'):
+                        return failure
+                    return self._monitor(command, arguments)
+                with patch.object(self.runner, 'run_monitor', side_effect=reply):
+                    self.assertIsNone(self.runner.add_hostfwd(1234, port))
+
+    def test_internal_monitor_timeouts(self):
+        self.config.SLIRP_QMP_TIMEOUT = 0.1
+        for phase in ('greeting', 'capabilities', 'hostfwd'):
+            with self.subTest(phase=phase), tempfile.TemporaryDirectory() as directory:
+                port = self._free_port()
+                self.config.internal_qmp_path = os.path.join(directory, 'silent.sock')
+                self.config.slirp_hostfwd_allowlist = [('tcp', '127.0.0.1', port, '', 1234)]
+                with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as listener:
+                    listener.settimeout(5)
+                    listener.bind(self.config.internal_qmp_path)
+                    listener.listen()
+                    with ThreadPoolExecutor(max_workers=1) as executor:
+                        future = executor.submit(self.config.add_slirp_hostfwds)
+                        with listener.accept()[0] as peer:
+                            peer.settimeout(2)
+                            with peer.makefile('rw') as stream:
+                                if phase != 'greeting':
+                                    stream.write(json.dumps({'QMP': {}}) + '\n')
+                                    stream.flush()
+                                    self.assertEqual(json.loads(stream.readline())['execute'], 'qmp_capabilities')
+                                if phase == 'hostfwd':
+                                    stream.write(json.dumps({'return': {}}) + '\n')
+                                    stream.flush()
+                                    self.assertEqual(json.loads(stream.readline())['execute'], 'human-monitor-command')
+                                with self.assertRaisesRegex(self.runqemu_error, 'Timed out communicating'):
+                                    future.result(timeout=2)
+
+    def test_private_internal_monitor(self):
+        """Add a private forwarding monitor without replacing the requested monitor.
+
+        The internal socket's directory must be accessible only to its owner
+        and registered for cleanup. Both QMP sockets must appear in QEMU's
+        command line.
+        """
+        self.config.slirp_hostfwd_allowlist = [('tcp', '127.0.0.1', 2222, '', 22)]
+        self.config.qmp = 'unix:requested-monitor.sock'
+        self.config.setup_qmp()
+        directory = os.path.dirname(self.config.internal_qmp_path)
+        self.addCleanup(shutil.rmtree, directory)
+        self.assertEqual(stat.S_IMODE(os.stat(directory).st_mode), 0o700)
+        self.assertIn(directory, self.config.cleanup_files)
+        self.assertIn('-qmp unix:requested-monitor.sock,server,nowait', self.config.qemu_opt)
+        self.assertIn('-qmp unix:%s,server,nowait' % self.config.internal_qmp_path, self.config.qemu_opt)
+
+    def test_mac_slot_reuse(self):
+        """Allocate distinct MAC slots and reuse a slot after its lock is released.
+
+        A third configuration must take the first configuration's freed slot
+        while the second configuration continues to hold its own slot.
+        """
+        with tempfile.TemporaryDirectory() as directory:
+            configs = [self.base_config() for index in range(3)]
+            try:
+                self.assertEqual(configs[0].alloc_mac_slot(directory), 1)
+                self.assertEqual(configs[1].alloc_mac_slot(directory), 2)
+                configs[0].release_lock()
+                self.assertEqual(configs[2].alloc_mac_slot(directory), 1)
+            finally:
+                for config in configs:
+                    config.release_lock()
+
+    def test_mac_slot_exhaustion(self):
+        """Report exhaustion only after trying all 254 usable MAC slot locks."""
+        with tempfile.TemporaryDirectory() as directory:
+            with patch.object(self.config, 'acquire_lock', return_value=False) as acquire:
+                with self.assertRaisesRegex(self.runqemu_error, 'Too many concurrent'):
+                    self.config.alloc_mac_slot(directory)
+            self.assertEqual(acquire.call_count, 254)
+            self.assertEqual([os.path.basename(call.args[0]) for call in acquire.call_args_list],
+                             ['%d.lock' % slot for slot in range(1, 255)])
+
+    def test_bind_addresses(self):
+        """Preserve explicit bind addresses and resolve wildcard binds to localhost."""
+        for guest_port, host, expected in ((1234, '127.0.0.2', '127.0.0.2'), (1235, '0.0.0.0', '127.0.0.1')):
+            with self.subTest(host=host):
+                actual = self._startup_forward(self._free_port(), guest_port=guest_port, host=host)
+                endpoint = self.runner._get_slirp_host_endpoint(guest_port)
+                self.assertEqual(endpoint, (expected, actual))
+                with socket.create_connection(endpoint, timeout=5):
+                    pass
+
+    def test_unsupported_protocol(self):
+        """Reject unsupported forwarding protocols."""
+        with self.assertRaises(ValueError):
+            self.runner.add_hostfwd(1234, protocol='sctp')
+
+    def test_explicit_forward_with_non_slirp_primary(self):
+        """Manage slirp forwards independently of the primary networking mode."""
+        self.runner.use_slirp = False
+        for protocol in ('tcp', 'udp'):
+            with self.subTest(protocol=protocol):
+                port = self._free_port()
+                self.assertEqual(self.runner.add_hostfwd(1234, port, protocol=protocol), port)
+                self.assertEqual(self.runner.slirp_port_mappings[(protocol, 1234)], port)
+                self.assertEqual(self.runner.get_host_port(1234, protocol=protocol), port)
+        port = self.runner.get_host_port(1236)
+        self.assertEqual(self.runner.slirp_port_mappings[('tcp', 1236)], port)
+        with socket.create_connection(('127.0.0.1', port), timeout=5):
+            pass
+        response = self.runner.run_monitor('netdev_del', {'id': 'net0'})
+        self.assertEqual(response, {'return': {}})
+        port = self._free_port()
+        self.assertIsNone(self.runner.add_hostfwd(1235, port))
+        with self.assertRaisesRegex(RuntimeError, 'Failed to add a slirp tcp hostfwd'):
+            self.runner.get_host_port(1235)
 
 
 @OETestTag("runqemu")
-- 
2.56.0


