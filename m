Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CCFC00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:41:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.22970.1713192095855731800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 07:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=e96ZD7jn;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.48, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a54176639ecso86405166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713192094; x=1713796894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6s5sWiceyBTsH3kZm31IGPFI5TuXN4k2D0HgTwSDlgg=;
        b=e96ZD7jnFuFWsndh3lFSu24hDfvrqyvj6gk1KB2kirsFoyFsnmF+Q2iJFiUhA0ZrVL
         4t7LNJsQRm9ePI7OIlKSwUATFQd/e85Cq0Da+tO+BT8n0oQrh6Cce4cPp/3WPccoP4oW
         xt0eOQQTFvHphLdWgYOuXRmGpq/eybOeQDvmKZJjSKGJrGVZh08BDv5rkrueAnQwU55l
         029yN0dYyLYTp/v0Ym8FaY2FYeva9y0H++LQcL3jjLfxRAJ4NkAzDtT3OThlfY6tsdVw
         sbiUOiOTCHIyJ1V6OccaZhUXBMcrg980DamMfL5x2OLEGzJx5EIOhvdi1PuucWNWcxQg
         OGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713192094; x=1713796894;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6s5sWiceyBTsH3kZm31IGPFI5TuXN4k2D0HgTwSDlgg=;
        b=kxmvlfpQWeC9yUqnsRKVplQ+OJcWOFfsF3mtYPwBHUaI7mNTMrawIemadFCmEQVMi4
         L14bj5X1rhrTRvwfFjmuhUKhCgulFxzkdww8+bE+m1rECcDeZh0Zdzzon+MsscAHeQ4C
         I+PvN+ze6kzW+lBiacbwi0OU23ASLA2KXsRHD9xRYh8giuvNmGJDLvl+fV55bF8LLpqd
         0VRDbeayrSVkdagTCOe5UN/tnMhvkSaaYspOEdaJIhomFn2NOOxVN5N5pfTBql5sbo4C
         h11vUhxGqVeG+/tsflSAGgRjKTZC+COOxEZg6JRdnPFDLB7iEgJczD4jSjrtPRWlyr6m
         1URA==
X-Gm-Message-State: AOJu0YxPC9iNeXQ5639yU5tx0w/e1oG671ljq72ZFdw7S8OIq1A4TjiM
	QGtngNeU7wiP6J9hdmveFtoK7baK4HyTenXVafxjOs8klPZdfsas/bC+Nty2QVv8Bul/V5yRB2P
	D
X-Google-Smtp-Source: AGHT+IFI9oVFZEzImTx3N7f9vl+533+YnvMg0bdm7Rc7WnMdxt0yUDnL/eG8MG95rSyuKEMakYO34w==
X-Received: by 2002:a17:907:7f94:b0:a50:e069:55ab with SMTP id qk20-20020a1709077f9400b00a50e06955abmr7829611ejc.55.1713192094127;
        Mon, 15 Apr 2024 07:41:34 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id bq3-20020a170906d0c300b00a522f867697sm4658749ejb.132.2024.04.15.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 07:41:33 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/3] oe-build-perf-report: Add apache echarts to make report interactive
Date: Mon, 15 Apr 2024 16:41:27 +0200
Message-ID: <20240415144129.92641-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415144129.92641-1-ninette@thehoodiefirm.com>
References: <20240415144129.92641-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 14:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198240

From: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>

- Add Apache echarts (https://echarts.apache.org/en/index.html) library to create build performance charts.
- Restructure data to time and value array format so that it can be used by echarts.
- This commit also converts test duration to minutes to map against the values axis.
- Zoom is added to the line charts.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../build_perf/html/measurement_chart.html    | 116 +++++++++++-------
 scripts/lib/build_perf/html/report.html       |   6 +-
 2 files changed, 72 insertions(+), 50 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 65f1a227ad..ffec3d09db 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -1,50 +1,76 @@
-<script type="text/javascript">
-  chartsDrawing += 1;
-  google.charts.setOnLoadCallback(drawChart_{{ chart_elem_id }});
-  function drawChart_{{ chart_elem_id }}() {
-    var data = new google.visualization.DataTable();
+<script type="module">
+  // Get raw data
+  const rawData = [
+    {% for sample in measurement.samples %}
+      [{{ sample.commit_num }}, {{ sample.mean.gv_value() }}, {{ sample.start_time }}],
+    {% endfor %}
+  ];
 
-    // Chart options
-    var options = {
-      theme : 'material',
-      legend: 'none',
-      hAxis: { format: '', title: 'Commit number',
-               minValue: {{ chart_opts.haxis.min }},
-               maxValue: {{ chart_opts.haxis.max }} },
-      {% if measurement.type == 'time' %}
-      vAxis: { format: 'h:mm:ss' },
-      {% else %}
-      vAxis: { format: '' },
-      {% endif %}
-      pointSize: 5,
-      chartArea: { left: 80, right: 15 },
-    };
+  const convertToMinute = (time) => {
+    return time[0]*60 + time[1] + time[2]/60 + time[3]/3600;
+  }
 
-    // Define data columns
-    data.addColumn('number', 'Commit');
-    data.addColumn('{{ measurement.value_type.gv_data_type }}',
-                   '{{ measurement.value_type.quantity }}');
-    // Add data rows
-    data.addRows([
-      {% for sample in measurement.samples %}
-        [{{ sample.commit_num }}, {{ sample.mean.gv_value() }}],
-      {% endfor %}
-    ]);
+  // Convert raw data to the format: [time, value]
+  const data = rawData.map(([commit, value, time]) => {
+    return [
+      new Date(time * 1000).getTime(), // The Date object takes values in milliseconds rather than seconds. So to use a Unix timestamp we have to multiply it by 1000.
+      Array.isArray(value) ? convertToMinute(value) : value // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
+    ]
+  });
 
-    // Finally, draw the chart
-    chart_div = document.getElementById('{{ chart_elem_id }}');
-    var chart = new google.visualization.LineChart(chart_div);
-    google.visualization.events.addListener(chart, 'ready', function () {
-      //chart_div = document.getElementById('{{ chart_elem_id }}');
-      //chart_div.innerHTML = '<img src="' + chart.getImageURI() + '">';
-      png_div = document.getElementById('{{ chart_elem_id }}_png');
-      png_div.outerHTML = '<a id="{{ chart_elem_id }}_png" href="' + chart.getImageURI() + '">PNG</a>';
-      console.log("CHART READY: {{ chart_elem_id }}");
-      chartsDrawing -= 1;
-      if (chartsDrawing == 0)
-        console.log("ALL CHARTS READY");
-    });
-    chart.draw(data, options);
-}
+  // Set chart options
+  const option = {
+    tooltip: {
+      trigger: 'axis',
+      position: function (pt) {
+        return [pt[0], '10%'];
+      },
+      valueFormatter: (value) => value.toFixed(2)
+    },
+    xAxis: {
+      type: 'time',
+    },
+    yAxis: {
+      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration (minutes)' : 'Disk size (MB)',
+      type: 'value',
+      min: function(value) {
+        return Math.round(value.min - 0.5);
+      },
+      max: function(value) {
+        return Math.round(value.max + 0.5);
+      }
+    },
+    dataZoom: [
+      {
+        type: 'inside',
+        start: 0,
+        end: 100
+      },
+      {
+        start: 0,
+        end: 100
+      }
+    ],
+    series: [
+      {
+        name: '{{ measurement.value_type.quantity }}',
+        type: 'line',
+        smooth: true,
+        symbol: 'none',
+        data: data
+      }
+    ]
+  };
+
+  // Draw chart
+  const chart_div = document.getElementById('{{ chart_elem_id }}');
+  const measurement_chart= echarts.init(chart_div, null, {
+    height: 320
+  });
+  // Change chart size with browser resize
+  window.addEventListener('resize', function() {
+    measurement_chart.resize();
+  });
+  measurement_chart.setOption(option);
 </script>
 
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index d1ba6f2578..653fd985bc 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -3,11 +3,7 @@
 <head>
 {# Scripts, for visualization#}
 <!--START-OF-SCRIPTS-->
-<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
-<script type="text/javascript">
-google.charts.load('current', {'packages':['corechart']});
-var chartsDrawing = 0;
-</script>
+<script src=" https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js "></script>
 
 {# Render measurement result charts #}
 {% for test in test_data %}
-- 
2.44.0


