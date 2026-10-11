Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCDCCA9ED1
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:59:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32877.1791748795274036701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=R9KxDjF0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-2026101119595228eba491cf000207c1-fkta_l@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026101119595228eba491cf000207c1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7ZX13zzIFwP6HrfrLKc4BkLaOWqzaZC6wKBfFyasrxU=;
 b=R9KxDjF00vjLV8weL4fr9SHJEWxS0SBA47NPQw9J1SZwwSuqZB/Jzeqx/bYOK8bKksLoPi
 6RsqZ/y7UAhAqluLF3BUNo9MJ49O53+ylwoMBc4pzAUjGVwBn1YdV4rvofMRf5jVV4Q/2eYm
 wCwHIXvrcqD+CWZ2/xM+KG1SsWjVMtOt0+4luAnG4pbp2p/BF+7OixMhkZ0P1+iT31Krz0Oj
 LbpNFbfBESsupbCvYjDCTJ7bWLwKiOmYBfzLJn3td1lSszDIAaCrzehCPnTZFSucTAOtkXc9
 NMPhLsFOY/DKzQbuS7p64BhogtAjaKOTnE7sDDhdU4NWmyw5483LaQVQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/11] qemurunner: query the slirp port mapping from the running qemu
Date: Sun, 11 Oct 2026 21:59:10 +0200
Message-ID: <20261011195949.2118607-6-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247589

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This series changes how runqemu allocates slirp host ports: instead of
taking a flock per port and probing it before QEMU starts, QEMU binds
each port itself and runqemu retries with the next port if the bind
fails. This works for any number of forwarded ports, such as the debug
server ports added by devtool ide-sdk or any other forwarded ports added
to QB_SLIRP_OPT. The effective host ports are then only known to the
running QEMU.

As a first step, make QemuRunner read the forwards from QEMU instead of
scraping its command line, which only resolved SSH and breaks once the
forwards are no longer passed there. Query info usernet through QMP and
expose mappings keyed by protocol and guest port. Preserve the SSH bind
address, provide TCP-default lookup and TCP/UDP allocation through
QemuTarget, and require an explicit successful QMP reply before
reporting a forward.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/targetcontrol.py    |  10 +++
 meta/lib/oeqa/utils/qemurunner.py | 143 ++++++++++++++++++++++++------
 2 files changed, 124 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1deea2e5ce..600ea3efcf 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -224,6 +224,16 @@ class QemuTarget(BaseTarget):
     def run_serial(self, command, timeout=60):
         return self.runner.run_serial(command, timeout=timeout)
 
+    def get_host_port(self, target_port, protocol='tcp'):
+        return self.runner.get_host_port(target_port, protocol=protocol)
+
+    @property
+    def slirp_port_mappings(self):
+        return self.runner.slirp_port_mappings
+
+    def add_hostfwd(self, target_port, host_port=None, protocol='tcp'):
+        return self.runner.add_hostfwd(target_port, host_port, protocol=protocol)
+
 
 class SimpleRemoteTarget(BaseTarget):
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 5979b52650..5d7374446e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -400,38 +400,44 @@ class QemuRunner:
                            self.qemupid, time.strftime("%D %H:%M:%S")))
         cmdline = ''
         if get_ip:
-            with open('/proc/%s/cmdline' % self.qemupid) as p:
-                cmdline = p.read()
-                # It is needed to sanitize the data received
-                # because is possible to have control characters
-                cmdline = re_control_char.sub(' ', cmdline)
-            try:
-                if self.use_slirp:
-                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
-                    ip, tcp_ports = tcp_ports.split(":")[:2]
-                    host_port = tcp_ports[:tcp_ports.find('-')]
-                    self.ip = "%s:%s" % (ip, host_port)
-                else:
+            if self.use_slirp:
+                # The running qemu is the authoritative source for the
+                # effective hostfwd rules: the host port a rule ends up on is
+                # not necessarily the one that was wished for.
+                try:
+                    host, port = self._get_slirp_host_endpoint(22)
+                    self.ip = "%s:%s" % (host, port)
+                except RuntimeError as err:
+                    self.logger.error("Couldn't resolve the ssh host port for slirp qemu: %s" % err)
+                    self.stop()
+                    return False
+            else:
+                with open('/proc/%s/cmdline' % self.qemupid) as p:
+                    cmdline = p.read()
+                    # It is needed to sanitize the data received
+                    # because is possible to have control characters
+                    cmdline = re_control_char.sub(' ', cmdline)
+                try:
                     ips = re.findall(r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                     self.ip = ips[0]
                     self.server_ip = ips[1]
-                self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
-            except (IndexError, ValueError):
-                # Try to get network configuration from runqemu output
-                match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+).*',
-                                 out, re.MULTILINE | re.DOTALL)
-                if match:
-                    self.ip, self.server_ip, self.netmask = match.groups()
-                    # network configuration is required as we couldn't get it
-                    # from the runqemu command line, so qemu doesn't run kernel
-                    # and guest networking is not configured
-                    netconf = True
-                else:
-                    self.logger.error("Couldn't get ip from qemu command line and runqemu output! "
-                                 "Here is the qemu command line used:\n%s\n"
-                                 "and output from runqemu:\n%s" % (cmdline, out))
-                    self.stop()
-                    return False
+                    self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
+                except (IndexError, ValueError):
+                    # Try to get network configuration from runqemu output
+                    match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+).*',
+                                     out, re.MULTILINE | re.DOTALL)
+                    if match:
+                        self.ip, self.server_ip, self.netmask = match.groups()
+                        # network configuration is required as we couldn't get it
+                        # from the runqemu command line, so qemu doesn't run kernel
+                        # and guest networking is not configured
+                        netconf = True
+                    else:
+                        self.logger.error("Couldn't get ip from qemu command line and runqemu output! "
+                                     "Here is the qemu command line used:\n%s\n"
+                                     "and output from runqemu:\n%s" % (cmdline, out))
+                        self.stop()
+                        return False
 
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
@@ -649,6 +655,85 @@ class QemuRunner:
                         return True
         return False
 
+    @property
+    def slirp_port_mappings(self):
+        """Slirp hostfwd rules as {(protocol, target_port): host_port} read from Qemu's monitor."""
+        return {key: endpoint[1]
+            for key, endpoint in self._slirp_hostfwd_mappings.items()}
+
+    @property
+    def _slirp_hostfwd_mappings(self):
+        """Return {(protocol, guest_port): (host_address, host_port)} from QEMU."""
+        result = self.run_monitor('human-monitor-command',
+                                  {'command-line': 'info usernet'})
+        output = (result or {}).get('return', '') if isinstance(result, dict) else ''
+        mappings = {}
+        # Protocol[State]    FD  Source Address  Port   Dest. Address  Port RecvQ SendQ
+        # TCP[HOST_FORWARD]  10       127.0.0.1  2222       10.0.2.15    22     0     0
+        for line in (output or '').splitlines():
+            fields = line.split()
+            if len(fields) < 6:
+                continue
+            protocol, separator, state = fields[0].partition('[')
+            if not protocol or not separator or state != 'HOST_FORWARD]':
+                continue
+            try:
+                mappings[(protocol.lower(), int(fields[5]))] = (fields[2], int(fields[3]))
+            except ValueError:
+                continue
+        return mappings
+
+    def _get_slirp_host_endpoint(self, target_port, protocol='tcp'):
+        protocol = protocol.lower()
+        endpoint = self._slirp_hostfwd_mappings.get((protocol, target_port))
+        if endpoint is None:
+            return '127.0.0.1', self.add_hostfwd(target_port, protocol=protocol)
+        host, port = endpoint
+        if host in ('*', '0.0.0.0'):
+            host = '127.0.0.1'
+        return host, port
+
+    def add_hostfwd(self, target_port, host_port=None, protocol='tcp'):
+        """Add a TCP or UDP slirp hostfwd rule and return the host port.
+
+        Without host_port a free one is picked automatically. Returns None if
+        an explicitly requested host_port is already in use.
+        """
+        protocol = protocol.lower()
+        socket_type = {'tcp': socket.SOCK_STREAM, 'udp': socket.SOCK_DGRAM}.get(protocol)
+        if socket_type is None:
+            raise ValueError("Unsupported slirp host forwarding protocol: %s" % protocol)
+        candidates = [host_port] if host_port else []
+        if not host_port:
+            for _ in range(10):
+                with socket.socket(socket.AF_INET, socket_type) as s:
+                    s.bind(('127.0.0.1', 0))
+                    candidates.append(s.getsockname()[1])
+        for candidate in candidates:
+            result = self.run_monitor('human-monitor-command', {
+                'command-line': 'hostfwd_add %s:127.0.0.1:%d-:%d' % (protocol, candidate, target_port)})
+            output = result.get('return') if isinstance(result, dict) else None
+            # hostfwd_add prints nothing on success; on failure it prints a message like
+            # "Could not set up host forwarding rule ...". Check for empty output to determine success.
+            if isinstance(result, dict) and 'error' not in result and isinstance(output, str) and output.strip() == '':
+                self.logger.debug("Added %s hostfwd for target port %d on host port %d"
+                                 % (protocol, target_port, candidate))
+                return candidate
+            self.logger.debug("hostfwd_add for %s host port %d failed: %s" % (protocol, candidate, result))
+        if host_port:
+            return None
+        raise RuntimeError(
+            "Failed to add a slirp %s hostfwd rule for target port %d" % (protocol, target_port))
+
+    def get_host_port(self, target_port, protocol='tcp'):
+        """Resolve a slirp protocol and target port to the host port qemu
+        forwards it on, adding a rule for it if there is none yet."""
+        protocol = protocol.lower()
+        host_port = self.slirp_port_mappings.get((protocol, target_port))
+        if host_port is None:
+            host_port = self.add_hostfwd(target_port, protocol=protocol)
+        return host_port
+
     def run_monitor(self, command, args=None, timeout=60):
         if hasattr(self, 'qmp') and self.qmp:
             self.qmp.settimeout(timeout)
-- 
2.56.0


