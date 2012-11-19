Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TaT67-0004cn-1L for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 16:17:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJF3G5T027889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:03:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26882-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:03:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJF37VL027882
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 15:03:08 GMT
Message-ID: <1353337389.3709.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 15:03:09 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/pybootchart: Allow minimum task length to be configured from the commandline
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
X-List-Received-Date: Mon, 19 Nov 2012 15:17:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than hardcode the value of "8", allow the minimum task length to be
configured from the commandline using the -m option. "-m 0" means all
tasks will be graphed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
index e70ab13..e22636c 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py
+++ b/scripts/pybootchartgui/pybootchartgui/main.py
@@ -19,6 +19,8 @@ def _mk_options_parser():
 			  help="output path (file or directory) where charts are stored")
 	parser.add_option("-s", "--split", dest="num", type=int, default=1,
 			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
+	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
+			  help="only tasks longer than this time will be displayed")
 	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
 			  help="do not prune the process tree")
 	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
@@ -51,7 +53,7 @@ def main(argv=None):
 			parser.error("insufficient arguments, expected at least one path.")
 			return 2
 
-		res = parsing.parse(args, options.prune)
+		res = parsing.parse(args, options.prune, options.mintime)
 		if options.interactive or options.output == None:
 			gui.show(res)
 		else:
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index a0f6e8e..6343fd5 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -170,7 +170,7 @@ class ParserState:
 
 _relevant_files = set(["header", "proc_diskstats.log", "proc_ps.log", "proc_stat.log"])
 
-def _do_parse(state, filename, file):
+def _do_parse(state, filename, file, mintime):
     #print filename
     #writer.status("parsing '%s'" % filename)
     paths = filename.split("/")
@@ -183,7 +183,7 @@ def _do_parse(state, filename, file):
             start = int(float(line.split()[-1]))
         elif line.startswith("Ended:"):
             end = int(float(line.split()[-1]))
-    if start and end and (end - start) > 8:
+    if start and end and (end - start) >= mintime:
         k = pn + ":" + task
         state.processes[pn + ":" + task] = [start, end]
         if start not in state.start:
@@ -196,12 +196,12 @@ def _do_parse(state, filename, file):
             state.end[end].append(pn + ":" + task)
     return state
 
-def parse_file(state, filename):
+def parse_file(state, filename, mintime):
     basename = os.path.basename(filename)
     with open(filename, "rb") as file:
-        return _do_parse(state, filename, file)
+        return _do_parse(state, filename, file, mintime)
 
-def parse_paths(state, paths):
+def parse_paths(state, paths, mintime):
     for path in paths:
         root,extension = os.path.splitext(path)
         if not(os.path.exists(path)):
@@ -210,7 +210,7 @@ def parse_paths(state, paths):
         if os.path.isdir(path):
             files = [ f for f in [os.path.join(path, f) for f in os.listdir(path)] ]
             files.sort()
-            state = parse_paths(state, files)
+            state = parse_paths(state, files, mintime)
         elif extension in [".tar", ".tgz", ".tar.gz"]:
             tf = None
             try:
@@ -223,11 +223,11 @@ def parse_paths(state, paths):
                 if tf != None:
                     tf.close()
         else:
-            state = parse_file(state, path)
+            state = parse_file(state, path, mintime)
     return state
 
-def parse(paths, prune):   
-    state = parse_paths(ParserState(), paths)
+def parse(paths, prune, mintime):   
+    state = parse_paths(ParserState(), paths, mintime)
     if not state.valid():
         raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
     #monitored_app = state.headers.get("profile.process")




