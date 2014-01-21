Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 195F06E7F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 15:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id DE16F19E95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O8ABXP+wjSMY
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:23:46 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 547631A05D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 395F2AB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 2AAFBA99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 1F5AE3E077
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s0LFMcRb015078
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:22:38 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s0LFMcjj015077
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jan 2014 16:22:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 16:22:35 +0100
Message-Id: <51db6414380b5c16b7427b42e83dd2ad62114b75.1390317718.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
In-Reply-To: <cover.1390317718.git.pkj@axis.com>
References: <cover.1390317718.git.pkj@axis.com>
Subject: [PATCH 5/5] pybootchartgui: Add option -T to allways use the full time
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
X-List-Received-Date: Tue, 21 Jan 2014 15:23:47 -0000

When --full-time (or -T) is used, the graph allways shows the full
time regardless of which processes are currently shown. This is
especially useful in combinationm with the -s flag when outputting to
multiple files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    |  6 +++++-
 scripts/pybootchartgui/pybootchartgui/main.py.in |  4 +++-
 scripts/pybootchartgui/pybootchartgui/parsing.py | 15 ++++++++++++---
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 4a2ffd7..8c574be 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -314,6 +314,10 @@ def extents(options, xscale, trace):
                         end = trace.processes[proc][1]
                 processes += 1
 
+	if trace.min is not None and trace.max is not None:
+		start = trace.min
+		end = trace.max
+
 	w = int ((end - start) * sec_w_base * xscale) + 2 * off_x
 	h = proc_h * processes + header_h + 2 * off_y
 
@@ -433,7 +437,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 
 	y = curr_y+header_h
 
-        offset = min(trace.start.keys())
+        offset = trace.min or min(trace.start.keys())
         for s in sorted(trace.start.keys()):
             for val in sorted(trace.start[s]):
                 if not options.app_options.show_all and \
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index e9d2c74..21bb0be 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -65,6 +65,8 @@ def _mk_options_parser():
 #			       "To create a single annotation when any one of a set of processes is started, use commas to separate the names")
 #	parser.add_option("--annotate-file", dest="annotate_file", metavar="FILENAME", default=None,
 #			  help="filename to write annotation points to")
+	parser.add_option("-T", "--full-time", action="store_true", dest="full_time", default=False,
+			  help="display the full time regardless of which processes are currently shown")
 	return parser
 
 class Writer:
@@ -153,7 +155,7 @@ def main(argv=None):
 				finally:
 					f.close()
 			filename = _get_filename(options.output)
-			res_list = parsing.split_res(res, options.num)
+			res_list = parsing.split_res(res, options)
 			n = 1
 			width = len(str(len(res_list)))
 			s = "_%%0%dd." % width
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 1cb4466..d423b9f 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -38,6 +38,8 @@ class Trace:
         self.processes = {}
         self.start = {}
         self.end = {}
+        self.min = None
+        self.max = None
         self.headers = None
         self.disk_stats = None
         self.ps_stats = None
@@ -55,6 +57,10 @@ class Trace:
             if not self.valid():
                 raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
 
+            if options.full_time:
+                self.min = min(self.start.keys())
+                self.max = max(self.end.keys())
+
         return
 
         # Turn that parsed information into something more useful
@@ -700,12 +706,12 @@ def parse_paths(writer, state, paths):
             state = parse_file(writer, state, path)
     return state
 
-def split_res(res, n):
+def split_res(res, options):
     """ Split the res into n pieces """
     res_list = []
-    if n > 1:
+    if options.num > 1:
         s_list = sorted(res.start.keys())
-        frag_size = len(s_list) / float(n)
+        frag_size = len(s_list) / float(options.num)
         # Need the top value
         if frag_size > int(frag_size):
             frag_size = int(frag_size + 1)
@@ -716,6 +722,9 @@ def split_res(res, n):
         end = frag_size
         while start < end:
             state = Trace(None, [], None)
+            if options.full_time:
+                state.min = min(res.start.keys())
+                state.max = max(res.end.keys())
             for i in range(start, end):
                 # Add this line for reference
                 #state.add_process(pn + ":" + task, start, end)
-- 
1.8.4


