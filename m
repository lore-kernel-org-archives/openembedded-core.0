Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C21E6DAB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 27BC625B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CKO3aqUHDnEg
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:12 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 14E3025B13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F27C8BEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id F1447BE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id F02C23404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH984g014856
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:08 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH98UW014855
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:08:59 +0100
Message-Id: <d56c0aa2c2bb26aa779feed3dbad791462ecbe20.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 10/14] pybootchartgui: Make "Show more" show all processes
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:13 -0000

While "Show more" is enabled, all processes are shown, regardless of
--mintime.

This also has the added benefit of making the first shown bar start at
its correct offset from the start time, rather than always starting at
0.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    | 19 ++++++++++++++++---
 scripts/pybootchartgui/pybootchartgui/gui.py     |  2 ++
 scripts/pybootchartgui/pybootchartgui/main.py.in |  2 +-
 scripts/pybootchartgui/pybootchartgui/parsing.py | 16 ++++++++--------
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index a22ac80..2aa348b 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -297,10 +297,20 @@ OPTIONS = None
 
 def extents(options, xscale, trace):
 	start = min(trace.start.keys())
-	end = max(trace.end.keys())
+	end = start
 
-	w = int ((end - start) * sec_w_base * xscale) + 2*off_x
-	h = proc_h * len(trace.processes) + header_h + 2 * off_y
+        processes = 0
+        for proc in trace.processes:
+                if not options.app_options.show_all and \
+                   trace.processes[proc][1] - trace.processes[proc][0] < options.app_options.mintime:
+                        continue
+
+                if trace.processes[proc][1] > end:
+                        end = trace.processes[proc][1]
+                processes += 1
+
+	w = int ((end - start) * sec_w_base * xscale) + 2 * off_x
+	h = proc_h * processes + header_h + 2 * off_y
 
 	return (w, h)
 
@@ -419,6 +429,9 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
         offset = min(trace.start.keys())
         for s in sorted(trace.start.keys()):
             for val in sorted(trace.start[s]):
+                if not options.app_options.show_all and \
+                   trace.processes[val][1] - s < options.app_options.mintime:
+                    continue
                 task = val.split(":")[1]
                 #print val
                 #print trace.processes[val][1]
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 1120701..7fedd23 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -121,6 +121,8 @@ class PyBootchartWidget(gtk.DrawingArea):
 
     def show_toggled(self, button):
         self.options.app_options.show_all = button.get_property ('active')
+        self.chart_width, self.chart_height = draw.extents(self.options, self.xscale, self.trace)
+        self._set_scroll_adjustments(self.hadj, self.vadj)
         self.queue_draw()
 
     POS_INCREMENT = 100
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index 3927186..1d70271 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -55,7 +55,7 @@ def _mk_options_parser():
 #	parser.add_option("--show-pid", action="store_true", dest="show_pid", default=False,
 #			  help="show process ids in the bootchart as 'processname [pid]'")
 	parser.add_option("--show-all", action="store_true", dest="show_all", default=False,
-			  help="show all process information in the bootchart as '/process/path/exe [pid] [args]'")
+			  help="show all processes in the chart")
 #	parser.add_option("--crop-after", dest="crop_after", metavar="PROCESS", default=None,
 #			  help="crop chart when idle after PROCESS is started")
 #	parser.add_option("--annotate", action="append", dest="annotate", metavar="PROCESS", default=None,
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index ed61825..daee593 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -50,7 +50,7 @@ class Trace:
         self.parent_map = None
         self.mem_stats = None
 
-        parse_paths (writer, self, paths, options.mintime)
+        parse_paths (writer, self, paths)
         if not self.valid():
             raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
 
@@ -630,7 +630,7 @@ def get_num_cpus(headers):
         return 1
     return max (int(mat.group(1)), 1)
 
-def _do_parse(writer, state, filename, file, mintime):
+def _do_parse(writer, state, filename, file):
     writer.info("parsing '%s'" % filename)
     t1 = clock()
     paths = filename.split("/")
@@ -643,7 +643,7 @@ def _do_parse(writer, state, filename, file, mintime):
             start = int(float(line.split()[-1]))
         elif line.startswith("Ended:"):
             end = int(float(line.split()[-1]))
-    if start and end and (end - start) >= mintime:
+    if start and end:
         k = pn + ":" + task
         state.processes[pn + ":" + task] = [start, end]
         if start not in state.start:
@@ -658,14 +658,14 @@ def _do_parse(writer, state, filename, file, mintime):
     writer.info("  %s seconds" % str(t2-t1))
     return state
 
-def parse_file(writer, state, filename, mintime):
+def parse_file(writer, state, filename):
     if state.filename is None:
         state.filename = filename
     basename = os.path.basename(filename)
     with open(filename, "rb") as file:
-        return _do_parse(writer, state, filename, file, mintime)
+        return _do_parse(writer, state, filename, file)
 
-def parse_paths(writer, state, paths, mintime):
+def parse_paths(writer, state, paths):
     for path in paths:
         if state.filename is None:
             state.filename = path
@@ -676,7 +676,7 @@ def parse_paths(writer, state, paths, mintime):
         #state.filename = path
         if os.path.isdir(path):
             files = sorted([os.path.join(path, f) for f in os.listdir(path)])
-            state = parse_paths(writer, state, files, mintime)
+            state = parse_paths(writer, state, files)
         elif extension in [".tar", ".tgz", ".gz"]:
             if extension == ".gz":
                 root, extension = os.path.splitext(root)
@@ -695,7 +695,7 @@ def parse_paths(writer, state, paths, mintime):
                 if tf != None:
                     tf.close()
         else:
-            state = parse_file(writer, state, path, mintime)
+            state = parse_file(writer, state, path)
     return state
 
 def split_res(res, n):
-- 
1.8.4


