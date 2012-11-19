Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TaT5I-0004Zh-Ph for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 16:16:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJF2PHa027878
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:02:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26887-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:02:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJF2G9c027871
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:02:17 GMT
Message-ID: <1353337338.3709.168.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 15:02:18 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/pybootchart: Fix missing entries bug
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 15:16:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If two entries have the same start time, the data store used will cause
all but one of the entries to be lost. This patch enhances the data
storage structure to avoid this problem and allow more than one
event to start at the same time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 16830fa..1b872de 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -287,32 +287,33 @@ def render(ctx, res):
 
         offset = min(res.start.keys())
         for s in sorted(res.start.keys()):
-            task = res.start[s].split(":")[1]
-            #print res.start[s]
-            #print res.processes[res.start[s]][1]
-            #print s
-            x = (s - offset) * sec_w
-            w = ((res.processes[res.start[s]][1] - s) * sec_w)
-
-            #print "proc at %s %s %s %s" % (x, y, w, proc_h)
-            col = None
-            if task == "do_compile":
-                col = TASK_COLOR_COMPILE
-            elif task == "do_configure":
-                col = TASK_COLOR_CONFIGURE
-            elif task == "do_install":
-                col = TASK_COLOR_INSTALL
-            elif task == "do_package":
-                col = TASK_COLOR_PACKAGE
-            elif task == "do_populate_sysroot":
-                col = TASK_COLOR_SYSROOT
-
-            draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
-            if col:
-                draw_fill_rect(ctx, col, (x, y, w, proc_h))
-
-            draw_label_in_box(ctx, PROC_TEXT_COLOR, res.start[s], x, y + proc_h - 4, w, proc_h)
-            y = y + proc_h
+            for val in sorted(res.start[s]):
+                task = val.split(":")[1]
+                #print val
+                #print res.processes[val][1]
+                #print s
+                x = (s - offset) * sec_w
+                w = ((res.processes[val][1] - s) * sec_w)
+
+                #print "proc at %s %s %s %s" % (x, y, w, proc_h)
+                col = None
+                if task == "do_compile":
+                    col = TASK_COLOR_COMPILE
+                elif task == "do_configure":
+                    col = TASK_COLOR_CONFIGURE
+                elif task == "do_install":
+                    col = TASK_COLOR_INSTALL
+                elif task == "do_package":
+                    col = TASK_COLOR_PACKAGE
+                elif task == "do_populate_sysroot":
+                    col = TASK_COLOR_SYSROOT
+
+                draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
+                if col:
+                    draw_fill_rect(ctx, col, (x, y, w, proc_h))
+
+                draw_label_in_box(ctx, PROC_TEXT_COLOR, val, x, y + proc_h - 4, w, proc_h)
+                y = y + proc_h
 
 	# draw process boxes
 	#draw_process_bar_chart(ctx, proc_tree, curr_y + bar_h, w, h)
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index c64eba0..a0f6e8e 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -184,9 +184,16 @@ def _do_parse(state, filename, file):
         elif line.startswith("Ended:"):
             end = int(float(line.split()[-1]))
     if start and end and (end - start) > 8:
+        k = pn + ":" + task
         state.processes[pn + ":" + task] = [start, end]
-        state.start[start] = pn + ":" + task
-        state.end[end] = pn + ":" + task
+        if start not in state.start:
+            state.start[start] = []
+        if k not in state.start[start]:
+            state.start[start].append(pn + ":" + task)
+        if end not in state.end:
+            state.end[end] = []
+        if k not in state.end[end]:
+            state.end[end].append(pn + ":" + task)
     return state
 
 def parse_file(state, filename):
@@ -248,12 +255,18 @@ def split_res(res, n):
                 #state.processes[pn + ":" + task] = [start, end]
                 #state.start[start] = pn + ":" + task
                 #state.end[end] = pn + ":" + task
-                p = res.start[s_list[i]]
-                s = s_list[i]
-                e = res.processes[p][1]
-                state.processes[p] = [s, e]
-                state.start[s] = p
-                state.end[e] = p
+                for p in res.start[s_list[i]]:
+                    s = s_list[i]
+                    e = res.processes[p][1]
+                    state.processes[p] = [s, e]
+                    if s not in state.start:
+                        state.start[s] = []
+                    if p not in state.start[s]:
+                        state.start[s].append(p)
+                    if e not in state.end:
+                        state.end[e] = []
+                    if p not in state.end[e]:
+                        state.end[e].append(p)
             start = end
             end = end + frag_size
             if end > len(s_list):




