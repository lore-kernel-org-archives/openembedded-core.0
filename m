Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2986E7F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id D681A19FF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ppt73sZuNWUh
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:45 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 463B51A049
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2D776A9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 14B94A9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 08BF33E06F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMcbJ015070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMchR015069
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:33 +0100
Message-Id: <025ae93411ca8e80b900d116369c74d2abc3f477.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
Subject: [PATCH 3/5] pybootchartgui: Simplify adding processes to the trace
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:48 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 39 +++++++++---------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 0600b51..1cb4466 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -96,6 +96,16 @@ class Trace:
         return self.headers != None and self.disk_stats != None and \
                self.ps_stats != None and self.cpu_stats != None
 
+    def add_process(self, process, start, end):
+        self.processes[process] = [start, end]
+        if start not in self.start:
+            self.start[start] = []
+        if process not in self.start[start]:
+            self.start[start].append(process)
+        if end not in self.end:
+            self.end[end] = []
+        if process not in self.end[end]:
+            self.end[end].append(process)
 
     def compile(self, writer):
 
@@ -645,16 +655,7 @@ def _do_parse(writer, state, filename, file):
         elif line.startswith("Ended:"):
             end = int(float(line.split()[-1]))
     if start and end:
-        k = pn + ":" + task
-        state.processes[pn + ":" + task] = [start, end]
-        if start not in state.start:
-            state.start[start] = []
-        if k not in state.start[start]:
-            state.start[start].append(pn + ":" + task)
-        if end not in state.end:
-            state.end[end] = []
-        if k not in state.end[end]:
-            state.end[end].append(pn + ":" + task)
+        state.add_process(pn + ":" + task, start, end)
     t2 = clock()
     writer.info("  %s seconds" % str(t2-t1))
     return state
@@ -716,22 +717,10 @@ def split_res(res, n):
         while start < end:
             state = Trace(None, [], None)
             for i in range(start, end):
-                # Add these lines for reference
-                #state.processes[pn + ":" + task] = [start, end]
-                #state.start[start] = pn + ":" + task
-                #state.end[end] = pn + ":" + task
+                # Add this line for reference
+                #state.add_process(pn + ":" + task, start, end)
                 for p in res.start[s_list[i]]:
-                    s = s_list[i]
-                    e = res.processes[p][1]
-                    state.processes[p] = [s, e]
-                    if s not in state.start:
-                        state.start[s] = []
-                    if p not in state.start[s]:
-                        state.start[s].append(p)
-                    if e not in state.end:
-                        state.end[e] = []
-                    if p not in state.end[e]:
-                        state.end[e].append(p)
+                    state.add_process(p, s_list[i], res.processes[p][1])
             start = end
             end = end + frag_size
             if end > len(s_list):
-- 
1.8.4


