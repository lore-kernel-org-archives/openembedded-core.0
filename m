Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A78C04FF8
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:41:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.22972.1713192098473927227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 07:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=XKzqWtrx;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.42, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a53ed18f34fso84923766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713192097; x=1713796897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5w7rrdMjZnZxXfl9ys3hy3iZkzIt2s2nT86yUgu8POQ=;
        b=XKzqWtrxMDbUm7mn65kmQeEL8WIFo2vKvPndQdnMqDvOkTZUduABc44pHVHH8iMH8R
         sKH7hzjmF8T5yBrJz6w8eXXsOnz1pco5d3LA2zfUMqmY6qxqcfwZFJwlvFbHfrRAP1T1
         0d0eLxPM9ETStKxGl/lZ8QjAkOk9gDcEDsmsZ3J2QbNW9qUmPss7vp42xY+6rGhbDLWW
         /x5FoSs+/JMBOv7ui1Y32DfC8VRugT0gV5Lk0NIsjm/I+WaerwLH+IxCFlu//h4toZrg
         FnFlno88TwwwMpMv5mzZMnNeNkkE/lHGpNSZHmldLP3f36gtP91yGuVRUlxdGH8FZWdT
         eO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713192097; x=1713796897;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5w7rrdMjZnZxXfl9ys3hy3iZkzIt2s2nT86yUgu8POQ=;
        b=ErXBDxvpJ1y4mLF04AyQDCaiol9I6G0MgKS/xU3sriLH/cD9xVvqxwzV3kQVqwcpTN
         5wlcvKGJ640eC/Ydgc0kQIhSEp9lBnPCkM/QdtgVwKB4paj7GF/GQq7ltPDfZPqj6A1Z
         2qO68hncAIBtDnvH6qSdpLm6MYvpoj8bwE3NFcmSGYlxzp8/QUyAXj3gfXkLolWplaqa
         ZnRIVEP9Ur6Mevc1MUpplBDHrpExVw4NhTWNvG0P9Jro/sQRKpyV5kkJjqkghKUlQOxL
         zuF2UrwEDH55Tf/GCdCJ2M3ZlMZSFzbYQD40xjpmQEf9WT/Rk8IJ891NCg4Ypzj3bA05
         rdtA==
X-Gm-Message-State: AOJu0Yy8gep+vjpI0kXdjCdsGqVI/TWJLZd2/21n57Kp0mg+BHISIyq8
	LDMVsVp2qDPKphOZVMt7MIMyF9B8AI0wx71IyKSOCRpqLmXZe1WNnQ/ZAHuXZJcwCky47RrjjOl
	W
X-Google-Smtp-Source: AGHT+IHHCpf8bkAVWZfDBGeE0DHG+5mDJ9jT5X79DE58puSuVNwKGHzO/R8eoK8FBPTu9d3lfYk/cQ==
X-Received: by 2002:a17:906:5a88:b0:a52:4fc1:ea98 with SMTP id l8-20020a1709065a8800b00a524fc1ea98mr4125452ejq.55.1713192096852;
        Mon, 15 Apr 2024 07:41:36 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id bq3-20020a170906d0c300b00a522f867697sm4658749ejb.132.2024.04.15.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 07:41:36 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 3/3] oe-build-perf-report: Improve report styling and add descriptions
Date: Mon, 15 Apr 2024 16:41:29 +0200
Message-ID: <20240415144129.92641-4-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415144129.92641-1-ninette@thehoodiefirm.com>
References: <20240415144129.92641-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 14:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198242

From: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>

Styling updates are added including page margin, labels for x and y axis, tooltip, and section descriptions.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../build_perf/html/measurement_chart.html    | 28 +++---
 scripts/lib/build_perf/html/report.html       | 90 +++++++++++++------
 2 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index ffec3d09db..9acb3785e2 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -13,8 +13,10 @@
   // Convert raw data to the format: [time, value]
   const data = rawData.map(([commit, value, time]) => {
     return [
-      new Date(time * 1000).getTime(), // The Date object takes values in milliseconds rather than seconds. So to use a Unix timestamp we have to multiply it by 1000.
-      Array.isArray(value) ? convertToMinute(value) : value // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
+      // The Date object takes values in milliseconds rather than seconds. So to use a Unix timestamp we have to multiply it by 1000.
+      new Date(time * 1000).getTime(),
+      // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
+      Array.isArray(value) ? convertToMinute(value) : value
     ]
   });
 
@@ -22,16 +24,18 @@
   const option = {
     tooltip: {
       trigger: 'axis',
-      position: function (pt) {
-        return [pt[0], '10%'];
-      },
-      valueFormatter: (value) => value.toFixed(2)
+      valueFormatter: (value) => {
+        const hours = Math.floor(value/60)
+        const minutes = Math.floor(value % 60)
+        const seconds = Math.floor((value * 60) % 60)
+        return hours + ':' + minutes + ':' + seconds
+      }
     },
     xAxis: {
       type: 'time',
     },
     yAxis: {
-      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration (minutes)' : 'Disk size (MB)',
+      name: '{{ measurement.value_type.quantity }}' == 'time' ? 'Duration in minutes' : 'Disk size in MB',
       type: 'value',
       min: function(value) {
         return Math.round(value.min - 0.5);
@@ -42,14 +46,10 @@
     },
     dataZoom: [
       {
-        type: 'inside',
-        start: 0,
-        end: 100
+        type: 'slider',
+        xAxisIndex: 0,
+        filterMode: 'none'
       },
-      {
-        start: 0,
-        end: 100
-      }
     ],
     series: [
       {
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 653fd985bc..4cd240760a 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -24,23 +24,15 @@
   text-align: left;
   border-collapse: collapse;
 }
-.meta-table tr:nth-child(even){background-color: #f2f2f2}
-meta-table th, .meta-table td {
-  padding: 4px;
-}
 .summary {
-  margin: 0;
   font-size: 14px;
   text-align: left;
   border-collapse: collapse;
 }
-summary th, .meta-table td {
-  padding: 4px;
-}
 .measurement {
   padding: 8px 0px 8px 8px;
   border: 2px solid #f0f0f0;
-  margin-bottom: 10px;
+  margin: 1.5rem 0;
 }
 .details {
   margin: 0;
@@ -60,18 +52,58 @@ summary th, .meta-table td {
   background-color: #f0f0f0;
   margin-left: 10px;
 }
-hr {
-  color: #f0f0f0;
+.card-container {
+  border-bottom-width: 1px;
+  padding: 1.25rem 3rem;
+  box-shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
+  border-radius: 0.25rem;
+}
+body {
+  font-family: 'Helvetica', sans-serif;
+  margin: 3rem 8rem;
+}
+h1 {
+  text-align: center;
 }
 h2 {
-  font-size: 20px;
+  font-size: 1.5rem;
   margin-bottom: 0px;
   color: #707070;
+  padding-top: 1.5rem;
 }
 h3 {
-  font-size: 16px;
+  font-size: 1.3rem;
   margin: 0px;
   color: #707070;
+  padding: 1.5rem 0;
+}
+h4 {
+  font-size: 14px;
+  font-weight: lighter;
+  line-height: 1.2rem;
+  margin: auto;
+  padding-top: 1rem;
+}
+table {
+  margin-top: 1.5rem;
+  line-height: 2rem;
+}
+tr {
+  border-bottom: 1px solid #e5e7eb;
+}
+tr:first-child {
+  border-bottom: 1px solid #9ca3af;
+}
+tr:last-child {
+  border-bottom: none;
+}
+a {
+  text-decoration: none;
+  font-weight: bold;
+  color: #0000EE;
+}
+a:hover {
+  color: #8080ff;
 }
 </style>
 
@@ -79,13 +111,14 @@ h3 {
 </head>
 
 {% macro poky_link(commit) -%}
-    <a href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?id={{ commit }}">{{ commit[0:11] }}</a>
+  <a href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?id={{ commit }}">{{ commit[0:11] }}</a>
 {%- endmacro %}
 
-<body><div style="width: 700px">
+<body><div>
+  <h1 style="text-align: center;">Performance Test Report</h1>
   {# Test metadata #}
   <h2>General</h2>
-  <hr>
+  <h4>The table provides an overview of the comparison between two selected commits from the same branch.</h4>
   <table class="meta-table" style="width: 100%">
     <tr>
       <th></th>
@@ -108,19 +141,21 @@ h3 {
 
   {# Test result summary #}
   <h2>Test result summary</h2>
-  <hr>
+  <h4>The test summary presents a thorough breakdown of each test conducted on the branch, including details such as build time and disk space consumption. Additionally, it gives insights into the average time taken for test execution, along with absolute and relative values for a better understanding.</h4>
   <table class="summary" style="width: 100%">
+    <tr>
+      <th>Test name</th>
+      <th>Measurement description</th>
+      <th>Mean value</th>
+      <th>Absolute difference</th>
+      <th>Relative difference</th>
+    </tr>
     {% for test in test_data %}
-      {% if loop.index is even %}
-        {% set row_style = 'style="background-color: #f2f2f2"' %}
-      {% else %}
-        {% set row_style = 'style="background-color: #ffffff"' %}
-      {% endif %}
       {% if test.status == 'SUCCESS' %}
         {% for measurement in test.measurements %}
           <tr {{ row_style }}>
             {% if loop.index == 1 %}
-              <td>{{ test.name }}: {{ test.description }}</td>
+              <td><a href=#{{test.name}}>{{ test.name }}: {{ test.description }}</a></td>
             {% else %}
               {# add empty cell in place of the test name#}
               <td></td>
@@ -149,10 +184,12 @@ h3 {
   </table>
 
   {# Detailed test results #}
+  <h2>Test details</h2>
+  <h4>The following section provides details of each test, accompanied by charts representing build time and disk usage over time or by commit number.</h4>
   {% for test in test_data %}
-  <h2>{{ test.name }}: {{ test.description }}</h2>
-  <hr>
+  <h3 style="color: #000;" id={{test.name}}>{{ test.name }}: {{ test.description }}</h3>
     {% if test.status == 'SUCCESS' %}
+    <div class="card-container">
       {% for measurement in test.measurements %}
         <div class="measurement">
           <h3>{{ measurement.description }}</h3>
@@ -271,7 +308,8 @@ h3 {
             {% endif %}
           {% endif %}
         </div>
-      {% endfor %}
+        {% endfor %}
+      </div>
     {# Unsuccessful test #}
     {% else %}
       <span style="font-size: 150%; font-weight: bold; color: red;">{{ test.status }}
-- 
2.44.0


