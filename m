Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474FAC04FF8
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 14:41:38 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.22810.1713192097024415408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 07:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=CbfavIRm;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.51, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so3399817a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1713192095; x=1713796895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UlWsfqTAG7RHDAZaw9Dvkq0glLcU+oq7otggdIC1mwA=;
        b=CbfavIRmLNMhROhf9aMur3mY7FruH6I/Yb2XgWDiQFAtZuDQ1GMsksOSJx6caxaB/a
         j2oqKpvKO0d5BLxBrHzCPz7N+K0jX59fUyHMMbgJcM+ZU6+wMc/9lb0gp2XdM9OdHzgd
         aH6xiLmyC5qG22oOAdO/bseRWwjhaSsmEL2OSrRl6cmE8Jo6X0yZJbFeGwENCX3eFZ56
         iET4V7gUqRjiExHlJedXZGx+uuQ+dp+DbMfp2sOqdAtXQRZSWcLM4gLvJyRA+KbtHEDe
         1r9zC2c8X0sZ81bWVhI/VQoCFHtLdbJg5SjyGjr1MSb0u/c6ZeX/r5pbQvRnqDc9PcSk
         lHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713192095; x=1713796895;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UlWsfqTAG7RHDAZaw9Dvkq0glLcU+oq7otggdIC1mwA=;
        b=FvMV1WR/qn9PeLwvVLDN4KlIT62oRfVx6jK9I4XfofzPDxpA9dJRx2PAU80wyEPBBb
         NLjCfY1tV+QYo5onRl9AW3HTaNfyex4ntNeHwtsSlBNtMMsvKLUDFjhyDy4dqRTz9a8E
         DSjS8dhfDaRNThDsxdMfxY339axDHAovENu4oaxpgtnUw/OO1ZdINHuDkZ/bYQU0Nd3Y
         H0mqluEF94q7N0AYb1rKsarZgsikTAvL7XMcO5gF5C2+drmr0Yl/WjldPI37gDAYToEW
         dBTRWcARLwbWK93hKCsK3LguwDX1ZAQ0mBIDQrZ5iuegjP47DJN3sNiYxIJtopVIrF1r
         divA==
X-Gm-Message-State: AOJu0YwKUSegIsXDKMu/pR9c5SOc0yuw41khzCD7xB+GbLCzwUyGOLT5
	q2Y8MTf86ARs5BlFuFQMzC8Xrk9gyfTAOpyKHzZQoIrAVopIKglpLfpO0g3DPZL3i5o+8Q1XO22
	y
X-Google-Smtp-Source: AGHT+IELP1t9GLIEfFQCSnParbtxxoVF+w3LvVsduXq4nCmFUbwaCG4e7Ljn0tsgi1PrBR8MPyDR2g==
X-Received: by 2002:a17:907:36c2:b0:a54:4f06:375d with SMTP id bj2-20020a17090736c200b00a544f06375dmr1724198ejc.62.1713192095399;
        Mon, 15 Apr 2024 07:41:35 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id bq3-20020a170906d0c300b00a522f867697sm4658749ejb.132.2024.04.15.07.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 07:41:35 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 2/3] oe-build-perf-report: Display more than 300 commits and date instead of commit number
Date: Mon, 15 Apr 2024 16:41:28 +0200
Message-ID: <20240415144129.92641-3-ninette@thehoodiefirm.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198241

From: Ninette Adhikari <13760198+ninetteadhikari@users.noreply.github.com>

- This commit updates measurement statistics data to include start_time so that time can be displayed instead of commit numbers on the chart.
- It also updates default commit history length to 300.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
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


