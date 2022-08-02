Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D21C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 19:12:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.10444.1659467517638787894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 12:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hnimdMuH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id v5so7671208wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 12:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ROymTLzLPw23qbQr4hMuR2ydtnkNM7jlogsUWMdOfdo=;
        b=hnimdMuHnxwaigoEYskZUkZpGT0ZcO2GoBmlFGmjREbtYAONMYEaF9uCPXoUzokYQX
         6DKmOe9CqPr2M3Qi8vh7c0KOYDVdBibxnn+ivrlut5dY7VlInAhJ2eeD/qv9ChA1U7y4
         0Le1OR4Vs+I72fnrTcp1KpRS1BKSoCABEki3ikw+scPSNjdsJiWqEgan0plZ+/P9c8hy
         CM8cV63CE+EPQlHZe5XWhHjkbAt+Eo1BYWnnIJ59yd2w2a6FluOqggvetAXY6FVCe+lj
         cLnMJ8pnQNgsdeHE67S6uerKEHpKzcMPybEW6Q5F/Of5xNyWAmbSFkYfhZ0iYszwKiO1
         IX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ROymTLzLPw23qbQr4hMuR2ydtnkNM7jlogsUWMdOfdo=;
        b=z2zwmTnkEZxxqLhro+110lXRbA3i0AVR729my0BR1D6WkRWXIg0D74v9LNbI0ldrMa
         27dFZ6WQDZdZD3bvcx6utwG3b6hJmQMJLT745kPkzOI9FijJqrlNrn6cUnzTC1/2mtgh
         oxbubVMX4prpiLFX0enjNplqWAbpsrkK/ayXNuvEQogIydcjL3jciAqq4RWYCe4aKVPF
         VumKnm1ujF86LsaKLffyalgDvtVLQQ8naRzNEriSZkMqw+rAiH23DNSGngtqMCbEZ53c
         5WIsm0lZzfr0C2qRcvCURzDKzRxhJwE3zOTTeH6qhs+WuJJePskzTDPb4RVsAGzuYNVw
         3jrQ==
X-Gm-Message-State: ACgBeo3MW0539nXt+bH96sT9sDw9RFbNwQbyFzZk9RJEdg+2UXKoc1+B
	qCmhNhn+JMJSc6G2WFSJ3o4EwosjCV0=
X-Google-Smtp-Source: 
 AA6agR669PqtMsJUcFY7DqEf2EU45Wl8QArzM7/8Z/JJrn99a2eVN3DpmqdDZuodYqK+01AmujRX8w==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr527151wmj.113.1659467515766;
        Tue, 02 Aug 2022 12:11:55 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b003a4ef39b8f3sm2802569wms.18.2022.08.02.12.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 12:11:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Aryaman Gupta <aryaman.gupta@windriver.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] pybootchartgui: render memory pressure as well
Date: Tue,  2 Aug 2022 21:11:26 +0200
Message-Id: <20220802191126.697586-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 19:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168801

* memory pressure is already collected in buildstats, render it as well
  when available
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 44 +++++++++++++++++--
 .../pybootchartgui/pybootchartgui/parsing.py  |  5 +++
 .../pybootchartgui/pybootchartgui/samples.py  |  8 ++++
 3 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index a13df3a3fa..3926bdd11e 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -88,6 +88,10 @@ CPU_PRESSURE_TOTAL_COLOR = CPU_COLOR
 IO_PRESSURE_AVG10_COLOR = (0.0, 0.0, 0.0, 1.0)
 # delta total IO pressure color
 IO_PRESSURE_TOTAL_COLOR = IO_COLOR
+# avg10 memory pressure color
+MEM_PRESSURE_AVG10_COLOR = (0.0, 0.0, 0.0, 1.0)
+# delta total memory pressure color
+MEM_PRESSURE_TOTAL_COLOR = DISK_TPUT_COLOR
 
 
 
@@ -460,12 +464,12 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
         curr_y = curr_y + 30 + bar_h
 
-    # render delta total io
+    # render I/O pressure chart
     if trace.io_pressure:
         draw_legend_line(ctx, "avg10 I/O Pressure", IO_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
         draw_legend_box(ctx, "delta total I/O Pressure", IO_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
 
-        # render avg10 io
+        # render delta total io
         chart_rect = (off_x, curr_y+30, w, bar_h)
         if clip_visible (clip, chart_rect):
             draw_box_ticks (ctx, chart_rect, sec_w)
@@ -474,7 +478,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                     [(sample.time, sample.deltaTotal) for sample in trace.io_pressure], \
                     proc_tree, None)
 
-        # render io pressure
+        # render avg10 io
         max_sample = max (trace.io_pressure, key = lambda s: s.avg10)
         if clip_visible (clip, chart_rect):
             draw_chart (ctx, IO_PRESSURE_AVG10_COLOR, False, chart_rect, \
@@ -487,11 +491,45 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
         if (pos_x < off_x + 245):
             shift_x, shift_y = 5, 40
 
+
         label = "%d%%" % (max_sample.avg10)
         draw_text (ctx, label, IO_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
 
         curr_y = curr_y + 30 + bar_h
 
+    # render MEM pressure chart
+    if trace.mem_pressure:
+        draw_legend_line(ctx, "avg10 MEM Pressure", MEM_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total MEM Pressure", MEM_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+
+        # render delta total mem
+        chart_rect = (off_x, curr_y+30, w, bar_h)
+        if clip_visible (clip, chart_rect):
+            draw_box_ticks (ctx, chart_rect, sec_w)
+            draw_annotations (ctx, proc_tree, trace.times, chart_rect)
+            draw_chart (ctx, MEM_PRESSURE_TOTAL_COLOR, True, chart_rect, \
+                    [(sample.time, sample.deltaTotal) for sample in trace.mem_pressure], \
+                    proc_tree, None)
+
+        # render avg10 mem
+        max_sample = max (trace.mem_pressure, key = lambda s: s.avg10)
+        if clip_visible (clip, chart_rect):
+            draw_chart (ctx, MEM_PRESSURE_AVG10_COLOR, False, chart_rect, \
+                    [(sample.time, sample.avg10) for sample in trace.mem_pressure], \
+                    proc_tree, None)
+
+        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+
+        shift_x, shift_y = -20, 20
+        if (pos_x < off_x + 245):
+            shift_x, shift_y = 5, 40
+
+
+        label = "%d%%" % (max_sample.avg10)
+        draw_text (ctx, label, MEM_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
+
+        curr_y = curr_y + 30 + bar_h
+
     # render disk space usage
     #
     # Draws the amount of disk space used on each volume relative to the
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 004d6fb953..362d5153e8 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -51,6 +51,7 @@ class Trace:
         self.monitor_disk = None
         self.cpu_pressure = []
         self.io_pressure = []
+        self.mem_pressure = []
         self.times = [] # Always empty, but expected by draw.py when drawing system charts.
 
         if len(paths):
@@ -564,6 +565,8 @@ def _parse_pressure_logs(file, filename):
     pressure_stats = []
     if filename == "cpu.log":
         SamplingClass = CPUPressureSample
+    elif filename == "memory.log":
+        SamplingClass = MemPressureSample
     else:
         SamplingClass = IOPressureSample
     for time, lines in _parse_timed_blocks(file):
@@ -769,6 +772,8 @@ def _do_parse(writer, state, filename, file):
         state.cpu_pressure = _parse_pressure_logs(file, name)
     elif name == "io.log":
         state.io_pressure = _parse_pressure_logs(file, name)
+    elif name == "memory.log":
+        state.mem_pressure = _parse_pressure_logs(file, name)
     elif not filename.endswith('.log'):
         _parse_bitbake_buildstats(writer, state, filename, file)
     t2 = time.process_time()
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 472dc27be0..a70d8a5a28 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -53,6 +53,14 @@ class IOPressureSample:
         self.avg300 = avg300
         self.deltaTotal = deltaTotal
 
+class MemPressureSample:
+    def __init__(self, time, avg10, avg60, avg300, deltaTotal):
+        self.time = time
+        self.avg10 = avg10
+        self.avg60 = avg60
+        self.avg300 = avg300
+        self.deltaTotal = deltaTotal
+
 
 class MemSample:
     used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
-- 
2.35.1


