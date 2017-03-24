Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id E586B77BD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:18:51 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id w124so14835252itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g1xxQj3pWW1xDNtx199Gw/J5DxZeoVZnpaHQYyva4o4=;
	b=JWzJ/18RRoOfviZSaMQVUqsVTRxMy9tEOGmJF/UrNbzesenXAGu0nL9cZSgwSH3gEC
	nO5tN/f3SM8whs/xpgw7/CQQ4SUg62yJpmYQX2DrdT+pcjeD1JQ9vyHyU6fq5AgJ5bq5
	QThRc8IH0prGUqhemc5NnRBZ4NFpLcpMqLVhhHlD2DW/EHri8tI+l8+ey04FsJQvSlj3
	8+DYDzNzf/fC1FdPtuqVUzdO5VJUE3ULCsgOq18/B/XGL4KrhDxrqqENM15MTVDOGPsj
	g0aZVP5AMH1kg3t5sdHF3snirvd9C0BV9gCLR/TmauPD9NU8pw/XLjA4AxB0nxs+gczI
	B9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g1xxQj3pWW1xDNtx199Gw/J5DxZeoVZnpaHQYyva4o4=;
	b=sWkgMY7rMbG069ldgG1Uk6A5nQx5905h3Ttbcvd2NHD26AbFJzGF/cSF93D9J5vwC/
	5lyZ5jo9hZkNuANS4HxzOlU3uIY24i/DKIgRzvO0M1NbPIKK6I4q9PggOE6qC33g/xIC
	jHhIl7obMpVhYq89UqYkOrBWnCb8fmLTulH4UtyRrVrIK+iE9uFUSBrr07zNzq5QQIoM
	/2y2scjDv3kpF8kcq6Rm05aGZhcKzpI3aucpasDnakvMib8ALQgweMPXMm6GCIuKG1/0
	LLj4GUFKiFz+s0LJ+XjvcpcFG0cIgRpXOU219bDi2+R31p8Z8XL6A2UT348qFR/yC4fO
	+P1Q==
X-Gm-Message-State: AFeK/H0L6xJsXi4BcKUHBjqLbvUMOkEDmD+MFdHbc2DnziFB/qQyA3Vlae2oEsBUCtNlQ+P4
X-Received: by 10.36.19.8 with SMTP id 8mr4282510itz.2.1490375931356;
	Fri, 24 Mar 2017 10:18:51 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249]) by smtp.gmail.com with ESMTPSA id
	g23sm1477725ioi.20.2017.03.24.10.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 10:18:50 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 18:18:35 +0100
Message-Id: <8c8a253db25f8bc606125e976c19ee23f9054278.1490375888.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
References: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/4] qemurunner: configurable timeout for run_serial()
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
X-List-Received-Date: Fri, 24 Mar 2017 17:18:52 -0000

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
index 0ad3a6b..2f071e0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -206,8 +206,8 @@ class QemuTarget(BaseTarget):
         else:
             raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
 
-    def run_serial(self, command):
-        return self.runner.run_serial(command)
+    def run_serial(self, command, timeout=5):
+        return self.runner.run_serial(command, timeout=timeout)
 
 
 class SimpleRemoteTarget(BaseTarget):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9ef7629..c0abb96 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -416,7 +416,7 @@ class QemuRunner:
             if "qemu-system" in basecmd and "-serial tcp" in commands[p]:
                 return [int(p),commands[p]]
 
-    def run_serial(self, command, raw=False):
+    def run_serial(self, command, raw=False, timeout=5):
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command
@@ -424,20 +424,23 @@ class QemuRunner:
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

