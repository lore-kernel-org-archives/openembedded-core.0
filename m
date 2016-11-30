Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71D8671AB2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:22 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m5so201447360ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z0x2Q+Mswx8kxQfxCY0eTslaLm+twYZWTVagQwNREpQ=;
	b=yzgjPjvlygG36Hc7DOT4zZKvuNRFjkEQ3jcSp7oDKAeQvSPuMIu8F2nNzJ2Nh3924Q
	qghB3WT39bOA3GxLZDBBIW55vaytJC3V+ZOjhd3B1NVdwXbUDhe9Bz6CFFq1+rrvV755
	5UODtK/z+mEEvV1T6ZOZi8KOVC8SYTtW7kp/o2QYiY/obVIvg2kiR4VcftLsYfGbI8ZF
	vDjpBHwZcIYzx0vsVcb+vLVWoWgRLQkZ9s/PRf5oOSc/AnpvbrjfhpfczRel1H0hGxhh
	5t0tD7e9/FWp8cQxa0bfHq5qJpUIi09YyCiwb5gIZnVwj3+Wtr1jLW1z11e1l69Mevvh
	j5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z0x2Q+Mswx8kxQfxCY0eTslaLm+twYZWTVagQwNREpQ=;
	b=duvrpP4nztBB7uf0ySww3EjiabvcfQWoSQg6IxkR9fQNMi0QDwuz1Qcc6l6XmmQ5zk
	oHJwLaspyYGXj+MC6OyJ43OHiNFKocUcDXSN6pZkhGosNc9lJmFlJgDJd7Ax4NQ87vkX
	y+nyK6VBGk4kI3xJjZby0GFlK0VNzj7w4XVmO30oOKuG15bgm2tOr9mFEvVM5Bx5zL7/
	EPAU0/isYtsVuW110aSFrBl6Y4lBIwcGcDuYC0bLC/xLtISrKLhEeIxIwAfRCvcShSjy
	MsgngqwU1wMG1g9+opIsd35TM8DEDaSVIGMJZ3pNvq4EHdntxzcT2wE6jyX+MhdnIjIm
	iHbA==
X-Gm-Message-State: AKaTC01PhF2mDE/ULoih/tzfmI/dC2qyPkL1dIhZmgjo9Wr145ImO0ClDNJDJoaMerotzDr9
X-Received: by 10.36.193.197 with SMTP id e188mr25447553itg.99.1480499423334; 
	Wed, 30 Nov 2016 01:50:23 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:22 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:04 +0100
Message-Id: <e0fde11ec2bcdab679405c46e48290fa292627be.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 04/11] pybootchartgui: show system utilization
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:23 -0000

This enables rendering of the original bootchart charts for CPU, disk
and memory usage. It depends on the /proc samples recorded by the
updated buildstats.bbclass. Currently, empty charts CPU and disk usage
charts are drawn if that data is not present; the memory chart already
gets skipped when there's no data, which will also have to be added
for the other two.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    | 16 +++++--
 scripts/pybootchartgui/pybootchartgui/parsing.py | 61 +++++++++++++++++-------
 2 files changed, 57 insertions(+), 20 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 925002d..bddd804 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -321,6 +321,16 @@ def extents(options, xscale, trace):
 	w = int ((end - start) * sec_w_base * xscale) + 2 * off_x
 	h = proc_h * processes + header_h + 2 * off_y
 
+	if options.charts:
+		if trace.cpu_stats:
+			h += 30 + bar_h
+		if trace.disk_stats:
+			h += 30 + bar_h
+		if trace.monitor_disk:
+			h += 30 + bar_h
+		if trace.mem_stats:
+			h += meminfo_bar_h
+
 	return (w, h)
 
 def clip_visible(clip, rect):
@@ -496,6 +506,9 @@ def render(ctx, options, xscale, trace):
 	w -= 2*off_x
 	curr_y = off_y;
 
+	if options.charts:
+		curr_y = render_charts (ctx, options, clip, trace, curr_y, w, h, sec_w)
+
 	curr_y = render_processes_chart (ctx, options, trace, curr_y, w, h, sec_w)
 
 	return
@@ -513,9 +526,6 @@ def render(ctx, options, xscale, trace):
 	else:
 		curr_y = off_y;
 
-	if options.charts:
-		curr_y = render_charts (ctx, options, clip, trace, curr_y, w, h, sec_w)
-
 	# draw process boxes
 	proc_height = h
 	if proc_tree.taskstats and options.cumulative:
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index a3a0b0b..af68435 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -38,16 +38,17 @@ class Trace:
         self.min = None
         self.max = None
         self.headers = None
-        self.disk_stats = None
+        self.disk_stats =  []
         self.ps_stats = None
         self.taskstats = None
-        self.cpu_stats = None
+        self.cpu_stats = []
         self.cmdline = None
         self.kernel = None
         self.kernel_tree = None
         self.filename = None
         self.parent_map = None
-        self.mem_stats = None
+        self.mem_stats = []
+        self.times = [] # Always empty, but expected by draw.py when drawing system charts.
 
         if len(paths):
             parse_paths (writer, self, paths)
@@ -58,6 +59,19 @@ class Trace:
                 self.min = min(self.start.keys())
                 self.max = max(self.end.keys())
 
+
+        # Rendering system charts depends on start and end
+        # time. Provide them where the original drawing code expects
+        # them, i.e. in proc_tree.
+        class BitbakeProcessTree:
+            def __init__(self, start_time, end_time):
+                self.start_time = start_time
+                self.end_time = end_time
+                self.duration = self.end_time - self.start_time
+        self.proc_tree = BitbakeProcessTree(min(self.start.keys()),
+                                            max(self.end.keys()))
+
+
         return
 
         # Turn that parsed information into something more useful
@@ -427,7 +441,7 @@ def _parse_proc_stat_log(file):
         # skip the rest of statistics lines
     return samples
 
-def _parse_proc_disk_stat_log(file, numCpu):
+def _parse_proc_disk_stat_log(file):
     """
     Parse file for disk stats, but only look at the whole device, eg. sda,
     not sda1, sda2 etc. The format of relevant lines should be:
@@ -462,7 +476,7 @@ def _parse_proc_disk_stat_log(file, numCpu):
         sums = [ a - b for a, b in zip(sample1.diskdata, sample2.diskdata) ]
         readTput = sums[0] / 2.0 * 100.0 / interval
         writeTput = sums[1] / 2.0 * 100.0 / interval
-        util = float( sums[2] ) / 10 / interval / numCpu
+        util = float( sums[2] ) / 10 / interval
         util = max(0.0, min(1.0, util))
         disk_stats.append(DiskSample(sample2.time, readTput, writeTput, util))
 
@@ -628,6 +642,20 @@ def _parse_cmdline_log(writer, file):
             cmdLines[pid] = values
     return cmdLines
 
+def _parse_bitbake_buildstats(writer, state, filename, file):
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
+    if start and end:
+        state.add_process(pn + ":" + task, start, end)
+
 def get_num_cpus(headers):
     """Get the number of CPUs from the system.cpu header property. As the
     CPU utilization graphs are relative, the number of CPUs currently makes
@@ -647,18 +675,17 @@ def get_num_cpus(headers):
 def _do_parse(writer, state, filename, file):
     writer.info("parsing '%s'" % filename)
     t1 = clock()
-    paths = filename.split("/")
-    task = paths[-1]
-    pn = paths[-2]
-    start = None
-    end = None
-    for line in file:
-        if line.startswith("Started:"):
-            start = int(float(line.split()[-1]))
-        elif line.startswith("Ended:"):
-            end = int(float(line.split()[-1]))
-    if start and end:
-        state.add_process(pn + ":" + task, start, end)
+    name = os.path.basename(filename)
+    if name == "proc_diskstats.log":
+        state.disk_stats = _parse_proc_disk_stat_log(file)
+    elif name == "proc_stat.log":
+        state.cpu_stats = _parse_proc_stat_log(file)
+    elif name == "proc_meminfo.log":
+        state.mem_stats = _parse_proc_meminfo_log(file)
+    elif name == "cmdline2.log":
+        state.cmdline = _parse_cmdline_log(writer, file)
+    elif not filename.endswith('.log'):
+        _parse_bitbake_buildstats(writer, state, filename, file)
     t2 = clock()
     writer.info("  %s seconds" % str(t2-t1))
     return state
-- 
2.1.4


