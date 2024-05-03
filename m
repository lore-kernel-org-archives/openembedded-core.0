Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC427C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:43:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.14701.1714747428129034050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=Jf+/o7d0;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5200202c1bso1402045766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714747426; x=1715352226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=laU5DtLkGDZTFTKvvaITQ8cXBDzM9hQQPvEygWw3MYc=;
        b=Jf+/o7d0N9Mksl9f6zmIvYd9BSSReeTrmSPjjgJlDVxOpCl21oM26dkw73dWrQrUGP
         XHFryWmtSO46QcixhK9UrSyO7/ciUXvMpBxmGtr8h5vCYXH3gwB0SN5K+t5Joi0PeuWs
         Jj6SOybJrnknCDWW0SagGFE4Aug7WEFGsYwmloMooUKtRj2ISmnlSCom44AOEK0W+K11
         p3Pmgt7UmSk4jHSpFqkxceAbcUjjhrGMHPrkmmo/LW6ITpx4CloPpL+bCpPHwq4RvUoN
         YgQviTogA9ALA4gaNrGyW7ZNDfCyQXNtb19I8SYO+jBhuEJznjXNagH53vjn3XYmaTv2
         okKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747426; x=1715352226;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laU5DtLkGDZTFTKvvaITQ8cXBDzM9hQQPvEygWw3MYc=;
        b=Hm5qEH4QhbFTitnXhTWasaszAtnaBPyEBk3OlCeETykwAf1pN+Z3np9O+qYblwiA/l
         Cmw3UtUQFtAzWoKxUT7JOIBA7c+0SbTfAaW353uAuEhFFS2SzGLX1FcpidKqpMZ8pSq2
         eA1AAj7FqddEplZiac334jaaeoNNoYth2aLJRwbiSVpAOdbtXvfBkiaydW4npiQiq0YE
         b8pCM9NwKWyn2ttpI+yzEpoax2wuYlYAXEk4vMm3wAKotyohzIRwDW/qZnj83B1U1l+g
         uKAcg/37efO1EZNcfe0ssmNS6Ygar5sUxwJQoyEZHljjMT+5DgPjzcH+xvme29jmGY4y
         d1UA==
X-Gm-Message-State: AOJu0YxSd9LAcjed30IIuD+8Nsi5eih9zQUY47/9PKPrV8FB2Nkh2noL
	+zpPY09xOtZzIRnx5CdZtDljdf4aomyyblCTY4+8tc99bW2Ug9zwhJdOTh46kpPtQipw73RPP+D
	v6FM=
X-Google-Smtp-Source: AGHT+IHdhyMMN1lJHUFTOJrYhuRYpOQ/s3loDzMQ9d0hgDGlkSH70vqZlfxNSDFQSdLaiZan0JCtzg==
X-Received: by 2002:a50:c003:0:b0:572:7c13:c7d8 with SMTP id r3-20020a50c003000000b005727c13c7d8mr2029029edb.34.1714747426692;
        Fri, 03 May 2024 07:43:46 -0700 (PDT)
Received: from localhost.localdomain ([95.90.235.164])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b005721b7bfea2sm1731017edb.22.2024.05.03.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:43:46 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	randy.macleod@windriver.com,
	engineering@neighbourhood.ie,
	Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>
Subject: [PATCH v2 2/5] oe-build-perf-report: Display more than 300 commits and date instead of commit number
Date: Fri,  3 May 2024 16:43:37 +0200
Message-ID: <20240503144340.27385-3-ninette@thehoodiefirm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198998

From: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>

- This commit updates measurement statistics data to include start_time so that time can be displayed instead of commit numbers on the chart.
- It also updates default commit history length to 300.
---
 scripts/lib/build_perf/report.py | 4 +++-
 scripts/oe-build-perf-report     | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index ab77424cc7..82c56830d7 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -294,7 +294,7 @@ class SizeVal(MeasurementVal):
             return "null"
         return self / 1024
 
-def measurement_stats(meas, prefix=''):
+def measurement_stats(meas, prefix='', time=0):
     """Get statistics of a measurement"""
     if not meas:
         return {prefix + 'sample_cnt': 0,
@@ -319,6 +319,7 @@ def measurement_stats(meas, prefix=''):
     stats['quantity'] = val_cls.quantity
     stats[prefix + 'sample_cnt'] = len(values)
 
+    start_time = time # Add start time for both type sysres and disk usage
     mean_val = val_cls(mean(values))
     min_val = val_cls(min(values))
     max_val = val_cls(max(values))
@@ -334,6 +335,7 @@ def measurement_stats(meas, prefix=''):
     stats[prefix + 'max'] = max_val
     stats[prefix + 'minus'] = val_cls(mean_val - min_val)
     stats[prefix + 'plus'] = val_cls(max_val - mean_val)
+    stats[prefix + 'start_time'] = start_time
 
     return stats
 
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 7812ea4540..266700d294 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -336,7 +336,9 @@ def print_html_report(data, id_comp, buildstats):
                 test_i = test_data['tests'][test]
                 meas_i = test_i['measurements'][meas]
                 commit_num = get_data_item(meta, 'layers.meta.commit_count')
-                samples.append(measurement_stats(meas_i))
+                # Add start_time for both test measurement types of sysres and disk usage
+                start_time = test_i['start_time'][0]
+                samples.append(measurement_stats(meas_i, '', start_time))
                 samples[-1]['commit_num'] = commit_num
 
             absdiff = samples[-1]['val_cls'](samples[-1]['mean'] - samples[id_comp]['mean'])
@@ -473,7 +475,7 @@ Examine build performance test results from a Git repository"""
     group.add_argument('--branch', '-B', default='master', help="Branch to find commit in")
     group.add_argument('--branch2', help="Branch to find comparision revisions in")
     group.add_argument('--machine', default='qemux86')
-    group.add_argument('--history-length', default=25, type=int,
+    group.add_argument('--history-length', default=300, type=int,
                        help="Number of tested revisions to plot in html report")
     group.add_argument('--commit',
                        help="Revision to search for")
-- 
2.44.0


