Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0FAAD77C23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:46:26 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id y18so22610922itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TeBcNUWkEro4wP9vF3/kRjLU5JM3Nior/iueuG6NQlQ=;
	b=Fbf0hNmmVBhWfojNsVmz/Y+zd2gZX401ipUwlvuuOvWTl4TM6oKVG5Q9Q7kyqVHDPT
	nlISnrCVnKGWHzwCwC5lzv6XU+jqZUa/8mXGkdqvvnC6kMucjm6g28tzpU5ZY04/GUw/
	Ac6wN0U8pr2pM9+BAN5DhTIVRmU7WpBrpj4ihIvVSZeARcsMopERq9+44DquQaxhOMHz
	fCsnO1e3xOyUTMpD8jITcUfvrz9N4bgH6FpvZL7pvqIwF8Mh1iBsw9rycEIYKAuh+vRX
	Df/qqvT19uWKlZ8AI5XsF8zmn550zMFfWhK+oIZCZHYIf6xTzlCtlXrBWYL45e+jVkIi
	F5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TeBcNUWkEro4wP9vF3/kRjLU5JM3Nior/iueuG6NQlQ=;
	b=mwe8FcvS/tBKUtb0wgXJ9IZTK3VrBNWPJGk0d08VexUWdjM8qBO4XD++kIhSZYo7pB
	TijHF9YNBJr49Bjo2LUdeskXa5Bphya9okEBvRszW410WzhXngaFp0CgA6Z2GPzwfaAQ
	8mrjNVre/9lX280KoyUpoG8sw/QZTpQhLoubKA0fScyinxtyRoWZEbQR+lt9VHTzpF8d
	FRFDBpLitO5PaB0h5dAzPBSJAJ5MbrG04D7A+pJmgNSo9mwgFaN/GPBJ4eOFG2eJHH7S
	6pvOPQIJtVCYsSyb+08Nx/nIrQxNdZk1ZypLAo72+jHeUahM3n4Zgvm8Owkx9MoggDZJ
	nrJg==
X-Gm-Message-State: AFeK/H1b49vGI5vnS49ZrkvLiomUnoZvPhrfnLj/3hGw4X4iGcWSDQ2rhutcxAHDcAVI0JnS
X-Received: by 10.107.200.151 with SMTP id y145mr10365005iof.171.1490391987931;
	Fri, 24 Mar 2017 14:46:27 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249])
	by smtp.gmail.com with ESMTPSA id 202sm1567370ith.7.2017.03.24.14.46.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 14:46:26 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 22:46:16 +0100
Message-Id: <bc4b6be48257d38ba9b4998da2ffd8ac2744f584.1490391921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
References: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/4] qemurunner: configurable timeout for run_serial()
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
X-List-Received-Date: Fri, 24 Mar 2017 21:46:27 -0000

Some commands might need to run longer than the default timeout of
five seconds. If that occurred, run_serial() returned with a status
code of zero (sic!) and no other indication of what went wrong.

Now the timeout is configurable (with five still the default) and
an explicit warning ("<<< run_serial(): command timed out after 5 seconds without output >>>")
gets appended at the end of the data returned to the caller.

While at it, the logic for checking for the timeout was updated a bit
because both implementations could overshoot the timeout when entering
select() right before the final deadline.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/targetcontrol.py        |  4 ++--
 meta/lib/oeqa/utils/qemurunner.py     | 17 ++++++++++-------
 meta/lib/oeqa/utils/qemutinyrunner.py |  8 +++++---
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 82aaf2f..40a2589 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -217,8 +217,8 @@ class QemuTarget(BaseTarget):
         else:
             raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
-    def run_serial(self, command):
-        return self.runner.run_serial(command)
+    def run_serial(self, command, timeout=5):
+        return self.runner.run_serial(command, timeout=timeout)
 
 
 class SimpleRemoteTarget(BaseTarget):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index abdbd14..95f5925 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -422,7 +422,7 @@ class QemuRunner:
             if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
 
-    def run_serial(self, command, raw=False):
+    def run_serial(self, command, raw=False, timeout=5):
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command
@@ -430,20 +430,23 @@ class QemuRunner:
         data = ''
         status = 0
         self.server_socket.sendall(command.encode('utf-8'))
-        keepreading = True
-        while keepreading:
-            sread, _, _ = select.select([self.server_socket],[],[],5)
+        start = time.time()
+        end = start + timeout
+        while True:
+            now = time.time()
+            if now >= end:
+                data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
+                break
+            sread, _, _ = select.select([self.server_socket],[],[], end - now)
             if sread:
                 answer = self.server_socket.recv(1024)
                 if answer:
                     data += answer.decode('utf-8')
                     # Search the prompt to stop
                     if re.search("[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#", data):
-                        keepreading = False
+                        break
                 else:
                     raise Exception("No data on serial console socket")
-            else:
-                keepreading = False
 
         if data:
             if raw:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index ec52473..b1009a0 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -107,14 +107,14 @@ class QemuTinyRunner(QemuRunner):
 
         return self.is_alive()
 
-    def run_serial(self, command):
+    def run_serial(self, command, timeout=5):
         self.server_socket.sendall(command+'\n')
         data = ''
         status = 0
         stopread = False
-        endtime = time.time()+5
+        endtime = time.time()+timeout
         while time.time()<endtime and not stopread:
-                sread, _, _ = select.select([self.server_socket],[],[],5)
+                sread, _, _ = select.select([self.server_socket],[],[],1)
                 for sock in sread:
                         answer = sock.recv(1024)
                         if answer:
@@ -124,6 +124,8 @@ class QemuTinyRunner(QemuRunner):
                                 stopread = True
         if not data:
             status = 1
+        if not stopread:
+            data += "<<< run_serial(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
         return (status, str(data))
 
     def find_child(self,parent_pid):
-- 
git-series 0.9.1

