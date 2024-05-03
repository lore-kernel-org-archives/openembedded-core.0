Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0868C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:43:59 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14886.1714747432597547145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=iNkQ2+JK;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.47, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59954c1271so176846566b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714747431; x=1715352231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PNSHEHa+eW1MSML8KrgIDh/1Sclxk6gfqHJWlFa8hK8=;
        b=iNkQ2+JKabcEknWsyQPLAMbOf0mdvF6HC9pNk2u1n1Vs+xLZt6L8xwCaMdn+6Levbv
         7DzX8Q8/a7L+5jAngzJIaUL2roPz/JuMyTvqckInuFh3gFkVvt/2irwYo/8/gNEd9tyx
         o7/1DXBf9Y2k976QL0JCFXUuUWK86vRGMchA6wSKc0+z8D8B+0hqIqksIAS0oD1Egyzz
         HFkOBU11XY56nzmfLrYTQgwWUOepoPdd2RQfPM0n+jzmGRIazpNQ89n3BFlsDNStZg1s
         mQBqHKbcMH1qpjlchChBl1a2q6hqlA9FlRS3CrMQ+CymDpwr92g2SrV9iYqovmBfJcih
         Yosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747431; x=1715352231;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNSHEHa+eW1MSML8KrgIDh/1Sclxk6gfqHJWlFa8hK8=;
        b=o/rJLJM8MrIP2t8zK5yOkL8qcZ55VrYrdLJrCiyAjHQxRxGF93EPZuwoO0rEtPSCbP
         /Dts/Cn/jH8zM6FKuTmvEzTcZeNv5A5bNGkl1jytEP8dIEJxl/Awa434WKJkDUGXEtyr
         NKfNvDz0YBeCJoz1l3GhIY+zb3BoeT5fy887uGc+GhwJ4Rqc1JPoRwuvygjAfxQOILcP
         /BpqCv/igeINS6jNMMnhkyT/SwD3CGh7gzwq9pqmien4u9bKgUoUv46n8Zyi7rxXpsPE
         RPyMc6CC3mX50bpc4HcZFhMczmtO93G71GAvAkNbREQb0GB3ts9O5FWdK0CXLQ4g8qMP
         Ks0Q==
X-Gm-Message-State: AOJu0YxenKjS7JwVOXWtXzCrc2RkB8J3jr+VY2A2ijHCVstqRP+ukkK5
	ipLU6TZts9OXJ4VH9qQuVeDhqvBaZGqoGxqzODz7kMjDPOQRmQV6ZDTKh56BDRozzyUx10hrvdB
	Jivg=
X-Google-Smtp-Source: AGHT+IFiOA9gBM9w0QqQrzS+Wq8G6TNFqT+mB3tyQnjn88Oid45wv2P0EuMnPh7EUXWGP1QsvB9OnQ==
X-Received: by 2002:a50:8a96:0:b0:56d:fdb3:bcc5 with SMTP id j22-20020a508a96000000b0056dfdb3bcc5mr1740720edj.12.1714747431126;
        Fri, 03 May 2024 07:43:51 -0700 (PDT)
Received: from localhost.localdomain ([95.90.235.164])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b005721b7bfea2sm1731017edb.22.2024.05.03.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:43:50 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2 5/5] oe-build-perf-report: Add dark mode
Date: Fri,  3 May 2024 16:43:40 +0200
Message-ID: <20240503144340.27385-6-ninette@thehoodiefirm.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 14:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199001

Update css to add dark mode when window prefers-color-scheme is dark.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../build_perf/html/measurement_chart.html    | 15 +++++---
 scripts/lib/build_perf/html/report.html       | 34 +++++++++++++++----
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 7982ec39c2..ad4a93ed02 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -81,13 +81,20 @@
 
   // Draw chart
   const chart_div = document.getElementById('{{ chart_elem_id }}');
-  const measurement_chart= echarts.init(chart_div, null, {
-    height: 320
-  });
+  // Set dark mode
+  let measurement_chart
+  if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
+      measurement_chart= echarts.init(chart_div, 'dark', {
+      height: 320
+    });
+  } else {
+      measurement_chart= echarts.init(chart_div, null, {
+      height: 320
+    });
+  }
   // Change chart size with browser resize
   window.addEventListener('resize', function() {
     measurement_chart.resize();
   });
   measurement_chart.setOption(option);
 </script>
-
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 4cd240760a..537ed3ee52 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -19,6 +19,15 @@
 
 {# Styles #}
 <style>
+:root {
+  --text: #000;
+  --bg: #fff;
+  --h2heading: #707070;
+  --link: #0000EE;
+  --trtopborder: #9ca3af;
+  --trborder: #e5e7eb;
+  --chartborder: #f0f0f0;
+  }
 .meta-table {
   font-size: 14px;
   text-align: left;
@@ -31,7 +40,7 @@
 }
 .measurement {
   padding: 8px 0px 8px 8px;
-  border: 2px solid #f0f0f0;
+  border: 2px solid var(--chartborder);
   margin: 1.5rem 0;
 }
 .details {
@@ -61,6 +70,8 @@
 body {
   font-family: 'Helvetica', sans-serif;
   margin: 3rem 8rem;
+  background-color: var(--bg);
+  color: var(--text);
 }
 h1 {
   text-align: center;
@@ -68,13 +79,13 @@ h1 {
 h2 {
   font-size: 1.5rem;
   margin-bottom: 0px;
-  color: #707070;
+  color: var(--h2heading);
   padding-top: 1.5rem;
 }
 h3 {
   font-size: 1.3rem;
   margin: 0px;
-  color: #707070;
+  color: var(--h2heading);
   padding: 1.5rem 0;
 }
 h4 {
@@ -89,10 +100,10 @@ table {
   line-height: 2rem;
 }
 tr {
-  border-bottom: 1px solid #e5e7eb;
+  border-bottom: 1px solid var(--trborder);
 }
 tr:first-child {
-  border-bottom: 1px solid #9ca3af;
+  border-bottom: 1px solid var(--trtopborder);
 }
 tr:last-child {
   border-bottom: none;
@@ -100,11 +111,22 @@ tr:last-child {
 a {
   text-decoration: none;
   font-weight: bold;
-  color: #0000EE;
+  color: var(--link);
 }
 a:hover {
   color: #8080ff;
 }
+@media (prefers-color-scheme: dark) {
+  :root {
+    --text: #e9e8fa;
+    --bg: #0F0C28;
+    --h2heading: #B8B7CB;
+    --link: #87cefa;
+    --trtopborder: #394150;
+    --trborder: #212936;
+    --chartborder: #b1b0bf;
+  }
+}
 </style>
 
 <title>{{ title }}</title>
-- 
2.44.0


