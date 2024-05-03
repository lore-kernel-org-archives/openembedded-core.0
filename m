Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3580C41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:43:59 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.14885.1714747430919500650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=uE6RtzWU;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.41, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a595199cb9bso492040666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714747429; x=1715352229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yc5VQSFptfXAKtZw1flQE4ob7d1CsnhF/ViiQcx8wJM=;
        b=uE6RtzWU4EBG6pDoO34gnNnBd0UcfAWF73d7FbHklgRXvNUemNfMX6YwR8RK6c6hIj
         a06ZUnzoPyKKwDA1nbcGKABQXx5qfFMQkEsDBpXr0LPYivYKXPHliBpWBushmfsGWyoG
         UDb+Q2DDucbB62OReqzP8m/sAag+W4EDBn9dSaNbv5Q+o/yoJznM14SaVkVXtOx5Zy0K
         QmcDoG8bm4TtpQz9Vl/CgrRCOx9DP2vZGZlo/wLzgRbqg4mjUElp7QyB/Og1IF0JwYf9
         xKnAdkFmgEcNXESNbclh3JkkxhvIDq7mIcBqaA673bOLQXZ/dRWpY0WQcuqPzN4KB4D1
         2DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747429; x=1715352229;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yc5VQSFptfXAKtZw1flQE4ob7d1CsnhF/ViiQcx8wJM=;
        b=Q1fH/Hbxyt0jv8piDO+GaO2G0/Bgs+vU3udYABb2TQbkW/mjEALsTmmbXP7y44Poo+
         yih2ZfZt2nZX+4tfOVher+i92TEwB/yOQEcjGHR74eQlCe2FKyaKiTmitkLa9FWM26hM
         rPB5MlYKVcKwD+3JhDgdRwlqQBDiIstFLW7t/Xi4vXK2O9mAl1OuMjtppXEa69qTtQ6B
         ln3ZtQ15P/Jx9D/fIRF4X59vh8OkLArvfv1u/OrieqiilG6qps3LeEKrrCoDzgpret7n
         142VirWPKdpUh7/F5TLbnTW3oCDdo3ybTUKHm3NeBirc2/fxr50dF7QupNdExcYIWvx2
         Si5w==
X-Gm-Message-State: AOJu0YzPe8od9YbcVwMI+SAbfnkV7AEPPHng/MQl2ca4yzM6Fa58VJUB
	0DFcFFpdg83YCbLWv8PJtXu/iBHmF5SXdENB9qlp+xAex7R7swm9rplh3DjAxCAvsPH+WRomhS7
	/xPs=
X-Google-Smtp-Source: AGHT+IE04TQNrIXFfvgI8F30xWnAV13S6FjqqpmjPZTVrE4+Cg4kXqsXBTcaHwrGc90sC/q6pXH5/g==
X-Received: by 2002:a50:d4d5:0:b0:56a:ae8a:acc0 with SMTP id e21-20020a50d4d5000000b0056aae8aacc0mr1610059edj.21.1714747429442;
        Fri, 03 May 2024 07:43:49 -0700 (PDT)
Received: from localhost.localdomain ([95.90.235.164])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b005721b7bfea2sm1731017edb.22.2024.05.03.07.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:43:49 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2 4/5] oe-build-perf-report: Update chart tooltip and chart type
Date: Fri,  3 May 2024 16:43:39 +0200
Message-ID: <20240503144340.27385-5-ninette@thehoodiefirm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199000

- Update chart tooltip format to show value as size in MB for 'rootfs size'
and timestamp for 'tmpdir size'
- Add commit number to tooltip
- Update chart type to 'step chart' instead of 'line chart'

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../build_perf/html/measurement_chart.html    | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 9acb3785e2..7982ec39c2 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -10,13 +10,19 @@
     return time[0]*60 + time[1] + time[2]/60 + time[3]/3600;
   }
 
+  // Update value format to either minutes or leave as size value
+  const updateValue = (value) => {
+    // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
+    return Array.isArray(value) ? convertToMinute(value) : value
+  }
+
   // Convert raw data to the format: [time, value]
   const data = rawData.map(([commit, value, time]) => {
     return [
       // The Date object takes values in milliseconds rather than seconds. So to use a Unix timestamp we have to multiply it by 1000.
       new Date(time * 1000).getTime(),
       // Assuming the array values are duration in the format [hours, minutes, seconds, milliseconds]
-      Array.isArray(value) ? convertToMinute(value) : value
+      updateValue(value)
     ]
   });
 
@@ -25,11 +31,22 @@
     tooltip: {
       trigger: 'axis',
       valueFormatter: (value) => {
-        const hours = Math.floor(value/60)
-        const minutes = Math.floor(value % 60)
-        const seconds = Math.floor((value * 60) % 60)
-        return hours + ':' + minutes + ':' + seconds
-      }
+        const commitNumber  = rawData.filter(([commit, dataValue, time]) => updateValue(dataValue) === value)
+        if ('{{ measurement.value_type.quantity }}' == 'time') {
+          const hours = Math.floor(value/60)
+          const minutes = Math.floor(value % 60)
+          const seconds = Math.floor((value * 60) % 60)
+          return [
+                hours + ':' + minutes + ':' + seconds + ', ' +
+                'commit number: ' + commitNumber[0][0]
+              ]
+        }
+        return [
+          value.toFixed(2) + ' MB' + ', ' +
+          'commit number: ' + commitNumber[0][0]
+        ]
+      },
+
     },
     xAxis: {
       type: 'time',
@@ -55,7 +72,7 @@
       {
         name: '{{ measurement.value_type.quantity }}',
         type: 'line',
-        smooth: true,
+        step: 'start',
         symbol: 'none',
         data: data
       }
-- 
2.44.0


