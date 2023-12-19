Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29587C46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:35:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.15005.1702996535496103182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hhq3LFSt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3364c9ff8e1so2537681f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702996533; x=1703601333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcUB0zdAvoy0z09thntI4WuPRyb3nadRKCMzxIW/3RM=;
        b=Hhq3LFStH5HiBgxc5kluosjiPPrSKszjka4bxOE8Y7LUav4KG2zAgKxsT2H6oKagtA
         iz0KjoXmO1wYXLpEVNBYm2AENkS2R2w//blxSjrICASfGRDwPo8AgDxFsCpIU7g1JUFE
         fKUfdney+HumixmkRjIh7RIO2BzsUFU3G/Qf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996533; x=1703601333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcUB0zdAvoy0z09thntI4WuPRyb3nadRKCMzxIW/3RM=;
        b=CXnfsOjB5fZ+kDRDoA2uApJZ6bZzYeGw6vhVKp8eMuoxeQN/NM5WSRsT2GA4rcwfih
         X4PG+h2+LD962/hk/Kc3EtX9kkMgHbPGT2C45W9MrStK8xeF21RoXJY5ilopdbARE0Z6
         T+km+v1buT1fiWbEOAHKDosSxK0/+d4n7xgTW/LOLdLCxqw1l+9CtZ/Uk4An4unv5s3p
         4mWuM48Wqf58uV6ERM8MwQv3wD0KR0luEPkTZ1hEMfy/k4KyVvX28+c55Pwwdo+cmj61
         /zP/sURu6qCE1kKh2R4XqiXVbg73dCfIhZWTI/lFmx80oXSrHkuiV1Tco5WOhMpxY+mu
         +YWQ==
X-Gm-Message-State: AOJu0YzFxc4d8peOCIzBiKkrLEiWEXmqXt9n+5Dtfip3monbW54iyHY6
	YCjuwLzs0y8e+yLqa+0NOUdINjTGQVfzSBLDQWc=
X-Google-Smtp-Source: AGHT+IEux/mSYWFX9yuyM8XirTNuP5enYHCvTM+OAWvFdBIePSAIF+f/fZwk6b9Yi67cW29ygQUfJA==
X-Received: by 2002:a1c:7505:0:b0:40c:6555:8faf with SMTP id o5-20020a1c7505000000b0040c65558fafmr613284wmc.180.1702996533574;
        Tue, 19 Dec 2023 06:35:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040c57e4ea28sm3168889wmq.17.2023.12.19.06.35.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:35:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] qemurunner: Improve stdout logging handling
Date: Tue, 19 Dec 2023 14:35:28 +0000
Message-Id: <20231219143531.3514266-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192741

We need to ensure we read from and log the output from qemu stdout
as otherwise the buffers can fill and block, leading qemu to hand.
Use our existing logging thread to do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 54 ++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index ee367078000..cdd0db58776 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -29,6 +29,15 @@ control_chars = [chr(x) for x in control_range
                 if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
+def getOutput(o):
+    import fcntl
+    fl = fcntl.fcntl(o, fcntl.F_GETFL)
+    fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
+    try:
+        return os.read(o.fileno(), 1000000).decode("utf-8")
+    except BlockingIOError:
+        return ""
+
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=False,
@@ -55,6 +64,7 @@ class QemuRunner:
         self.boottime = boottime
         self.logged = False
         self.thread = None
+        self.threadsock = None
         self.use_kvm = use_kvm
         self.use_ovmf = use_ovmf
         self.use_slirp = use_slirp
@@ -119,21 +129,11 @@ class QemuRunner:
                 f.write(msg)
         self.msg += self.decode_qemulog(msg)
 
-    def getOutput(self, o):
-        import fcntl
-        fl = fcntl.fcntl(o, fcntl.F_GETFL)
-        fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
-        try:
-            return os.read(o.fileno(), 1000000).decode("utf-8")
-        except BlockingIOError:
-            return ""
-
-
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
                 self.logger.error('runqemu exited with code %d' % self.runqemu.returncode)
-                self.logger.error('Output from runqemu:\n%s' % self.getOutput(self.runqemu.stdout))
+                self.logger.error('Output from runqemu:\n%s' % getOutput(self.runqemu.stdout))
                 self.stop()
 
     def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None, discard_writes=True):
@@ -282,7 +282,7 @@ class QemuRunner:
                 if self.runqemu.returncode:
                     # No point waiting any longer
                     self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
-                    self.logger.warning("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.logger.warning("Output from runqemu:\n%s" % getOutput(output))
                     self.stop()
                     return False
             time.sleep(0.5)
@@ -309,7 +309,7 @@ class QemuRunner:
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
             self.logger.debug("Running processes:\n%s" % processes)
-            op = self.getOutput(output)
+            op = getOutput(output)
             self.stop()
             if op:
                 self.logger.error("Output from runqemu:\n%s" % op)
@@ -387,7 +387,7 @@ class QemuRunner:
                            time.time() - connect_time))
 
         # We are alive: qemu is running
-        out = self.getOutput(output)
+        out = getOutput(output)
         netconf = False # network configuration is not required by default
         self.logger.debug("qemu started in %.2f seconds - qemu procces pid is %s (%s)" %
                           (time.time() - (endtime - self.runqemutime),
@@ -430,9 +430,10 @@ class QemuRunner:
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
 
+        self.thread = LoggingThread(self.log, self.threadsock, self.logger, self.runqemu.stdout)
+        self.thread.start()
+
         if self.serial_ports >= 2:
-            self.thread = LoggingThread(self.log, self.threadsock, self.logger)
-            self.thread.start()
             if not self.thread.connection_established.wait(self.boottime):
                 self.logger.error("Didn't receive a console connection from qemu. "
                              "Here is the qemu command line used:\n%s\nand "
@@ -444,7 +445,7 @@ class QemuRunner:
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
-        filelist = [self.server_socket, self.runqemu.stdout]
+        filelist = [self.server_socket]
         reachedlogin = False
         stopread = False
         qemusock = None
@@ -564,7 +565,7 @@ class QemuRunner:
                 self.logger.debug("Sending SIGKILL to runqemu")
                 os.killpg(os.getpgid(self.runqemu.pid), signal.SIGKILL)
             if not self.runqemu.stdout.closed:
-                self.logger.info("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
+                self.logger.info("Output from runqemu:\n%s" % getOutput(self.runqemu.stdout))
             self.runqemu.stdin.close()
             self.runqemu.stdout.close()
             self.runqemu_exited = True
@@ -700,9 +701,11 @@ class QemuRunner:
 # event loop. The mechanism for stopping the thread is a simple pipe which
 # will wake up the poll and allow for tearing everything down.
 class LoggingThread(threading.Thread):
-    def __init__(self, logfunc, sock, logger):
+    def __init__(self, logfunc, sock, logger, qemuoutput):
         self.connection_established = threading.Event()
+
         self.serversock = sock
+        self.qemuoutput = qemuoutput
         self.logfunc = logfunc
         self.logger = logger
         self.readsock = None
@@ -732,7 +735,8 @@ class LoggingThread(threading.Thread):
 
     def teardown(self):
         self.logger.debug("Tearing down logging thread")
-        self.close_socket(self.serversock)
+        if self.serversock:
+            self.close_socket(self.serversock)
 
         if self.readsock is not None:
             self.close_socket(self.readsock)
@@ -747,7 +751,9 @@ class LoggingThread(threading.Thread):
     def eventloop(self):
         poll = select.poll()
         event_read_mask = self.errorevents | self.readevents
-        poll.register(self.serversock.fileno())
+        if self.serversock:
+            poll.register(self.serversock.fileno())
+        poll.register(self.qemuoutput.fileno())
         poll.register(self.readpipe, event_read_mask)
 
         breakout = False
@@ -767,7 +773,7 @@ class LoggingThread(threading.Thread):
                     break
 
                 # A connection request was received
-                elif self.serversock.fileno() == event[0]:
+                elif self.serversock and self.serversock.fileno() == event[0]:
                     self.logger.debug("Connection request received")
                     self.readsock, _ = self.serversock.accept()
                     self.readsock.setblocking(0)
@@ -781,6 +787,10 @@ class LoggingThread(threading.Thread):
                 elif self.readsock.fileno() == event[0]:
                     data = self.recv(1024)
                     self.logfunc(data)
+                elif self.qemuoutput.fileno() == event[0]:
+                    data = self.qemuoutput.read()
+                    self.logger.debug("Data received on qemu stdout %s" % data)
+                    self.logfunc(data, ".stdout")
 
     # Since the socket is non-blocking make sure to honor EAGAIN
     # and EWOULDBLOCK.
-- 
2.39.2


