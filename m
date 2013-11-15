Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3E76DA69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 1FCE725B10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YvPF45+ccR4G
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:17 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 4A01425B1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 3416DA5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 31CF7BEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 279283E06F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id rAFH99Rt014872
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 18:09:09 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id rAFH99Wb014871
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Nov 2013 18:09:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 18:09:03 +0100
Message-Id: <24805267152a204be3d7177ea3dfcc4b3c56689b.1384535211.git.pkj@axis.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
In-Reply-To: <cover.1384535211.git.pkj@axis.com>
References: <cover.1384535211.git.pkj@axis.com>
Subject: [PATCH 14/14] pybootchartgui: Add option --minutes to show time in minutes
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
X-List-Received-Date: Fri, 15 Nov 2013 17:09:16 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    | 11 +++++++----
 scripts/pybootchartgui/pybootchartgui/main.py.in |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 2a26160..299cced 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -187,12 +187,15 @@ def draw_label_in_box(ctx, color, label, x, y, w, maxx):
 		label_x = x - label_w - 5
 	draw_text(ctx, label, color, label_x, y)
 
-def draw_sec_labels(ctx, rect, sec_w, nsecs):
+def draw_sec_labels(ctx, options, rect, sec_w, nsecs):
 	ctx.set_font_size(AXIS_FONT_SIZE)
 	prev_x = 0
 	for i in range(0, rect[2] + 1, sec_w):
 		if ((i / sec_w) % nsecs == 0) :
-			label = "%ds" % (i / sec_w)
+			if options.app_options.as_minutes :
+				label = "%.1f" % (i / sec_w / 60.0)
+			else :
+				label = "%d" % (i / sec_w)
 			label_w = ctx.text_extents(label)[2]
 			x = rect[0] + i - label_w/2
 			if x >= prev_x:
@@ -426,7 +429,7 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 	ctx.set_font_size(PROC_TEXT_FONT_SIZE)
 
 	draw_box_ticks(ctx, chart_rect, sec_w)
-	draw_sec_labels(ctx, chart_rect, sec_w, 30)
+	draw_sec_labels(ctx, options, chart_rect, sec_w, 30)
 
 	y = curr_y+header_h
 
@@ -555,7 +558,7 @@ def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, s
 		nsec = 1
 	else:
 		nsec = 5
-	draw_sec_labels (ctx, chart_rect, sec_w, nsec)
+	draw_sec_labels (ctx, options, chart_rect, sec_w, nsec)
 	draw_annotations (ctx, proc_tree, times, chart_rect)
 
 	y = curr_y + 60
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index 1d70271..cc9c40b 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -40,6 +40,8 @@ def _mk_options_parser():
 			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
 	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
 			  help="only tasks longer than this time will be displayed")
+	parser.add_option("-M", "--minutes", action="store_true", dest="as_minutes", default=False,
+			  help="display time in minutes instead of seconds")
 #	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
 #			  help="do not prune the process tree")
 	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
-- 
1.8.4


