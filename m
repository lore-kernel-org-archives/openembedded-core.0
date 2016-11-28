Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 28E3971AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m5so97705059ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FKtRKCSpfe4oaQC060oY2tPM6+hdNXbZHcQQbZbtSPc=;
	b=y8MFRhn8i1K3faYAEI5dl2X7Gj4qBZnKziOgIWr3o9/qeDV2SnX6WQn1MMyLzsQCUd
	EfwLbX3sl52zROh/QMnEbK0Zya2E9DQ3O1DY/DoSfqIEGVRuZ7OubmgP6Uudf6nGCo2M
	a2CmVJ/I3ryMvl2z15Y+QESSBsq+9JnuspzWpFl4lK3Y2gFnoyuvXoREPkZq45r4feB2
	RKGnlqVBXtEqiKegLM3xr/hitB5zV41/A4Uz31PJuVwZqvhAXr+TJ7VabHNglGu21/Bv
	gpnc/ffu0KvfWUvL2ix7/7uQwi/4RzNiFQYe2Ug4cTSxIfdSVgI9AN2n5mdNpzidNKA2
	BDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FKtRKCSpfe4oaQC060oY2tPM6+hdNXbZHcQQbZbtSPc=;
	b=XyAvYnW76r5r1HofWlrY88+WuMnzocV3nfQrW4bg0zHxtQe/j+Di3za6YdBW9fpASo
	yViHDVgcez5yS0oMvVFIpkECSB6i7GJEPOlpHHOT/mignRR1xgmKBDXBEUsd//1Eg8jw
	+vLf+t0l4BJZMl7ckwE+fOF3E6gQchQfdl0pg40ZW7nqp8aCSrQ+utrGlPpCnAz+fjYi
	9zI6lpUb5amLjpVE1HgTY00WZEN/BQeSaDOKiiAruA+ixvIov1ce96r7rR4mIZq1ylPM
	a3VLsvZu5j8nLJ3nsEnkflh1LpZbZEBswOYa5WKj41CLq4Cyob/z2Oy8SWmafdl6Ey0Z
	eXbg==
X-Gm-Message-State: AKaTC02TI8YiS/9LjsOBKbA2ejPXnOyyFoX45CBqFRvo65QdZONLBoeH53lxww6aX6xzL0YM
X-Received: by 10.107.24.196 with SMTP id 187mr18824153ioy.81.1480347208355;
	Mon, 28 Nov 2016 07:33:28 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:27 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:06 +0100
Message-Id: <e1305a99c3d0f89781a9482c7386b3effab4a31c.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 05/11] pybootchartgui/draw.py: skip empty CPU and disk usage charts
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:27 -0000

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


