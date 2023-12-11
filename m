Return-Path: <alex.bennee@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FACC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 15:57:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.11918.1702310258532716424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 07:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oz1dRWF1;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: alex.bennee@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33338c47134so4405152f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702310257; x=1702915057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMlIjQY80IYClHx5CUEgohkHkdv0ARXAq1aLoKM9pzQ=;
        b=oz1dRWF1vSZeS1lHhc0a7qJW++/DhTisjxM78q2LFXThAEMCqgbdzGGOI40s40QY6V
         bChHMqWPCrJ8ZYCv2Rf1DUFnK6+0DGphI83RKQbRZ2d2HlHYmrz30j8yAqrEcG0/oKk+
         b2dyw+L4LmVI+Mn4VEQiH+/fkt66LDc7RvXEPtbGnu7T18sWWOevGYQUKT9aF7ICuQYD
         MicU7FZAKKC6QXGComwrPmHqTfeO/jdPpRe+2KeQ790UtS63DGeVsZCe7W5+1lR/YTn3
         LLWGpdU8le15RxHcV8UJqHB0HLekuGEJlryVmDXWRvfVf1OVmeZQLcqhMDwawRGBmTnC
         XBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310257; x=1702915057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMlIjQY80IYClHx5CUEgohkHkdv0ARXAq1aLoKM9pzQ=;
        b=nTmoydNY4u4CHlFG8F/35vcEYIApmAD+j50F/U4j2BY5SrcS/N79aqS5we/+ZC//PQ
         l5muF2y8wR4oWC1ta60zL7OYT3DARnIMbu57LyPbhrtUayDuT39wq4HrWNmW9NB07Oev
         1SCxENRhcGmJIuQRG2fwFoCoV9dZ0rozzV1L4G/gYqdo6F2akPRV/z2Tdea1AxmFmc1k
         fCogst6h51WEr7SQBUGhzLV/qYEvrUoSON8gzNLR5/NOlXiLmJl3LEkFTZZjTfzDc3R4
         D+Ij+dDKUl/HXHkUqDntu96NtWP5gvl2+C8jz9xc+xEtotUxQ55SlZFZfbVnSz/o+QkV
         ZBzw==
X-Gm-Message-State: AOJu0YxpKOvWb+F+cVKzxVmNVt3fFMqy4FqTRvYxe+usgkcUNt2Buzl6
	kG6vVZc6ID7aA1zzrxgsbLlGE0WzDWerZyCtnsw=
X-Google-Smtp-Source: AGHT+IGCCFNJey1ORW+xzER0glnomzCC2B/aVRLHour5GktBasD51oC9KRzLyxjhTBfg7HXcsFFqwA==
X-Received: by 2002:adf:a488:0:b0:333:2f23:870d with SMTP id g8-20020adfa488000000b003332f23870dmr2754081wrb.49.1702310256794;
        Mon, 11 Dec 2023 07:57:36 -0800 (PST)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d524e000000b00333479734a7sm8838682wrc.99.2023.12.11.07.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:57:36 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 06E305FBC6;
	Mon, 11 Dec 2023 15:57:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [RFC PATCH v2] qemurunner.py: continue to drain stdout after login:
Date: Mon, 11 Dec 2023 15:57:29 +0000
Message-Id: <20231211155729.106010-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192177

If qemurunner doesn't continuously drain stdout we will eventually
cause QEMU to block while trying to write to the pipe. This can
manifest itself if the guest has for example configured its serial
ports to output via stdio even if the test itself is using a TCP
console or SSH to run things.

To do this:

  - always create a logging thread regardless of serial_ports
  - use a semaphore between main and logging threads
  - move the login detection into the logging thread
  - wait until the second acquire before continuing

This doesn't address a potential overflow of stderr although generally
stderr from QEMU will be a lot less likely to block due to the volume
of data.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 128 ++++++++++++++++++------------
 1 file changed, 78 insertions(+), 50 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 29fe271976..b768c08f04 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -207,8 +207,7 @@ class QemuRunner:
         self.logger.info("QMP Available for connection at %s" % (qmp_port2))
 
         try:
-            if self.serial_ports >= 2:
-                self.threadsock, threadport = self.create_socket()
+            self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
@@ -243,6 +242,7 @@ class QemuRunner:
         # to be a proper fix but this will suffice for now.
         self.runqemu = subprocess.Popen(launch_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE, preexec_fn=os.setpgrp, env=env, cwd=self.tmpdir)
         output = self.runqemu.stdout
+        output_drain = output
         launch_time = time.time()
 
         #
@@ -431,21 +431,30 @@ class QemuRunner:
         self.logger.debug("Target IP: %s" % self.ip)
         self.logger.debug("Server IP: %s" % self.server_ip)
 
-        if self.serial_ports >= 2:
-            self.thread = LoggingThread(self.log, self.threadsock, self.logger)
-            self.thread.start()
-            if not self.thread.connection_established.wait(self.boottime):
-                self.logger.error("Didn't receive a console connection from qemu. "
-                             "Here is the qemu command line used:\n%s\nand "
-                             "output from runqemu:\n%s" % (cmdline, out))
-                self.stop_thread()
-                return False
+        # Create and hold onto the login semaphore, this will block
+        # the LoggingThread until we are ready
+        login_semaphore = threading.Semaphore()
+        login_semaphore.acquire()
+
+        self.thread = LoggingThread(self.log, self.threadsock,
+                                    self.runqemu.stdout, self.boot_patterns['search_reached_prompt'],
+                                    self.logger, login_semaphore)
+
+        self.thread.start()
+        login_semaphore.release()
+
+        # if not self.thread.connection_established.wait(self.boottime):
+        #     self.logger.error("Didn't receive a console connection from qemu. "
+        #                       "Here is the qemu command line used:\n%s\nand "
+        #                       "output from runqemu:\n%s" % (cmdline, out))
+        #     self.stop_thread()
+        #     return False
 
         self.logger.debug("Output from runqemu:\n%s", out)
         self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
                           (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
-        filelist = [self.server_socket, self.runqemu.stdout]
+        filelist = [self.server_socket]
         reachedlogin = False
         stopread = False
         qemusock = None
@@ -464,46 +473,19 @@ class QemuRunner:
                     filelist.remove(self.server_socket)
                     self.logger.debug("Connection from %s:%s" % addr)
                 else:
-                    # try to avoid reading only a single character at a time
-                    time.sleep(0.1)
-                    if hasattr(file, 'read'):
-                        read = file.read(1024)
-                    elif hasattr(file, 'recv'):
-                        read = file.recv(1024)
-                    else:
-                        self.logger.error('Invalid file type: %s\n%s' % (file))
-                        read = b''
-
-                    self.logger.debug2('Partial boot log:\n%s' % (read.decode('utf-8', errors='backslashreplace')))
-                    data = data + read
-                    if data:
-                        bootlog += data
-                        self.log(data, extension = ".2")
-                        data = b''
-
-                        if bytes(self.boot_patterns['search_reached_prompt'], 'utf-8') in bootlog:
-                            self.server_socket.close()
-                            self.server_socket = qemusock
-                            stopread = True
-                            reachedlogin = True
-                            self.logger.debug("Reached login banner in %.2f seconds (%s)" %
-                                              (time.time() - (endtime - self.boottime),
-                                              time.strftime("%D %H:%M:%S")))
-                    else:
-                        # no need to check if reachedlogin unless we support multiple connections
-                        self.logger.debug("QEMU socket disconnected before login banner reached. (%s)" %
-                                          time.strftime("%D %H:%M:%S"))
-                        filelist.remove(file)
-                        file.close()
+                    if login_semaphore.acquire(blocking=False):
+                        self.server_socket.close()
+                        self.server_socket = qemusock
                         stopread = True
+                        reachedlogin = True
+
+        self.logger.debug("continuing on....")
 
         if not reachedlogin:
             if time.time() >= endtime:
                 self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
-            bootlog = self.decode_qemulog(bootlog)
-            self.logger.warning("Last 25 lines of login console (%d):\n%s" % (len(bootlog), tail(bootlog)))
             self.logger.warning("Last 25 lines of all logging (%d):\n%s" % (len(self.msg), tail(self.msg)))
             self.logger.warning("Check full boot log: %s" % self.logfile)
             self.stop()
@@ -539,6 +521,7 @@ class QemuRunner:
                 self.logger.warning("The output:\n%s" % output)
         except:
             self.logger.warning("Serial console failed while trying to login")
+
         return True
 
     def stop(self):
@@ -696,14 +679,16 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
-# This class is for reading data from a socket and passing it to logfunc
-# to be processed. It's completely event driven and has a straightforward
-# event loop. The mechanism for stopping the thread is a simple pipe which
-# will wake up the poll and allow for tearing everything down.
+# This class is for reading data from sockets and QEMU's stdio output
+# and passing it to logfunc to be processed. It's completely event
+# driven and has a straightforward event loop. The mechanism for
+# stopping the thread is a simple pipe which will wake up the poll and
+# allow for tearing everything down.
 class LoggingThread(threading.Thread):
-    def __init__(self, logfunc, sock, logger):
+    def __init__(self, logfunc, sock, qemu_stdio, prompt, logger, semaphore):
         self.connection_established = threading.Event()
         self.serversock = sock
+        self.qemu_stdio = qemu_stdio
         self.logfunc = logfunc
         self.logger = logger
         self.readsock = None
@@ -713,9 +698,19 @@ class LoggingThread(threading.Thread):
         self.errorevents = select.POLLERR | select.POLLHUP | select.POLLNVAL
         self.readevents = select.POLLIN | select.POLLPRI
 
+        # tracking until we see prompt
+        self.prompt = prompt
+        self.prompt_seen = False
+        self.boot_log = b''
+        self.semaphore = semaphore
+        self.boottime = time.time()
+
         threading.Thread.__init__(self, target=self.threadtarget)
 
     def threadtarget(self):
+        # we acquire until we see the boot prompt
+        self.semaphore.acquire()
+
         try:
             self.eventloop()
         finally:
@@ -750,6 +745,7 @@ class LoggingThread(threading.Thread):
         event_read_mask = self.errorevents | self.readevents
         poll.register(self.serversock.fileno())
         poll.register(self.readpipe, event_read_mask)
+        poll.register(self.qemu_stdio, event_read_mask)
 
         breakout = False
         self.running = True
@@ -757,8 +753,12 @@ class LoggingThread(threading.Thread):
         while not breakout:
             events = poll.poll()
             for event in events:
+
+                self.logger.debug(f"event is {event}")
+
                 # An error occurred, bail out
                 if event[1] & self.errorevents:
+                    self.logger.debug("error event")
                     raise Exception(self.stringify_event(event[1]))
 
                 # Event to stop the thread
@@ -767,6 +767,10 @@ class LoggingThread(threading.Thread):
                     breakout = True
                     break
 
+                # stdio data to be logged
+                elif self.qemu_stdio.fileno() == event[0]:
+                    self.consume_qemu_stdio()
+
                 # A connection request was received
                 elif self.serversock.fileno() == event[0]:
                     self.logger.debug("Connection request received")
@@ -783,6 +787,30 @@ class LoggingThread(threading.Thread):
                     data = self.recv(1024)
                     self.logfunc(data)
 
+
+    # Consume QEMU's stdio output, checking for login strings
+    def consume_qemu_stdio(self):
+        # try to avoid reading only a single character at a time
+        time.sleep(0.1)
+        read = self.qemu_stdio.read(1024)
+
+        # log what we have seen
+        decoded_data = read.decode('utf-8', errors='backslashreplace')
+        if self.prompt_seen:
+            self.logger.debug2('Post login log:\n%s' % decoded_data)
+        else:
+            self.logger.debug2('Pre login log:\n%s' % decoded_data)
+
+        if not self.prompt_seen and read:
+            self.boot_log += read
+
+            if bytes(self.prompt, 'utf-8') in self.boot_log:
+                time_to_login = time.time() - self.boottime
+                self.logger.debug("Reached login banner in %.2f seconds (%s)" %
+                                  (time_to_login,  time.strftime("%D %H:%M:%S")))
+                self.semaphore.release()
+                self.prompt_seen = True
+
     # Since the socket is non-blocking make sure to honor EAGAIN
     # and EWOULDBLOCK.
     def recv(self, count):
-- 
2.39.2


