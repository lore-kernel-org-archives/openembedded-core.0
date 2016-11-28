Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C8F5171AB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:38 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m5so97715661ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=h5jfeBwqYjtzA8Os/r6r3MK1A71PXiMBVY6m4mQ6Mpo=;
	b=xPWrK3+kxf9N9K/68xshf54aHi6HpLaW3wtm1SoJgqzEIHK42DUKCmvfCr4AtSFpi7
	NZy0nKaaZdXedqLa6yjlNPwlYMC5kx0VmgTD4WYZ+3Tj2WYVm/5V/GOPFlrjjXuHMenQ
	b7oxVJE3xV4W49rXHrhrx/Mcgd3i3H2oVXVorWo/WQf9VXKJENo9sdWuOGLT24bYbrUD
	6S0YutYAh8utwRyX0pcLpSfr28SP3Gu5bipaxHI9FuBsOS+BqGXvN4s7ebkxDmtY4WPJ
	I5SOzCafPd4WdRxkxzA9JZZs8897qK1oYTsIO2hZZFsI9K0URSvz32kxudpFYhZ+tYn2
	eBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=h5jfeBwqYjtzA8Os/r6r3MK1A71PXiMBVY6m4mQ6Mpo=;
	b=mAQQbVrkvwzLWQGN6pfNGgRJaDLWhVDwXJZEaZiyQ/IlrlU3dlP3amO/24rRxvsoXR
	MFEKDFgeUYfZTjfNOLDHAeNW9rjN/oqaldcctx/+5vSjGs1nqNAdBGfFE8Iii77B2GFy
	lHxnp+CXeJCqs2bo7YEuidWS3QnhSXDIJ0werDuafi1lcIOWL4Jtx8U2O2kaJWYZf8f7
	h4G/sefsruONzcnYzGmwC4m9E8iSoAczrCNdePaUuN5yNNHb3aaACd2OFdBY8apAmLm8
	ZEne1qA+YivXIjcsHDTjocnovwSbeCvEY6H7xRmICFq6RRFWINiErKHpfRgQ3ogX5Ha5
	TpZQ==
X-Gm-Message-State: AKaTC0133UJN8ZQB7bqxA5BMcAghcq3EbZ7TprS7bwkdHB1XPteu1yy8pOx5svo2XCrUyEWk
X-Received: by 10.36.28.204 with SMTP id c195mr18685678itc.81.1480347219435;
	Mon, 28 Nov 2016 07:33:39 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	m83sm5332339ioi.11.2016.11.28.07.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:38 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:10 +0100
Message-Id: <ec991bdcf8652151e2264ba03345cd15e6407be7.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
References: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1480346284.git.patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
Subject: [PATCH 09/11] pybootchartgui: simplify drawing of memory usage
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:39 -0000

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


