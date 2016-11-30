Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B376871AB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:24 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c21so321028584ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FKtRKCSpfe4oaQC060oY2tPM6+hdNXbZHcQQbZbtSPc=;
	b=GFCM0x8oQU/0qM7rNszMWK80cbnSG4rQyCPGVd2Gagb+zuhQ03nKIZnauYqaURYx9p
	slBGjbfauRqv9n9tQBkZrQMkc+HgvV2jVvm6GRIqqjwvzWCsukQ90HFbvRO4cnWlKK94
	+EqN4hCsOD8MSp5lSt1Px5BBZkl+2eIq099V2YIlNlBCGqWPXTj7nYjGP1zsK0lpvoUi
	/ixxKB+6GSYjCtUAMKLKNMwwPegf+y+m35qxopy2XvcmC2P04QT1jBJyWgj1fsElqC+u
	ozBh8/xPXjG+nRIwAYhI4V/eyK7+JIyNuMCVDei8qMVVBoKDkj4cjFjQfAvZyIp8vtAC
	k7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FKtRKCSpfe4oaQC060oY2tPM6+hdNXbZHcQQbZbtSPc=;
	b=b/PEuoNBxY/lz59Uh5QfwoBq2u3kY/Fmj4wB6ak9do3U4xp/+PosU7eOXCmVeEPLYF
	kJqp5vlb0idSbUo23W3tY49Ij65Yq2whm8W7A1tw3hIkGcMlCMsTxvpsoxZS3odqeOlG
	K+wIN8d0Dgv4b6HYGHc2WIQAOGum9cbcKWS+wJCmJXNOi+56gYTlDPG2upZrzwuXsjvQ
	cwEXmIjkx+TI1YZuHsIB8ayYQX5iDtSHUqnOkS/xrh7uA2pQBoXPv8VjPu2bMAq3FiFY
	3H2PMWR0BXwhrLBzjBBHsIQTAeRlW9kVE3b2NHrzlB6iuEF4O+T3+qnhyqt0nI66z5IZ
	E3zA==
X-Gm-Message-State: AKaTC00oA+TTiakAiGCfRwYcqbvTM4jR2oTE9RMOAGWrsf/g8ebenpkeYuNh8Hl6vjFKLULw
X-Received: by 10.36.103.198 with SMTP id u189mr27682227itc.9.1480499425292;
	Wed, 30 Nov 2016 01:50:25 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:24 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:05 +0100
Message-Id: <1bc7d2f701c73469c7617e88d207d0290ff67861.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 05/11] pybootchartgui/draw.py: skip empty CPU and disk usage charts
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:25 -0000

The only real change is the addition of two if checks that skips the
corresponding drawing code when there is no data.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 98 ++++++++++++++-------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index bddd804..ec5dd33 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -344,56 +344,58 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 	proc_tree = options.proc_tree(trace)
 
 	# render bar legend
-	ctx.set_font_size(LEGEND_FONT_SIZE)
-
-	draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
-	draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
-
-	# render I/O wait
-	chart_rect = (off_x, curr_y+30, w, bar_h)
-	if clip_visible (clip, chart_rect):
-		draw_box_ticks (ctx, chart_rect, sec_w)
-		draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-		draw_chart (ctx, IO_COLOR, True, chart_rect, \
-			    [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats], \
-			    proc_tree, None)
-		# render CPU load
-		draw_chart (ctx, CPU_COLOR, True, chart_rect, \
-			    [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats], \
-			    proc_tree, None)
-
-	curr_y = curr_y + 30 + bar_h
+	if trace.cpu_stats:
+		ctx.set_font_size(LEGEND_FONT_SIZE)
+
+		draw_legend_box(ctx, "CPU (user+sys)", CPU_COLOR, off_x, curr_y+20, leg_s)
+		draw_legend_box(ctx, "I/O (wait)", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+
+		# render I/O wait
+		chart_rect = (off_x, curr_y+30, w, bar_h)
+		if clip_visible (clip, chart_rect):
+			draw_box_ticks (ctx, chart_rect, sec_w)
+			draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+			draw_chart (ctx, IO_COLOR, True, chart_rect, \
+				    [(sample.time, sample.user + sample.sys + sample.io) for sample in trace.cpu_stats], \
+				    proc_tree, None)
+			# render CPU load
+			draw_chart (ctx, CPU_COLOR, True, chart_rect, \
+				    [(sample.time, sample.user + sample.sys) for sample in trace.cpu_stats], \
+				    proc_tree, None)
+
+		curr_y = curr_y + 30 + bar_h
 
 	# render second chart
-	draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
-	draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
-
-        # render I/O utilization
-	chart_rect = (off_x, curr_y+30, w, bar_h)
-	if clip_visible (clip, chart_rect):
-		draw_box_ticks (ctx, chart_rect, sec_w)
-		draw_annotations (ctx, proc_tree, trace.times, chart_rect)
-		draw_chart (ctx, IO_COLOR, True, chart_rect, \
-			    [(sample.time, sample.util) for sample in trace.disk_stats], \
-			    proc_tree, None)
-
-	# render disk throughput
-	max_sample = max (trace.disk_stats, key = lambda s: s.tput)
-	if clip_visible (clip, chart_rect):
-		draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect, \
-			    [(sample.time, sample.tput) for sample in trace.disk_stats], \
-			    proc_tree, None)
-
-	pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
-
-	shift_x, shift_y = -20, 20
-	if (pos_x < off_x + 245):
-		shift_x, shift_y = 5, 40
-
-	label = "%dMB/s" % round ((max_sample.tput) / 1024.0)
-	draw_text (ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
-
-	curr_y = curr_y + 30 + bar_h
+	if trace.disk_stats:
+		draw_legend_line(ctx, "Disk throughput", DISK_TPUT_COLOR, off_x, curr_y+20, leg_s)
+		draw_legend_box(ctx, "Disk utilization", IO_COLOR, off_x + 120, curr_y+20, leg_s)
+
+		# render I/O utilization
+		chart_rect = (off_x, curr_y+30, w, bar_h)
+		if clip_visible (clip, chart_rect):
+			draw_box_ticks (ctx, chart_rect, sec_w)
+			draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+			draw_chart (ctx, IO_COLOR, True, chart_rect, \
+				    [(sample.time, sample.util) for sample in trace.disk_stats], \
+				    proc_tree, None)
+
+		# render disk throughput
+		max_sample = max (trace.disk_stats, key = lambda s: s.tput)
+		if clip_visible (clip, chart_rect):
+			draw_chart (ctx, DISK_TPUT_COLOR, False, chart_rect, \
+				    [(sample.time, sample.tput) for sample in trace.disk_stats], \
+				    proc_tree, None)
+
+		pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+
+		shift_x, shift_y = -20, 20
+		if (pos_x < off_x + 245):
+			shift_x, shift_y = 5, 40
+
+		label = "%dMB/s" % round ((max_sample.tput) / 1024.0)
+		draw_text (ctx, label, DISK_TPUT_COLOR, pos_x + shift_x, curr_y + shift_y)
+
+		curr_y = curr_y + 30 + bar_h
 
 	# render mem usage
 	chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
-- 
2.1.4


