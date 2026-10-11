Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2A7CA9ED3
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:59:59 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32874.1791748795181070821
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OmsanzWf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20261011195952d772e228b8000207d6-zdyvsn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261011195952d772e228b8000207d6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=urfVPRJpvto8SGYKkWZhmUQlSlQVwrVQbbZ2MwhoDU8=;
 b=OmsanzWfXzWkvi/qAf3EM/OF0ByVTJ9pEDrordSyBood721Gjsc8vUbMttLKh0ErTda1Vh
 5UWS5bkJd6Z6LhjVQMnrrvx5cLzeGkMCTH0angzuYtYq6PiuiouVVvYCf0MsbhaGohs2g7RB
 2Iod7C2IRcUrFuw7xb2tLSrabgzcC7ByCRLfJffbQauZHbQu99jHfEpEz82coclqCsP6UWn7
 LZwmsUrILlY3JbVPeGorX8lRPm6OMX7ELFMYPQD8LEWusFhwaYVo484jpRqfI71gEFdZTMWQ
 ecfK8zNm1Mh6bOpCd4UfcxRuStoXp4r1dldoW1WljVu1OmHYghtXQMKw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 06/11] runqemu: add slirp hostfwd ports via QMP after qemu started
Date: Sun, 11 Oct 2026 21:59:11 +0200
Message-ID: <20261011195949.2118607-7-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247591

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is the second step of letting QEMU bind the slirp host ports and
retrying on failure, instead of taking a flock per port.

So far runqemu locked and probed each hostfwd port before starting QEMU.
The lock only coordinates runqemu instances, so any other process can
still bind the port before QEMU does, and QEMU then fails to start.

Now runqemu strips the hostfwd rules from the QEMU command line and adds
them through a private QMP monitor once QEMU runs. If QEMU cannot bind a
host port, runqemu tries the next one. TCP and UDP are tracked
separately, so both can use the same host port. QemuRunner already
reads the effective forwards from QEMU and briefly waits for the SSH
forward before adding its own.

The QMP exchange is bounded and validated so a broken monitor cannot
hang startup, and QEMU's stderr is reported if it exits early.

Coordination with older runqemu instances via the legacy port locks
is added separately later in this series, so it can be reverted once
older branches have the backports or reach EOL.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/qemurunner.py |   5 ++
 scripts/runqemu                   | 127 +++++++++++++++++++++++++-----
 2 files changed, 112 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5d7374446e..81434dc117 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -404,6 +404,11 @@ class QemuRunner:
                 # The running qemu is the authoritative source for the
                 # effective hostfwd rules: the host port a rule ends up on is
                 # not necessarily the one that was wished for.
+                # runqemu adds its forwards via QMP shortly after qemu starts.
+                endtime = time.time() + 10
+                while (('tcp', 22) not in self.slirp_port_mappings
+                       and self.is_alive() and time.time() < endtime):
+                    time.sleep(0.1)
                 try:
                     host, port = self._get_slirp_host_endpoint(22)
                     self.ip = "%s:%s" % (host, port)
diff --git a/scripts/runqemu b/scripts/runqemu
index ca1f74e9d7..c569fc7c84 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -19,6 +19,8 @@ import glob
 import configparser
 import signal
 import time
+import json
+import tempfile
 import shlex
 import socket
 import traceback
@@ -221,6 +223,8 @@ class BaseConfig(object):
         # slirp qemus are running.
         self.mac_tap = "52:54:00:12:34:"
         self.mac_slirp = "52:54:00:12:35:"
+        self.slirp_hostfwd_allowlist = []
+        self.internal_qmp_path = None
         # pid of the actual qemu process
         self.qemu_environ = os.environ.copy()
         self.qemuprocess = None
@@ -1156,30 +1160,103 @@ to your build configuration.
         hostfwd = ",hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23"
         qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
-        # Figure out the port
-        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
-        ports = [int(i) for i in ports]
 
-        lockdir = "/tmp/qemu-port-locks"
-        self.make_lock_dir(lockdir)
+        # Strip hostfwd rules from argv and add them via QMP after startup,
+        # making QEMU's host port binding authoritative.
+        self.slirp_hostfwd_allowlist = [
+            (proto, hostip, int(hostport), guestip, int(targetport)) for
+            proto, hostip, hostport, guestip, targetport in
+            re.findall(r'hostfwd=([a-z]+):([^:]*):([0-9]+)-([^:,]*):([0-9]+)', qb_slirp_opt)
+        ]
+        qb_slirp_opt = re.sub(r',hostfwd=[a-z]+:[^:]*:[0-9]+-[^:,]*:[0-9]+', '', qb_slirp_opt)
 
-        # Find a free port to avoid conflicts
-        for p in ports[:]:
-            p_new = p
-            while not self.check_free_port('localhost', p_new, lockdir):
-                p_new += 1
-                while p_new in ports:
-                        p_new += 1
-            if p != p_new:
-                ports.append(p_new)
-                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
-                logger.info("Port forward changed: %s -> %s" % (p, p_new))
         mac = "%s%02x" % (self.mac_slirp, self.alloc_mac_slot("/tmp/qemu-mac-locks"))
         self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qb_slirp_opt))
-        # Print out port foward
-        hostfwd = re.findall('(hostfwd=[^,]*)', qb_slirp_opt)
-        if hostfwd:
-            logger.info('Port forward: %s' % ' '.join(hostfwd))
+
+    SLIRP_QMP_TIMEOUT = 10
+
+    def add_slirp_hostfwds(self):
+        """Add the slirp hostfwd allowlist to the running qemu via QMP"""
+        # qemu creates/binds this socket itself soon after it starts, so it
+        # may not be ready to accept a connection yet right after Popen().
+        sock = None
+        for _ in range(100):
+            if self.qemuprocess and self.qemuprocess.poll() is not None:
+                raise RunQemuError("Failed to run qemu: %s" % self.qemuprocess.stderr.read().decode())
+            try:
+                sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+                sock.settimeout(self.SLIRP_QMP_TIMEOUT)
+                sock.connect(self.internal_qmp_path)
+                break
+            except (FileNotFoundError, ConnectionRefusedError):
+                sock.close()
+                sock = None
+                time.sleep(0.1)
+            except socket.timeout as error:
+                sock.close()
+                raise RunQemuError("Timed out connecting to internal QMP socket %s" % self.internal_qmp_path) from error
+            except OSError:
+                sock.close()
+                raise
+        else:
+            raise RunQemuError("Timed out waiting for internal QMP socket %s" % self.internal_qmp_path)
+        sockf = sock.makefile('rw')
+
+        def read_response():
+            # QMP may interleave asynchronous event messages with command
+            # responses; skip those and return the first actual reply.
+            while True:
+                line = sockf.readline()
+                if not line:
+                    raise RunQemuError("Internal QMP connection closed unexpectedly")
+                msg = json.loads(line)
+                if 'event' not in msg:
+                    return msg
+
+        try:
+            greeting = read_response()
+            if 'QMP' not in greeting:
+                raise RunQemuError("Invalid internal QMP greeting: %s" % greeting)
+            sockf.write(json.dumps({"execute": "qmp_capabilities"}) + '\n')
+            sockf.flush()
+            response = read_response()
+            if 'error' in response or response.get('return') != {}:
+                raise RunQemuError("Internal QMP negotiation failed: %s" % response)
+
+            used_ports = set()
+            hostfwd_added = []
+            for proto, hostip, hostport, guestip, targetport in self.slirp_hostfwd_allowlist:
+                candidate = hostport
+                for _ in range(100):
+                    while (proto, candidate) in used_ports:
+                        candidate += 1
+                    cmdline = 'hostfwd_add %s:%s:%d-%s:%d' % (proto, hostip, candidate, guestip, targetport)
+                    sockf.write(json.dumps({"execute": "human-monitor-command",
+                                            "arguments": {"command-line": cmdline}}) + '\n')
+                    sockf.flush()
+                    response = read_response()
+                    # hostfwd_add prints nothing on success; on failure it
+                    # prints a message like "Could not set up host forwarding
+                    # rule ..." which does NOT contain the word "error", so
+                    # check for empty output rather than absence of that word.
+                    result = response.get('return')
+                    if 'error' not in response and isinstance(result, str) and result.strip() == '':
+                        used_ports.add((proto, candidate))
+                        hostfwd_added.append('hostfwd=%s:%s:%d-%s:%d' % (proto, hostip, candidate, guestip, targetport))
+                        if candidate != hostport:
+                            logger.info("Port forward changed: %s -> %s" % (hostport, candidate))
+                        break
+                    candidate += 1
+                else:
+                    raise RunQemuError("Could not find a free host port for hostfwd target %d after 100 attempts" % targetport)
+        except socket.timeout as error:
+            raise RunQemuError("Timed out communicating with internal QMP socket %s" % self.internal_qmp_path) from error
+        finally:
+            sockf.close()
+            sock.close()
+
+        if hostfwd_added:
+            logger.info('Port forward: %s' % ' '.join(hostfwd_added))
 
     def setup_tap(self):
         """Setup tap"""
@@ -1460,6 +1537,14 @@ to your build configuration.
     def setup_qmp(self):
         if self.qmp:
             self.qemu_opt += " -qmp %s,server,nowait" % self.qmp
+        if self.slirp_hostfwd_allowlist:
+            # A private monitor, in addition to any user-requested self.qmp,
+            # used internally to add the hostfwd allowlist once qemu is up
+            # (see add_slirp_hostfwds()).
+            qmp_dir = tempfile.mkdtemp(prefix='qemu-slirp-qmp-')
+            self.cleanup_files.append(qmp_dir)
+            self.internal_qmp_path = os.path.join(qmp_dir, 'monitor.sock')
+            self.qemu_opt += " -qmp unix:%s,server,nowait" % self.internal_qmp_path
 
     def setup_vga(self):
         if self.nographic == True:
@@ -1645,6 +1730,8 @@ to your build configuration.
                 pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
         self.qemuprocess = process
+        if self.slirp_hostfwd_allowlist:
+            self.add_slirp_hostfwds()
         retcode = process.wait()
         if retcode:
             if retcode == -signal.SIGTERM:
-- 
2.56.0


