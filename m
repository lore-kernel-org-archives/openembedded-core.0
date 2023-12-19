Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22131C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:35:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14867.1702996536199470183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HoFHO+8D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d2376db79so7941705e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702996534; x=1703601334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIU3sidFJlHRS+DYETettLZILKmVSXMjku4Rr5R6wyk=;
        b=HoFHO+8DdRh1ay1B/pZ7/jMI4P6hQAv0MYdXsIHCYmBTnI2Zx1Ju6o3E7YD+CGJqWp
         Qp1gRPS3eXX7C3B0myqqrqIFmY/1/hcRnATYL03nLw0O1Lf/sqtiGU+eSiA/keYHwGiX
         fwKbNFsSXDdwAithBKXxNQJo+ih/QpqAo5vpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996534; x=1703601334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIU3sidFJlHRS+DYETettLZILKmVSXMjku4Rr5R6wyk=;
        b=usFuvJnNN/sR3MNgXFgPPU0fdWTYrsVzPiPpU1PkO15zaQYWGcfQsvWC40G2zNigSY
         A8Nvg8owCi1tH8KbRP28d8xqbCzHQ0k1BF050/qYIbpa/4JEUfR+DA2gp47eIwUqG/kp
         A/mOIlIQZmAQtuMsLNYvk+Xwvum65JGHAkvkadani/C4wpJJj1zDKB2SRXD9fyVZBZur
         BJXqq0hVhzwUvpcuyeOZ4Grl6IjhGef8JA7Zks2dgggouFSTJ2L3j60pDMsX/vDMRfs/
         hGpmfoIl/1lf3K3LyGxpB7AT7WasMRzpiA5YfnJb1piDMmXiChNqlh2JGHEWYZ+CAAV7
         2WJA==
X-Gm-Message-State: AOJu0YwHGFmgLWig5NcokPD0Z9S9iALG8iyfEwXccGHwheqsexVUXGE6
	EiOk3SUqWvOVDdtlQpjOf97IcC7HrKqoGqq7wY0=
X-Google-Smtp-Source: AGHT+IGQ6T9KENsCkcDRVwm/vh2PifUIukwWFQGILQvQ4Lr7TldM3UQvpzm/jo1pfQvNex/OLfPePw==
X-Received: by 2002:a05:600c:1da9:b0:40d:247f:3266 with SMTP id p41-20020a05600c1da900b0040d247f3266mr638744wms.42.1702996534430;
        Tue, 19 Dec 2023 06:35:34 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040c57e4ea28sm3168889wmq.17.2023.12.19.06.35.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:35:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] qemurunner: Improve handling of serial port output blocking
Date: Tue, 19 Dec 2023 14:35:29 +0000
Message-Id: <20231219143531.3514266-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192742

Similar to stdout in the previous commit, we need to ensure serial output
if written is read and put somewhere, else qemu might block on writes to
the serial port leading to hangs in the kernel. Use our existing logging
thread to log data when run_serial is not in use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 98 ++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 29 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cdd0db58776..4a2246733f8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -21,7 +21,9 @@ import threading
 import codecs
 import tempfile
 from collections import defaultdict
+from contextlib import contextmanager
 import importlib
+import traceback
 
 # Get Unicode non printable control chars
 control_range = list(range(0,32))+list(range(127,160))
@@ -517,8 +519,12 @@ class QemuRunner:
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
@@ -653,31 +659,32 @@ class QemuRunner:
 
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
@@ -696,6 +703,15 @@ class QemuRunner:
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
@@ -703,8 +719,10 @@ class QemuRunner:
 class LoggingThread(threading.Thread):
     def __init__(self, logfunc, sock, logger, qemuoutput):
         self.connection_established = threading.Event()
+        self.serial_lock = threading.Lock()
 
         self.serversock = sock
+        self.serialsock = None
         self.qemuoutput = qemuoutput
         self.logfunc = logfunc
         self.logger = logger
@@ -717,9 +735,14 @@ class LoggingThread(threading.Thread):
 
         threading.Thread.__init__(self, target=self.threadtarget)
 
+    def set_serialsock(self, serialsock):
+        self.serialsock = serialsock
+
     def threadtarget(self):
         try:
             self.eventloop()
+        except Exception as e:
+            self.logger.warning("Exception %s in logging thread" % traceback.format_exception(e))
         finally:
             self.teardown()
 
@@ -753,6 +776,7 @@ class LoggingThread(threading.Thread):
         event_read_mask = self.errorevents | self.readevents
         if self.serversock:
             poll.register(self.serversock.fileno())
+        serial_registered = False
         poll.register(self.qemuoutput.fileno())
         poll.register(self.readpipe, event_read_mask)
 
@@ -760,7 +784,7 @@ class LoggingThread(threading.Thread):
         self.running = True
         self.logger.debug("Starting thread event loop")
         while not breakout:
-            events = poll.poll()
+            events = poll.poll(2)
             for event in events:
                 # An error occurred, bail out
                 if event[1] & self.errorevents:
@@ -785,18 +809,34 @@ class LoggingThread(threading.Thread):
 
                 # Actual data to be logged
                 elif self.readsock.fileno() == event[0]:
-                    data = self.recv(1024)
+                    data = self.recv(1024, self.readsock)
                     self.logfunc(data)
                 elif self.qemuoutput.fileno() == event[0]:
                     data = self.qemuoutput.read()
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


