Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6174271B1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:35 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m5so97712869ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9sie2vVGDgcxChxdTeqT6LSjO4kPkelB4MipSZSiYsA=;
	b=B75JG9r7foySG50I3jcUCl8MNK/fz//Sm1ccUpJT2TeOCXk5t6pmwZVNVJl/1Qycpv
	S2CtViUiOEu7QEP2FoMzNM/yH/lruXPWy+maDsjXL+8YmUWyo9vZ01mPauS2S/2Bu0OO
	Rhmd8e8cJBVJT7QE3qzLC5hPIOvJOoLeUlz4/NlxWuXe4SxbH6tSfbWhf/9kwA96siUW
	Vy547t6BCXKV3cMUjgL/DifHRvO27ldHosTgOdia6DyGyPCSM9Wp7KQaV99/pHzVcfXz
	QGio4a0rwAVCzCedkXlLYbhwymB052FqBnZqNp4k7sXOeD2xCpT+h2ukKvoKwMjEFtn5
	RqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9sie2vVGDgcxChxdTeqT6LSjO4kPkelB4MipSZSiYsA=;
	b=O4JdqnrMoC6hFuavLsyDyWT0C3dZCrF4txR+/YQHz4qtEftfsX+ApmzbxTRnQaRMNE
	ttewAfz/xSEnZjtmcJEvk7FG7xn7KbIeqVzI6tTfIvcH/r+ifQY38uA5Drm9IUJaVnzt
	H0eryvCgWP8fHSbmUjkVhSNNO4vQO87kjtO4m6Hg3hLkp4xzSuHhLHdyn6gOt1klLA+P
	qHMySNezWK7UjzjxhesLP8coJ4IPjbgNy6ZL1vIe2ld2b0YhkFff6EJdLb6P4qF+wEZc
	Gga4F515OAEouuYU/QmzsqdE+JnLe/n6u94vExe48BJat1r5ULz+dcAz81c+C/BLoNYM
	lBnA==
X-Gm-Message-State: AKaTC0265H6H1DRgMoUEY+LcLz/9WlswqRrVDksPVd4yujolSEwUWAC25SJ5wg2mtOdUwasg
X-Received: by 10.36.37.199 with SMTP id g190mr18808361itg.66.1480347216480;
	Mon, 28 Nov 2016 07:33:36 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:35 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:09 +0100
Message-Id: <4701e79b968b6d0435bf8c9f178a520ab6ecea7e.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 08/11] pybootchartgui: render disk space usage
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:35 -0000

This adds a new, separate chart showing the amount of disk space used
over time for each volume monitored during the build. The hight of the
graph entries represents the delta between current usage and minimal
usage during the build.

That's more useful than showing just the current usage, because then a
graph showing changes in the order of MBs in a volume that is several
GB large would be just flat.

The legend shows the maximum of those deltas, i.e. maximum amount of
space needed for the build. Minor caveat: sampling of disk space usage
starts a bit later than the initial task, so the displayed value may
be slightly lower than the actual amount of space needed because
sampling does not record the actual initial state.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    | 62 ++++++++++++++++++++++++
 scripts/pybootchartgui/pybootchartgui/parsing.py | 26 ++++++++++
 scripts/pybootchartgui/pybootchartgui/samples.py | 11 +++++
 3 files changed, 99 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index ec5dd33..f0143ad 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -133,6 +133,16 @@ TASK_COLOR_PACKAGE = (0.0, 1.00, 1.00, 1.0)
 # Package Write RPM/DEB/IPK task color
 TASK_COLOR_PACKAGE_WRITE = (0.0, 0.50, 0.50, 1.0)
 
+# Distinct colors used for different disk volumnes.
+# If we have more volumns, colors get re-used.
+VOLUME_COLORS = [
+	(1.0, 1.0, 0.00, 1.0),
+	(0.0, 1.00, 0.00, 1.0),
+	(1.0, 0.00, 1.00, 1.0),
+	(0.0, 0.00, 1.00, 1.0),
+	(0.0, 1.00, 1.00, 1.0),
+]
+
 # Process states
 STATE_UNDEFINED = 0
 STATE_RUNNING   = 1
@@ -397,6 +407,58 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
 		curr_y = curr_y + 30 + bar_h
 
+	# render disk space usage
+	#
+	# Draws the amount of disk space used on each volume relative to the
+	# lowest recorded amount. The graphs for each volume are stacked above
+	# each other so that total disk usage is visible.
+	if trace.monitor_disk:
+		ctx.set_font_size(LEGEND_FONT_SIZE)
+		# Determine set of volumes for which we have
+		# information and the minimal amount of used disk
+		# space for each. Currently samples are allowed to
+		# not have a values for all volumes; drawing could be
+		# made more efficient if that wasn't the case.
+		volumes = set()
+		min_used = {}
+		for sample in trace.monitor_disk:
+			for volume, used in sample.records.items():
+				volumes.add(volume)
+				if volume not in min_used or min_used[volume] > used:
+					min_used[volume] = used
+		volumes = sorted(list(volumes))
+		disk_scale = 0
+		for i, volume in enumerate(volumes):
+			volume_scale = max([sample.records[volume] - min_used[volume]
+			                    for sample in trace.monitor_disk
+			                    if volume in sample.records])
+			# Does not take length of volume name into account, but fixed offset
+			# works okay in practice.
+			draw_legend_box(ctx, '%s (max: %u MiB)' % (volume, volume_scale / 1024 / 1024),
+			                VOLUME_COLORS[i % len(VOLUME_COLORS)],
+			                off_x + i * 250, curr_y+20, leg_s)
+			disk_scale += volume_scale
+
+		# render used amount of disk space
+		chart_rect = (off_x, curr_y+30, w, bar_h)
+		if clip_visible (clip, chart_rect):
+			draw_box_ticks (ctx, chart_rect, sec_w)
+			draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+			for i in range(len(volumes), 0, -1):
+				draw_chart (ctx, VOLUME_COLORS[(i - 1) % len(VOLUME_COLORS)], True, chart_rect, \
+				            [(sample.time,
+				              # Sum up used space of all volumes including the current one
+				              # so that the graphs appear as stacked on top of each other.
+				              reduce(lambda x,y: x+y,
+				                     [sample.records[volume] - min_used[volume]
+				                      for volume in volumes[0:i]
+				                      if volume in sample.records],
+				                     0))
+				             for sample in trace.monitor_disk], \
+				            proc_tree, [0, disk_scale])
+
+		curr_y = curr_y + 30 + bar_h
+
 	# render mem usage
 	chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
 	mem_stats = trace.mem_stats
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 48eb048..301145a 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -48,6 +48,7 @@ class Trace:
         self.filename = None
         self.parent_map = None
         self.mem_stats = []
+        self.monitor_disk = None
         self.times = [] # Always empty, but expected by draw.py when drawing system charts.
 
         if len(paths):
@@ -506,6 +507,29 @@ def _parse_proc_meminfo_log(file):
 
     return mem_stats
 
+def _parse_monitor_disk_log(file):
+    """
+    Parse file with information about amount of diskspace used.
+    The format of relevant lines should be: ^volume path: number-of-bytes?
+    """
+    disk_stats = []
+    diskinfo_re = re.compile(r'^(.+):\s*(\d+)$')
+
+    for time, lines in _parse_timed_blocks(file):
+        sample = DiskSpaceSample(time)
+
+        for line in lines:
+            match = diskinfo_re.match(line)
+            if not match:
+                raise ParseError("Invalid monitor_disk line \"%s\"" % line)
+            sample.add_value(match.group(1), int(match.group(2)))
+
+        if sample.valid():
+            disk_stats.append(sample)
+
+    return disk_stats
+
+
 # if we boot the kernel with: initcall_debug printk.time=1 we can
 # get all manner of interesting data from the dmesg output
 # We turn this into a pseudo-process tree: each event is
@@ -684,6 +708,8 @@ def _do_parse(writer, state, filename, file):
         state.mem_stats = _parse_proc_meminfo_log(file)
     elif name == "cmdline2.log":
         state.cmdline = _parse_cmdline_log(writer, file)
+    elif name == "monitor_disk.log":
+        state.monitor_disk = _parse_monitor_disk_log(file)
     elif not filename.endswith('.log'):
         _parse_bitbake_buildstats(writer, state, filename, file)
     t2 = clock()
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 015d743..bedca41 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -53,6 +53,17 @@ class MemSample:
         # discard incomplete samples
         return [v for v in MemSample.used_values if v not in keys] == []
 
+class DiskSpaceSample:
+    def __init__(self, time):
+        self.time = time
+        self.records = {}
+
+    def add_value(self, name, value):
+        self.records[name] = value
+
+    def valid(self):
+        return bool(self.records)
+
 class ProcessSample:
     def __init__(self, time, state, cpu_sample):
         self.time = time
-- 
2.1.4


