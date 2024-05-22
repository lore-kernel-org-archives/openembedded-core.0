Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14832C25B7D
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 14:53:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.12298.1716389582986565429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 07:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=MHVzQ2z3;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f174e316eso6108952e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1716389581; x=1716994381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ufR4PCRWr9KIDBZY6Loeb3amXZDJE4Vess6ZIcgLwpQ=;
        b=MHVzQ2z3rLptIUvHE77MBxYmp6k45LSNMdP3LPosQh8GFj+HsUrUUuxoht9QiWZyl5
         XIh4EoI5ydd7iMzi0hPc27MVxGyaZdbu0oBDCbFs9Lx7MK+iJReAotwQvLoC3Rho6lFh
         Z8PE0D6p8Duub4ZA3wSvJibZM24KYcJnWlnDrDt2HZebU870i/GQySkIIvsgrcpSkEPG
         SA+YcS9NXZEH/hb3hlLzy/SQ5rK9GbvcuC4XceD7ibbpTV9os8QH14CTVHE0G9BtlIOd
         eoBL+s6iCvFa5XASXg1TkmEDsjaa0+sxvXXI7W51eRTBfLTCyCcKLEux6gdnv3upc5//
         HcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716389581; x=1716994381;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufR4PCRWr9KIDBZY6Loeb3amXZDJE4Vess6ZIcgLwpQ=;
        b=U6cGuWIWXlsvWQ90oizBZQFga8BYblifslr+emnWEf37jr3nWCV1/6SGazaWImq9Ki
         ZJUI6pDiYDLRvQvpNNN/0GDghrvqMNEgfSj/0kw6OZRxIXBx4NFauEqxlIQLuuBcekCC
         U932uLzFiz0iISai4CnaFGVZmN5+Gk/+3/nCq0KkeANixmwA4YaeA/EsHpPA9MVEc5yW
         9pYc/3XAp3X93Yp+hUcah8VEzbgiohMHMIK+1ze24y+tn+ZXgk7SW0SxgxlSqnZNIJk+
         a+MZNRU/AkfBd6M1G3PvjIubivtZSdz2yI7hM3j9TsRkbR55+Zu1MZK9u42VvP+lstUE
         /mAg==
X-Gm-Message-State: AOJu0YyXbm8bI2JKXKOqYFLl7LPvyd61lKHIt/XXdO4RpSu+DhwKZCFn
	TPIYsT99WmHQsqb4NeefhcyNdiZaz4hrRU4/jbnDSBhFlS7TBOxGbcsIWi2GmoMLha2Hq43wJPM
	nfNA=
X-Google-Smtp-Source: AGHT+IE8MmLlnz8KQTUqomIsjH5iIxAFnIpifQ22M5EJWRnn0IIoBihgU2KY+hMy4N/bY1uZpEepMg==
X-Received: by 2002:a05:6512:3f0:b0:51e:2282:63cf with SMTP id 2adb3069b0e04-526c0a68f09mr1227561e87.45.1716389581155;
        Wed, 22 May 2024 07:53:01 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeba4.dynamic.kabel-deutschland.de. [95.90.235.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17f0dsm1786072566b.211.2024.05.22.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 07:53:00 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] oe-build-perf-report: Add commit hash link to chart tooltip"
Date: Wed, 22 May 2024 16:52:52 +0200
Message-ID: <20240522145252.58663-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522145252.58663-1-ninette@thehoodiefirm.com>
References: <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
 <20240522145252.58663-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199761

Update tooltip to include the commit hash link to the poky repository

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 .../build_perf/html/measurement_chart.html    | 26 +++++++++----------
 scripts/oe-build-perf-report                  |  2 ++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index ad4a93ed02..05bd84e6ce 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -2,7 +2,7 @@
   // Get raw data
   const rawData = [
     {% for sample in measurement.samples %}
-      [{{ sample.commit_num }}, {{ sample.mean.gv_value() }}, {{ sample.start_time }}],
+      [{{ sample.commit_num }}, {{ sample.mean.gv_value() }}, {{ sample.start_time }}, '{{sample.commit}}'],
     {% endfor %}
   ];
 
@@ -30,23 +30,23 @@
   const option = {
     tooltip: {
       trigger: 'axis',
-      valueFormatter: (value) => {
-        const commitNumber  = rawData.filter(([commit, dataValue, time]) => updateValue(dataValue) === value)
+      enterable: true,
+      position: function (point, params, dom, rect, size) {
+        return [point[0]-150, '10%'];
+      },
+      formatter: function (param) {
+        const value = param[0].value[1]
+        const sample  = rawData.filter(([commit, dataValue]) => updateValue(dataValue) === value)
+        // Add commit hash to the tooltip as a link
+        const commitLink = `https://git.yoctoproject.org/poky/commit/?id=${sample[0][3]}`
         if ('{{ measurement.value_type.quantity }}' == 'time') {
           const hours = Math.floor(value/60)
           const minutes = Math.floor(value % 60)
           const seconds = Math.floor((value * 60) % 60)
-          return [
-                hours + ':' + minutes + ':' + seconds + ', ' +
-                'commit number: ' + commitNumber[0][0]
-              ]
+          return `<strong>Duration:</strong> ${hours}:${minutes}:${seconds}, <br/> <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>`
         }
-        return [
-          value.toFixed(2) + ' MB' + ', ' +
-          'commit number: ' + commitNumber[0][0]
-        ]
-      },
-
+        return `<strong>Size:</strong> ${value.toFixed(2)} MB, <br/> <strong>Commit number:</strong> <a href="${commitLink}" target="_blank" rel="noreferrer noopener">${sample[0][0]}</a>`
+      ;}
     },
     xAxis: {
       type: 'time',
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 266700d294..6c3c726ee3 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -336,10 +336,12 @@ def print_html_report(data, id_comp, buildstats):
                 test_i = test_data['tests'][test]
                 meas_i = test_i['measurements'][meas]
                 commit_num = get_data_item(meta, 'layers.meta.commit_count')
+                commit = get_data_item(meta, 'layers.meta.commit')
                 # Add start_time for both test measurement types of sysres and disk usage
                 start_time = test_i['start_time'][0]
                 samples.append(measurement_stats(meas_i, '', start_time))
                 samples[-1]['commit_num'] = commit_num
+                samples[-1]['commit'] = commit
 
             absdiff = samples[-1]['val_cls'](samples[-1]['mean'] - samples[id_comp]['mean'])
             reldiff = absdiff * 100 / samples[id_comp]['mean']
-- 
2.44.0


