Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCF4C0219B
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 22:12:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.38236.1739139168130917934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 14:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gD7S3Hr5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361815b96cso24592415e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 14:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739139166; x=1739743966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsjBkVW7EA6pdhnBPIYDn0I456wB0KMW0ejpulmCAQk=;
        b=gD7S3Hr5TRluL0su2lpiSHiOmSgrCOhs6sjKpvXgMjI+jeYCxA0VQfHDBXXn/Hh0kU
         sYvTy/ujgI25uMhaKA0E8C11Dogx8n4Ix4B59Rpseo+WkLM8lCrc7WsaJvB7Kgsn3HlD
         /YjEG3xnNXl3LbhphfJgHVu+TKNjs0r8A/TaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739139166; x=1739743966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsjBkVW7EA6pdhnBPIYDn0I456wB0KMW0ejpulmCAQk=;
        b=ZsawjOBM7pPRNHqAJD+7f+y4DLfp79ugBqi3N6K/z6GPCYlog1veeZwFetHtdVlb0A
         W3VLfziUS8z+edXQeBhqYYOa6kctvOgBGcJpgdw3o31AWUwBFjR+ir/b+ajrGcDEYzSj
         MQ9/2RnazM08kSgpFtY/X8NJasZ7bTugw/D1uTaUOv2U/rXnjK/BK9UUwobqqxddTLJU
         szsMInVQJz0YITvy3FFDT0z+iLDeOUEx8cSaoz1q9mOWWycqJ2NaOCFpGXPCakGUDsJ0
         1LFxQ4cuUYxehl52gWwrLjO1n8I2PjWuHl2GJiIL4uO0LgU01h3Cl7KdTg4AvulJ/1Ri
         IOyw==
X-Gm-Message-State: AOJu0YzuHt2+jspo4/jWPCAaHHprDV4NR1rHpiqCXYyvgJyBdqMn278L
	rZ8fAi0PvWpe6eCDhsXOT6DaCXtn0hTWtRgwLsFcrlShap2i6P6V6aER+GafY0cI1JMcSlHmjZj
	5
X-Gm-Gg: ASbGncsYQ2HSgCZ8LnfEet7cuM5GeWhds56p3jF9oOfAvD6cMTd947RtdqMq3zLYASg
	mQoKGlYk0EcCRmBSJJfsJs3iXi6qwq53a+oR5sQb1SvDgbUKuC2fieIcf5Di63ceoQLVyPU5azc
	eTu9tTw7gdGTAsoqafDOtmfyItmroOO8sLCnS2lCBVxkGH8IfGL/nR4h+v3PKylIkqznvWox9z2
	kFXJ98QmWYr2DgsQNDBexzwe3TYicfQCzVmpZ6rGBN5TWL6ELDLxDJmU9bKda035yRGds0PpzVf
	5qveDBWJTMQxEGuW9zmPwJoEG3otmlatJXVBcdCUXfKN
X-Google-Smtp-Source: AGHT+IHiF5nxP7R+ntAvHiCbshd6miT4ULoqVaOesNXZVfin8HX81YD8s1yISdkIR3ASH5VKeGW+Cw==
X-Received: by 2002:a05:6000:401f:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-38dde45c654mr1672960f8f.8.1739139165692;
        Sun, 09 Feb 2025 14:12:45 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:781a:bdb2:c1ab:8505])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd99472d0sm2906807f8f.80.2025.02.09.14.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:12:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ninette Adhikari <ninette.adhikari@gmail.com>
Subject: [PATCH] scripts/buildperf: Add chart tabs for commit count/time
Date: Sun,  9 Feb 2025 22:12:43 +0000
Message-ID: <20250209221243.220370-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 22:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211052

From: Ninette Adhikari <ninette.adhikari@gmail.com>

We triggered a test of an older revision to narrow down when performance
changed. The issue is that git's timestamps are granular to 1s. We'll
usually merge a set of commits at the same time so they will all have
the same timestamp for a block of them. This means that even if we use
the commit date, all the points can't be distinguished on the graph.
The author date doesn't work either as the commits are not merged in
author date order.

To solve this this patch adds the commit_count chart as a separate tab
next to the start_time chart

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../build_perf/html/measurement_chart.html    | 108 +++++++++++++++---
 scripts/lib/build_perf/html/report.html       |  71 +++++++++++-
 2 files changed, 156 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 05bd84e6cef..3cd713a2ee5 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -26,26 +26,36 @@
     ]
   });
 
+  const commitCountList = rawData.map(([commit, value, time]) => {
+    return commit
+  });
+
+  const commitCountData = rawData.map(([commit, value, time]) => {
+    return updateValue(value)
+  });
+
   // Set chart options
-  const option = {
+  const option_start_time = {
     tooltip: {
       trigger: 'axis',
       enterable: true,
       position: function (point, params, dom, rect, size) {
-        return [point[0]-150, '10%'];
+        return [point[0]+20, '10%'];
       },
       formatter: function (param) {
         const value = param[0].value[1]
         const sample  = rawData.filter(([commit, dataValue]) => updateValue(dataValue) === value)
+        const formattedDate = new Date(sample[0][2] * 1000).toString().replace(/GMT[+-]\d{4}/, '').replace(/\(.*\)/, '(CEST)');
+
         // Add commit hash to the tooltip as a link
         const commitLink = `https://git.yoctoproject.org/poky/commit/?id=${sample[0][3]}`
         if ('{{ measurement.value_type.quantity }}' == 'time') {
           const hours = Math.floor(value/60)
           const minutes = Math.floor(value % 60)
           const seconds = Math.floor((value * 60) % 60)
-          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <br/> <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>`
+          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
         }
-        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <br/> <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>`
+        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
       ;}
     },
     xAxis: {
@@ -79,22 +89,82 @@
     ]
   };
 
+  const option_commit_count = {
+    tooltip: {
+      trigger: 'axis',
+      enterable: true,
+      position: function (point, params, dom, rect, size) {
+        return [point[0]+20, '10%'];
+      },
+      formatter: function (param) {
+        const value = param[0].value
+        const sample  = rawData.filter(([commit, dataValue]) => updateValue(dataValue) === value)
+        const formattedDate = new Date(sample[0][2] * 1000).toString().replace(/GMT[+-]\d{4}/, '').replace(/\(.*\)/, '(CEST)');
+        // Add commit hash to the tooltip as a link
+        const commitLink = `https://git.yoctoproject.org/poky/commit/?id=${sample[0][3]}`
+        if ('{{ measurement.value_type.quantity }}' == 'time') {
+          const hours = Math.floor(value/60)
+          const minutes = Math.floor(value % 60)
+          const seconds = Math.floor((value * 60) % 60)
+          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
+        }
+        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
+      ;}
+    },
+    xAxis: {
+      name: 'Commit count',
+      type: 'category',
+      data: commitCountList
+    },
+    yAxis: {
+      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration in minutes' : 'Disk size in MB',
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
+        type: 'slider',
+        xAxisIndex: 0,
+        filterMode: 'none'
+      },
+    ],
+    series: [
+      {
+        name: '{{ measurement.value_type.quantity }}',
+        type: 'line',
+        step: 'start',
+        symbol: 'none',
+        data: commitCountData
+      }
+    ]
+  };
+
   // Draw chart
-  const chart_div = document.getElementById('{{ chart_elem_id }}');
-  // Set dark mode
-  let measurement_chart
-  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
-      measurement_chart= echarts.init(chart_div, 'dark', {
-      height: 320
-    });
-  } else {
-      measurement_chart= echarts.init(chart_div, null, {
-      height: 320
+  const draw_chart = (chart_id, option) => {
+    let chart_name
+    const chart_div = document.getElementById(chart_id);
+    // Set dark mode
+    if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
+        chart_name= echarts.init(chart_div, 'dark', {
+        height: 320
+      });
+    } else {
+        chart_name= echarts.init(chart_div, null, {
+        height: 320
+      });
+    }
+    // Change chart size with browser resize
+    window.addEventListener('resize', function() {
+      chart_name.resize();
     });
+    return chart_name.setOption(option);
   }
-  // Change chart size with browser resize
-  window.addEventListener('resize', function() {
-    measurement_chart.resize();
-  });
-  measurement_chart.setOption(option);
+
+  draw_chart('{{ chart_elem_start_time_id }}', option_start_time)
+  draw_chart('{{ chart_elem_commit_count_id }}', option_commit_count)
 </script>
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 537ed3ee529..28cd80e7380 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -9,7 +9,8 @@
 {% for test in test_data %}
   {% if test.status == 'SUCCESS' %}
     {% for measurement in test.measurements %}
-      {% set chart_elem_id = test.name + '_' + measurement.name + '_chart' %}
+      {% set chart_elem_start_time_id = test.name + '_' + measurement.name + '_chart_start_time' %}
+      {% set chart_elem_commit_count_id = test.name + '_' + measurement.name + '_chart_commit_count' %}
       {% include 'measurement_chart.html' %}
     {% endfor %}
   {% endif %}
@@ -116,6 +117,22 @@ a {
 a:hover {
   color: #8080ff;
 }
+button {
+  background-color: #F3F4F6;
+  border: none;
+  outline: none;
+  cursor: pointer;
+  padding: 10px 12px;
+  transition: 0.3s;
+  border-radius: 8px;
+  color: #3A4353;
+}
+button:hover {
+  background-color: #d6d9e0;
+}
+.tab button.active {
+  background-color: #d6d9e0;
+}
 @media (prefers-color-scheme: dark) {
   :root {
     --text: #e9e8fa;
@@ -126,6 +143,16 @@ a:hover {
     --trborder: #212936;
     --chartborder: #b1b0bf;
   }
+  button {
+    background-color: #28303E;
+    color: #fff;
+  }
+  button:hover {
+    background-color: #545a69;
+  }
+  .tab button.active {
+    background-color: #545a69;
+  }
 }
 </style>
 
@@ -233,7 +260,18 @@ a:hover {
             <tr>
               <td style="width: 75%">
                 {# Linechart #}
-                <div id="{{ test.name }}_{{ measurement.name }}_chart"></div>
+                <div class="tab {{ test.name }}_{{ measurement.name }}_tablinks">
+                  <button class="tablinks active" onclick="openChart(event, '{{ test.name }}_{{ measurement.name }}_start_time', '{{ test.name }}_{{ measurement.name }}')">Chart with start time</button>
+                  <button class="tablinks" onclick="openChart(event, '{{ test.name }}_{{ measurement.name }}_commit_count', '{{ test.name }}_{{ measurement.name }}')">Chart with commit count</button>
+                </div>
+                <div class="{{ test.name }}_{{ measurement.name }}_tabcontent">
+                  <div id="{{ test.name }}_{{ measurement.name }}_start_time" class="tabcontent" style="display: block;">
+                    <div id="{{ test.name }}_{{ measurement.name }}_chart_start_time"></div>
+                  </div>
+                  <div id="{{ test.name }}_{{ measurement.name }}_commit_count" class="tabcontent" style="display: none;">
+                    <div id="{{ test.name }}_{{ measurement.name }}_chart_commit_count"></div>
+                  </div>
+                </div>
               </td>
               <td>
                 {# Measurement statistics #}
@@ -340,6 +378,31 @@ a:hover {
       <div class="preformatted">{{ test.message }}</div>
     {% endif %}
   {% endfor %}
-</div></body>
-</html>
+</div>
 
+<script>
+function openChart(event, chartType, chartName) {
+  let i, tabcontents, tablinks
+  tabcontents = document.querySelectorAll(`.${chartName}_tabcontent > .tabcontent`);
+  tabcontents.forEach((tabcontent) => {
+    tabcontent.style.display = "none";
+  });
+
+  tablinks = document.querySelectorAll(`.${chartName}_tablinks > .tablinks`);
+  tablinks.forEach((tabLink) => {
+    tabLink.classList.remove('active');
+  });
+
+  const targetTab = document.getElementById(chartType)
+  targetTab.style.display = "block";
+
+  // Call resize on the ECharts instance to redraw the chart
+  const chartContainer = targetTab.querySelector('div')
+  echarts.init(chartContainer).resize();
+
+  event.currentTarget.classList.add('active');
+}
+</script>
+
+</body>
+</html>

