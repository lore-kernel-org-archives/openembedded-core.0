Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D38CC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 15:13:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.9953.1659539586682544667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 08:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ct4f2R9q;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id j1so13582898wrw.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=R3bMdaqU4lZOfXi2o1dC/NCT/Vsy+p3Rput4XIbfCQs=;
        b=ct4f2R9q3J9N5BQLNl83g8hd8iW4gZLxAps/50373OruR0Ib4gfTjydMGfExA6r94u
         whYsm31gCY9r2QVNUAjPLoD/bJRDzqVDlDjoqT9EKFWWmtB9Ka84d5aqcMO7aM3fBBcI
         De93W64u+ivPNNkDQQTH6iOKRqMKQRi+sE372lSAoHmTKHb6Fksb5s1FJmFObQIqS6dX
         1AZZOhc76TMER2Jx8pDB8LDMRO90mDEQeSQHEGheRD+m8XYLQqsFBx3aKQ/vSpTbkbHl
         bDrfSCzyKRi1SWBosWBu2EzRJFxITZ+f0oULM7LpZ37vDIBlCq21moBvEMruTiSyehDm
         gSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=R3bMdaqU4lZOfXi2o1dC/NCT/Vsy+p3Rput4XIbfCQs=;
        b=EJ3CpICQLyMaU4fHsEi1F5GtSrM8eD5mbEMUuuiM3LvAfGrRFBZj7MvujhtCL3R3u+
         atXGn7Hit+oonmsz8zPu9dLQ3Wn7VOzZWQ9FiCjOlr0/Ezp5SKZIewB85tKnzTmLecBd
         yhR7SHcvetbQKqRDsoDiVpUTkhqK2o5QTnPaEvFnZHdP922iHdbAaiMFlmqBMPRoJeJh
         Gqpgj9sFruJhgLZGoOp6hZid6V5lL21GXs8lSlwG9hZjnvBZJA/5tRF3X6jNyH6dmn2n
         ElJy5bFToPJ5OHv+tzMVIv4nrE1k7QXmjIS2INLdPWEOBIfUQARMkQmDjz4s0MQLUUV8
         s81Q==
X-Gm-Message-State: ACgBeo2hgMzdIepVVvwtM+XlKTehU9I3F6Bp1mbNYd4NiaKcgLiUFJW7
	x2ZxJh9NskcOigBItl6bMe/i14UbVA4=
X-Google-Smtp-Source: 
 AA6agR6j7+sA4A3JGwAj4pqnq4wb27zwmXDbL9CS0G6/8DLdmbn4Jc8agBhAinCalPwg7Dn+cGdM8Q==
X-Received: by 2002:a5d:64aa:0:b0:21e:be27:6dfb with SMTP id
 m10-20020a5d64aa000000b0021ebe276dfbmr16959243wrp.456.1659539585032;
        Wed, 03 Aug 2022 08:13:05 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a501ad8648sm1993482wmq.40.2022.08.03.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 08:13:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Aryaman Gupta <aryaman.gupta@windriver.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] pybootchartgui: write the max values in the graph legend
Date: Wed,  3 Aug 2022 17:12:30 +0200
Message-Id: <20220803151230.3510723-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220803151230.3510723-1-Martin.Jansa@gmail.com>
References: <17079CEA61EEB51A.26827@lists.openembedded.org>
 <20220803151230.3510723-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 15:13:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168823

* easier to find than searching for the highest value in the graph, when the graph is really wide

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 4e04b06427..4326361426 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -433,8 +433,10 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
     # render CPU pressure chart
     if trace.cpu_pressure:
-        draw_legend_line(ctx, "avg10 CPU Pressure", CPU_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "delta total CPU Pressure", CPU_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+        max_sample_avg = max (trace.cpu_pressure, key = lambda s: s.avg10)
+        max_sample_total = max (trace.cpu_pressure, key = lambda s: s.deltaTotal)
+        draw_legend_line(ctx, "avg10 CPU Pressure (max %d%%)"  % (max_sample_avg.avg10), CPU_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total CPU Pressure (max %d)" % (max_sample_total.deltaTotal), CPU_PRESSURE_TOTAL_COLOR, off_x + 240, curr_y+20, leg_s)
 
         # render delta total cpu
         chart_rect = (off_x, curr_y+30, w, bar_h)
@@ -446,28 +448,29 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                     proc_tree, None)
 
         # render avg10 cpu
-        max_sample = max (trace.cpu_pressure, key = lambda s: s.avg10)
         if clip_visible (clip, chart_rect):
             draw_chart (ctx, CPU_PRESSURE_AVG10_COLOR, False, chart_rect, \
                     [(sample.time, sample.avg10) for sample in trace.cpu_pressure], \
                     proc_tree, None)
 
-        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+        pos_x = off_x + ((max_sample_avg.time - proc_tree.start_time) * w / proc_tree.duration)
 
         shift_x, shift_y = -20, 20
         if (pos_x < off_x + 245):
             shift_x, shift_y = 5, 40
 
 
-        label = "%d%%" % (max_sample.avg10)
+        label = "%d%%" % (max_sample_avg.avg10)
         draw_text (ctx, label, CPU_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
 
         curr_y = curr_y + 30 + bar_h
 
     # render I/O pressure chart
     if trace.io_pressure:
-        draw_legend_line(ctx, "avg10 I/O Pressure", IO_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "delta total I/O Pressure", IO_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+        max_sample_avg = max (trace.io_pressure, key = lambda s: s.avg10)
+        max_sample_total = max (trace.io_pressure, key = lambda s: s.deltaTotal)
+        draw_legend_line(ctx, "avg10 I/O Pressure (max %d%%)"  % (max_sample_avg.avg10), IO_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total I/O Pressure (max %d)" % (max_sample_total.deltaTotal), IO_PRESSURE_TOTAL_COLOR, off_x + 240, curr_y+20, leg_s)
 
         # render delta total io
         chart_rect = (off_x, curr_y+30, w, bar_h)
@@ -479,28 +482,29 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                     proc_tree, None)
 
         # render avg10 io
-        max_sample = max (trace.io_pressure, key = lambda s: s.avg10)
         if clip_visible (clip, chart_rect):
             draw_chart (ctx, IO_PRESSURE_AVG10_COLOR, False, chart_rect, \
                     [(sample.time, sample.avg10) for sample in trace.io_pressure], \
                     proc_tree, None)
 
-        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+        pos_x = off_x + ((max_sample_avg.time - proc_tree.start_time) * w / proc_tree.duration)
 
         shift_x, shift_y = -20, 20
         if (pos_x < off_x + 245):
             shift_x, shift_y = 5, 40
 
 
-        label = "%d%%" % (max_sample.avg10)
+        label = "%d%%" % (max_sample_avg.avg10)
         draw_text (ctx, label, IO_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
 
         curr_y = curr_y + 30 + bar_h
 
     # render MEM pressure chart
     if trace.mem_pressure:
-        draw_legend_line(ctx, "avg10 MEM Pressure", MEM_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
-        draw_legend_box(ctx, "delta total MEM Pressure", MEM_PRESSURE_TOTAL_COLOR, off_x + 140, curr_y+20, leg_s)
+        max_sample_avg = max (trace.mem_pressure, key = lambda s: s.avg10)
+        max_sample_total = max (trace.mem_pressure, key = lambda s: s.deltaTotal)
+        draw_legend_line(ctx, "avg10 MEM Pressure (max %d%%)"  % (max_sample_avg.avg10), MEM_PRESSURE_AVG10_COLOR, off_x, curr_y+20, leg_s)
+        draw_legend_box(ctx, "delta total MEM Pressure (max %d)" % (max_sample_total.deltaTotal), MEM_PRESSURE_TOTAL_COLOR, off_x + 240, curr_y+20, leg_s)
 
         # render delta total mem
         chart_rect = (off_x, curr_y+30, w, bar_h)
@@ -512,20 +516,19 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
                     proc_tree, None)
 
         # render avg10 mem
-        max_sample = max (trace.mem_pressure, key = lambda s: s.avg10)
         if clip_visible (clip, chart_rect):
             draw_chart (ctx, MEM_PRESSURE_AVG10_COLOR, False, chart_rect, \
                     [(sample.time, sample.avg10) for sample in trace.mem_pressure], \
                     proc_tree, None)
 
-        pos_x = off_x + ((max_sample.time - proc_tree.start_time) * w / proc_tree.duration)
+        pos_x = off_x + ((max_sample_avg.time - proc_tree.start_time) * w / proc_tree.duration)
 
         shift_x, shift_y = -20, 20
         if (pos_x < off_x + 245):
             shift_x, shift_y = 5, 40
 
 
-        label = "%d%%" % (max_sample.avg10)
+        label = "%d%%" % (max_sample_avg.avg10)
         draw_text (ctx, label, MEM_PRESSURE_AVG10_COLOR, pos_x + shift_x, curr_y + shift_y)
 
         curr_y = curr_y + 30 + bar_h
-- 
2.35.1


