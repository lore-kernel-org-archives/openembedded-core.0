Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScCmr-0001pp-Nl
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 11:44:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q569Xsnw002554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 02:33:54 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 02:33:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 17:34:31 +0800
Message-ID: <cadc562e6d2f269390c0d1eca2af23067dc23987.1338963552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338963552.git.liezhi.yang@windriver.com>
References: <cover.1338963552.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/5] pybootchartgui: split the output chart into multiple ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2012 09:44:22 -0000
Content-Type: text/plain

Split the output chart into multiple ones to make it more readable, it
only works with "-o path", which means that it doesn't work if the user
doesn't want to save the chart to the disk. For example:

$ ./pybootchartgui.py /path/to/tmp/buildstats/core-image-sato-qemux86/201205301810/ -f svg -s 5 -o /tmp/
bootchart written to /tmp/bootchart_1.svg
bootchart written to /tmp/bootchart_2.svg
bootchart written to /tmp/bootchart_3.svg
bootchart written to /tmp/bootchart_4.svg
bootchart written to /tmp/bootchart_5.svg

[YOCTO #2403]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/pybootchartgui/pybootchartgui/main.py    |   14 +++++++-
 scripts/pybootchartgui/pybootchartgui/parsing.py |   36 ++++++++++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
index bf50afb..fce8dd3 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py
+++ b/scripts/pybootchartgui/pybootchartgui/main.py
@@ -17,6 +17,8 @@ def _mk_options_parser():
 			  help="image format (...); default format ...")
 	parser.add_option("-o", "--output", dest="output", metavar="PATH", default=None,
 			  help="output path (file or directory) where charts are stored")
+	parser.add_option("-s", "--split", dest="num", type=int, default=1,
+			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
 	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
 			  help="do not prune the process tree")
 	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
@@ -59,8 +61,16 @@ def main(argv=None):
 			gui.show(res)
 		else:
 			filename = _get_filename(args, options)
-			batch.render(res, options.format, filename)
-			print "bootchart written to", filename
+			res_list = parsing.split_res(res, options.num)
+			n = 1
+			for r in res_list:
+				if len(res_list) == 1:
+					f = filename + "." + options.format
+				else:
+					f = filename + "_" + str(n) + "." + options.format
+					n = n + 1
+				batch.render(r, options.format, f)
+				print "bootchart written to", f
 		return 0
 	except parsing.ParseError, ex:
 		print("Parse error: %s" % ex)
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 11a0829..c64eba0 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -226,3 +226,39 @@ def parse(paths, prune):
     #monitored_app = state.headers.get("profile.process")
     #proc_tree = ProcessTree(state.ps_stats, monitored_app, prune)
     return state
+
+def split_res(res, n):
+    """ Split the res into n pieces """
+    res_list = []
+    if n > 1:
+        s_list = sorted(res.start.keys())
+        frag_size = len(s_list) / float(n)
+        # Need the top value
+        if frag_size > int(frag_size):
+            frag_size = int(frag_size + 1)
+        else:
+            frag_size = int(frag_size)
+
+        start = 0
+        end = frag_size
+        while start < end:
+            state = ParserState()
+            for i in range(start, end):
+                # Add these lines for reference
+                #state.processes[pn + ":" + task] = [start, end]
+                #state.start[start] = pn + ":" + task
+                #state.end[end] = pn + ":" + task
+                p = res.start[s_list[i]]
+                s = s_list[i]
+                e = res.processes[p][1]
+                state.processes[p] = [s, e]
+                state.start[s] = p
+                state.end[e] = p
+            start = end
+            end = end + frag_size
+            if end > len(s_list):
+                end = len(s_list)
+            res_list.append(state)
+    else:
+        res_list.append(res)
+    return res_list
-- 
1.7.1



