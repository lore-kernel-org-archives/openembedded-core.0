Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBA766C37E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 06:57:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b19so6907351pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=5/x3axfApyhaqREOr4JRzHGZJRRPUZzDZpvBv7XQ2EA=;
	b=WgDDrIZek2iFT5WhvjkzMF2d2ra3z1lbfiYVMLxiM3a3AdvltcRbKIzyGS1KxPpiX6
	pJPezr/Qd+N9XMxdeulAdHDg4QXBNyBLiJTe+HZPG9OGXgxiwzklotmQRAfl+rQllslx
	cwfdI/VUJte3zch4GDa3xAw4xdXNtj+CilulIfiutByTAFwMH1sXOcVvJaDmz0Wv5KLW
	Sbcgn8ou5Ak4mFh5mkenS0k1Zqf5VIXY3Cyi68MPpqSWidz1PwMheul8dPbrnyJPmrqC
	LXSQJEdm/sMZ/OTcZZsiUWChT/xcZioNX57MpwhucmVOrx7354dIYMxOG+oYeV8kClNn
	bONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=5/x3axfApyhaqREOr4JRzHGZJRRPUZzDZpvBv7XQ2EA=;
	b=KZ3qTobL4/PoPivTWEtXwPPDlG4ctG7YdWd85i9A4FjLniZm6eS5NzcAcK/YUeDm6s
	SajhJnWc4qIj9zp7pcAsJBovIIX0JT3yra0s2dZp6Gi6SB+lMKuF7ZYXjGbhIHvWmsCT
	aL1AAz+P/brYq9UPeuvbI06onrfSRW0IgbDkC7++vl2qcA1BeEOSk0Kjzt4DG2RRIrkS
	Pe+HLCIQhAiep9SrhZRRvgZC0kPf0cQfb5vIeIXwLZTOjvrhAOyZOPrri7zJa/48NhFr
	qLdemJIChzG1z3zARJaZ2e20eTwExCK4UukVP6tqCPZgW8vJh38yoOFIx8Lf80rB2P8V
	btyw==
X-Gm-Message-State: APjAAAVin5a2nrIqmOQ2dmObnIEwKPFVfhPWQrivT39aOG3Gj0xPuEaN
	d+G7cScWIPd6f5gSbRDkyyct5t1OmlE=
X-Google-Smtp-Source: APXvYqxJeGXdcD8ealnuEgq/xC49p0QjQniqbjq3X7fbeZcr59a3H7MrBmJ7KsmcfAPcu4YsIr5CQA==
X-Received: by 2002:aa7:8dcf:: with SMTP id j15mr33462546pfr.233.1574665026477;
	Sun, 24 Nov 2019 22:57:06 -0800 (PST)
Received: from [127.0.1.1] ([101.184.7.224])
	by smtp.gmail.com with UTF8SMTPSA id
	z11sm7155845pfg.117.2019.11.24.22.57.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 24 Nov 2019 22:57:05 -0800 (PST)
Date: Mon, 25 Nov 2019 06:56:56 +0000
Message-Id: <20191125065656.332177-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] oeqa/utils/qemurunner.py: Handle QEMU machines with a single serial
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
X-List-Received-Date: Mon, 25 Nov 2019 06:57:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Not all QEMU machines are capable of having more than one serial port,
this is due to the machine emulating a physical device/board.

Rework QemuRunner to handle machines that only have 1 serial port, where
the serial port shares output of the kernel log buffer and a login
console. In this case the output is mixed but enables the machine to
boot and have QemuRunner detect the login prompt.

QemuTarget uses SERIAL_CONSOLES to determine the number of available
serial ports.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/targetcontrol.py    |  3 ++-
 meta/lib/oeqa/utils/qemurunner.py | 32 +++++++++++++++++++++-----------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1445e3ecfb..0b2915d5cc 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -143,7 +143,8 @@ class QemuTarget(BaseTarget):
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
                             dump_host_cmds = d.getVar("testimage_dump_host"),
-                            logger = logger)
+                            logger = logger,
+                            serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index fe8b77d97a..c025eb09c5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -31,7 +31,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False):
+                 use_kvm, logger, use_slirp=False, serial_ports=2):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -55,6 +55,7 @@ class QemuRunner:
         self.thread = None
         self.use_kvm = use_kvm
         self.use_slirp = use_slirp
+        self.serial_ports = serial_ports
         self.msg = ''
 
         self.runqemutime = 120
@@ -142,7 +143,8 @@ class QemuRunner:
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
         try:
-            self.threadsock, threadport = self.create_socket()
+            if self.serial_ports >= 2:
+                self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
@@ -160,7 +162,10 @@ class QemuRunner:
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-        launch_cmd += ' tcpserial=%s:%s %s' % (threadport, self.serverport, self.qemuparams)
+        if self.serial_ports >= 2:
+            launch_cmd += ' tcpserial=%s:%s %s' % (threadport, self.serverport, self.qemuparams)
+        else:
+            launch_cmd += ' tcpserial=%s %s' % (self.serverport, self.qemuparams)
 
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
@@ -275,14 +280,15 @@ class QemuRunner:
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
 
-        self.thread = LoggingThread(self.log, self.threadsock, self.logger)
-        self.thread.start()
-        if not self.thread.connection_established.wait(self.boottime):
-            self.logger.error("Didn't receive a console connection from qemu. "
-                         "Here is the qemu command line used:\n%s\nand "
-                         "output from runqemu:\n%s" % (cmdline, out))
-            self.stop_thread()
-            return False
+        if self.serial_ports >= 2:
+            self.thread = LoggingThread(self.log, self.threadsock, self.logger)
+            self.thread.start()
+            if not self.thread.connection_established.wait(self.boottime):
+                self.logger.error("Didn't receive a console connection from qemu. "
+                             "Here is the qemu command line used:\n%s\nand "
+                             "output from runqemu:\n%s" % (cmdline, out))
+                self.stop_thread()
+                return False
 
         self.logger.debug("Output from runqemu:\n%s", out)
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
@@ -310,6 +316,10 @@ class QemuRunner:
                     data = data + sock.recv(1024)
                     if data:
                         bootlog += data
+                        if self.serial_ports < 2:
+                            # this socket has mixed console/kernel data, log it to logfile
+                            self.log(data)
+
                         data = b''
                         if b' login:' in bootlog:
                             self.server_socket = qemusock
---
2.24.0

