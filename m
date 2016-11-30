Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2C02C71AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:30 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id j65so339556419iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h5jfeBwqYjtzA8Os/r6r3MK1A71PXiMBVY6m4mQ6Mpo=;
	b=zeW86/92jyyScZVyEFErD7t+Ou/0N4UU7ki2jvbWmi3xqwpRS3W7HFc/P2grFEKaTZ
	YGfxd9yy4SjuWF2v+bqQwQZ/fiUupzKuoEQY7sS/DoEMbMkC1KYePbwDW+i/x0sMh5Ub
	rSIdRoC+eSuS3CkZL/U6Pd9z3pp/7hUjou1IloydIaooTTH9fSZhqipCs0gAPbueLiZG
	n4+vGy/Je7/doslq92E755d0TqqWnSzDY/cLr9yITvgJKxvhDSMPc0Ht0XyDdC3PS4Uc
	k3NDewK4mPXPZi17pgZyXAu8wS8/hiwLDlE2fPEg7AaKwDJlKeqgpmwJuxyxFi33vctk
	0zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h5jfeBwqYjtzA8Os/r6r3MK1A71PXiMBVY6m4mQ6Mpo=;
	b=SIidbGXz+KhAgpJsabsqBPbs46qYSUhys20LlG3HhJ1cxV79LnHGVQgpG5U/kF9Rj6
	SZr7Y9swpRpbWaU0o+ytLOIqAWI3jJodDzjKvJnvEMSkshiiO6nRJY+QR/A9os2Jrtwv
	7q1n/MkcCP7BGepbT8ZA5VPHo9s+vaAG9RkMRaRMG6I3yoGUzcOVS/IGNrrlr8w1nUt0
	j5lXPZD+wUpGmouqqBS32j1Z8hLtUbxa3p0O4j0FWrKMdpD6JM64tKaiwkkPa6Q5RiEY
	XYRHafrrU8zwnAXe8gUE/eXAPoVCI2+7emt2YWtGnw+0M8ScoxvJzqgk72rtoH9gBv6x
	YIKA==
X-Gm-Message-State: AKaTC02vHlatEkH+tOmH3fS3P+snZFGHGzogBAFHlRFUk/NAqTdYxfgq0bQQIRJGB54MrV/3
X-Received: by 10.107.128.75 with SMTP id b72mr28813525iod.192.1480499432298; 
	Wed, 30 Nov 2016 01:50:32 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	k128sm8496953iok.23.2016.11.30.01.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:31 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:09 +0100
Message-Id: <de6e08e3218c66d9927657267365d5fee40a0ed4.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1480499133.git.patrick.ohly@intel.com>
References: <cover.1480499133.git.patrick.ohly@intel.com>
Subject: [PATCH V2 09/11] pybootchartgui: simplify drawing of memory usage
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:31 -0000

The internal representation after parsing now matches exactly
what the drawing code needs, thus speeding up drawing a bit.
However, the main motivation is to store exactly that required
information in a more compact file.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py    | 12 ++++++------
 scripts/pybootchartgui/pybootchartgui/parsing.py |  2 +-
 scripts/pybootchartgui/pybootchartgui/samples.py | 16 ++++++++++++++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index f0143ad..201ce45 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -463,25 +463,25 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 	chart_rect = (off_x, curr_y+30, w, meminfo_bar_h)
 	mem_stats = trace.mem_stats
 	if mem_stats and clip_visible (clip, chart_rect):
-		mem_scale = max(sample.records['MemTotal'] - sample.records['MemFree'] for sample in mem_stats)
+		mem_scale = max(sample.buffers for sample in mem_stats)
 		draw_legend_box(ctx, "Mem cached (scale: %u MiB)" % (float(mem_scale) / 1024), MEM_CACHED_COLOR, off_x, curr_y+20, leg_s)
 		draw_legend_box(ctx, "Used", MEM_USED_COLOR, off_x + 240, curr_y+20, leg_s)
 		draw_legend_box(ctx, "Buffers", MEM_BUFFERS_COLOR, off_x + 360, curr_y+20, leg_s)
-		draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.records['SwapTotal'] - sample.records['SwapFree'])/1024 for sample in mem_stats]), \
+		draw_legend_line(ctx, "Swap (scale: %u MiB)" % max([(sample.swap)/1024 for sample in mem_stats]), \
 				 MEM_SWAP_COLOR, off_x + 480, curr_y+20, leg_s)
 		draw_box_ticks(ctx, chart_rect, sec_w)
 		draw_annotations(ctx, proc_tree, trace.times, chart_rect)
 		draw_chart(ctx, MEM_BUFFERS_COLOR, True, chart_rect, \
-			   [(sample.time, sample.records['MemTotal'] - sample.records['MemFree']) for sample in trace.mem_stats], \
+			   [(sample.time, sample.buffers) for sample in trace.mem_stats], \
 			   proc_tree, [0, mem_scale])
 		draw_chart(ctx, MEM_USED_COLOR, True, chart_rect, \
-			   [(sample.time, sample.records['MemTotal'] - sample.records['MemFree'] - sample.records['Buffers']) for sample in mem_stats], \
+			   [(sample.time, sample.used) for sample in mem_stats], \
 			   proc_tree, [0, mem_scale])
 		draw_chart(ctx, MEM_CACHED_COLOR, True, chart_rect, \
-			   [(sample.time, sample.records['Cached']) for sample in mem_stats], \
+			   [(sample.time, sample.cached) for sample in mem_stats], \
 			   proc_tree, [0, mem_scale])
 		draw_chart(ctx, MEM_SWAP_COLOR, False, chart_rect, \
-			   [(sample.time, float(sample.records['SwapTotal'] - sample.records['SwapFree'])) for sample in mem_stats], \
+			   [(sample.time, float(sample.swap)) for sample in mem_stats], \
 			   proc_tree, None)
 
 		curr_y = curr_y + meminfo_bar_h
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 301145a..1c8d8ef 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -503,7 +503,7 @@ def _parse_proc_meminfo_log(file):
             sample.add_value(match.group(1), int(match.group(2)))
 
         if sample.valid():
-            mem_stats.append(sample)
+            mem_stats.append(DrawMemSample(sample))
 
     return mem_stats
 
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index bedca41..9fc309b 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -53,6 +53,22 @@ class MemSample:
         # discard incomplete samples
         return [v for v in MemSample.used_values if v not in keys] == []
 
+class DrawMemSample:
+    """
+    Condensed version of a MemSample with exactly the values used by the drawing code.
+    Initialized either from a valid MemSample or
+    a tuple/list of buffer/used/cached/swap values.
+    """
+    def __init__(self, mem_sample):
+        self.time = mem_sample.time
+        if isinstance(mem_sample, MemSample):
+            self.buffers = mem_sample.records['MemTotal'] - mem_sample.records['MemFree']
+            self.used = mem_sample.records['MemTotal'] - mem_sample.records['MemFree'] - mem_sample.records['Buffers']
+            self.cached = mem_sample.records['Cached']
+            self.swap = mem_sample.records['SwapTotal'] - mem_sample.records['SwapFree']
+        else:
+            self.buffers, self.used, self.cached, self.swap = mem_sample
+
 class DiskSpaceSample:
     def __init__(self, time):
         self.time = time
-- 
2.1.4


