Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF340C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:43:49 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.14880.1714747427174534860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=qJDCBsGR;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.41, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-572adaa172cso2427894a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714747425; x=1715352225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7lDlcqKNspL3K1VgWcO6LUgJSEP1qm/7i0L+k+2Hh0U=;
        b=qJDCBsGRZSwTdqxfARFtvIP7XS5e6oY2gxBxmVkS+EcVKU7BvHGR5SSsBIdj2ce8p+
         RrxEyMBw77hrItGp9E/9xCDFT4pY4i/z2QWUOWWFjnRufzJ9P7oEpdAeOEG/nFP9kj1e
         VtQfsuagY3x9yBy8WPeyzyYW+iwKExl4BSafm3qo7cdQPeyGfgg7DOXKy2+B9W5B9spN
         WTIEprFfnn1drx8yaegaesum9VH2hzvY0QTaaJDiwCZZvliIOjXsnCf9yJX1iZT0/K/l
         T1mUH5fjwiaHFezFnnBsaMQVJAh4E5N/miJrm8FXOq123laCFQKzpa7+naWk8oAn+rVm
         vMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747425; x=1715352225;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lDlcqKNspL3K1VgWcO6LUgJSEP1qm/7i0L+k+2Hh0U=;
        b=h2JqF8roqbOmyaHCxPnLsc3PuqdhzLLJwWxH1K7r7L4rCb1OFiLmyOALrBiEuFISjd
         QSTTjRo+RdE1hqDD5vjoDtNdAN9vy1hxmyZDlNd5pJJuT5AkyQ4XX7ZlLbAX0pae17BV
         4b9uTJucsq/ngvajIMQ2H9Wkz1GsA8BXbWyWn5mKB2/tn1CIYofBMMPgxsMQ0gdh0XcE
         htuQD3Yixo2ePlaenDRzOnmbSk5tGj3b43pry/MsBY3tfzpRzSAXZFVE6b/hrpYS9hHV
         oASTWRTxrFP47WA2SG7mOHTv/duW97ohSIwJKfjnlumNgYwQi0axNXgnZi8zQ4VyhiwN
         X5Ww==
X-Gm-Message-State: AOJu0Yz3oMn3sdGlPn4CTaQ/k6jIiZ/Qkxg+QDNNBSNXrQsZ/3zC2tUu
	gWws6P+cThhzz5bpMcmUL3zHP/ayIvlb4Wlrh4T/A+1tlKQvcIktEi+WQLeh6w3BaEsb0LQuArl
	w4kM=
X-Google-Smtp-Source: AGHT+IG1+LHQjPyOyGTBjlOFOCBiVFWGLsM9DXctLy7KLtM8G+JerppUfSfUx/re6nDS5CF/WEkpgg==
X-Received: by 2002:a50:c04d:0:b0:572:1fb7:2a77 with SMTP id u13-20020a50c04d000000b005721fb72a77mr2600433edd.6.1714747425412;
        Fri, 03 May 2024 07:43:45 -0700 (PDT)
Received: from localhost.localdomain ([95.90.235.164])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b005721b7bfea2sm1731017edb.22.2024.05.03.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:43:45 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	engineering@neighbourhood.ie,
	Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>
Subject: [PATCH v2 1/5] oe-build-perf-report: Add apache echarts to make report interactive
Date: Fri,  3 May 2024 16:43:36 +0200
Message-ID: <20240503144340.27385-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503144340.27385-1-ninette@thehoodiefirm.com>
References: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
 <20240503144340.27385-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198997

From: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>

- Add Apache echarts (https://echarts.apache.org/en/index.html) library to create build performance charts.
- Restructure data to time and value array format so that it can be used by echarts.
- This commit also converts test duration to minutes to map against the values axis.
- Zoom is added to the line charts.
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


