Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFsF-0005l9-7L
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jun 2012 12:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153881"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:10 -0700
Message-Id: <cc27c98e06e142d4bfea394b387997ba0a8dc08a.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 06/17] pybootchartgui: make the build profiling in pictures
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
X-List-Received-Date: Thu, 14 Jun 2012 19:38:32 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The original patch is from Richard, I rebased it to the up-to-date
upstream code, here are the original messages from him:

We have just merged Beth's initial buildstats logging work. I was
sitting wondering how to actually evaluate the numbers as I wanted to
know "where are we spending the time?".

It occurred to me that I wanted a graph very similar to that generated
by bootchart. I looked around and found pyboootchartgui and then hacked
it around a bit and coerced it to start producing charts like:

http://tim.rpsys.net/bootchart.png

which is the initial "pseudo-native" part of the build. This was simple
enough to test with.

I then tried graphing a poky-image-sato. To get a graph I could actually
read, I stripped out any task taking less than 8 seconds and scaled the
x axis from 25 units per second to one unit per second. The result was:

http://tim.rpsys.net/bootchart2.png
(warning this is a 2.7MB png)

I also added in a little bit of colour coding for the second chart.
Interestingly it looks like there is more yellow than green meaning
configure is a bigger drain on the build time not that its
unexpected :/.

I quite enjoyed playing with this and on a serious note, the gradient of
the task graph makes me a little suspicious of whether the overhead of
launching tasks in bitbake itself is having some effect on build time.
Certainly on the first graph there are some interesting latencies
showing up.

Anyhow, I think this is the first time bitbake's task execution has been
visualised and there are some interesting things we can learn from it.
I'm hoping this is a start of a much more detailed understanding of the
build process with respect to performance.

[YOCTO #2403]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/pybootchartgui/pybootchartgui/batch.py   |    4 +-
 scripts/pybootchartgui/pybootchartgui/draw.py    |  131 +++++++++++++++-------
 scripts/pybootchartgui/pybootchartgui/gui.py     |    4 +-
 scripts/pybootchartgui/pybootchartgui/parsing.py |   47 +++++----
 4 files changed, 122 insertions(+), 64 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index bd67c93..3c1dbf8 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -14,10 +14,10 @@ def render(res, format, filename):
         return 10
 
     make_surface, write_surface = handlers[format]
-    w,h = draw.extents(*res)
+    w,h = draw.extents(res)
     w = max(w, draw.MIN_IMG_W)
     surface = make_surface(w,h)
     ctx = cairo.Context(surface)
-    draw.render(ctx, *res)
+    draw.render(ctx, res)
     write_surface(surface)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 249cd2e..16830fa 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -37,7 +37,7 @@ FILE_OPEN_COLOR = (0.20, 0.71, 0.71, 1.0)
 	
 # Process border color.
 PROC_BORDER_COLOR = (0.71, 0.71, 0.71, 1.0)
-# Waiting process color.
+
 PROC_COLOR_D = (0.76, 0.48, 0.48, 0.125)
 # Running process color.
 PROC_COLOR_R = CPU_COLOR
@@ -72,6 +72,17 @@ DEP_STROKE = 1.0
 # Process description date format.
 DESC_TIME_FORMAT = "mm:ss.SSS"
 
+# Configure task color
+TASK_COLOR_CONFIGURE = (1.0, 1.0, 0.00, 1.0)
+# Compile task color.
+TASK_COLOR_COMPILE = (0.0, 1.00, 0.00, 1.0)
+# Install task color
+TASK_COLOR_INSTALL = (1.0, 0.00, 1.00, 1.0)
+# Package task color
+TASK_COLOR_PACKAGE = (0.0, 1.00, 1.00, 1.0)
+# Sysroot task color
+TASK_COLOR_SYSROOT = (0.0, 0.00, 1.00, 1.0)
+
 # Process states
 STATE_UNDEFINED = 0
 STATE_RUNNING   = 1
@@ -131,7 +142,7 @@ def draw_label_in_box(ctx, color, label, x, y, w, maxx):
 def draw_5sec_labels(ctx, rect, sec_w):
         ctx.set_font_size(AXIS_FONT_SIZE)
 	for i in range(0, rect[2] + 1, sec_w):
-		if ((i / sec_w) % 5 == 0) :
+		if ((i / sec_w) % 30 == 0) :
 			label = "%ds" % (i / sec_w)
 			label_w = ctx.text_extents(label)[2]
 			draw_text(ctx, label, TEXT_COLOR, rect[0] + i - label_w/2, rect[1] - 2)
@@ -143,7 +154,7 @@ def draw_box_ticks(ctx, rect, sec_w):
 	ctx.set_line_cap(cairo.LINE_CAP_SQUARE)
 
 	for i in range(sec_w, rect[2] + 1, sec_w):
-		if ((i / sec_w) % 5 == 0) :
+		if ((i / sec_w) % 30 == 0) :
 			ctx.set_source_rgba(*TICK_COLOR_BOLD)
 		else :
 			ctx.set_source_rgba(*TICK_COLOR)
@@ -188,87 +199,129 @@ header_h = 280
 bar_h = 55
 # offsets
 off_x, off_y = 10, 10
-sec_w = 25 # the width of a second
+sec_w = 1 # the width of a second
 proc_h = 16 # the height of a process
 leg_s = 10
 MIN_IMG_W = 800
 
 
-def extents(headers, cpu_stats, disk_stats, proc_tree):
-	w = (proc_tree.duration * sec_w / 100) + 2*off_x
-	h = proc_h * proc_tree.num_proc + header_h + 2*off_y
+def extents(res):
+	start = min(res.start.keys())
+	end = max(res.end.keys())
+
+	w = ((end - start) * sec_w) + 2*off_x
+	h = proc_h * len(res.processes) + header_h + 2*off_y
+
 	return (w,h)
 
 #
 # Render the chart.
 # 
-def render(ctx, headers, cpu_stats, disk_stats, proc_tree):
-	(w, h) = extents(headers, cpu_stats, disk_stats, proc_tree)
+def render(ctx, res):
+	(w, h) = extents(res)
 
 	ctx.set_line_width(1.0)
 	ctx.select_font_face(FONT_NAME)
 	draw_fill_rect(ctx, WHITE, (0, 0, max(w, MIN_IMG_W), h))
 	w -= 2*off_x    
 	# draw the title and headers
-	curr_y = draw_header(ctx, headers, off_x, proc_tree.duration)
+	#curr_y = draw_header(ctx, headers, off_x, proc_tree.duration)
+        curr_y = 0
     
 	# render bar legend
 	ctx.set_font_size(LEGEND_FONT_SIZE)
 
-	draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
-	draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+        #print "w, h %s %s" % (w, h)
+
+	#draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
+	#draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
 
 	# render I/O wait
-        chart_rect = (off_x, curr_y+30, w, bar_h)
-	draw_box_ticks(ctx, chart_rect, sec_w)
-	draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys + sample.io) for sample in cpu_stats], proc_tree) 
+        #chart_rect = (off_x, curr_y+30, w, bar_h)
+	#draw_box_ticks(ctx, chart_rect, sec_w)
+	#draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys + sample.io) for sample in cpu_stats], proc_tree) 
 	# render CPU load
-	draw_chart(ctx, CPU_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys) for sample in cpu_stats], proc_tree)
+	#draw_chart(ctx, CPU_COLOR, True, chart_rect, [(sample.time, sample.user + sample.sys) for sample in cpu_stats], proc_tree)
 
-	curr_y = curr_y + 30 + bar_h
+	#curr_y = curr_y + 30 + bar_h
 
 	# render second chart
-	draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
-	draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+	#draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
+	#draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
 
         # render I/O utilization
-	chart_rect = (off_x, curr_y+30, w, bar_h)
-	draw_box_ticks(ctx, chart_rect, sec_w)			
-	draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.util) for sample in disk_stats], proc_tree)
+	#chart_rect = (off_x, curr_y+30, w, bar_h)
+	#draw_box_ticks(ctx, chart_rect, sec_w)
+	#draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.util) for sample in disk_stats], proc_tree)
 				
 	# render disk throughput
-	max_sample = max(disk_stats, key=lambda s: s.tput)
-	draw_chart(ctx, DISK_TPUT_COLOR, False, chart_rect, [(sample.time, sample.tput) for sample in disk_stats], proc_tree)
+	#max_sample = max(disk_stats, key=lambda s: s.tput)
+	#draw_chart(ctx, DISK_TPUT_COLOR, False, chart_rect, [(sample.time, sample.tput) for sample in disk_stats], proc_tree)
 	
-	pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+	#pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+        pos_x = off_x
 
 	shift_x, shift_y = -20, 20
 	if (pos_x < off_x + 245):
 		shift_x, shift_y = 5, 40
        				
-	label = "%dMB/s" % round((max_sample.tput) / 1024.0)
-	draw_text(ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
+	#label = "%dMB/s" % round((max_sample.tput) / 1024.0)
+	#draw_text(ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
 
 
-	# draw process boxes
-	draw_process_bar_chart(ctx, proc_tree, curr_y + bar_h, w, h)
 
-	ctx.set_font_size(SIG_FONT_SIZE)
-	draw_text(ctx, SIGNATURE, SIG_COLOR, off_x + 5, h - off_y - 5)
-	
-def draw_process_bar_chart(ctx, proc_tree, curr_y, w, h):
-	draw_legend_box(ctx, "Running (%cpu)", 		PROC_COLOR_R, off_x    , curr_y + 45, leg_s)		
-	draw_legend_box(ctx, "Unint.sleep (I/O)", 	PROC_COLOR_D, off_x+120, curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Sleeping", 		PROC_COLOR_S, off_x+240, curr_y + 45, leg_s)
-	draw_legend_box(ctx, "Zombie", 			PROC_COLOR_Z, off_x+360, curr_y + 45, leg_s)
+        chart_rect = [off_x, curr_y+60, w, h - 2 * off_y - (curr_y+60) + proc_h]
+
+	draw_legend_box(ctx, "Configure", 	TASK_COLOR_CONFIGURE, off_x    , curr_y + 45, leg_s)
+	draw_legend_box(ctx, "Compile", 	TASK_COLOR_COMPILE, off_x+120, curr_y + 45, leg_s)
+	draw_legend_box(ctx, "Install", 	TASK_COLOR_INSTALL, off_x+240, curr_y + 45, leg_s)
+	draw_legend_box(ctx, "Package", 	TASK_COLOR_PACKAGE, off_x+360, curr_y + 45, leg_s)
+	draw_legend_box(ctx, "Populate Sysroot",	TASK_COLOR_SYSROOT, off_x+480, curr_y + 45, leg_s)
 	
-	chart_rect = [off_x, curr_y+60, w, h - 2 * off_y - (curr_y+60) + proc_h]
 	ctx.set_font_size(PROC_TEXT_FONT_SIZE)
 	
 	draw_box_ticks(ctx, chart_rect, sec_w)
 	draw_5sec_labels(ctx, chart_rect, sec_w)
-        
+
 	y = curr_y+60
+
+        offset = min(res.start.keys())
+        for s in sorted(res.start.keys()):
+            task = res.start[s].split(":")[1]
+            #print res.start[s]
+            #print res.processes[res.start[s]][1]
+            #print s
+            x = (s - offset) * sec_w
+            w = ((res.processes[res.start[s]][1] - s) * sec_w)
+
+            #print "proc at %s %s %s %s" % (x, y, w, proc_h)
+            col = None
+            if task == "do_compile":
+                col = TASK_COLOR_COMPILE
+            elif task == "do_configure":
+                col = TASK_COLOR_CONFIGURE
+            elif task == "do_install":
+                col = TASK_COLOR_INSTALL
+            elif task == "do_package":
+                col = TASK_COLOR_PACKAGE
+            elif task == "do_populate_sysroot":
+                col = TASK_COLOR_SYSROOT
+
+            draw_rect(ctx, PROC_BORDER_COLOR, (x, y, w, proc_h))
+            if col:
+                draw_fill_rect(ctx, col, (x, y, w, proc_h))
+
+            draw_label_in_box(ctx, PROC_TEXT_COLOR, res.start[s], x, y + proc_h - 4, w, proc_h)
+            y = y + proc_h
+
+	# draw process boxes
+	#draw_process_bar_chart(ctx, proc_tree, curr_y + bar_h, w, h)
+
+	ctx.set_font_size(SIG_FONT_SIZE)
+	draw_text(ctx, SIGNATURE, SIG_COLOR, off_x + 5, h - off_y - 5)
+
+def draw_process_bar_chart(ctx, proc_tree, curr_y, w, h):
+
 	for root in proc_tree.process_tree:        
 		draw_processes_recursively(ctx, root, proc_tree, y, proc_h, chart_rect)
 		y  = y + proc_h * proc_tree.num_nodes([root])
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index 87081e3..310c3d1 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -35,7 +35,7 @@ class PyBootchartWidget(gtk.DrawingArea):
 		self.zoom_ratio = 1.0
                 self.x, self.y = 0.0, 0.0
 
-		self.chart_width, self.chart_height = draw.extents(*res)
+		self.chart_width, self.chart_height = draw.extents(res)
 		self.hadj = None
 		self.vadj = None
 
@@ -56,7 +56,7 @@ class PyBootchartWidget(gtk.DrawingArea):
 		cr.paint()
                 cr.scale(self.zoom_ratio, self.zoom_ratio)
                 cr.translate(-self.x, -self.y)
-		draw.render(cr, *self.res)
+		draw.render(cr, self.res)
 
 	def position_changed(self):
 		self.emit("position-changed", self.x, self.y)
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index a350a3e..11a0829 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -160,34 +160,39 @@ def get_num_cpus(headers):
 
 class ParserState:
     def __init__(self):
-        self.headers = None
-	self.disk_stats = None
-	self.ps_stats = None
-	self.cpu_stats = None
+        self.processes = {}
+        self.start = {}
+        self.end = {}
 
     def valid(self):
-        return self.headers != None and self.disk_stats != None and self.ps_stats != None and self.cpu_stats != None
+        return len(self.processes) != 0
 
 
 _relevant_files = set(["header", "proc_diskstats.log", "proc_ps.log", "proc_stat.log"])
 
-def _do_parse(state, name, file):
-    if name == "header":
-        state.headers = _parse_headers(file)
-    elif name == "proc_diskstats.log":
-        state.disk_stats = _parse_proc_disk_stat_log(file, get_num_cpus(state.headers))
-    elif name == "proc_ps.log":
-        state.ps_stats = _parse_proc_ps_log(file)
-    elif name == "proc_stat.log":
-        state.cpu_stats = _parse_proc_stat_log(file)
+def _do_parse(state, filename, file):
+    #print filename
+    #writer.status("parsing '%s'" % filename)
+    paths = filename.split("/")
+    task = paths[-1]
+    pn = paths[-2]
+    start = None
+    end = None
+    for line in file:
+        if line.startswith("Started:"):
+            start = int(float(line.split()[-1]))
+        elif line.startswith("Ended:"):
+            end = int(float(line.split()[-1]))
+    if start and end and (end - start) > 8:
+        state.processes[pn + ":" + task] = [start, end]
+        state.start[start] = pn + ":" + task
+        state.end[end] = pn + ":" + task
     return state
 
 def parse_file(state, filename):
     basename = os.path.basename(filename)
-    if not(basename in _relevant_files):
-        return state
     with open(filename, "rb") as file:
-        return _do_parse(state, basename, file)
+        return _do_parse(state, filename, file)
 
 def parse_paths(state, paths):
     for path in paths:
@@ -196,7 +201,7 @@ def parse_paths(state, paths):
             print "warning: path '%s' does not exist, ignoring." % path
             continue
         if os.path.isdir(path):
-            files = [ f for f in [os.path.join(path, f) for f in os.listdir(path)] if os.path.isfile(f) ]
+            files = [ f for f in [os.path.join(path, f) for f in os.listdir(path)] ]
             files.sort()
             state = parse_paths(state, files)
         elif extension in [".tar", ".tgz", ".tar.gz"]:
@@ -218,6 +223,6 @@ def parse(paths, prune):
     state = parse_paths(ParserState(), paths)
     if not state.valid():
         raise ParseError("empty state: '%s' does not contain a valid bootchart" % ", ".join(paths))
-    monitored_app = state.headers.get("profile.process")
-    proc_tree = ProcessTree(state.ps_stats, monitored_app, prune)
-    return (state.headers, state.cpu_stats, state.disk_stats, proc_tree)
+    #monitored_app = state.headers.get("profile.process")
+    #proc_tree = ProcessTree(state.ps_stats, monitored_app, prune)
+    return state
-- 
1.7.7.6



