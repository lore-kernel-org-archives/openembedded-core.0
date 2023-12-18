Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750B5C46CD2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 15:29:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.46196.1702913394636446535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 07:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fEIn7k2T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336607f4d05so945807f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702913393; x=1703518193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUl2Noq6bn0Sivdw630UocJm7XqOFYTihNjMtymdvkw=;
        b=fEIn7k2TTl+eNu9rtBEDqrs7+zpB81wK4Y/Th/vV+Js2n54/ej9jR9ZeM8v/PKKCxZ
         VAUjTIoPeUHmYXJ69odGc+Cd6wjQiY8VX+8dutgLjTSOR3Y4d0UQRiytnnNKOODy2wCN
         onGScpybY5e45h1HtMpCBNjYTE7TSCm2Pk16Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913393; x=1703518193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUl2Noq6bn0Sivdw630UocJm7XqOFYTihNjMtymdvkw=;
        b=gSfIzoZA1phQEPjkR2Vnp9SyxD4FuDn4jn44yHC7ofeZ45r7p3if1CdvAgmcbHaChf
         rjzP9JRlZaDroQRaREa/SJSkaxGBd4+XeCtBZXZnOue6cxhtS6IH62rY50VyjWo3eXwg
         BL49fas5uWSGSdV9hPpkrZW3hQoql8Z3eKbqI46kr5RvzIGU5mTj2zJ3fvWTM3s1HnXH
         CCEZsX/7fQwinKCm6FQuNuutdhpegRdcs9KftPL0bV1BSiM4umMBLcuAuchWpwPZSLRy
         jzmsZW25Czc0ZnMTadqzlJc5hZa91O29O/g/gFWMKQSNCJ6uRj8erEmoQ7lM4gXChd4n
         EyjA==
X-Gm-Message-State: AOJu0YyOeuA65ZZ/shFe42Qc5/PezPMCNRhowHiQM06qRYypDaDCSGFL
	H6tTQLXum8XCw/W/r+xUh/OGBFCeaQLGh0+xgxo=
X-Google-Smtp-Source: AGHT+IGGLiwa0OrLNRhWDmlPD1DJgH0RbDl0okGUFBtTEu4NiZJVFcROTYHh25bt00mE3d7H2ZDFig==
X-Received: by 2002:a5d:6906:0:b0:336:64c0:a1f9 with SMTP id t6-20020a5d6906000000b0033664c0a1f9mr1318509wru.36.1702913392841;
        Mon, 18 Dec 2023 07:29:52 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a720:6e27:acc4:d591])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d5685000000b0033657376b62sm8921726wrv.105.2023.12.18.07.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:29:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Impove handling of serial port output blocking
Date: Mon, 18 Dec 2023 15:29:51 +0000
Message-Id: <20231218152951.3398964-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 15:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192656

Similar to stdout in the previous commit, we need to ensure serial output
if written is read and put somewhere, else qemu might block on writes to
the serial port leading to hangs in the kernel. Use our existing logging
thread to log data when run_serial is not in use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 97 ++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 36bdfb96ae6..16aa1c08d3e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -21,6 +21,7 @@ import threading
 import codecs
 import tempfile
 from collections import defaultdict
+from contextlib import contextmanager
 import importlib
 
 # Get Unicode non printable control chars
@@ -517,8 +518,12 @@ class QemuRunner:
                 except Exception as e:
                     self.logger.warning('Extra log data exception %s' % repr(e))
                     data = None
+            self.thread.serial_lock.release()
             return False
 
+        with self.thread.serial_lock:
+            self.thread.set_serialsock(self.server_socket)
+
         # If we are not able to login the tests can continue
         try:
             (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True, timeout=120)
@@ -653,31 +658,32 @@ class QemuRunner:
 
         data = ''
         status = 0
-        self.server_socket.sendall(command.encode('utf-8'))
-        start = time.time()
-        end = start + timeout
-        while True:
-            now = time.time()
-            if now >= end:
-                data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
-                break
-            try:
-                sread, _, _ = select.select([self.server_socket],[],[], end - now)
-            except InterruptedError:
-                continue
-            if sread:
-                # try to avoid reading single character at a time
-                time.sleep(0.1)
-                answer = self.server_socket.recv(1024)
-                if answer:
-                    data += answer.decode('utf-8')
-                    # Search the prompt to stop
-                    if re.search(self.boot_patterns['search_cmd_finished'], data):
-                        break
-                else:
-                    if self.canexit:
-                        return (1, "")
-                    raise Exception("No data on serial console socket, connection closed?")
+        with self.thread.serial_lock:
+            self.server_socket.sendall(command.encode('utf-8'))
+            start = time.time()
+            end = start + timeout
+            while True:
+                now = time.time()
+                if now >= end:
+                    data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
+                    break
+                try:
+                    sread, _, _ = select.select([self.server_socket],[],[], end - now)
+                except InterruptedError:
+                    continue
+                if sread:
+                    # try to avoid reading single character at a time
+                    time.sleep(0.1)
+                    answer = self.server_socket.recv(1024)
+                    if answer:
+                        data += answer.decode('utf-8')
+                        # Search the prompt to stop
+                        if re.search(self.boot_patterns['search_cmd_finished'], data):
+                            break
+                    else:
+                        if self.canexit:
+                            return (1, "")
+                        raise Exception("No data on serial console socket, connection closed?")
 
         if data:
             if raw:
@@ -696,6 +702,15 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
+@contextmanager
+def nonblocking_lock(lock):
+    locked = lock.acquire(False)
+    try:
+        yield locked
+    finally:
+        if locked:
+            lock.release()
+
 # This class is for reading data from a socket and passing it to logfunc
 # to be processed. It's completely event driven and has a straightforward
 # event loop. The mechanism for stopping the thread is a simple pipe which
@@ -703,8 +718,10 @@ class QemuRunner:
 class LoggingThread(threading.Thread):
     def __init__(self, logfunc, sock, logger, qemuoutput):
         self.connection_established = threading.Event()
+        self.serial_lock = threading.Lock()
 
         self.serversock = sock
+        self.serialsock = None
         self.qemuoutput = qemuoutput
         self.logfunc = logfunc
         self.logger = logger
@@ -717,9 +734,14 @@ class LoggingThread(threading.Thread):
 
         threading.Thread.__init__(self, target=self.threadtarget)
 
+    def set_serialsock(self, serialsock):
+        self.serialsock = serialsock
+
     def threadtarget(self):
         try:
             self.eventloop()
+        except Exception as e:
+            self.logger.warning("Exception %s in logging thread" % repr(e))
         finally:
             self.teardown()
 
@@ -753,6 +775,7 @@ class LoggingThread(threading.Thread):
         event_read_mask = self.errorevents | self.readevents
         if self.serversock:
             poll.register(self.serversock.fileno())
+        serial_registered = False
         poll.register(self.qemuoutput.fileno())
         poll.register(self.readpipe, event_read_mask)
 
@@ -760,7 +783,7 @@ class LoggingThread(threading.Thread):
         self.running = True
         self.logger.debug("Starting thread event loop")
         while not breakout:
-            events = poll.poll()
+            events = poll.poll(2)
             for event in events:
                 # An error occurred, bail out
                 if event[1] & self.errorevents:
@@ -785,18 +808,34 @@ class LoggingThread(threading.Thread):
 
                 # Actual data to be logged
                 elif self.readsock.fileno() == event[0]:
-                    data = self.recv(1024)
+                    data = self.recv(1024, self.readsock)
                     self.logfunc(data)
                 elif self.qemuoutput.fileno() == event[0]:
                     data = getOutput(self.qemuoutput)
                     self.logger.debug("Data received on qemu stdout %s" % data)
                     self.logfunc(data, ".stdout")
+                elif self.serialsock and self.serialsock.fileno() == event[0]:
+                    if self.serial_lock.acquire(blocking=False):
+                        data = self.recv(1024, self.serialsock)
+                        self.logger.debug("Data received serial thread %s" % data.decode('utf-8', 'replace'))
+                        self.logfunc(data, ".2")
+                        self.serial_lock.release()
+                    else:
+                        serial_registered = False
+                        poll.unregister(self.serialsock.fileno())
+
+            if not serial_registered and self.serialsock:
+                with nonblocking_lock(self.serial_lock) as l:
+                    if l:
+                        serial_registered = True
+                        poll.register(self.serialsock.fileno(), event_read_mask)
+
 
     # Since the socket is non-blocking make sure to honor EAGAIN
     # and EWOULDBLOCK.
-    def recv(self, count):
+    def recv(self, count, sock):
         try:
-            data = self.readsock.recv(count)
+            data = sock.recv(count)
         except socket.error as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
                 return b''
-- 
2.39.2


