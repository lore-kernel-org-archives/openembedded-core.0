Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55263D25B59
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 12:59:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12581.1769605118769252138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 04:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Gx0bO/lt;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.51, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so8482105e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 04:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1769605117; x=1770209917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqBZSwRAkB8SGkd0FskrTityMyV+AEixyxHJsva50rQ=;
        b=Gx0bO/ltwXKfou/Ia965Dux8Pi/PE55UjwNbsXd9XPmgLvrb1pWpIbV9cJBhcgFsFR
         +y0JtXBfR9g5yO+EpTLf2a0n7GLejIheAgtBK7eS6dgO5HC5qXWLrojZyyKKkAtQPe8p
         311tyFFs4vXvXWGcuz+IYMJyqkcjllZNge4dTajaVXLnQRRR4kynNd6/LJ2cFipDSVtU
         XDM+ULu8X6YCzzW8xDPcV86Bf4i4MkQT8ngo0ff9d2eJ9trM0tNdqk/PuAlbsxh4nifI
         ZlrvFVpvtTpjWwGyOSwho7QJVp4Q+gkrSVYAfb0D7hFBByjt0fvjJfSOoz3BXRA9nkMp
         9ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605117; x=1770209917;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqBZSwRAkB8SGkd0FskrTityMyV+AEixyxHJsva50rQ=;
        b=ZPrf3UM5Otf2S5ns8tsyhYKhhPJa7O9bkNGXZxmz/fwqa0Tub+anW4dy+UuPFP1L0R
         P+XsefRaef9GQoBEbzMijXydLyxoMxDm2EYb1psZc4Xl3LH6bREOjcQ0IlWe4mM0RNo9
         0MYsGZluu65xuQvtFp92jN8ct6TUeAZZ6QZKbv//8/2gkpyoPyQAdzq+/A7kHOn3sNUt
         icNcnmQ66V/yq4E7j48DgsXR/csYXOrzSDlr0G8ZRIbgvHAi4yNwgSCrvA5mcTWswevV
         EZWXg2zxIuVgklxDBJroUJIqPcQonyE6/Fd79NkDrYmwb/kDu/1E6pFuHB9Qu2fGhASC
         Jt4g==
X-Gm-Message-State: AOJu0YyLVNjrwE2SyUxX9RS56YWOtUQ3y1oH35QoZTYRzxqSUPYxs0hl
	8XW33pI9N1vxZpOTOoHNRkSrZnlqIBQAKlv+fU7b6K1f7k0Fih9jQBRRyHpE3XbwEYgzILE98sK
	G9XvO/k0=
X-Gm-Gg: AZuq6aKA+JeglYP7Skc8dsV+YxYSQKhgZYMF48UMjHinrxK9QSRaiyZpCfegCqbWC1u
	eFVt3VaYKSPewJXs+R2Lkw3ladhrIxjdDEkP691Oae/U8+ek08rDOT2MlvDUxnwitoPqm4dXpNh
	a4f48J8aFhKI5GnXWQYRqkLYfMByPdYzx7iz1krnmD0mxaKMsVEbZQq9jdEpb3tT0pbnh5LK+4n
	5gJvajZENsl7n8wqKa/VMi4VbEoWwnFxtMh5hEsZO2vv2py4EEN4A/FDDcDlXfLzeShNMi9wBg+
	G9U5v8vYrZrf3UsEI5m8s3K6e7Es13We+/GXX7jSF4mxCvXvjCWJAqLfaOz/UK3AwdyErlDE76X
	KKh+qvCGYTEsGQEVa4Lyhucqe1Bf/JM66g0rj3H/RhLkfhaTeAZ2XmlUvywuI7RXQWxnFA5VOBJ
	zUarxRXnHIFpe2WQkNbpqikaVTHL5RFkRTzewGLnTKLCnz4weUhkrk2Iz87HhOTGKSgGNSVS64n
	gjzo0AvglOZ4u7bMekAfdzMpw==
X-Received: by 2002:a05:600c:608e:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-48069e24017mr64742955e9.2.1769605116507;
        Wed, 28 Jan 2026 04:58:36 -0800 (PST)
Received: from localhost.localdomain (253.red-83-57-139.dynamicip.rima-tde.net. [83.57.139.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm64744475e9.6.2026.01.28.04.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Jan 2026 04:58:36 -0800 (PST)
Sender: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFzIFJhbcOtcmV6?= <alba@thehoodiefirm.com>
From: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFz?= <alba@thehoodiefirm.com>
X-Google-Original-From: Alba Herrerias <albaherreriasdev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Alex Feyerke <alex@neighbourhood.ie>
Subject: [PATCH 1/1] build_perf: add commit annotations
Date: Wed, 28 Jan 2026 12:57:45 +0000
Message-Id: <20260128125745.58440-2-albaherreriasdev@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260128125745.58440-1-albaherreriasdev@gmail.com>
References: <20260128125745.58440-1-albaherreriasdev@gmail.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 12:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230093

From: Alex Feyerke <alex@neighbourhood.ie>

Also: refactoring and simplification of html rendering, esp. wrt. charts.
Signed-off-by: Alex Feyerke <alex@neighbourhood.ie>
---
 .../build_perf/html/measurement_chart.html    | 168 -------------
 scripts/lib/build_perf/html/report.html       | 222 +++++++++++++++---
 scripts/oe-build-perf-report                  | 153 +++++++++++-
 3 files changed, 339 insertions(+), 204 deletions(-)
 delete mode 100644 scripts/lib/build_perf/html/measurement_chart.html

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
deleted file mode 100644
index 86435273cf..0000000000
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ /dev/null
@@ -1,168 +0,0 @@
-<script type="module">
-  // Get raw data
-  const rawData = [
-    {% for sample in measurement.samples %}
-      [{{ sample.commit_num }}, {{ sample.mean.gv_value() }}, {{ sample.start_time }}, '{{sample.commit}}'],
-    {% endfor %}
-  ];
-
-  const convertToMinute = (time) => {
-    return time[0]*60 + time[1] + time[2]/60 + time[3]/3600;
-  }
-
-  // Update value format to either minutes or leave as size value
-  const updateValue = (value) => {
-    // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
-    return Array.isArray(value) ? convertToMinute(value) : value
-  }
-
-  // Convert raw data to the format: [time, value]
-  const data = rawData.map(([commit, value, time]) => {
-    return [
-      // The Date object takes values in milliseconds rather than seconds. So to use a Unix timestamp we have to multiply it by 1000.
-      new Date(time * 1000).getTime(),
-      // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
-      updateValue(value)
-    ]
-  });
-
-  const commitCountList = rawData.map(([commit, value, time]) => {
-    return commit
-  });
-
-  const commitCountData = rawData.map(([commit, value, time]) => {
-    return updateValue(value)
-  });
-
-  // Set chart options
-  const option_start_time = {
-    tooltip: {
-      trigger: 'axis',
-      enterable: true,
-      position: function (point, params, dom, rect, size) {
-        return [point[0], '0%'];
-      },
-      formatter: function (param) {
-        const value = param[0].value[1]
-        const sample  = rawData.filter(([commit, dataValue]) => updateValue(dataValue) === value)
-        const formattedDate = new Date(sample[0][2] * 1000).toString().replace(/GMT[+-]\d{4}/, '').replace(/\(.*\)/, '(CEST)');
-
-        // Add commit hash to the tooltip as a link
-        const commitLink = `https://git.yoctoproject.org/poky/commit/?id=${sample[0][3]}`
-        if ('{{ measurement.value_type.quantity }}' == 'time') {
-          const hours = Math.floor(value/60)
-          const minutes = Math.floor(value % 60)
-          const seconds = Math.floor((value * 60) % 60)
-          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
-        }
-        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
-      ;}
-    },
-    xAxis: {
-      type: 'time',
-    },
-    yAxis: {
-      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration in minutes' : 'Disk size in MB',
-      type: 'value',
-      min: function(value) {
-        return Math.round(value.min - 0.5);
-      },
-      max: function(value) {
-        return Math.round(value.max + 0.5);
-      }
-    },
-    dataZoom: [
-      {
-        type: 'slider',
-        xAxisIndex: 0,
-        filterMode: 'none'
-      },
-    ],
-    series: [
-      {
-        name: '{{ measurement.value_type.quantity }}',
-        type: 'line',
-        symbol: 'none',
-        data: data
-      }
-    ]
-  };
-
-  const option_commit_count = {
-    tooltip: {
-      trigger: 'axis',
-      enterable: true,
-      position: function (point, params, dom, rect, size) {
-        return [point[0], '0%'];
-      },
-      formatter: function (param) {
-        const value = param[0].value
-        const sample  = rawData.filter(([commit, dataValue]) => updateValue(dataValue) === value)
-        const formattedDate = new Date(sample[0][2] * 1000).toString().replace(/GMT[+-]\d{4}/, '').replace(/\(.*\)/, '(CEST)');
-        // Add commit hash to the tooltip as a link
-        const commitLink = `https://git.yoctoproject.org/poky/commit/?id=${sample[0][3]}`
-        if ('{{ measurement.value_type.quantity }}' == 'time') {
-          const hours = Math.floor(value/60)
-          const minutes = Math.floor(value % 60)
-          const seconds = Math.floor((value * 60) % 60)
-          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
-        }
-        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`
-      ;}
-    },
-    xAxis: {
-      name: 'Commit count',
-      type: 'category',
-      data: commitCountList
-    },
-    yAxis: {
-      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration in minutes' : 'Disk size in MB',
-      type: 'value',
-      min: function(value) {
-        return Math.round(value.min - 0.5);
-      },
-      max: function(value) {
-        return Math.round(value.max + 0.5);
-      }
-    },
-    dataZoom: [
-      {
-        type: 'slider',
-        xAxisIndex: 0,
-        filterMode: 'none'
-      },
-    ],
-    series: [
-      {
-        name: '{{ measurement.value_type.quantity }}',
-        type: 'line',
-        symbol: 'none',
-        data: commitCountData
-      }
-    ]
-  };
-
-  // Draw chart
-  const draw_chart = (chart_id, option) => {
-    let chart_name
-    const chart_div = document.getElementById(chart_id);
-    // Set dark mode
-    if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
-        chart_name= echarts.init(chart_div, 'dark', {
-        height: 320
-      });
-    } else {
-        chart_name= echarts.init(chart_div, null, {
-        height: 320
-      });
-    }
-    // Change chart size with browser resize
-    window.addEventListener('resize', function() {
-      chart_name.resize();
-    });
-    return chart_name.setOption(option);
-  }
-
-  draw_chart('{{ chart_elem_start_time_id }}', option_start_time)
-  draw_chart('{{ chart_elem_commit_count_id }}', option_commit_count)
-</script>
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 28cd80e738..4b37893cd0 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -1,24 +1,8 @@
 <!DOCTYPE html>
 <html lang="en">
 <head>
-{# Scripts, for visualization#}
-<!--START-OF-SCRIPTS-->
 <script src=" https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js "></script>
 
-{# Render measurement result charts #}
-{% for test in test_data %}
-  {% if test.status == 'SUCCESS' %}
-    {% for measurement in test.measurements %}
-      {% set chart_elem_start_time_id = test.name + '_' + measurement.name + '_chart_start_time' %}
-      {% set chart_elem_commit_count_id = test.name + '_' + measurement.name + '_chart_commit_count' %}
-      {% include 'measurement_chart.html' %}
-    {% endfor %}
-  {% endif %}
-{% endfor %}
-
-<!--END-OF-SCRIPTS-->
-
-{# Styles #}
 <style>
 :root {
   --text: #000;
@@ -103,12 +87,22 @@ table {
 tr {
   border-bottom: 1px solid var(--trborder);
 }
-tr:first-child {
+thead {
   border-bottom: 1px solid var(--trtopborder);
 }
 tr:last-child {
   border-bottom: none;
 }
+
+table.meta-table tbody td, table.meta-table tbody th {
+  vertical-align: top;
+  line-height: 1.5em;
+}
+
+.fixed-table-header-width {
+  width: 40%;
+}
+
 a {
   text-decoration: none;
   font-weight: bold;
@@ -133,6 +127,19 @@ button:hover {
 .tab button.active {
   background-color: #d6d9e0;
 }
+
+.chart-tooltip {
+  max-width: 70vw;
+}
+
+.chart-tooltip ul {
+  padding-left: 1.5em;
+}
+
+.chart-tooltip li {
+  max-width: 30em;
+  text-wrap: auto;
+}
 @media (prefers-color-scheme: dark) {
   :root {
     --text: #e9e8fa;
@@ -154,6 +161,16 @@ button:hover {
     background-color: #545a69;
   }
 }
+
+@media (max-width: 1024px) {
+  body {
+    margin-inline: 0.5em;
+  }
+  .card-container {
+    padding-inline: 0;
+  }
+}
+
 </style>
 
 <title>{{ title }}</title>
@@ -169,23 +186,28 @@ button:hover {
   <h2>General</h2>
   <h4>The table provides an overview of the comparison between two selected commits from the same branch.</h4>
   <table class="meta-table" style="width: 100%">
-    <tr>
-      <th></th>
-      <th>Current commit</th>
-      <th>Comparing with</th>
-    </tr>
-    {% for key, item in metadata.items() %}
-    <tr>
-      <th>{{ item.title }}</th>
-      {%if key == 'commit' %}
-        <td>{{ poky_link(item.value) }}</td>
-        <td>{{ poky_link(item.value_old) }}</td>
-      {% else %}
-        <td>{{ item.value }}</td>
-        <td>{{ item.value_old }}</td>
-      {% endif %}
-    </tr>
-    {% endfor %}
+    <thead>
+      <tr>
+        <th></th>
+        <th class="fixed-table-header-width">Current commit</th>
+        <th class="fixed-table-header-width">Comparing with</th>
+      </tr>
+    </thead>
+    <tbody>
+      {% for key, item in metadata.items() %}
+      <tr>
+        <th>{{ item.title }}</th>
+        {%if key == 'commit' %}
+          <td>{{ poky_link(item.value) }}{%if metadata.commit_annotation and metadata.commit_annotation.value %}<br>{{metadata.commit_annotation.value}}{% endif %}</td>
+          <td>{{ poky_link(item.value_old) }}{%if metadata.commit_annotation and metadata.commit_annotation.value %}<br>{{metadata.commit_annotation.value_old}}{% endif %}</td>
+        {% elif key == 'commit_annotation' %}
+        {% else %}
+          <td>{{ item.value }}</td>
+          <td>{{ item.value_old }}</td>
+        {% endif %}
+      </tr>
+      {% endfor %}
+    </tbody>
   </table>
 
   {# Test result summary #}
@@ -380,7 +402,137 @@ button:hover {
   {% endfor %}
 </div>
 
-<script>
+<script type="text/javascript">
+
+const getCommonChartConfig = (measurement) => {
+  return {
+    tooltip: {
+      trigger: 'axis',
+      enterable: true,
+      className: 'chart-tooltip',
+      position: function (point, params, dom, rect, size) {
+        return [point[0], '0%'];
+      },
+    },
+    xAxis: {
+      type: 'time',
+    },
+    yAxis: {
+      name: measurement.value_type == 'time' ? 'Duration in minutes' : 'Disk size in MB',
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
+    ]
+  }
+}
+
+const drawChart = (chart_id, chartOptions) => {
+  const chart_div = document.getElementById(chart_id);
+  const theme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'default'
+
+  const chart = echarts.init(chart_div, theme, {height: 320});
+  chart.setOption(chartOptions);
+  window.addEventListener('resize', () => {
+    chart.resize();
+  });
+  requestAnimationFrame(() => chart.resize());
+}
+
+const generateTooltip = (param, sample, type) => {
+  // Data might be an array of arrays (for startTime charts) or an arraay of commit numbers (for commit number charts)
+  const value = Array.isArray(param[0].value) ? param[0].value[1] : param[0].value
+  const formattedDate = new Date(sample[0][0]).toString().replace(/GMT[+-]\d{4}/, '').replace(/\(.*\)/, '(CEST)');
+
+  // Add commit hash to the tooltip as a link
+  const commitLink = `https://git.yoctoproject.org/yocto-buildstats/commit/?id=${sample[0][2]}`
+  const commitAnnotation = commitAnnotations[sample[0][2]]
+  console.log('commitAnnotation', commitAnnotation)
+  if (type == 'time') {
+    const hours = Math.floor(value/60)
+    const minutes = Math.floor(value % 60)
+    const seconds = Math.floor((value * 60) % 60)
+    return `<ul>
+  <li><strong>Duration:</strong> ${hours}:${minutes}:${seconds}</li>
+  <li><strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][1]}</a></li>
+  ${commitAnnotation ? `<li><strong>Commit annotation:</strong> ${commitAnnotation}</li>` : ''}
+  <li><strong>Start time:</strong> ${formattedDate}</li>
+</ul>
+`
+  }
+  return `<strong>Size:</strong> ${value.toFixed(2)} MB, <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][1]}</a>, <br/> <strong>Start time:</strong> ${formattedDate}`;
+}
+
+chartData.forEach(test => {
+  // sample array is:
+  // [start_time_in_ms, commit_num, commit_hash, duration_in_minutes_or_size]
+  test.measurements.forEach(measurement => {
+    const sharedChartConfig = getCommonChartConfig(measurement)
+    const startTimeChartConfig = {
+      ...sharedChartConfig,
+      tooltip: {
+        ...sharedChartConfig.tooltip,
+        formatter: function (param) {
+          const sample = measurement.combo_samples.filter(([start_time_in_ms, commit_num, commit_hash, duration_in_minutes_or_size]) => param[0].axisValue === start_time_in_ms)
+          return generateTooltip(param, sample, measurement.value_type)
+        }
+      },
+      series: [
+        {
+          name: measurement.value_type,
+          type: 'line',
+          symbol: 'none',
+          data: measurement.combo_samples.map((sample) => {
+            return [sample[0], sample[3]]
+          })
+        }
+      ]
+    }
+    const commitCountChartConfig = {
+      ...sharedChartConfig,
+      // Custom xAxis that displays the commit numbers
+      xAxis: {
+        name: 'Commit count',
+        type: 'category',
+        data: measurement.combo_samples.map((sample) => {
+            return sample[1]
+          })
+      },
+      tooltip: {
+        ...sharedChartConfig.tooltip,
+        formatter: function (param) {
+          const sample = measurement.combo_samples.filter(([start_time_in_ms, commit_num, commit_hash, duration_in_minutes_or_size]) => param[0].axisValue == commit_num)
+          return generateTooltip(param, sample, measurement.value_type)
+        }
+      },
+      series: [
+        {
+          name: measurement.value_type,
+          type: 'line',
+          symbol: 'none',
+          data: measurement.combo_samples.map((sample) => {
+            return sample[3]
+          })
+        }
+      ]
+    }
+    drawChart(measurement.chart_elem_start_time_id, startTimeChartConfig)
+    drawChart(measurement.chart_elem_commit_count_id, commitCountChartConfig)
+  })
+})
+
+
+
 function openChart(event, chartType, chartName) {
   let i, tabcontents, tablinks
   tabcontents = document.querySelectorAll(`.${chartName}_tabcontent > .tabcontent`);
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index a36f3c1bca..f9bdef2712 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -9,10 +9,15 @@
 
 import argparse
 import json
+import math
+import copy
 import logging
 import os
 import re
 import sys
+from urllib.request import urlopen
+from urllib import error
+
 from collections import namedtuple, OrderedDict
 from operator import attrgetter
 from xml.etree import ElementTree as ET
@@ -24,7 +29,7 @@ import scriptpath
 from build_perf import print_table
 from build_perf.report import (metadata_xml_to_json, results_xml_to_json,
                                aggregate_data, aggregate_metadata, measurement_stats,
-                               AggregateTestData)
+                               AggregateTestData, TimeVal, SizeVal)
 from build_perf import html
 from buildstats import BuildStats, diff_buildstats, BSVerDiff
 
@@ -292,6 +297,49 @@ class BSSummary(object):
             if ver_diff.rchanged:
                 self.ver_diff['Revision changed'] = [(n, "{} &rarr; {}".format(r.left.evr, r.right.evr)) for n, r in ver_diff.rchanged.items()]
 
+# Helpers for generating chart JSON
+
+CLASS_MAP = {
+    TimeVal: "time",
+    SizeVal: "size",
+}
+
+# Sanitize inf and nan, because JSON doesn’t support those
+def sanitize(obj):
+    if isinstance(obj, float):
+        if not math.isfinite(obj):
+            return None
+        return obj
+
+    if isinstance(obj, dict):
+        return {k: sanitize(v) for k, v in obj.items()}
+
+    if isinstance(obj, list):
+        return [sanitize(v) for v in obj]
+
+    if isinstance(obj, tuple):
+        return [sanitize(v) for v in obj]  # JSON has no tuples
+
+    # leave everything else alone
+    return obj
+
+# Default json.dump handlers for unknown data types 
+def json_default(obj):
+    # Class objects (only TimeVal and SizeVal)
+    if obj in CLASS_MAP:
+        return CLASS_MAP[obj]
+    
+    # Custom object instances (BSSummary)
+    if hasattr(obj, "__dict__"):
+        # This happens _after_ sanitze(tests) in json.dump,
+        # so we need to sanitize again…
+        return sanitize(obj.__dict__)
+
+    # NaN / Infinity (JSON does not like these)
+    if isinstance(obj, float) and not math.isfinite(obj):
+        return None
+
+    raise TypeError(f"Object of type {type(obj).__name__} is not JSON serializable")
 
 def print_html_report(data, id_comp, buildstats):
     """Print report in html format"""
@@ -375,6 +423,109 @@ def print_html_report(data, id_comp, buildstats):
                             'max': get_data_item(data[-1][0], 'layers.meta.commit_count')}
                  }
 
+    # Get commit annotations from Yocto’s git,
+    # mush them into the metadata object,
+    # and also output them as a POJO so eCharts can use them
+
+    commitAnnotationsURL = 'https://git.yoctoproject.org/yocto-buildstats/plain/annotations.json'
+    commitAnnotationsJSON = {}
+    try:
+        response = urlopen(commitAnnotationsURL)
+        commitAnnotationsJSON = json.loads(response.read())
+        # Splice the annotations into the metadata
+        commit = metadata.get('commit', {})
+        annotations_out = {}
+
+        if (h := commit.get('value')) in commitAnnotationsJSON:
+            annotations_out['value'] = commitAnnotationsJSON[h]
+
+        if (h := commit.get('value_old')) in commitAnnotationsJSON:
+            annotations_out['value_old'] = commitAnnotationsJSON[h]
+
+        if annotations_out:
+            metadata['commit_annotation'] = annotations_out
+            metadata['commit_annotation']['title'] = "Commit annotation"
+
+    except error.URLError as e:
+        logging.debug(f"Couldn't find any commit annotations at {commitAnnotationsURL}, reason: {e.reason}.")
+    except json.decoder.JSONDecodeError as e:
+        logging.error(f"Invalid JSON received from {commitAnnotationsURL}, error: {e}")
+    except Exception as e:
+        logging.exception(f"Unexpected error while loading annotations: {e}")
+
+    ### JSONifying data for consumption by Apache eCharts
+    
+    # Make a copy of tests to pare down into what we need as JSON
+    tests_for_JSON = copy.deepcopy(tests)
+
+    # Some transformation pipeline functions, because we don't want to output the
+    # entire JSON to the html file, that would be wasteful.
+    def skip_failed_tests(test):
+        if test.get('status') != 'SUCCESS':
+            return None
+        return test
+
+    # Adds the div ids so each chart knows where to render itself into
+    def add_chart_ids(test):
+        for measurement in test.get('measurements', []):
+            measurement['chart_elem_start_time_id'] = f"{test.get('name', '')}_{measurement.get('name', '')}_chart_start_time"
+            measurement['chart_elem_commit_count_id'] = f"{test.get('name', '')}_{measurement.get('name', '')}_chart_commit_count"
+        return test
+
+    # Compose sample series data for the charts
+    def parse_samples(test):
+        for measurement in test.get('measurements', []):
+            start_time_samples = []
+            commit_count_samples = []
+            combo_samples = []
+            for sample in measurement.get('samples', []):
+                # Mean is either a TimeVal or a SizeVal
+                mean = sample.get('mean')
+                # One chart shows duration in minutes/size over start time
+                # The other shows duration in minutes/size over commit count
+                duration_in_minutes = None
+                if isinstance(mean, TimeVal):
+                    hh, mm, ss = mean.hms()
+                    duration_in_minutes = hh*60 + mm + int(ss)/60 + int(ss*1000) % 1000/3600;
+                # Charts either need the time in minutes (from TimeVal) as their value, or size (SizeVal)
+                start_time_samples.append([int(sample.get('start_time')) * 1000, duration_in_minutes if duration_in_minutes is not None else mean])
+                commit_count_samples.append([sample.get('commit_num'), duration_in_minutes if duration_in_minutes is not None else mean])
+                combo_samples.append([int(sample.get('start_time')) * 1000, sample.get('commit_num'), sample.get('commit'), duration_in_minutes if duration_in_minutes is not None else mean])
+            # For echarts consumption, all we need is samples in the format [time_in_milliseconds, build_length_in_minutes],
+            # eg [1760544944000, 59.42388888888889]
+            measurement['combo_samples'] = combo_samples
+        return test
+
+    # Throw away all the large things we don't need
+    def clean_measurements(test):
+        for m in test.get('measurements', []):
+            m.pop('buildstats', None)
+            m.pop('value', None)
+            m.pop('samples', None)
+        return test
+
+    # Apply pipeline
+    for i, test in enumerate(tests_for_JSON):
+        for func in (skip_failed_tests, add_chart_ids, parse_samples, clean_measurements):
+            test = func(test)
+            if test is None:  # skip this test entirely
+                break
+        if test is not None:
+            tests_for_JSON[i] = test
+    
+    json_str = json.dumps(
+        sanitize(tests_for_JSON),
+        indent=2,
+        default=json_default,
+        allow_nan=False,
+    )
+    
+    # Output all the JSON to the head of the report html
+    print(f"""<script type="text/javascript">
+    const commitAnnotations = {commitAnnotationsJSON}
+    const chartData = {json_str}
+</script>""")
+
     print(html.template.render(title="Build Perf Test Report",
                                metadata=metadata, test_data=tests,
                                chart_opts=chart_opts))
-- 
2.40.1


